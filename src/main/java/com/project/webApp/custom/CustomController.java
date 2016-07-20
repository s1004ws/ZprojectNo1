package com.project.webApp.custom;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CustomController {
	@Autowired
	SqlSession sqlSession;
	
	@RequestMapping("/login")
	public String admin(){
		return "custom/loginform";
	}
}
