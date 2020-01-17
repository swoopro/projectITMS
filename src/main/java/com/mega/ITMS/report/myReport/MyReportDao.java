package com.mega.ITMS.report.myReport;

import org.springframework.stereotype.Repository;

import java.util.List;
@Repository
public interface MyReportDao {
    List<MyReportDto> list();
    void insertReport(MyReportDto dto);
    MyReportDto myReportDetail(int id);
}
