package edu.vinaenter.controller;

import java.util.ArrayList;

import javax.validation.Valid;

import org.apache.jasper.tagplugins.jstl.core.Out;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import edu.vinaenter.constant.Defines;
import edu.vinaenter.dao.ItemsDao;
import edu.vinaenter.dao.ProductDao;
import edu.vinaenter.model.Items;

@Controller
@RequestMapping("admin/items")
public class AdminItemsController {
	@Autowired
	private Defines defines;
	@Autowired
	private ItemsDao itemsDao;
	@Autowired
	private ProductDao productDao;
	
	@RequestMapping("")
	public String index(ModelMap modelMap){
		modelMap.addAttribute("arItems", itemsDao.getItems());
		return "admin.item.index";
	}
	
	@RequestMapping(value="/add" , method = RequestMethod.GET)
	public String add() {
		return "admin.item.add";
	}
	
	@RequestMapping(value="/add" , method = RequestMethod.POST)
	public String add(@Valid @ModelAttribute("items") Items objItems,BindingResult br,RedirectAttributes ra) {
		if(br.hasErrors()) {
			return "admin.item.add";
		}
		for(int i = 0 ; i < itemsDao.getItems().size() ; i++) {
			if(objItems.getName_items().equals(itemsDao.getItems().get(i).getName_items())) {
				ra.addFlashAttribute("check", "Is already use please choose another name");
				return "redirect:/admin/items/add";
			}
		}
		if("".equals(objItems.getName_items())) {
			ra.addFlashAttribute("check", "No data to action");
			return "redirect:/admin/items/add";
		}
		if(itemsDao.addItem(objItems) > 0) {
			ra.addFlashAttribute("msg", defines.SUCCESS);
			return "redirect:/admin/items";
		}else {
			ra.addFlashAttribute("msg", defines.ERROR);
			return "redirect:/admin/items";
		}
	}
	@RequestMapping(value="/edit/{id_items}" , method = RequestMethod.GET)
	public String edit(@PathVariable("id_items") int id_items,ModelMap modelMap) {
		modelMap.addAttribute("objItems", itemsDao.getItem(id_items));
		return "admin.item.edit";
	}
	
	@RequestMapping(value="/edit/{id_items}" , method = RequestMethod.POST)
	public String edit(@PathVariable("id_items") int id_items,@ModelAttribute("items") Items objItems,RedirectAttributes ra) {
		if(itemsDao.editItem(objItems)>0) {
			ra.addFlashAttribute("msg", defines.SUCCESS);
		}else {
			ra.addFlashAttribute("msg", defines.ERROR);
		}
		return "redirect:/admin/items";
	}
	@RequestMapping(value="/delete/{id_items}")
	public String delete(@PathVariable("id_items") int id_items,ModelMap modelMap,RedirectAttributes ra) {
		if(itemsDao.deleteItem(id_items) > 0) {
			productDao.deleteItemByCat(id_items);
			ra.addFlashAttribute("msg", defines.SUCCESS);
		}else {
			ra.addFlashAttribute("msg", defines.ERROR);
		}
		return "redirect:/admin/items";
	}
	
}
