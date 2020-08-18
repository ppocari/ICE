package com.will.ice.spay.controller;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.BorderStyle;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.HorizontalAlignment;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.will.ice.common.Utility;
import com.will.ice.common.DateSearchVO;
import com.will.ice.common.PaginationInfo;
import com.will.ice.member.model.MemberService;
import com.will.ice.member.model.MemberVO;
import com.will.ice.spay.model.SpayService;
import com.will.ice.spay.model.SpayVO;
import com.will.ice.spay.model.SpayViewVO;

@Controller
@RequestMapping("/spay")
public class SpayController {
	
	private static final Logger logger
	=LoggerFactory.getLogger(SpayController.class);
	
	@Autowired private MemberService memberService;
	@Autowired private SpayService spayService;
	
	@RequestMapping("/sbuy.do")
	public void sbuy() {
		logger.info("구입 페이지 보여주기");
	
	}

	@RequestMapping("/sList.do")
	public void sList(@ModelAttribute DateSearchVO dateSearchVo,
			HttpSession session, Model model) {
		String identNum = (String)session.getAttribute("identNum");
		dateSearchVo.setMemNo(identNum);
		logger.info("구매 목록 파라미터 dateSearchVo={}", dateSearchVo);
		
		PaginationInfo pagingInfo = new PaginationInfo();
		pagingInfo.setBlockSize(Utility.BLOCKSIZE);
		pagingInfo.setCurrentPage(dateSearchVo.getCurrentPage());
		pagingInfo.setRecordCountPerPage(Utility.RECORD_COUNT);
		
		dateSearchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		dateSearchVo.setRecordCountPerPage(Utility.RECORD_COUNT);
		
		String startDay=dateSearchVo.getStartDay();
		if(startDay==null || startDay.isEmpty()) {
			Date today = new Date();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			String str=sdf.format(today);
			dateSearchVo.setStartDay(str);
			dateSearchVo.setEndDay(str);			
		}
		
		List<SpayViewVO> list=spayService.selectSpayView(dateSearchVo);
		logger.info("구매 내역 결과 list.size={}", list.size());
		
		int totalRecord=spayService.selectTotalRecord(dateSearchVo);
		logger.info("구매내역 조회 결과, totalRecord={}", totalRecord);
			
		pagingInfo.setTotalRecord(totalRecord);
		
		model.addAttribute("list", list);
		model.addAttribute("pagingInfo", pagingInfo);	

	}

	@RequestMapping(value="/spay.do")
	public void spay_post(HttpSession session, Model model,
			int TICPRICE, int TICQUANTITY) {
		String identNum=(String) session.getAttribute("identNum");
		
		SpayVO sVo = new SpayVO();
		sVo.setTICPRICE(TICPRICE);
		sVo.setTICQUANTITY(TICQUANTITY);
		
		MemberVO memVo=memberService.selectMember(identNum);
		logger.info("주문하기 - 회원조회 결과 vo={}", memVo);
		
		model.addAttribute("sVo", sVo);
		model.addAttribute("memVo", memVo);
		
	}
		
	@RequestMapping(value = "/sok.do", method = RequestMethod.GET)
	public void sok_get(@ModelAttribute SpayVO sVo,
			HttpSession session, Model model) {
		int identNum=Integer.parseInt((String)session.getAttribute("identNum"));
		String userid=(String) session.getAttribute("identNum");
		
		int ticno = spayService.searchNum(identNum);
		logger.info("가장최근구매내역, 파라미터 tinco={}", ticno);
		
		SpayVO vo = spayService.searchAll(ticno);
		logger.info("구매확인, 파라미터 vo={}", vo);

		MemberVO memVo = memberService.selectMember(userid);
		logger.info("구매자, 파라미터 memVo={}", memVo);
		
		model.addAttribute("memVo", memVo);
		model.addAttribute("vo", vo);
	}
	
	@ResponseBody
	@RequestMapping(value = "/sok.do", method = RequestMethod.POST)
	public String sok_post(@ModelAttribute SpayVO sVo,
			HttpSession session, Model model,
			@RequestParam int TICPRICE, @RequestParam int TICQUANTITY) {
		String identNum=(String) session.getAttribute("identNum");
		
		sVo.setMEMNO(identNum);
		sVo.setTICPRICE(TICPRICE);
		sVo.setTICQUANTITY(TICQUANTITY);
		
		logger.info("구매, 파라미터 sVo={}", sVo);
		
		int cnt=spayService.insertTic(sVo);
		logger.info("주문하기 결과, cnt={}", cnt);
		
		model.addAttribute("sVo", sVo);
		
		return "spay/sok";
	}
	
	@RequestMapping("/sListAll.do")
	public String sListAll(@ModelAttribute DateSearchVO dateSearchVo,
			HttpSession session, Model model) {
		int identNum=Integer.parseInt((String)session.getAttribute("identNum"));
		String memno=Integer.toString(identNum);
		
		logger.info("사원번호 identNum={}", identNum);
		
		String posCode = (String)session.getAttribute("posCode");
		if(posCode.equals("999")) {
			
			dateSearchVo.setMemNo(memno);
			logger.info("구매 조회 파라미터 dateSearchVo={}", dateSearchVo);
			
			PaginationInfo pagingInfo = new PaginationInfo();
			pagingInfo.setBlockSize(Utility.BLOCKSIZE);
			pagingInfo.setCurrentPage(dateSearchVo.getCurrentPage());
			pagingInfo.setRecordCountPerPage(Utility.RECORD_COUNT);
			
			dateSearchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
			dateSearchVo.setRecordCountPerPage(Utility.RECORD_COUNT);
			
			String startDay=dateSearchVo.getStartDay();
			if(startDay==null || startDay.isEmpty()) {
				Date today = new Date();
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
				String str=sdf.format(today);
				dateSearchVo.setStartDay(str);
				dateSearchVo.setEndDay(str);			
			}
			
			List<SpayViewVO> list=spayService.selectSpayViewAll(dateSearchVo);
			logger.info("구매 내역 결과 list.size={}", list.size());
			
			int totalRecord=spayService.selectTotalRecordAll(dateSearchVo);
			logger.info("구매내역 조회 결과, totalRecord={}", totalRecord);
				
			pagingInfo.setTotalRecord(totalRecord);
			
			model.addAttribute("list", list);
			model.addAttribute("pagingInfo", pagingInfo);	

		}else {
			return "authority";
		}
		
		return "spay/sListAll";
	}
	
	@RequestMapping(value = "/excelDown.do")
	@ResponseBody
	public String excelDown(@ModelAttribute DateSearchVO dateSearchVo,
			HttpServletResponse response, Model model) throws Exception {

		logger.info("엑셀에 넣을 날짜 파라미터, dateSearchVo={}",dateSearchVo);
		
		PaginationInfo pagingInfo = new PaginationInfo();
		pagingInfo.setBlockSize(Utility.BLOCKSIZE);
		pagingInfo.setCurrentPage(dateSearchVo.getCurrentPage());
		pagingInfo.setRecordCountPerPage(Utility.RECORD_COUNT);
		
		dateSearchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		dateSearchVo.setRecordCountPerPage(Utility.RECORD_COUNT);
		
		String startDay=dateSearchVo.getStartDay();
		if(startDay==null || startDay.isEmpty()) {
			Date today = new Date();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			String str=sdf.format(today);
			dateSearchVo.setStartDay(str);
			dateSearchVo.setEndDay(str);			
		}
		
	    // 게시판 목록조회
	    List<SpayViewVO> list=spayService.selectSpayViewAll(dateSearchVo);
		logger.info("엑셀에 넣기전 결과 list.size={}", list.size());
		
		String msg="데이터가 없습니다!", url="/spay/sListAll.do";
		if(list.size()!=0) {
			
			// 워크북 생성
		    Workbook wb = new HSSFWorkbook();
		    Sheet sheet = wb.createSheet("결제된 목록");
		    Row row = null;
		    Cell cell = null;
		    int rowNo = 0;
	
		    // 테이블 헤더용 스타일
		    CellStyle headStyle = wb.createCellStyle();
	
		    // 가는 경계선을 가집니다.
		    headStyle.setBorderTop(BorderStyle.THIN);
		    headStyle.setBorderBottom(BorderStyle.THIN);
		    headStyle.setBorderLeft(BorderStyle.THIN);
		    headStyle.setBorderRight(BorderStyle.THIN);
	
		    // 데이터는 가운데 정렬합니다.
		    headStyle.setAlignment(HorizontalAlignment.CENTER);
	
		    // 데이터용 경계 스타일 테두리만 지정
		    CellStyle bodyStyle = wb.createCellStyle();
		    bodyStyle.setBorderTop(BorderStyle.THIN);
		    bodyStyle.setBorderBottom(BorderStyle.THIN);
		    bodyStyle.setBorderLeft(BorderStyle.THIN);
		    bodyStyle.setBorderRight(BorderStyle.THIN);
	
		    // 헤더 생성
		    row = sheet.createRow(rowNo++);
	        cell = row.createCell(0);
	        cell.setCellValue("사원번호");
	        
	        cell = row.createCell(1);
	        cell.setCellValue("이름");
	        
	        cell = row.createCell(2);
	        cell.setCellValue("수량");
	
	        cell = row.createCell(3);
	        cell.setCellValue("가격");
	        
	        cell = row.createCell(4);
	        cell.setCellValue("번호");
	        
	        cell = row.createCell(5);
	        cell.setCellValue("구매시각");
	
		    // 데이터 부분 생성
		    SpayViewVO vo;
	        for(int rowIdx=0; rowIdx < list.size(); rowIdx++) {
	            vo = list.get(rowIdx);
	            String hp = vo.getHP1();
	            if(hp==null) {
	            	hp="";
	            }else {
	            	hp = vo.getHP1()+"-"+vo.getHP2()+"-"+vo.getHP3();
	            }
	            
	            row = sheet.createRow(rowNo++);
		        
		        SimpleDateFormat formatter = new SimpleDateFormat ( "yyyy.MM.dd HH:mm:ss", Locale.KOREA );
		        
		        int sum = vo.getTICQUANTITY()*vo.getTICPRICE();
		        Timestamp time = vo.getTICREGDATE();
	    		String Time = formatter.format ( time );
		      	        
	            cell = row.createCell(0);
	            cell.setCellValue(vo.getMEMNO());
	            
	            cell = row.createCell(1);
	            cell.setCellValue(vo.getNAME());
	            
	            cell = row.createCell(2);
	            cell.setCellValue(vo.getTICQUANTITY());
	            
	            cell = row.createCell(3);
	            cell.setCellValue(sum);
	
	            cell = row.createCell(4);
	            cell.setCellValue(hp);
	            
	            cell = row.createCell(5);
	            cell.setCellValue(Time);
		    }
	
		    // 컨텐츠 타입과 파일명 지정
		    response.setContentType("ms-vnd/excel");
		    response.setHeader("Content-Disposition", "attachment;filename=buyticket.xls");
	
		    // 엑셀 출력
		    wb.write(response.getOutputStream());
		    wb.close();
		
		}else{
			msg="데이터가 없습니다!";
		}		  
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
	
		return "common/message";
	}
	
}