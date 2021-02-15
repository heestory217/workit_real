package com.it.workit.admin.indivUsers.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.hssf.util.HSSFColor.HSSFColorPredefined;
import org.apache.poi.ss.usermodel.BorderStyle;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.FillPatternType;
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
import org.springframework.web.bind.annotation.RequestParam;

import com.it.workit.common.PaginationInfo;
import com.it.workit.common.SearchVO;
import com.it.workit.users.model.UsersService;
import com.it.workit.users.model.UsersVO;

@Controller
@RequestMapping("/admin/users/indiv")
public class AdminIndivUsersController {
	private Logger logger
		=LoggerFactory.getLogger(AdminIndivUsersController.class);
	
	@Autowired private UsersService usersService;
	
	@RequestMapping("/selectIndivUsers.do")
	public String selectIndivUsers(Model model, @ModelAttribute SearchVO searchVo) {
		logger.info("관리자 - 개인 회원 조회 View / 파라미터 searchVo={}",searchVo);
		
		//[1]pagingInfo
		PaginationInfo pagingInfo=new PaginationInfo();
		pagingInfo.setBlockSize(10);
		pagingInfo.setCurrentPage(searchVo.getCurrentPage());
		pagingInfo.setRecordCountPerPage(10);
		
		//[2]searchVo
		searchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		searchVo.setRecordCountPerPage(10);
		
		int totalRecord=usersService.totalUsers(searchVo);
		pagingInfo.setTotalRecord(totalRecord);
		
		logger.info("총 레코드 수, totalRecord={}", totalRecord);
		model.addAttribute("pagingInfo", pagingInfo);
		
		List<UsersVO> list=usersService.selectIndivUsersAll(searchVo);
		
		logger.info("list.size={}",list.size());
		model.addAttribute("list", list);
		
		return "admin/users/indiv/selectIndivUsers";
	}
	
	@RequestMapping("/selectWithdrawUsers.do")
	public String selectWithdrawUsers(Model model, @ModelAttribute SearchVO searchVo) {
		logger.info("관리자 - 개인 탈퇴 회원 조회 View / 파라미터 searchVo={}",searchVo);
		
		//[1]pagingInfo
		PaginationInfo pagingInfo=new PaginationInfo();
		pagingInfo.setBlockSize(10);
		pagingInfo.setCurrentPage(searchVo.getCurrentPage());
		pagingInfo.setRecordCountPerPage(10);
				
		//[2]searchVo
		searchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		searchVo.setRecordCountPerPage(10);
				
		int totalRecord=usersService.totalWithdrawUsers(searchVo);
		pagingInfo.setTotalRecord(totalRecord);
				
		logger.info("총 레코드 수, totalRecord={}", totalRecord);
		model.addAttribute("pagingInfo", pagingInfo);
				
		List<UsersVO> list=usersService.selectWithdrawUsersAll(searchVo);
				
		logger.info("list.size={}",list.size());
		model.addAttribute("list", list);
				
		return "admin/users/indiv/selectWithdrawUsers";
	}
	
	@RequestMapping("/withdrawUsers.do")
	public String withdrawUsers(@RequestParam(defaultValue ="0") int userNo, Model model) {
		logger.info("탈퇴 userNo={}",userNo);
		
		if(userNo==0) {
			String msg="잘못된 접근입니다. 다시 시도하세요", url="/admin/users/indiv/selectIndivUsers.do";
			
			model.addAttribute("msg", msg);
			model.addAttribute("url", url);

			return "common/message";
		}
		
		int cnt=usersService.withdrawUsers(userNo);
		
		String msg="잘못된 접근입니다. 다시 시도하세요", url="/admin/users/indiv/selectIndivUsers.do";
		
		if(cnt>0) {
			msg="탈퇴 처리 되었습니다.";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);

		return "common/message";
		
	}
	
	@RequestMapping("/excelDown.do")
	public void excelDown(HttpServletResponse response) throws IOException {
		
		logger.info("회원정보 excel 다운로드");
		List<UsersVO> list=usersService.usersAll();
		
		// 워크북 생성
	    Workbook wb = new HSSFWorkbook();
	    Sheet sheet = wb.createSheet("회원정보");

	    Row row = null;
	    Cell cell = null;

	    int rowNo = 0;

	    // 테이블 헤더용 스타일
	    CellStyle headStyle = wb.createCellStyle();

	    //가는 경계선
	    headStyle.setBorderTop(BorderStyle.THIN);
	    headStyle.setBorderBottom(BorderStyle.THIN);
	    headStyle.setBorderLeft(BorderStyle.THIN);
	    headStyle.setBorderRight(BorderStyle.THIN);

	    // 배경색 회색
	    headStyle.setFillForegroundColor(HSSFColorPredefined.GREY_25_PERCENT.getIndex());
	    headStyle.setFillPattern(FillPatternType.SOLID_FOREGROUND);

	    // 데이터는 가운데 정렬
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
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("번호");
	    cell = row.createCell(1);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("이름");
	    cell = row.createCell(2);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("아이디");
	    cell = row.createCell(3);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("전화번호");
	    cell = row.createCell(4);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("이메일");
	    cell = row.createCell(5);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("우편번호");
	    cell = row.createCell(6);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("주소");
	    cell = row.createCell(7);
	    cell.setCellStyle(headStyle);
	    cell.setCellValue("상세 주소");
		 
	    // 데이터 부분 생성
	    for(UsersVO vo : list) {
	        row = sheet.createRow(rowNo++);
	        cell = row.createCell(0);
	        cell.setCellStyle(bodyStyle);
	        cell.setCellValue(vo.getUserNo());

	        cell = row.createCell(1);
	        cell.setCellStyle(bodyStyle);
	        cell.setCellValue(vo.getUserName());

	        cell = row.createCell(2);
	        cell.setCellStyle(bodyStyle);
	        cell.setCellValue(vo.getUserId());
	        
	        cell = row.createCell(3);
	        cell.setCellStyle(bodyStyle);
	        cell.setCellValue(vo.getUserHp1()+"-"+vo.getUserHp2()+"-"+vo.getUserHp3());
	        
	        cell = row.createCell(4);
	        cell.setCellStyle(bodyStyle);
	        cell.setCellValue(vo.getUserEmail1()+"@"+vo.getUserEmail2());
	        
	        cell = row.createCell(5);
	        cell.setCellStyle(bodyStyle);
	        cell.setCellValue(vo.getUserZipcode());
	        
	        cell = row.createCell(6);
	        cell.setCellStyle(bodyStyle);
	        cell.setCellValue(vo.getUserAddress());
	        
	        cell = row.createCell(7);
	        cell.setCellStyle(bodyStyle);
	        cell.setCellValue(vo.getUserAddressdetail());
	    }
	    
	    //셀 크기 변경
	    for (int i=0;i<rowNo;i++)  
	    {
	        sheet.autoSizeColumn(i);
	        sheet.setColumnWidth(i, (sheet.getColumnWidth(i))+2048 );
	    }

	    // 컨텐츠 타입과 파일명 지정
	    response.setContentType("ms-vnd/excel");
	    response.setHeader("Content-Disposition", "attachment;filename=WorkIt_users.xls");

	    // 엑셀 출력
	    wb.write(response.getOutputStream());
	    wb.close();
	}
}
