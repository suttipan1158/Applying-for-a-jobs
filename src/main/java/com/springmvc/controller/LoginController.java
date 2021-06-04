package com.springmvc.controller;



import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.apache.jasper.tagplugins.jstl.core.Remove;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.springmvc.manager.LoginManager;
import com.springmvc.model.Login;

@Controller
public class LoginController {
		
	///line Go Login
		@RequestMapping(value="/goLogin",method=RequestMethod.GET)
				public String loadLoginPage(){
					return "login"; 
				}
		
		@RequestMapping(value="/isValidateLogin",method=RequestMethod.POST)
		public String getLoginData(HttpServletRequest req , Model md ,
				HttpSession session , Login userlogin,BindingResult br){
				try {
				 System.out.println(br.getAllErrors().size());
				 session.setMaxInactiveInterval(6000);
					 if(br.hasErrors()){
						 System.out.println("Server side validation");
					 }else{
						 String username = req.getParameter("username");
						 String pdw = req.getParameter("password");
						 	
						LoginManager lm = new LoginManager();
						List<Login> user = lm.isValidateLogin(username,pdw);	
						if(!user.isEmpty() && user.get(0).getStatus().equals("อนุญาตให้เข้าใช้งาน")) {
							
								Login login = new Login();
								for(Login l :user) {
									 login = new Login(l.getUsername(),l.getPassword(),l.getLoginType(),l.getStatus());
								}
								System.out.println("login =="+login.getUsername() + " " + login.getPassword());
								md.addAttribute("user", login);
								md.addAttribute("msgLogin", "0");
								session.setAttribute("user", login);
								
								 return "index";
							
						}else {
							md.addAttribute("msgLogin", "1");
							
						}
					 }
					 return "login";
				}catch(Exception e){
					md.addAttribute("msgLogin", "1");
					return "login";
				}
		}
		
		
		@RequestMapping(value="/LogOut",method=RequestMethod.GET)
		public String do_LogOut(HttpSession session ){
				session.removeAttribute("user");
				return "index";
					
		}
}
