package pers.qingyu.book.manage.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


/**
 * 调度控制器
 * @author IsQingyu
 *
 */
@Controller
public class DispatchaerController {

	@RequestMapping("/login")
	public String login () {
		return "user/login";
	}
	
	@RequestMapping("/main")
	public String main () {
		return "main";
	}
	
	@RequestMapping("readerMain")
	public String readerMain () {
		return "readerMain";
	}
	
	@RequestMapping("/logout")
	public String logout (HttpSession session) {
		session.invalidate();
		return "redirect:/login";
	}
	

	
}
