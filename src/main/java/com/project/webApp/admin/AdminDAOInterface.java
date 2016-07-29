package com.project.webApp.admin;

import java.util.List;

public interface AdminDAOInterface {

	public List<AdminVO> selectAll(); //����Ʈ
	public int totalRecordCount(); //��ü��
	public int insertRecord(AdminVO vo); //��ü���
	public AdminVO select(int num); //��ü�󼼺���, ��ü����
	public int updateRecord(AdminVO vo);//��Ͼ�ü �����Ϸ�
	public int deleteRecord(int num); //��Ͼ�ü ����
   public AdminVO selectLunch(); //CafeDaoMapper.xml���� ���� ��vo ���� List�� ���
   public AdminVO selectDinner(); //CafeDaoMapper.xml���� ���� ��vo ���� List�� ���
   public AdminVO selectLate(); //CafeDaoMapper.xml���� ���� ��vo ���� List�� ���
   public AdminVO selectAlcohol(); //CafeDaoMapper.xml���� ���� ��vo ���� List�� ���
}
