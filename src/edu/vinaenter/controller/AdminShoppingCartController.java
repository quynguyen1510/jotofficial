package edu.vinaenter.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("admin/shoppingcart")
public class AdminShoppingCartController {
	@RequestMapping("")
	public String index() {
		return "admin.shoppingcart.index";
	}
}
