package edu.vinaenter.controller;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpSession;
import javax.swing.plaf.basic.BasicTreeUI.CellEditorHandler;
import javax.validation.Valid;

import org.apache.tomcat.util.http.parser.HttpParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import edu.vinaenter.dao.Detail_OrderDao;
import edu.vinaenter.dao.ItemsDao;
import edu.vinaenter.dao.OrderDao;
import edu.vinaenter.dao.ProductDao;
import edu.vinaenter.dao.Slides_Dao;
import edu.vinaenter.dao.UsersDao;
import edu.vinaenter.model.Detail_Order;
import edu.vinaenter.model.Order;
import edu.vinaenter.model.Product;
import edu.vinaenter.model.Users;
import edu.vinaenter.util.SlugUtil;

@Controller
public class PublicJoTController {
	@Autowired
	private ItemsDao itemsDao;
	@Autowired
	private ProductDao productDao;
	@Autowired
	private UsersDao usersDao;
	@Autowired
	private OrderDao orderDao;
	@Autowired
	private Detail_OrderDao detail_orderDao;
	@Autowired
	private SlugUtil slugUtil;
	@Autowired
	private Slides_Dao slideDao;

	@ModelAttribute
	public void addCommons(ModelMap modelMap) {
		modelMap.addAttribute("slugUtil", slugUtil);
	}

	@ModelAttribute
	public void commondMenu(ModelMap modelMap) {
		modelMap.addAttribute("arItems", itemsDao.getItems());
	}

	@RequestMapping("")
	public String index(ModelMap modelMap) {
		modelMap.addAttribute("arHotItems", productDao.getHotItems());
		modelMap.addAttribute("arSlides", slideDao.getItems());
		return "public.jot.index";
	}

	@RequestMapping("/shop")
	public String shop(ModelMap modelMap) {
		modelMap.addAttribute("arAllItems", productDao.getAllItems());
		return "public.shop.index";
	}

	@RequestMapping("/collections/{name_items}-{id_items}")
	public String categories(ModelMap modelMap, @PathVariable("id_items") int id_items) {
		modelMap.addAttribute("arCat", productDao.getItemsByCat(id_items));
		return "public.categories.index";
	}

	@RequestMapping("/product/sort")
	public String sort(ModelMap modelMap, @RequestParam("sort") int sort) {
		if (sort == 1) {
			modelMap.addAttribute("arAllItems", productDao.sortPrizeLowToHight());
		} else if (sort == 2) {
			modelMap.addAttribute("arAllItems", productDao.sortPrizeHightToLow());
		} else if (sort == 3) {
			modelMap.addAttribute("arAllItems", productDao.sortAToZ());
		} else {
			modelMap.addAttribute("arAllItems", productDao.sortZToA());
		}
		return "public.shop.index";
	}

	@RequestMapping("/product/{name_product}-{id_product}")
	public String detail(ModelMap modelMap, @PathVariable("id_product") int id_product) {
		modelMap.addAttribute("objProduct", productDao.getItemsByID(id_product));
		modelMap.addAttribute("arSize", productDao.getSize(productDao.getItemsByID(id_product).getName_product()));
		modelMap.addAttribute("arProductByCat",
				productDao.getItemsByCatLimit(productDao.getItemsByID(id_product).getId_items(),
						productDao.getItemsByID(id_product).getName_product()));
		return "public.detail.index";
	}

	@RequestMapping(value = "/search", method = RequestMethod.GET)
	public String search() {
		return "public.search";
	}

	@RequestMapping(value = "/search", method = RequestMethod.POST)
	public String search(ModelMap modelMap, @RequestParam("search") String search) {
		ArrayList<Product> arSearch = productDao.getSearch(search);
		if (arSearch.size() == 0) {
			modelMap.addAttribute("noti", "Không có sản phẩm nào phù hợp");
		} else {
			modelMap.addAttribute("arSearch", arSearch);
		}
		return "public.search";
	}

	@RequestMapping(value = "/shoppingcart", method = RequestMethod.GET)
	public String shoppingcart() {
		return "public.shoppingcart";
	}

	@RequestMapping(value = "/shoppingcart/{id_product}/{quantity}", method = RequestMethod.POST)
	public String shoppingcart(@PathVariable("id_product") int id_product, @PathVariable("quantity") int quantity,
			@RequestParam("size") String size, HttpSession session) {
		Product objProduct = productDao.getItemsByID(id_product);
		ArrayList<Detail_Order> order = (ArrayList<Detail_Order>) session.getAttribute("order");
		double unit_price = quantity * objProduct.getPrice();
		double total_price = 0;
		boolean check = true;
		if (order == null) {
			order = new ArrayList<>();
			Detail_Order objDetailOrder = new Detail_Order(1, id_product, objProduct.getName_product(), size,
					objProduct.getHinhanh(), quantity, objProduct.getPrice(), unit_price);
			order.add(objDetailOrder);
		} else {
			Detail_Order objDetailOrder = new Detail_Order(1, id_product, objProduct.getName_product(), size,
					objProduct.getHinhanh(), quantity, objProduct.getPrice(), unit_price);
			for (int i = 0; i < order.size(); i++) {
				if (order.get(i).getName_product().equals(objProduct.getName_product())
						&& order.get(i).getSize().equals(objProduct.getName_size())) {
					order.get(i).setQuantity(order.get(i).getQuantity() + 1);
					order.get(i).setUnit_price(order.get(i).getQuantity() * order.get(i).getPrice());
					check = true;
					break;
				} else {
					check = false;
				}
			}
			if (check == false) {
				order.add(objDetailOrder);
			}
		}
		for (int i = 0; i < order.size(); i++) {
			total_price = total_price + order.get(i).getUnit_price();
		}
		int number_order = order.size();
		session.setAttribute("checkOut", total_price);
		session.setAttribute("order", order);
		session.setAttribute("numberOrder", number_order);
		return "public.shoppingcart";
	}

	@RequestMapping(value = "/deleteCart/{id_product}", method = RequestMethod.GET)
	public String deleteCart(@PathVariable("id_product") int id_product, HttpSession session) {
		ArrayList<Detail_Order> order = (ArrayList<Detail_Order>) session.getAttribute("order");
		double total_price = 0;
		for (int i = 0; i < order.size(); i++) {
			if (order.get(i).getId_product() == id_product) {
				order.remove(order.get(i));
			}
		}
		for (int i = 0; i < order.size(); i++) {
			total_price = total_price + order.get(i).getUnit_price();
		}
		if (order.size() == 0) {
			session.invalidate();
		} else {
			session.removeAttribute("order");
			session.setAttribute("order", order);
			session.setAttribute("checkOut", total_price);
			session.setAttribute("numberOrder", order.size());
		}
		return "public.shoppingcart";
	}

	@RequestMapping(value = "/updateCart/{id_product}")
	public String updateCart(HttpSession session, @PathVariable("id_product") int id_product,
			@RequestParam("quantity") int quantity) {
		ArrayList<Detail_Order> order = (ArrayList<Detail_Order>) session.getAttribute("order");
		double total_price = 0;
		for (int i = 0; i < order.size(); i++) {
			if (id_product == order.get(i).getId_product()) {
				order.get(i).setQuantity(quantity);
				order.get(i).setUnit_price(order.get(i).getQuantity() * order.get(i).getPrice());
			}
			total_price = total_price + order.get(i).getUnit_price();
		}
		session.setAttribute("checkOut", total_price);
		return "public.shoppingcart";
	}

	@RequestMapping("/joinWithUs")
	public String joinWithUs(RedirectAttributes ra, ModelMap modelMap, @Valid @ModelAttribute("user") Users user,
			BindingResult br) {
		if (br.hasErrors()) {
			modelMap.addAttribute("arHotItems", productDao.getHotItems());
			return "public.jot.index";
		}
		ArrayList<Users> arUser = usersDao.getItems();
		if (user.getUsername().equals("admin")) {
			ra.addFlashAttribute("check", "You can't register with this username");
			modelMap.addAttribute("arAllItems", productDao.getAllItems());
			return "redirect:/shop";
		}
		for (int i = 0; i < arUser.size(); i++) {
			if (user.getUsername().equals(arUser.get(i).getUsername())) {
				ra.addFlashAttribute("check", "Username is already use");
				modelMap.addAttribute("arAllItems", productDao.getAllItems());
				return "redirect:/shop";
			}
		}
		if (usersDao.addItem(user) > 0) {
			modelMap.addAttribute("msg", "Thank you for joinning");
			modelMap.addAttribute("arAllItems", productDao.getAllItems());
		} else {
			modelMap.addAttribute("msg", "Sorry signing not success");
			modelMap.addAttribute("arAllItems", productDao.getAllItems());
		}
		return "public.shop.index";
	}

	@RequestMapping(value = "/checkOrder", method = RequestMethod.GET)
	public String CheckOrder() {
		return "public.checkorder";
	}

	@RequestMapping(value = "/checkOrder", method = RequestMethod.POST)
	public String CheckOrder(HttpSession session, @ModelAttribute("order") Order order, ModelMap modelMap,
			RedirectAttributes ra) {
		ArrayList<Detail_Order> arDetail = (ArrayList<Detail_Order>) session.getAttribute("order");
		Date date = new Date();
		Timestamp date_create = new Timestamp(date.getTime());
		// double checkOut = (double) session.getAttribute("checkOut");
		if ("".equals(order.getFullname()) || "".equals(order.getPhone()) || "".equals(order.getAddress())) {
			ra.addFlashAttribute("msg", "Hãy điền đầy đủ thông tin");
			return "redirect:/checkOrder";
		} else if (order.getPhone().length() < 10) {
			ra.addFlashAttribute("checkPhone", "Hãy nhập đúng số điện thoại");
			return "redirect:/checkOrder";
		}
		order.setDate_create(date_create);
		session.setAttribute("objOrder", order);
		modelMap.addAttribute("arDetailOrder", arDetail);
		return "public.confirmorder";
	}

	@RequestMapping(value = "/messageconfirm", method = RequestMethod.POST)
	public String MessageConfirm(HttpSession session) {
		Order objOrder = (Order) session.getAttribute("objOrder");
		ArrayList<Detail_Order> arDetail = (ArrayList<Detail_Order>) session.getAttribute("order");
		objOrder.setTotal_price((double) session.getAttribute("checkOut"));
		orderDao.addOrder(objOrder);
		int id_order = orderDao.getID_Order();
		for (int i = 0; i < arDetail.size(); i++) {
			arDetail.get(i).setId_order(id_order);
			detail_orderDao.addDetailOrder(arDetail.get(i));
		}
		session.invalidate();
		return "public.messageconfirm";
	}
}
