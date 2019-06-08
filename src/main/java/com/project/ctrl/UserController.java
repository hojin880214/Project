package com.project.ctrl;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.project.domain.LoginDTO;
import com.project.domain.UserVO;
import com.project.service.UserService;

@Controller
@RequestMapping("/user")
public class UserController {
	
	@Inject
	private UserService service;
	
	@RequestMapping(value="/login", method=RequestMethod.GET)
	public void loginGET(@ModelAttribute("dto") LoginDTO dto) {
		
	}
	@RequestMapping(value="/loginPost", method=RequestMethod.POST)
	public void loginPOST(LoginDTO dto, HttpSession session,
			Model model) throws Exception{
		UserVO uvo=service.login(dto);
		if(uvo==null) {
			return;
		}
		model.addAttribute("uvo",uvo);
		session.setAttribute("uvo", uvo);
	}
	@RequestMapping(value="/logout", method=RequestMethod.GET)
	public String logout(HttpSession session, HttpServletRequest request, HttpServletResponse response) throws Exception {
		Object obj=session.getAttribute("login");
		if(obj != null) {
			UserVO uvo=(UserVO)obj;
			session.removeAttribute("login");
			session.invalidate();
		}
		return "redirect:/";
	}
	
	@RequestMapping(value = "/signup", method = RequestMethod.GET)
	public void getSignup() throws Exception {
	
	}
	
	@RequestMapping(value = "/signup", method = RequestMethod.POST)
	public String postSignup(UserVO uvo,RedirectAttributes rttr) throws Exception {
	 
	    service.signup(uvo);
	    rttr.addFlashAttribute("msg", "signup_success");
	 return "redirect:/product/mainCateList";
	}
	
	@ResponseBody
	@RequestMapping(value="/checkid",method = RequestMethod.POST)
	public int checkId(@RequestBody UserVO uvo) throws Exception{
	    int result=0;
	    
	    result=service.idCheck(uvo.getUser_id());
	    
	    return result;
	}
}
