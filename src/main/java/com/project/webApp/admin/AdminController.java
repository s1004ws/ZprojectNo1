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
		vo.setCafelunch(req.getParameter("cafelunch"));
		vo.setCafedinner(req.getParameter("cafedinner"));
		vo.setCafelate(req.getParameter("cafelate"));
		vo.setCafealcohol(req.getParameter("cafealcohol"));
		
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
				}//if
			}//for
		}//if
		//cafepic 첨부파일목록 끝

		System.out.println("cafename 저장값 : "+vo.getCafename());
		System.out.println("cafemainmenu 저장값 : "+vo.getCafemainmenu());
		System.out.println("cafestar 저장값 : "+vo.getCafestar());
		System.out.println("latitude 저장값 : "+vo.getLatitude());
		System.out.println("longitude 저장값 : "+vo.getLongitude());
		
		System.out.println("cafepic1 저장값 : "+vo.getCafepic1());
		System.out.println("cafepic2 저장값 : "+vo.getCafepic2());
		System.out.println("cafepic3 저장값 : "+vo.getCafepic3());
		
		System.out.println("cafelunch 저장값 : "+vo.getCafelunch());
		System.out.println("cafedinner 저장값 : "+vo.getCafedinner());
		System.out.println("cafelate 저장값 : "+vo.getCafelate());
		System.out.println("cafealcohol 저장값 : "+vo.getCafealcohol());
		
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
		vo.setCafelunch(req.getParameter("cafelunch"));
		vo.setCafedinner(req.getParameter("cafedinner"));
		vo.setCafelate(req.getParameter("cafelate"));
		vo.setCafealcohol(req.getParameter("cafealcohol"));
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
				}//if
			}//for
		}//if
		//cafepic 첨부파일목록 끝
		
		

		System.out.println("cafeNum 저장값 : "+vo.getNum());
		System.out.println("cafename 저장값 : "+vo.getCafename());
		System.out.println("cafemainmenu 저장값 : "+vo.getCafemainmenu());
		System.out.println("cafestar 저장값 : "+vo.getCafestar());
		System.out.println("latitude 저장값 : "+vo.getLatitude());
		System.out.println("longitude 저장값 : "+vo.getLongitude());
		
		System.out.println("cafepic1 저장값 : "+vo.getCafepic1());
		System.out.println("cafepic2 저장값 : "+vo.getCafepic2());
		System.out.println("cafepic3 저장값 : "+vo.getCafepic3());
	
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
	
	   @RequestMapping("/selectLunch")
	   public ModelAndView selectLunch(HttpServletRequest req){
	      
	      AdminDAOInterface dao = sqlSession.getMapper(AdminDAOInterface.class);
	      List<AdminVO> map= dao.selectLunch();
	      
	      //CafeVO vo = map.get(0);
	      //System.out.println(vo.getCafemainmenu());
	   
	      ModelAndView mav = new ModelAndView();
	      mav.addObject("meal",map);
	      mav.setViewName("/choice/choice");
	      return mav;
	      
	   }
	   @RequestMapping("/selectDinner")
	   public ModelAndView selectDinner(HttpServletRequest req){
	      
		   AdminDAOInterface dao = sqlSession.getMapper(AdminDAOInterface.class);
	      List<AdminVO> map= dao.selectDinner();
	      //System.out.println(map.get(0));
	      
	      ModelAndView mav = new ModelAndView();
	      mav.addObject("meal",map);
	      mav.setViewName("/choice/choice");
	      return mav;
	      
	   }
	   @RequestMapping("/selectLate")
	   public ModelAndView selectLate(HttpServletRequest req){
	      
		   AdminDAOInterface dao = sqlSession.getMapper(AdminDAOInterface.class);
	      List<AdminVO> map= dao.selectLate();
	      //System.out.println(map.get(0));
	      
	      ModelAndView mav = new ModelAndView();
	      mav.addObject("meal",map);
	      mav.setViewName("/choice/choice");
	      return mav;
	      
	   }
	   @RequestMapping("/selectAlcohol")
	   public ModelAndView selectAlcohol(HttpServletRequest req){
	      
		   AdminDAOInterface dao = sqlSession.getMapper(AdminDAOInterface.class);
	      List<AdminVO> map= dao.selectAlcohol();
	      //System.out.println(map.get(0));
	      
	      ModelAndView mav = new ModelAndView();
	      mav.addObject("meal",map);
	      mav.setViewName("/choice/choice");
	      return mav;
	      
	   }
	   
}
















