package com.project.webApp.custom;

public interface CustomDAOInterface {
	public int emailChk(String user_email);
	public int insertCustom(CustomVO vo);
	public int selectCustom(CustomVO vo);
	public int updateCustomFavor(CustomVO vo);
	public String selectCustomFavor(CustomVO vo);
}
