package com.project.webApp.admin;

import java.util.List;

public interface AdminDAOInterface {

	public List<AdminVO> selectAll(); //리스트
	public int totalRecordCount(); //업체수
	public int insertRecord(AdminVO vo); //업체등록
	public AdminVO select(int num); //업체상세보기, 업체수정
	public int updateRecord(AdminVO vo);//등록업체 수정완료
	public int deleteRecord(int num); //등록업체 삭제
	
}
