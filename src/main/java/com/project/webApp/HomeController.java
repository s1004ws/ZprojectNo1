package com.project.webApp;

import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.project.webApp.admin.AdminDAOInterface;
import com.project.webApp.admin.AdminVO;

@Controller
public class HomeController {

	@Autowired
	SqlSession sqlSession;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView home(Locale locale, Model model, HttpServletRequest req) {
		//HttpSession session = req.getSession();
		//model.addAttribute("user_email",session.getAttribute("user_email"));
		AdminDAOInterface dao = sqlSession.getMapper(AdminDAOInterface.class);
		List<AdminVO> list = dao.selectAll();

		ModelAndView mav = new ModelAndView();
		mav.addObject("list",list);
		//mav.addObject("user_email",session.getAttribute("user_email"));
		mav.setViewName("home");
		
		return mav;
	}	
}
