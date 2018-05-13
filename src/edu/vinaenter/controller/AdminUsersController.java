package edu.vinaenter.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import edu.vinaenter.constant.Defines;
import edu.vinaenter.dao.RolesDao;
import edu.vinaenter.dao.UsersDao;
import edu.vinaenter.model.Users;
import edu.vinaenter.util.StringUtil;

@Controller
@RequestMapping("/admin/users")
public class AdminUsersController {
	@Autowired
	private StringUtil stringUtil;
	@Autowired
	private Defines defines;
	@Autowired
	private UsersDao usersDao;
	@Autowired
	private RolesDao rolesDao;
	@ModelAttribute
	public void addCommonsObject(ModelMap modelMap) {
		modelMap.addAttribute("defines", defines);
	}
	
	@RequestMapping("")
	public String index(ModelMap modelMap) {
		modelMap.addAttribute("arUsers", usersDao.getItems());
		return "admin.users.index";
	}
	
	@RequestMapping(value = "/add" , method = RequestMethod.GET)
	public String add(){
		return "admin.users.add";
	}
	
	@RequestMapping(value = "/add" , method = RequestMethod.POST)
	public String add(@Valid @ModelAttribute("user") Users user,BindingResult br,RedirectAttributes ra){
		if(br.hasErrors()) {
			return "admin.users.add";
		}
		ArrayList<Users> arUsers = usersDao.getItems();
		for(int i = 0 ; i < arUsers.size() ; i++) {
			if("admin".equals(user.getUsername())) {
				ra.addFlashAttribute("check", "Không có quyền đặt tên admin");
				return "redirect:/admin/users/add";
			}
			if(arUsers.get(i).getUsername().equals(user.getUsername())) {
				ra.addFlashAttribute("check", "Trùng tên user");
				return "redirect:/admin/users/add";
			}
		}
		user.setPassword(stringUtil.md5(user.getPassword()));
		if(usersDao.addItem(user) > 0) {
			ra.addFlashAttribute("msg", defines.SUCCESS);
		}else {
			ra.addFlashAttribute("msg", defines.ERROR);
		}
		return "redirect:/admin/users";
	}
	
	@RequestMapping("/edit/{id}")
	public String editItem(@PathVariable("id") int id,ModelMap modelMap) {
		modelMap.addAttribute("objUsers", usersDao.getItem(id));
		modelMap.addAttribute("arRoles", rolesDao.getItems());
		return "admin.users.edit";
	}
	
	@RequestMapping(value = "/edit/{id}" , method = RequestMethod.POST)
	public String edit(@PathVariable("id") int id ,@ModelAttribute("users") Users user, RedirectAttributes ra){
		user.setId(id);
		if(user.getRole_id() == 0) {
			user.setRole_id(usersDao.getItem(id).getRole_id());
		}
		if("".equals(user.getPassword())) {
			user.setPassword(usersDao.getItem(id).getPassword());
		}
		if(usersDao.editItem(user)>0) {
			ra.addFlashAttribute("msg", defines.SUCCESS);
		}else {
			ra.addFlashAttribute("msg", defines.ERROR);
		}
		return "redirect:/admin/users";
	}
	
	@RequestMapping(value ="/profile/{id}" , method = RequestMethod.GET)
	public String profile(@PathVariable("id") int id,ModelMap modelMap,HttpSession session){
		Users objUsers = (Users) session.getAttribute("user");
		if(objUsers.getId() != id) {
			modelMap.addAttribute("error", "Bạn không có quyền hạn này!");
			return "admin.users.profile";
		}else {
		modelMap.addAttribute("objUsers", usersDao.getItem(id));
		return "admin.users.profile";
		}
	}
	
	@RequestMapping(value ="/profile/{id}" , method = RequestMethod.POST)
	public String profile(@PathVariable("id") int id,@ModelAttribute("user") Users user,ModelMap modelMap,@RequestParam("hinhanh") CommonsMultipartFile img,HttpSession session,HttpServletRequest request){
		Users objUsers = (Users) session.getAttribute("user");
		if(objUsers.getId() != id) {
			modelMap.addAttribute("error", "Bạn không có quyền hạn này!");
			return "admin.users.profile";
		}
		if(user.getRole_id()==0) {
			user.setRole_id(usersDao.getItem(id).getRole_id());
		}
		if("".equals(user.getPassword())) {
			user.setPassword(usersDao.getItem(id).getPassword());
		}
		String fileNameOld = usersDao.getItem(id).getAvatar();
		String fileNameNew = img.getOriginalFilename();
		String nameNew = "";
		if(!"".equals(fileNameNew)) {
			String appPath = request.getServletContext().getRealPath("");
			String dirPath = appPath + "uploads";
			File dir = new File(dirPath);
			if(!dir.exists()) {
				dir.mkdirs();
			}
			String headName = "users_";
			String extendName = FilenameUtils.getExtension(fileNameNew);
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddhhmmss");
			nameNew = headName + sdf.format(new Date()) + "." + extendName;
			String filePath = dirPath + File.separator + nameNew;
			//Xóa hình cũ
			if(!"".equals(fileNameOld)) {
				String urlFileDel = dirPath + File.separator + fileNameOld;
				File delFile = new File(urlFileDel);
				delFile.delete();
			}
			try {
				img.transferTo(new File(filePath));
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}else {
			nameNew = fileNameOld;
		}
		user.setAvatar(nameNew);
		user.setId(id);
		if(usersDao.editProfile(user) > 0) {
			modelMap.addAttribute("msg", defines.SUCCESS);
		}else {
			modelMap.addAttribute("msg", defines.ERROR);
		}
		return "admin.users.profile";
		
	}
	
	@RequestMapping(value = "/signup" , method = RequestMethod.POST)
	public String signup(@Valid @ModelAttribute("user") Users user,BindingResult br,@RequestParam("hinhanh") CommonsMultipartFile img,RedirectAttributes ra,HttpServletRequest request){
		if(br.hasErrors()) {
			return "admin.users.signup";
		}
		ArrayList<Users> arUsers = usersDao.getItems();
		for(int i = 0 ; i < arUsers.size() ; i++) {
			if("admin".equals(user.getUsername())) {
				ra.addFlashAttribute("check", "Không có quyền đặt tên admin");
				return "redirect:/admin/users/signup";
			}
			if(arUsers.get(i).getUsername().equals(user.getUsername())) {
				ra.addFlashAttribute("check", "User đã có người sử dụng");
				return "redirect:/admin/users/signup";
			}
		}
		String fileName = img.getOriginalFilename();
		String filePath = "";
		if("".equals(fileName)) {
			user.setAvatar("");
		}else {
			String appPath = request.getServletContext().getRealPath("");
			String dirPath = appPath + "uploads";
			File dir = new File(dirPath);
			if(!dir.exists()) {
				dir.mkdirs();
			}
			String headName = "users_";
			String extendName = FilenameUtils.getExtension(fileName);
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddhhmmss");
			String nameNew = headName + sdf.format(new Date()) + "." + extendName;
			filePath = dirPath + File.separator + nameNew;
			user.setAvatar(nameNew);
		}
		if(usersDao.addProfile(user) > 0) {
			try {
				img.transferTo(new File(filePath));
				ra.addFlashAttribute("msg", defines.SUCCESS);
				return "redirect:/login";
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			}
		}else {
			ra.addFlashAttribute("msg", defines.ERROR);
		}
		return "redirect:/login";
	}
	
	@RequestMapping(value = "/signup" , method = RequestMethod.GET)
	public String signup(){
		return "admin.users.signup";
	}
	@RequestMapping(value = "/delete/{id}" , method = RequestMethod.GET)
	public String delete(@PathVariable("id") int id , RedirectAttributes ra , HttpServletRequest request){
		if(defines.getSuperAdmin().equals(usersDao.getItem(id).getUsername())) {
			ra.addFlashAttribute("msg", "Không có quyền xóa Admin");
			return "redirect:/admin/users";
		}
		String appPath = request.getServletContext().getRealPath("");
		String dirPath = appPath + "uploads";
		File dir = new File(dirPath);
		if(!dir.exists()) {
			dir.mkdirs();
		}
		Users objUsers = usersDao.getItem(id);
		String urlFileDel = dirPath + File.separator + objUsers.getAvatar();
		if(usersDao.deleteItem(id) > 0) {
			File delFile = new File(urlFileDel);
			delFile.delete();
			ra.addFlashAttribute("msg", defines.SUCCESS);
		}else {
			ra.addFlashAttribute("msg", defines.ERROR);
		}
		return "redirect:/admin/users";
	}
	@RequestMapping(value="/active/{userID}/{enable}",method = RequestMethod.POST)
	public String active(@PathVariable("userID") int userID,@PathVariable("enable") int enable,ModelMap modelMap) {
		if(enable == 1 ) {
			enable = 0;
			modelMap.addAttribute("enable", enable);
			modelMap.addAttribute("userID", userID);
			usersDao.editActive(userID,enable);
		}else {
			enable = 1;
			modelMap.addAttribute("enable", enable);
			modelMap.addAttribute("userID", userID);
			usersDao.editActive(userID,enable);
		}
		return "admin.users.active";
	}
	
	
	

}
