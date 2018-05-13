package edu.vinaenter.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import edu.vinaenter.constant.Defines;
import edu.vinaenter.dao.Detail_OrderDao;
import edu.vinaenter.dao.OrderDao;
import edu.vinaenter.model.Detail_Order;
import edu.vinaenter.model.Users;

@Controller
@RequestMapping("admin/order")
public class AdminOrderController {
	@Autowired
	private OrderDao orderDao;
	@Autowired
	private Detail_OrderDao detail_orderDao;
	@Autowired
	private Defines defines;

	@RequestMapping({ "/page/{page}", "" })
	public String index(ModelMap modelMap, @PathVariable(required = false) Integer page, HttpSession session) {
		if (page == null) {
			page = 1;
		}
		Users objUser = (Users) session.getAttribute("user");

		int sumPage = (int) Math.ceil((float) orderDao.countOrder() / defines.ROW_COUNT);
		int offSet = (page - 1) * defines.ROW_COUNT;
		modelMap.addAttribute("sumPage", sumPage);
		modelMap.addAttribute("currentPage", page);
		if (objUser.getRole_id() == 3) {
			modelMap.addAttribute("arOrder", orderDao.getOrderByUsername(objUser.getFullname(), offSet));
		} else {
			modelMap.addAttribute("arOrder", orderDao.getItems(offSet));
		}
		return "admin.order.index";
	}

	@RequestMapping("/detail/{id_order}")
	public String detail(ModelMap modelMap, @PathVariable("id_order") int id_order) {
		modelMap.addAttribute("detail_order", detail_orderDao.getItem(id_order));
		return "admin.order.detail";
	}

	@RequestMapping("/delete/{id_order}")
	public String delete(RedirectAttributes ra, @PathVariable("id_order") int id_order) {
		if (orderDao.deleteOrder(id_order) > 0) {
			detail_orderDao.deleteDetailByOrder(id_order);
			ra.addFlashAttribute("msg", defines.SUCCESS);
		} else {
			ra.addFlashAttribute("msg", defines.ERROR);
		}
		return "redirect:/admin/order";
	}
}
