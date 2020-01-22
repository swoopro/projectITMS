package com.mega.ITMS;

import java.io.BufferedInputStream;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.openxml4j.exceptions.InvalidFormatException;
import org.apache.poi.ss.usermodel.Workbook;

import net.sf.jxls.exception.ParsePropertyException;
import net.sf.jxls.transformer.XLSTransformer;

public class Excel {

	public void download(HttpServletRequest request, HttpServletResponse response,
            Map<String, Object> bean, String fileName, String templateFile, String string)
            throws ParsePropertyException, InvalidFormatException {

				// 받아오는 매개변수 bean는 디비에서 뽑아온 데이터
				// fileName 은 다운로드 받을때 지정되는 파일명
				// templateFile 는 템플릿 엑셀 파일명이다.
				
				// tempPath는 템플릿 엑셀파일이 들어가는 경로를 넣어 준다.
				String tempPath = request.getSession().getServletContext().getRealPath("resources/excel");
	
	
				// 별도로 다운로드 만들기 귀찮으까 이런식으로 만들어서 바로 엑셀 생성후 다운 받게 
				try {

				    InputStream is = new BufferedInputStream(new FileInputStream(tempPath + "\\" + templateFile));
				    XLSTransformer xls = new XLSTransformer();
				    
				    
				    Workbook workbook = xls.transformXLS(is, bean);
				    /*Workbook workbook2 = xls.transformXLS(is, bean2);*/
    
    
				    response.setHeader("Content-Disposition", "attachment; filename=\"" + fileName + ".xlsx\"");
    
				    OutputStream os = response.getOutputStream();
    
				    workbook.write(os);
				} catch (IOException e) {
					e.printStackTrace();
				}
	}

}
