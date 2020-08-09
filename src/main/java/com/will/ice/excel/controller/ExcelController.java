package com.will.ice.excel.controller;


import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FilenameUtils;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.will.ice.common.FileUploadUtil;
import com.will.ice.companyCard.model.ComCardFileVO;
import com.will.ice.companyCard.model.ComcardService;
import com.will.ice.excel.model.ExcelData;


@Controller
public class ExcelController {

	private static final Logger logger 
	= LoggerFactory.getLogger(ExcelController.class);

	@Autowired private FileUploadUtil fileUploadUtil;
	@Autowired private ComcardService comcardService;

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
}