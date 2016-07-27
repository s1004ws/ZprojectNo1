package com.project.webApp.custom;

import java.util.StringTokenizer;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.request.SessionScope;
import org.springframework.web.servlet.ModelAndView;

import com.project.webApp.admin.AdminVO;


@Controller
public class CustomController {
	@Autowired
	SqlSession sqlSession;
	
	@RequestMapping("/login")
	public String login(){
		return "custom/loginform";
	}
	
	@RequestMapping("/email_login")
	public String email_login(){
		return "emailLogin/emailLoginform";
	}
	@RequestMapping("/email_join")
	public String email_join(){
		return "emailLogin/emailJoinform";
	}
	@RequestMapping("/emailCheck")
	public ModelAndView del(@RequestParam("user_email") String user_email){
		CustomDAOInterface dao = sqlSession.getMapper(CustomDAOInterface.class);

		int cnt = dao.emailChk(user_email);
		
		System.out.println("이메일 체크 = " + cnt);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("cnt",cnt);
		mav.addObject("user_email", user_email);
		mav.setViewName("emailLogin/emailCheck");
		return mav;
	}
	@RequestMapping("/email_join_ok")
	public ModelAndView email_join_ok(HttpServletRequest req, CustomVO vo){
		CustomDAOInterface dao = sqlSession.getMapper(CustomDAOInterface.class);
		System.out.println("이메일 = "+vo.getUser_email());
		System.out.println("비밀번호 = "+vo.getUser_email_password());
		int cnt = dao.insertCustom(vo);
		System.out.println("cnt = "+cnt);	
		ModelAndView mav = new ModelAndView();
		mav.addObject("cnt", cnt);
		mav.setViewName("emailLogin/emailJoinformOk"); //redirect해서 컨트롤러 호출
		return mav;
	}
	@RequestMapping("/email_login_ok")
	public ModelAndView email_login_ok(HttpServletRequest req, CustomVO vo){
		CustomDAOInterface dao = sqlSession.getMapper(CustomDAOInterface.class);
		int cnt = dao.selectCustom(vo);
		HttpSession session = req.getSession();
		
		if(cnt == 0){
			vo.setLoginStatus("N");
			session.setAttribute("loginStatus", vo.getLoginStatus());
		} else {
			vo.setLoginStatus("Y");
			session.setAttribute("user_email", vo.getUser_email());
			session.setAttribute("loginStatus", vo.getLoginStatus());
		}
		
		System.out.println("이메일 = "+vo.getUser_email());
		System.out.println("비밀번호 = "+vo.getUser_email_password());
		System.out.println("cnt = "+cnt);	
		System.out.println("로그인 상태 = "+ session.getAttribute("loginStatus"));
		System.out.println("세션이메일 = "+ session.getAttribute("user_email"));
		//String loginStatus = vo.getLoginStatus();
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("user_email", vo.getUser_email());
		mav.addObject("loginStatus", vo.getLoginStatus());
		mav.setViewName("emailLogin/emailLoginformOk"); //redirect해서 컨트롤러 호출
		
		return mav;
	}
	@RequestMapping("/logout")
	public ModelAndView logout(HttpServletRequest req){
		HttpSession session = req.getSession();
		session.invalidate();//session 을 삭제하는 클래스
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:/");
		return mav;

	}
	@RequestMapping("/mypage")
	public ModelAndView mypage(HttpServletRequest req, CustomVO vo){
		HttpSession session = req.getSession();
		CustomDAOInterface dao = sqlSession.getMapper(CustomDAOInterface.class);
		vo.setUser_email((String)session.getAttribute("user_email"));
		//session이 object로 나오니깐 String으로 형변환
	
		String f = dao.selectCustomFavor(vo);
		
		if(f!=null){
		StringTokenizer st = new StringTokenizer(f, "-");
		String favor[] = new String[st.countTokens()];
		int i=0;
		while(st.hasMoreTokens()){
			favor[i++] = st.nextToken();
		}
		ModelAndView mav = new ModelAndView();
		mav.addObject("favor1",favor[0]);
		mav.addObject("favor2",favor[1]);
		mav.addObject("favor3",favor[2]);
		mav.addObject("favor4",favor[3]);
		mav.addObject("favor5",favor[4]);
		mav.setViewName("custom/mypage"); //redirect해서 컨트롤러 호출
		return mav;
		}
		else{ 
			ModelAndView mav = new ModelAndView();
			mav.setViewName("custom/mypage");
			return mav;
		}
	}
	@RequestMapping("/myfavorOk")
	public ModelAndView myfavorOk(HttpServletRequest req, CustomVO vo){
		HttpSession session = req.getSession();
		CustomDAOInterface dao = sqlSession.getMapper(CustomDAOInterface.class);
		vo.getFavorlist();
		System.out.println("취향 = "+vo.getFavorlist());
		vo.setUser_email((String)session.getAttribute("user_email"));
		//session이 object로 나오니깐 String으로 형변환
		int cnt = dao.updateCustomFavor(vo);


		ModelAndView mav = new ModelAndView();
		mav.addObject("cnt", cnt);
		
		mav.setViewName("redirect:/mypage"); //redirect해서 컨트롤러 호출
		return mav;
	}
}
