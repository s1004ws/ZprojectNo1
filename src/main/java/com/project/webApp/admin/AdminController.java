package com.project.webApp.admin;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;



@Controller
public class AdminController {
	String folder = "D:/cafeUpload";
	@Autowired
	SqlSession sqlSession;
	
	@RequestMapping("/admin")
	public String admin(){
		return "admin";
	}
	@RequestMapping("/cafe_list")
	public ModelAndView list(HttpServletRequest req){
		AdminDAOInterface dao = sqlSession.getMapper(AdminDAOInterface.class);
		List<AdminVO> list = dao.selectAll();
		
		//�ѷ��ڵ��
		int totalRecord = dao.totalRecordCount();
		ModelAndView mav = new ModelAndView();
		mav.addObject("list",list);
		mav.addObject("totalRecord",totalRecord);
		mav.setViewName("admin/cafe_list");
		
		return mav;
	}
	
	@RequestMapping("/cafe_regist")
	public String cafe_regist(){
		return "admin/cafe_regist";
	}
	
	@RequestMapping("/cafe_registOk")
	public ModelAndView cafe_registOk(HttpServletRequest req){
		AdminDAOInterface dao = sqlSession.getMapper(AdminDAOInterface.class);
		//���Ͼ��ε� �� ���� �ؾ��ϹǷ� enc ������
		AdminVO vo = new AdminVO();
		vo.setCafename(req.getParameter("cafename"));
		vo.setCafemainmenu(req.getParameter("cafemainmenu"));
		vo.setCafephone(req.getParameter("cafephone"));
		vo.setCafeaddr(req.getParameter("cafeaddr"));
		vo.setLatitude(req.getParameter("latitude"));
		vo.setLongitude(req.getParameter("longitude"));
		vo.setCafefavor(req.getParameter("cafefavor"));
		vo.setCafestar(Integer.parseInt(req.getParameter("cafestar")));
		vo.setCafeparking(req.getParameter("cafeparking"));
		vo.setCafeholi(req.getParameter("cafeholi"));
		vo.setCafetime(req.getParameter("cafetime"));
		vo.setCafeshutdown(req.getParameter("cafeshutdown"));
		vo.setCafedelivery(req.getParameter("cafedelivery"));
		
		// ���ε���� 
		
		folder = req.getRealPath("/upload");
		System.out.println(folder);
		ModelAndView mav = new ModelAndView();
    	//���� ����
		File f = new File(folder);
		if(!f.isDirectory()){//�����ִ��� Ȯ��
			f.mkdirs();//��������
		}		
		
		//cafepic ÷�����ϸ��
		MultipartHttpServletRequest mr = (MultipartHttpServletRequest)req;
		List<MultipartFile> flist= mr.getFiles("cafepic");		
		if(flist!=null){
			for(int i=0;i<flist.size();i++){
				MultipartFile mf = flist.get(i);
				//�Ű�������
				String aguName = mf.getName();
				//���ε��� ���� ���ϸ�
				String orgFilename = mf.getOriginalFilename();
				if(!orgFilename.isEmpty()){//////
					//���ε��� ���ϸ��� �����ϴ��� Ȯ��  d:/springUpload   
					File fCheck = new File(folder,orgFilename);
					//rename
					int cnt=1;
					String newFilename = orgFilename;
					while(fCheck.exists()){//������ �����ϴ� �� Ȯ�� index.png
						int idx = orgFilename.lastIndexOf(".");//������ .�� �ε���
						String firstFile = orgFilename.substring(0, idx) ;
						String lastFile = orgFilename.substring(idx+1);
						
						fCheck = new File(folder, firstFile+cnt+"."+lastFile );
						if(!fCheck.exists()){//���θ��� ���ϸ��� ���ε� ������ ������
							newFilename = fCheck.getName();
							break;
						}
						cnt++;
					}//while
				    //���Ͼ��ε�
					try{
						mf.transferTo(new File(folder, newFilename));
					}catch(IOException ie){ie.printStackTrace();}
					mav.addObject("cafepic"+(i+1), newFilename);
					if(i==0)vo.setCafepic1(newFilename);
					if(i==1)vo.setCafepic2(newFilename);
					if(i==2)vo.setCafepic3(newFilename);
					if(i==3)vo.setCafepic4(newFilename);
					if(i==4)vo.setCafepic5(newFilename);
				}//if
			}//for
		}//if
		//cafepic ÷�����ϸ�� ��
		
		
		List<MultipartFile> flist2= mr.getFiles("cafemenupic");		
		if(flist2!=null){
			for(int i=0;i<flist2.size();i++){
				MultipartFile mf2 = flist2.get(i);
				//�Ű�������
				String aguName2 = mf2.getName();
				//���ε��� ���� ���ϸ�
				String orgFilename2 = mf2.getOriginalFilename();
				if(!orgFilename2.isEmpty()){//////
					//���ε��� ���ϸ��� �����ϴ��� Ȯ��  d:/springUpload   
					File fCheck2 = new File(folder,orgFilename2);
					//rename
					int cnt=1;
					String newFilename2 = orgFilename2;
					while(fCheck2.exists()){//������ �����ϴ� �� Ȯ�� index.png
						int idx2 = orgFilename2.lastIndexOf(".");//������ .�� �ε���
						String firstFile2 = orgFilename2.substring(0, idx2) ;
						String lastFile2 = orgFilename2.substring(idx2+1);
						
						fCheck2 = new File(folder, firstFile2+cnt+"."+lastFile2 );
						if(!fCheck2.exists()){//���θ��� ���ϸ��� ���ε� ������ ������
							newFilename2 = fCheck2.getName();
							break;
						}
						cnt++;
					}//while
				    //���Ͼ��ε�
					try{
						mf2.transferTo(new File(folder, newFilename2));
					}catch(IOException ie){ie.printStackTrace();}
					mav.addObject("cafemenupic"+(i+1), newFilename2);
					if(i==0)vo.setCafemenupic1(newFilename2);
					if(i==1)vo.setCafemenupic2(newFilename2);
				}//if
			}//for
		}//if
		//cafenemupic ÷�����ϸ�� ��
		System.out.println("cafename ���尪 : "+vo.getCafename());
		System.out.println("cafemainmenu ���尪 : "+vo.getCafemainmenu());
		System.out.println("cafestar ���尪 : "+vo.getCafestar());
		System.out.println("latitude ���尪 : "+vo.getLatitude());
		System.out.println("longitude ���尪 : "+vo.getLongitude());
		
		System.out.println("cafepic1 ���尪 : "+vo.getCafepic1());
		System.out.println("cafepic2 ���尪 : "+vo.getCafepic2());
		System.out.println("cafepic3 ���尪 : "+vo.getCafepic3());
		System.out.println("cafepic4 ���尪 : "+vo.getCafepic4());
		System.out.println("cafepic5 ���尪 : "+vo.getCafepic5());
		System.out.println("cafemenupic1 ���尪 : "+vo.getCafemenupic1());
		System.out.println("cafemenupic2 ���尪 : "+vo.getCafemenupic2());
		
		
		int cnt = dao.insertRecord(vo);
		System.out.println("cnt = "+cnt);
		mav.setViewName("redirect:cafe_list"); //redirect�ؼ� ��Ʈ�ѷ� ȣ��
		return mav;
	}
	
	@RequestMapping("/cafe_view")
	public ModelAndView cafe_view(@RequestParam("num") int num){
		AdminDAOInterface dao = sqlSession.getMapper(AdminDAOInterface.class);
		ModelAndView mav = new ModelAndView();
		mav.addObject("vo",dao.select(num));
		mav.setViewName("admin/cafe_view");
		return mav;
	}
	
	@RequestMapping("/cafe_edit")
	public ModelAndView cafe_edit(@RequestParam("num") int num){
		AdminDAOInterface dao = sqlSession.getMapper(AdminDAOInterface.class);
		ModelAndView mav = new ModelAndView();
		mav.addObject("vo",dao.select(num));
		mav.setViewName("admin/cafe_edit");
		return mav;
	}
	@RequestMapping("/cafe_editOk")
	public ModelAndView cafe_editOk(HttpServletRequest req){
		AdminDAOInterface dao = sqlSession.getMapper(AdminDAOInterface.class);
		//���Ͼ��ε� �� ���� �ؾ��ϹǷ� enc ������
		AdminVO vo = new AdminVO();
		vo.setNum(Integer.parseInt(req.getParameter("num")));
		vo.setCafename(req.getParameter("cafename"));
		vo.setCafemainmenu(req.getParameter("cafemainmenu"));
		vo.setCafephone(req.getParameter("cafephone"));
		vo.setCafeaddr(req.getParameter("cafeaddr"));
		vo.setLatitude(req.getParameter("latitude"));
		vo.setLongitude(req.getParameter("longitude"));
		vo.setCafefavor(req.getParameter("cafefavor"));
		vo.setCafestar(Integer.parseInt(req.getParameter("cafestar")));
		vo.setCafeparking(req.getParameter("cafeparking"));
		vo.setCafeholi(req.getParameter("cafeholi"));
		vo.setCafetime(req.getParameter("cafetime"));
		vo.setCafeshutdown(req.getParameter("cafeshutdown"));
		vo.setCafedelivery(req.getParameter("cafedelivery"));
		vo.setCafewritedate(req.getParameter("cafewritedate"));
		
		// ���ε���� 
		
		folder = req.getRealPath("/upload");
		System.out.println(folder);
		ModelAndView mav = new ModelAndView();
    	//���� ����
		File f = new File(folder);
		if(!f.isDirectory()){//�����ִ��� Ȯ��
			f.mkdirs();//��������
		}		
		
		//cafepic ÷�����ϸ��
		MultipartHttpServletRequest mr = (MultipartHttpServletRequest)req;
		List<MultipartFile> flist= mr.getFiles("cafepic");		
		if(flist!=null){
			for(int i=0;i<flist.size();i++){
				MultipartFile mf = flist.get(i);
				//�Ű�������
				String aguName = mf.getName();
				//���ε��� ���� ���ϸ�
				String orgFilename = mf.getOriginalFilename();
				if(!orgFilename.isEmpty()){//////
					//���ε��� ���ϸ��� �����ϴ��� Ȯ��  d:/springUpload   
					File fCheck = new File(folder,orgFilename);
					//rename
					int cnt=1;
					String newFilename = orgFilename;
					while(fCheck.exists()){//������ �����ϴ� �� Ȯ�� index.png
						int idx = orgFilename.lastIndexOf(".");//������ .�� �ε���
						String firstFile = orgFilename.substring(0, idx) ;
						String lastFile = orgFilename.substring(idx+1);
						
						fCheck = new File(folder, firstFile+cnt+"."+lastFile );
						if(!fCheck.exists()){//���θ��� ���ϸ��� ���ε� ������ ������
							newFilename = fCheck.getName();
							break;
						}
						cnt++;
					}//while
				    //���Ͼ��ε�
					try{
						mf.transferTo(new File(folder, newFilename));
					}catch(IOException ie){ie.printStackTrace();}
					mav.addObject("cafepic"+(i+1), newFilename);
					if(i==0)vo.setCafepic1(newFilename);
					if(i==1)vo.setCafepic2(newFilename);
					if(i==2)vo.setCafepic3(newFilename);
					if(i==3)vo.setCafepic4(newFilename);
					if(i==4)vo.setCafepic5(newFilename);
				}//if
			}//for
		}//if
		//cafepic ÷�����ϸ�� ��
		
		
		List<MultipartFile> flist2= mr.getFiles("cafemenupic");		
		if(flist2!=null){
			for(int i=0;i<flist2.size();i++){
				MultipartFile mf2 = flist2.get(i);
				//�Ű�������
				String aguName2 = mf2.getName();
				//���ε��� ���� ���ϸ�
				String orgFilename2 = mf2.getOriginalFilename();
				if(!orgFilename2.isEmpty()){//////
					//���ε��� ���ϸ��� �����ϴ��� Ȯ��  d:/springUpload   
					File fCheck2 = new File(folder,orgFilename2);
					//rename
					int cnt=1;
					String newFilename2 = orgFilename2;
					while(fCheck2.exists()){//������ �����ϴ� �� Ȯ�� index.png
						int idx2 = orgFilename2.lastIndexOf(".");//������ .�� �ε���
						String firstFile2 = orgFilename2.substring(0, idx2) ;
						String lastFile2 = orgFilename2.substring(idx2+1);
						
						fCheck2 = new File(folder, firstFile2+cnt+"."+lastFile2 );
						if(!fCheck2.exists()){//���θ��� ���ϸ��� ���ε� ������ ������
							newFilename2 = fCheck2.getName();
							break;
						}
						cnt++;
					}//while
				    //���Ͼ��ε�
					try{
						mf2.transferTo(new File(folder, newFilename2));
					}catch(IOException ie){ie.printStackTrace();}
					mav.addObject("cafemenupic"+(i+1), newFilename2);
					if(i==0)vo.setCafemenupic1(newFilename2);
					if(i==1)vo.setCafemenupic2(newFilename2);
				}//if
			}//for
		}//if
		//cafenemupic ÷�����ϸ�� ��
		System.out.println("cafeNum ���尪 : "+vo.getNum());
		System.out.println("cafename ���尪 : "+vo.getCafename());
		System.out.println("cafemainmenu ���尪 : "+vo.getCafemainmenu());
		System.out.println("cafestar ���尪 : "+vo.getCafestar());
		System.out.println("latitude ���尪 : "+vo.getLatitude());
		System.out.println("longitude ���尪 : "+vo.getLongitude());
		
		System.out.println("cafepic1 ���尪 : "+vo.getCafepic1());
		System.out.println("cafepic2 ���尪 : "+vo.getCafepic2());
		System.out.println("cafepic3 ���尪 : "+vo.getCafepic3());
		System.out.println("cafepic4 ���尪 : "+vo.getCafepic4());
		System.out.println("cafepic5 ���尪 : "+vo.getCafepic5());
		System.out.println("cafemenupic1 ���尪 : "+vo.getCafemenupic1());
		System.out.println("cafemenupic2 ���尪 : "+vo.getCafemenupic2());
		
		
		int cnt = dao.updateRecord(vo);
		System.out.println("cnt = "+cnt); //Ȯ�θ�
		mav.addObject("num",vo.getNum());
		mav.setViewName("redirect:cafe_view"); //redirect�ؼ� ��Ʈ�ѷ� ȣ��
		return mav;
	}
	@RequestMapping("/cafe_del")
	public ModelAndView del(@RequestParam("num") int num){
		AdminDAOInterface dao = sqlSession.getMapper(AdminDAOInterface.class);
		dao.deleteRecord(num);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:cafe_list");
		return mav;
	}
}
















