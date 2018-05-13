package edu.vinaenter.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import edu.vinaenter.dao.UsersDao;

@Controller
public class LoginController {
	@Autowired
	private UsersDao userDao;
	@RequestMapping("/login")
	public String login() {
		return "auth.login";
	}
	
	@RequestMapping(value="/login/error",method = RequestMethod.GET)
	public String login(@RequestParam("error") String error,ModelMap modelMap) {
		if(error != null) {
			modelMap.addAttribute("loginError", "Sai tên đăng nhập hoặc mật khẩu ");
		}
		return "auth.login";
	}
	
	@RequestMapping(value="/403",produces = "text/plain;charset=UTF-8")
	public String error(ModelMap modelMap) {
		modelMap.addAttribute("authen", "Bạn không có quyền truy cập vào mục này! Xin lỗi vì sự bất tiện này ");
		return "admin.index.index";
	}
}
