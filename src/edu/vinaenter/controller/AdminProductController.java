package edu.vinaenter.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
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
import edu.vinaenter.dao.ItemsDao;
import edu.vinaenter.dao.ProductDao;
import edu.vinaenter.dao.SizeDao;
import edu.vinaenter.model.Product;

@Controller
@RequestMapping("admin/product")
public class AdminProductController {
	@Autowired
	private ProductDao productDao;
	@Autowired
	private Defines defines;
	@Autowired
	private ItemsDao itemsDao;
	
	@Autowired
	private SizeDao sizeDao;
	
	@RequestMapping({"/page/{page}",""})
	public String index(ModelMap modelMap,@PathVariable(required = false) Integer page) {
		if(page == null) {
			page = 1;
		}
		int sumPage = (int) Math.ceil( (float)productDao.countProduct()/defines.ROW_COUNT);
		int offSet = (page-1)*defines.ROW_COUNT;
		modelMap.addAttribute("sumPage", sumPage);
		modelMap.addAttribute("currentPage", page);
		modelMap.addAttribute("arProduct",productDao.getItems(offSet));
		return "admin.product.index";
	}
	
	@RequestMapping(value="/add",method = RequestMethod.GET)
	public String add(ModelMap modelMap) {
		modelMap.addAttribute("arSize", sizeDao.getItems());
		modelMap.addAttribute("arItems", itemsDao.getItems());
		return "admin.product.add";
	}
	
	@RequestMapping(value="/add",method = RequestMethod.POST)
	public String add(@ModelAttribute("product") Product product,BindingResult br,@RequestParam("hinhanh") CommonsMultipartFile img,@RequestParam("picture_description") CommonsMultipartFile img_description,HttpServletRequest request,RedirectAttributes ra,ModelMap modelMap) {
		String fileName = img.getOriginalFilename();
		String fileDescriptionName = img_description.getOriginalFilename();
		if("".equals(fileName)) {
			ra.addFlashAttribute("error", "Hãy thêm hình ảnh");
			return "redirect:/admin/product/add";
		}
		if("".equals(fileDescriptionName)) {
			ra.addFlashAttribute("error", "Hãy thêm hình ảnh");
			return "redirect:/admin/product/add";
		}
		if("".equals(product.getName_product()) || "".equals(product.getDescription()) || product.getId_items() == 0 || product.getId_size() == 0 || product.getPrice() == 0) {
			ra.addFlashAttribute("error", "Hãy thêm đầy đủ thông tin");
			return "redirect:/admin/product/add";
		}
		String appPath = request.getServletContext().getRealPath("");
		String dirPath = appPath + "uploads";
		File dir = new File(dirPath);
		if(!dir.exists()) {
			dir.mkdirs();
		}
		String headName = "product_";
		String extendName = FilenameUtils.getExtension(fileName);
		String headNameDesc = "description_";
		String extendNameDescr = FilenameUtils.getExtension(fileDescriptionName);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddhhmmss");
		String nameNew = headName + sdf.format(new Date()) + "." + extendName;
		String nameDescriptionNew = headNameDesc + sdf.format(new Date()) + "." + extendNameDescr;
		String filePath = dirPath + File.separator + nameNew;
		String filePathDescr = dirPath + File.separator + nameDescriptionNew;
		System.out.println(filePath);
		product.setHinhanh(nameNew);
		product.setPicture_description(nameDescriptionNew);
		if(productDao.addProduct(product) > 0) {
			try {
				img.transferTo(new File(filePath));
				img_description.transferTo(new File(filePathDescr));
				ra.addFlashAttribute("msg", defines.SUCCESS);
				return "redirect:/admin/product";
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			}
		}else {
			ra.addFlashAttribute("msg", defines.ERROR);
			return "redirect:/admin/product";
		}
		return "redirect:/admin/product";
	}
	
	@RequestMapping(value="/edit/{id_product}",method = RequestMethod.GET)
	public String edit(ModelMap modelMap,@PathVariable("id_product") int id_product) {
		modelMap.addAttribute("arSize", sizeDao.getItems());
		modelMap.addAttribute("arItems", itemsDao.getItems());
		modelMap.addAttribute("objProduct", productDao.getItemsByID(id_product));
		return "admin.product.edit";
	}
	@RequestMapping(value="/edit/{id_product}",method = RequestMethod.POST)
	public String edit(@ModelAttribute("product") Product product,BindingResult br,@PathVariable("id_product") int id_product,@RequestParam("hinhanh") CommonsMultipartFile img,@RequestParam("picture_description") CommonsMultipartFile img_description,ModelMap modelMap,HttpServletRequest request,RedirectAttributes ra) {
		String fileNameOld = productDao.getItemsByID(id_product).getHinhanh();
		String fileNameDescOld = productDao.getItemsByID(id_product).getPicture_description();
		String fileNameNew = img.getOriginalFilename();
		String fileDescriptionName = img_description.getOriginalFilename();
		String nameNew = "";
		String nameDescNew = "";
		if(!"".equals(fileNameNew)) {
			String appPath = request.getServletContext().getRealPath("");
			String dirPath = appPath + "uploads";
			File dir = new File(dirPath);
			if(!dir.exists()) {
				dir.mkdirs();
			}
			String headName = "product_";
			String extendName = FilenameUtils.getExtension(fileNameNew);
			String headNameDesc = "description_";
			String extendNameDescr = FilenameUtils.getExtension(fileDescriptionName);
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddhhmmss");
			nameNew = headName + sdf.format(new Date()) + "." + extendName;
			nameDescNew = headNameDesc + sdf.format(new Date()) + "." + extendNameDescr;
			String filePath = dirPath + File.separator + nameNew;
			String filePathDescr = dirPath + File.separator + nameDescNew;
			if(!"".equals(fileNameOld)) {
				String urlFileDel = dirPath + File.separator + fileNameOld;
				File delFile = new File(urlFileDel);
				delFile.delete();
			}
			if(!"".equals(fileNameDescOld)) {
				String urlFileDel = dirPath + File.separator + fileNameDescOld;
				File delFile = new File(urlFileDel);
				delFile.delete();
			}
			try {
				img.transferTo(new File(filePath));
				img_description.transferTo(new File(filePathDescr));
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}else {
			nameNew = fileNameOld;
		}
		if(!"".equals(fileDescriptionName)) {
			String appPath = request.getServletContext().getRealPath("");
			String dirPath = appPath + "uploads";
			File dir = new File(dirPath);
			if(!dir.exists()) {
				dir.mkdirs();
			}
			String headNameDesc = "description_";
			String extendNameDescr = FilenameUtils.getExtension(fileDescriptionName);
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddhhmmss");
			nameDescNew = headNameDesc + sdf.format(new Date()) + "." + extendNameDescr;
			String filePathDescr = dirPath + File.separator + nameDescNew;
			if(!"".equals(fileNameDescOld)) {
				String urlFileDel = dirPath + File.separator + fileNameDescOld;
				File delFile = new File(urlFileDel);
				delFile.delete();
			}
			try {
				img_description.transferTo(new File(filePathDescr));
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}else {
			nameDescNew = fileNameDescOld;
		}
		product.setHinhanh(nameNew);
		product.setId_product(id_product);
		product.setPicture_description(nameDescNew);
		if(productDao.editProduct(product) > 0) {
			productDao.editProductPicture(product.getHinhanh(),product.getPicture_description() ,product.getName_product());
			ra.addFlashAttribute("msg", defines.SUCCESS);
		}else {
			ra.addFlashAttribute("msg", defines.ERROR);
		}
		return "redirect:/admin/product";
	}
	@RequestMapping("/delete/{id_product}")
	public String delete(RedirectAttributes ra,ModelMap modelMap,@PathVariable("id_product") int id_product,HttpServletRequest request) {
		String appPath = request.getServletContext().getRealPath("");
		String dirPath = appPath + "uploads";
		File dir = new File(dirPath);
		String urlDelPicture = dirPath + File.separator + productDao.getItemsByID(id_product).getHinhanh();
		String urlDelPictureDescription = dirPath + File.separator + productDao.getItemsByID(id_product).getPicture_description();
		if(!dir.exists()) {
			dir.mkdirs();
		}
		if(productDao.deleteItem(id_product) > 0) {
			System.out.println(urlDelPicture);
			File delFile = new File(urlDelPicture);
			delFile.delete();
			File delFileDesc = new File(urlDelPictureDescription);
			delFileDesc.delete();
			ra.addFlashAttribute("msg", defines.SUCCESS);
		}else {
			ra.addFlashAttribute("msg", defines.ERROR);
		}
		return "redirect:/admin/product";
	}
	
}
