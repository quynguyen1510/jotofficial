package edu.vinaenter.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class PublicContactController {
	@RequestMapping("contact")
	public String index(){
		return "public.contact.index";
	}
}