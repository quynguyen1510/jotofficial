package edu.vinaenter.controller;

import java.security.Principal;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import edu.vinaenter.constant.Defines;
import edu.vinaenter.dao.ItemsDao;
import edu.vinaenter.dao.OrderDao;
import edu.vinaenter.dao.ProductDao;
import edu.vinaenter.dao.UsersDao;

@Controller
@RequestMapping("admin")
public class AdminIndexController {
	@Autowired
	private Defines defines;
	@Autowired
	private UsersDao usersDao;
	@Autowired
	private ProductDao productDao;
	@Autowired
	private ItemsDao itemsDao;
	@Autowired
	private OrderDao orderDao;
	@ModelAttribute
	public void addCommonsObject(ModelMap modelMap) {
		modelMap.addAttribute("defines", defines);
	}
	
	@RequestMapping("")
	public String index(Principal principal,HttpSession session,ModelMap modelMap){
		session.setAttribute("user", usersDao.getItems(principal.getName()));
		modelMap.addAttribute("numberProduct", productDao.countProduct());
		modelMap.addAttribute("numberItems", itemsDao.countItems());
		modelMap.addAttribute("numberUser", usersDao.countUser());
		modelMap.addAttribute("numberOrder", orderDao.countOrder());
		return "admin.index.index";
	}
	
}
