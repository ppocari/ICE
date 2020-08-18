package com.will.ice.excel.controller;


import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FilenameUtils;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.BorderStyle;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.HorizontalAlignment;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.will.ice.address.model.AddressSearchVO;
import com.will.ice.address.model.AddressService;
import com.will.ice.address.model.AddressVO;
import com.will.ice.common.Depart_posi_dateVO;
import com.will.ice.common.FileUploadUtil;
import com.will.ice.companyCard.model.ComCardFileVO;
import com.will.ice.companyCard.model.ComcardService;
import com.will.ice.companyCard.model.ComcardVO;
import com.will.ice.excel.model.ExcelData;


@Controller
public class ExcelController {

	private static final Logger logger 
	= LoggerFactory.getLogger(ExcelController.class);

	@Autowired private FileUploadUtil fileUploadUtil;
	@Autowired private ComcardService comcardService;
	@Autowired private AddressService service;

	@RequestMapping(value="/excelhtml.do", method = RequestMethod.GET)
	public void excelhtml_get() { // 1
		logger.info("excelhtml={} get");
	}

	@RequestMapping(value="/excelhtml.do", method = RequestMethod.POST)
	public void excelhtml_post() { // 1
		logger.info("excelhtml={} post");
	}

	@RequestMapping(value="/excel.do", method = RequestMethod.GET)
	public String main() { // 1
		logger.info("excel={} get");
		return "excel";
	}


	@RequestMapping(value="/excel.do", method = RequestMethod.POST)
	public String readExcel(@RequestParam("file") MultipartFile file,
			HttpServletRequest request, Model model)
					throws IOException { // 2
		logger.info("file={}",file);


		
		//insert 부터 하면 됨

		//파일 업로드 처리
		List<Map<String, Object>> fileList = fileUploadUtil.fileUpload(request, fileUploadUtil.PATH_COMCARD_FILE);
		String fileURL="",originalFileName="";long fileSize=0;
		if(fileList!=null) {
			for(Map<String, Object> map : fileList) {
				fileURL=(String) map.get("fileName");
				fileSize=(Long)map.get("fileSize");
				originalFileName = (String)map.get("originalFileName");
			}
		}
		ComCardFileVO ccfvo = new ComCardFileVO(); 
		ccfvo.setFileName(fileURL);
		ccfvo.setOriginalFileName(originalFileName);
		ccfvo.setFileSize(fileSize);
		
		logger.info("ccfvo={}",ccfvo);
		
		int cnt = comcardService.insertCCFile(ccfvo);
		
		logger.info("cnt={}",cnt);


		List<ExcelData> dataList = new ArrayList<>();

		String extension = FilenameUtils.getExtension(file.getOriginalFilename()); // 3

		if (!extension.equals("xlsx") && !extension.equals("xls")) {
			throw new IOException("엑셀파일만 업로드 해주세요.");
		}

		Workbook workbook = null;

		if (extension.equals("xlsx")) {
			workbook = new XSSFWorkbook(file.getInputStream());
		} else if (extension.equals("xls")) {
			workbook = new HSSFWorkbook(file.getInputStream());
		}

		Sheet worksheet = workbook.getSheetAt(0);

		for (int i = 1; i < worksheet.getPhysicalNumberOfRows(); i++) { // 4

			Row row = worksheet.getRow(i);

			ExcelData data = new ExcelData();

			data.setCompany(row.getCell(0).getStringCellValue());
			data.setCardNo(row.getCell(1).getStringCellValue());
			data.setMemNo(row.getCell(2).getStringCellValue());
			data.setPrice((int) row.getCell(3).getNumericCellValue());
			data.setUsePlace(row.getCell(4).getStringCellValue());
			data.setUseDate(row.getCell(5).getStringCellValue());

			dataList.add(data);

		}

		model.addAttribute("datas", dataList); // 5
		model.addAttribute("ccfvo", ccfvo); // 5

		return "/companyCard/comCardUpload";

	}
	
	@RequestMapping(value ="/cardListexcelDown.do")
	public void cardListexcelDown(@ModelAttribute Depart_posi_dateVO dpdvo,
			HttpServletResponse response) throws Exception {

		logger.info("날짜 파라미터, dpdvo={}",dpdvo);
		
	    //카드사용 목록 조회
		List<ComcardVO> list = comcardService.selectListComcard(dpdvo);
		logger.info("엑셀 입력 전 list.size={}", list.size());
		
	    //워크북 생성
	    Workbook wb = new HSSFWorkbook();
	    Sheet sheet = wb.createSheet("법인카드 사용 내역");
	    Row row = null;
	    Cell cell = null;
	    int rowNo = 0;

	    //테이블 헤더용 스타일
	    CellStyle headStyle = wb.createCellStyle();

	    //가는 경계선을 가집니다.
	    headStyle.setBorderTop(BorderStyle.THIN);
	    headStyle.setBorderBottom(BorderStyle.THIN);
	    headStyle.setBorderLeft(BorderStyle.THIN);
	    headStyle.setBorderRight(BorderStyle.THIN);

	    //데이터는 가운데 정렬합니다.
	    headStyle.setAlignment(HorizontalAlignment.CENTER);

	    //데이터용 경계 스타일 테두리만 지정
	    CellStyle bodyStyle = wb.createCellStyle();
	    bodyStyle.setBorderTop(BorderStyle.THIN);
	    bodyStyle.setBorderBottom(BorderStyle.THIN);
	    bodyStyle.setBorderLeft(BorderStyle.THIN);
	    bodyStyle.setBorderRight(BorderStyle.THIN);

	    //헤더 생성
	    row = sheet.createRow(rowNo++);
        cell = row.createCell(0);
        cell.setCellValue("카드사");
        
        cell = row.createCell(1);
        cell.setCellValue("카드번호");
        
        cell = row.createCell(2);
        cell.setCellValue("사원이름");

        cell = row.createCell(3);
        cell.setCellValue("계정제목");
        
        cell = row.createCell(4);
        cell.setCellValue("사용처");
        
        cell = row.createCell(5);
        cell.setCellValue("사용금액");
        
        cell = row.createCell(6);
        cell.setCellValue("사용일");
        
        cell = row.createCell(7);
        cell.setCellValue("부서");
        
        cell = row.createCell(8);
        cell.setCellValue("직급");
        
        cell = row.createCell(9);
        cell.setCellValue("승인 날짜");

        cell = row.createCell(10);
        cell.setCellValue("승인 시간");

	    //데이터 부분 생성
        for(int rowIdx=0; rowIdx < list.size(); rowIdx++) {
            ComcardVO vo = list.get(rowIdx);
	        row = sheet.createRow(rowNo++);
	        
            cell = row.createCell(0);
            cell.setCellValue(vo.getCompany());
            
            cell = row.createCell(1);
            cell.setCellValue(vo.getCardNo());
            
            cell = row.createCell(2);
            cell.setCellValue(vo.getName());
            
            cell = row.createCell(3);
            cell.setCellValue(vo.getAccTitle());
            
            cell = row.createCell(4);
            cell.setCellValue(vo.getUsePlace());
            
            cell = row.createCell(5);
            cell.setCellValue(vo.getPrice());
            
            cell = row.createCell(6);
            cell.setCellValue(vo.getUseDate());
            
            cell = row.createCell(7);
            cell.setCellValue(vo.getDeptName());
            
            cell = row.createCell(8);
            cell.setCellValue(vo.getPosName());
            
            cell = row.createCell(9);
            cell.setCellValue(vo.getConfirmDate());

            cell = row.createCell(10);
            cell.setCellValue(vo.getConfirmTime());
	    }

	    //컨텐츠 타입과 파일명 지정
	    response.setContentType("ms-vnd/excel");
	    response.setHeader("Content-Disposition", "attachment;filename=CorpcardDetails.xls");

	    //엑셀 출력
	    wb.write(response.getOutputStream());
	    wb.close();
	}
	
	@RequestMapping(value ="/myCorpCardList.do")
	public void myCorpCardList(@ModelAttribute Depart_posi_dateVO dpdvo,
			HttpServletResponse response) throws Exception {
		
		logger.info("날짜 파라미터, dpdvo={}",dpdvo);
		
		//내 카드목록 조회
		List<ComcardVO> list = comcardService.selectListComcard(dpdvo);
		logger.info("엑셀 입력 전 list.size={}", list.size());
		
		//워크북 생성
		Workbook wb = new HSSFWorkbook();
		Sheet sheet = wb.createSheet("법인카드 사용 내역");
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
		cell.setCellValue("카드사");
		
		cell = row.createCell(1);
		cell.setCellValue("카드번호");
		
		cell = row.createCell(2);
		cell.setCellValue("사원이름");
		
		cell = row.createCell(3);
		cell.setCellValue("계정제목");
		
		cell = row.createCell(4);
		cell.setCellValue("사용처");
		
		cell = row.createCell(5);
		cell.setCellValue("사용금액");
		
		cell = row.createCell(6);
		cell.setCellValue("사용일");
		
		cell = row.createCell(7);
		cell.setCellValue("부서");
		
		cell = row.createCell(8);
		cell.setCellValue("직급");
		
		cell = row.createCell(9);
		cell.setCellValue("승인 날짜");
		
		cell = row.createCell(10);
		cell.setCellValue("승인 시간");
		
		//데이터 부분 생성
		for(int rowIdx=0; rowIdx < list.size(); rowIdx++) {
			ComcardVO vo = list.get(rowIdx);
			row = sheet.createRow(rowNo++);
			
			cell = row.createCell(0);
			cell.setCellValue(vo.getCompany());
			
			cell = row.createCell(1);
			cell.setCellValue(vo.getCardNo());
			
			cell = row.createCell(2);
			cell.setCellValue(vo.getName());
			
			cell = row.createCell(3);
			cell.setCellValue(vo.getAccTitle());
			
			cell = row.createCell(4);
			cell.setCellValue(vo.getUsePlace());
			
			cell = row.createCell(5);
			cell.setCellValue(vo.getPrice());
			
			cell = row.createCell(6);
			cell.setCellValue(vo.getUseDate());
			
			cell = row.createCell(7);
			cell.setCellValue(vo.getDeptName());
			
			cell = row.createCell(8);
			cell.setCellValue(vo.getPosName());
			
			cell = row.createCell(9);
			cell.setCellValue(vo.getConfirmDate());
			
			cell = row.createCell(10);
			cell.setCellValue(vo.getConfirmTime());
		}
		
		//컨텐츠 타입과 파일명 지정
		response.setContentType("ms-vnd/excel");
		response.setHeader("Content-Disposition", "attachment;filename=MyCorpcardList.xls");
		
		// 엑셀 출력
		wb.write(response.getOutputStream());
		wb.close();
	}

	@RequestMapping("/addressExcel.do")
	public void addressExcel(@ModelAttribute AddressSearchVO adSearchVo, HttpServletResponse response,
			 HttpSession session) throws Exception {
		
		String memNo=(String)session.getAttribute("identNum");
		adSearchVo.setMemNo(memNo);
		logger.info("주소록 엑셀 입력 전 adSearchVo={}", adSearchVo);

		//주소록 조회
		List<AddressVO> list=service.selectAddress2(adSearchVo);
		logger.info("주소록 엑셀 입력 전 list.size={}", list.size());
		
		//워크북 생성
		Workbook wb = new HSSFWorkbook();
		Sheet sheet = wb.createSheet("주소록");
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
		cell.setCellValue("이름");
		
		cell = row.createCell(1);
		cell.setCellValue("전화번호");
		
		cell = row.createCell(2);
		cell.setCellValue("이메일");
		
		cell = row.createCell(3);
		cell.setCellValue("그룹");
		
		cell = row.createCell(4);
		cell.setCellValue("회사명");
		
		cell = row.createCell(5);
		cell.setCellValue("부서");
		
		cell = row.createCell(6);
		cell.setCellValue("직책");
		
		//데이터 부분 생성
		String tel="",email="";
		for(int rowIdx=0; rowIdx < list.size(); rowIdx++) {
			AddressVO vo = list.get(rowIdx);
			row = sheet.createRow(rowNo++);
			
			if(vo.getHp1()!=null&&!vo.getHp1().isEmpty()) {
				tel=vo.getHp1()+"-"+vo.getHp2()+"-"+vo.getHp3();
			}
			if(vo.getEmail1()!=null&&!vo.getEmail1().isEmpty()) {
				email=vo.getEmail1()+"@"+vo.getEmail2();
			}

			cell = row.createCell(0);
			cell.setCellValue(vo.getName());
			
			cell = row.createCell(1);
			cell.setCellValue(tel);
			
			cell = row.createCell(2);
			cell.setCellValue(email);

			cell = row.createCell(3);
			cell.setCellValue(vo.getGroupName());
			
			cell = row.createCell(4);
			cell.setCellValue(vo.getCompany());
			
			cell = row.createCell(5);
			cell.setCellValue(vo.getDeptName());
			
			cell = row.createCell(6);
			cell.setCellValue(vo.getPosName());
			
		}
		
		//컨텐츠 타입과 파일명 지정
		response.setContentType("ms-vnd/excel");
		response.setHeader("Content-Disposition", "attachment;filename=addressList.xls");
		
		// 엑셀 출력
		wb.write(response.getOutputStream());
		wb.close();
	}
}