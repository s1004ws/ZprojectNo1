package com.project.webApp.admin;

import java.util.List;

public interface AdminDAOInterface {

	public List<AdminVO> selectAll(); //리스트
	public int totalRecordCount(); //업체수
	public int insertRecord(AdminVO vo); //업체등록
	public AdminVO select(int num); //업체상세보기, 업체수정
	public int updateRecord(AdminVO vo);//등록업체 수정완료
	public int deleteRecord(int num); //등록업체 삭제
   public List<AdminVO> selectLunch(); //CafeDaoMapper.xml에서 리턴 된vo 값을 List에 담김
   public List<AdminVO> selectDinner(); //CafeDaoMapper.xml에서 리턴 된vo 값을 List에 담김
   public List<AdminVO> selectLate(); //CafeDaoMapper.xml에서 리턴 된vo 값을 List에 담김
   public List<AdminVO> selectAlcohol(); //CafeDaoMapper.xml에서 리턴 된vo 값을 List에 담김
}
