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
		
		//총레코드수
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
		//파일업로드 랑 같이 해야하므로 enc 때문에
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
		
		// 업로드관련 
		
		folder = req.getRealPath("/upload");
		System.out.println(folder);
		ModelAndView mav = new ModelAndView();
    	//폴더 생성
		File f = new File(folder);
		if(!f.isDirectory()){//폴더있는지 확인
			f.mkdirs();//폴더생성
		}		
		
		//cafepic 첨부파일목록
		MultipartHttpServletRequest mr = (MultipartHttpServletRequest)req;
		List<MultipartFile> flist= mr.getFiles("cafepic");		
		if(flist!=null){
			for(int i=0;i<flist.size();i++){
				MultipartFile mf = flist.get(i);
				//매개변수명
				String aguName = mf.getName();
				//업로드할 원래 파일명
				String orgFilename = mf.getOriginalFilename();
				if(!orgFilename.isEmpty()){//////
					//업로드할 파일명이 존재하는지 확인  d:/springUpload   
					File fCheck = new File(folder,orgFilename);
					//rename
					int cnt=1;
					String newFilename = orgFilename;
					while(fCheck.exists()){//파일이 존재하는 지 확인 index.png
						int idx = orgFilename.lastIndexOf(".");//마지막 .의 인덱스
						String firstFile = orgFilename.substring(0, idx) ;
						String lastFile = orgFilename.substring(idx+1);
						
						fCheck = new File(folder, firstFile+cnt+"."+lastFile );
						if(!fCheck.exists()){//새로만든 파일명이 업로드 폴더에 없으면
							newFilename = fCheck.getName();
							break;
						}
						cnt++;
					}//while
				    //파일업로드
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
		//cafepic 첨부파일목록 끝
		
		
		List<MultipartFile> flist2= mr.getFiles("cafemenupic");		
		if(flist2!=null){
			for(int i=0;i<flist2.size();i++){
				MultipartFile mf2 = flist2.get(i);
				//매개변수명
				String aguName2 = mf2.getName();
				//업로드할 원래 파일명
				String orgFilename2 = mf2.getOriginalFilename();
				if(!orgFilename2.isEmpty()){//////
					//업로드할 파일명이 존재하는지 확인  d:/springUpload   
					File fCheck2 = new File(folder,orgFilename2);
					//rename
					int cnt=1;
					String newFilename2 = orgFilename2;
					while(fCheck2.exists()){//파일이 존재하는 지 확인 index.png
						int idx2 = orgFilename2.lastIndexOf(".");//마지막 .의 인덱스
						String firstFile2 = orgFilename2.substring(0, idx2) ;
						String lastFile2 = orgFilename2.substring(idx2+1);
						
						fCheck2 = new File(folder, firstFile2+cnt+"."+lastFile2 );
						if(!fCheck2.exists()){//새로만든 파일명이 업로드 폴더에 없으면
							newFilename2 = fCheck2.getName();
							break;
						}
						cnt++;
					}//while
				    //파일업로드
					try{
						mf2.transferTo(new File(folder, newFilename2));
					}catch(IOException ie){ie.printStackTrace();}
					mav.addObject("cafemenupic"+(i+1), newFilename2);
					if(i==0)vo.setCafemenupic1(newFilename2);
					if(i==1)vo.setCafemenupic2(newFilename2);
				}//if
			}//for
		}//if
		//cafenemupic 첨부파일목록 끝
		System.out.println("cafename 저장값 : "+vo.getCafename());
		System.out.println("cafemainmenu 저장값 : "+vo.getCafemainmenu());
		System.out.println("cafestar 저장값 : "+vo.getCafestar());
		System.out.println("latitude 저장값 : "+vo.getLatitude());
		System.out.println("longitude 저장값 : "+vo.getLongitude());
		
		System.out.println("cafepic1 저장값 : "+vo.getCafepic1());
		System.out.println("cafepic2 저장값 : "+vo.getCafepic2());
		System.out.println("cafepic3 저장값 : "+vo.getCafepic3());
		System.out.println("cafepic4 저장값 : "+vo.getCafepic4());
		System.out.println("cafepic5 저장값 : "+vo.getCafepic5());
		System.out.println("cafemenupic1 저장값 : "+vo.getCafemenupic1());
		System.out.println("cafemenupic2 저장값 : "+vo.getCafemenupic2());
		
		
		int cnt = dao.insertRecord(vo);
		System.out.println("cnt = "+cnt);
		mav.setViewName("redirect:cafe_list"); //redirect해서 컨트롤러 호출
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
		//파일업로드 랑 같이 해야하므로 enc 때문에
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
		
		// 업로드관련 
		
		folder = req.getRealPath("/upload");
		System.out.println(folder);
		ModelAndView mav = new ModelAndView();
    	//폴더 생성
		File f = new File(folder);
		if(!f.isDirectory()){//폴더있는지 확인
			f.mkdirs();//폴더생성
		}		
		
		//cafepic 첨부파일목록
		MultipartHttpServletRequest mr = (MultipartHttpServletRequest)req;
		List<MultipartFile> flist= mr.getFiles("cafepic");		
		if(flist!=null){
			for(int i=0;i<flist.size();i++){
				MultipartFile mf = flist.get(i);
				//매개변수명
				String aguName = mf.getName();
				//업로드할 원래 파일명
				String orgFilename = mf.getOriginalFilename();
				if(!orgFilename.isEmpty()){//////
					//업로드할 파일명이 존재하는지 확인  d:/springUpload   
					File fCheck = new File(folder,orgFilename);
					//rename
					int cnt=1;
					String newFilename = orgFilename;
					while(fCheck.exists()){//파일이 존재하는 지 확인 index.png
						int idx = orgFilename.lastIndexOf(".");//마지막 .의 인덱스
						String firstFile = orgFilename.substring(0, idx) ;
						String lastFile = orgFilename.substring(idx+1);
						
						fCheck = new File(folder, firstFile+cnt+"."+lastFile );
						if(!fCheck.exists()){//새로만든 파일명이 업로드 폴더에 없으면
							newFilename = fCheck.getName();
							break;
						}
						cnt++;
					}//while
				    //파일업로드
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
		//cafepic 첨부파일목록 끝
		
		
		List<MultipartFile> flist2= mr.getFiles("cafemenupic");		
		if(flist2!=null){
			for(int i=0;i<flist2.size();i++){
				MultipartFile mf2 = flist2.get(i);
				//매개변수명
				String aguName2 = mf2.getName();
				//업로드할 원래 파일명
				String orgFilename2 = mf2.getOriginalFilename();
				if(!orgFilename2.isEmpty()){//////
					//업로드할 파일명이 존재하는지 확인  d:/springUpload   
					File fCheck2 = new File(folder,orgFilename2);
					//rename
					int cnt=1;
					String newFilename2 = orgFilename2;
					while(fCheck2.exists()){//파일이 존재하는 지 확인 index.png
						int idx2 = orgFilename2.lastIndexOf(".");//마지막 .의 인덱스
						String firstFile2 = orgFilename2.substring(0, idx2) ;
						String lastFile2 = orgFilename2.substring(idx2+1);
						
						fCheck2 = new File(folder, firstFile2+cnt+"."+lastFile2 );
						if(!fCheck2.exists()){//새로만든 파일명이 업로드 폴더에 없으면
							newFilename2 = fCheck2.getName();
							break;
						}
						cnt++;
					}//while
				    //파일업로드
					try{
						mf2.transferTo(new File(folder, newFilename2));
					}catch(IOException ie){ie.printStackTrace();}
					mav.addObject("cafemenupic"+(i+1), newFilename2);
					if(i==0)vo.setCafemenupic1(newFilename2);
					if(i==1)vo.setCafemenupic2(newFilename2);
				}//if
			}//for
		}//if
		//cafenemupic 첨부파일목록 끝
		System.out.println("cafeNum 저장값 : "+vo.getNum());
		System.out.println("cafename 저장값 : "+vo.getCafename());
		System.out.println("cafemainmenu 저장값 : "+vo.getCafemainmenu());
		System.out.println("cafestar 저장값 : "+vo.getCafestar());
		System.out.println("latitude 저장값 : "+vo.getLatitude());
		System.out.println("longitude 저장값 : "+vo.getLongitude());
		
		System.out.println("cafepic1 저장값 : "+vo.getCafepic1());
		System.out.println("cafepic2 저장값 : "+vo.getCafepic2());
		System.out.println("cafepic3 저장값 : "+vo.getCafepic3());
		System.out.println("cafepic4 저장값 : "+vo.getCafepic4());
		System.out.println("cafepic5 저장값 : "+vo.getCafepic5());
		System.out.println("cafemenupic1 저장값 : "+vo.getCafemenupic1());
		System.out.println("cafemenupic2 저장값 : "+vo.getCafemenupic2());
		
		
		int cnt = dao.updateRecord(vo);
		System.out.println("cnt = "+cnt); //확인만
		mav.addObject("num",vo.getNum());
		mav.setViewName("redirect:cafe_view"); //redirect해서 컨트롤러 호출
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
















