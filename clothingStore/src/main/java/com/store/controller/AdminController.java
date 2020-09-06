package com.store.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.store.dao.CategoryDao;
import com.store.dto.CategoryDto;
import com.store.dto.OrderDto;
import com.store.dto.StockDto;
import com.store.service.AdminService;
import com.store.service.OrderService;
import com.store.service.ProductService;
import com.store.service.StockService;

@Controller
public class AdminController {
	
	@Autowired
	AdminService service;
	@Autowired
	OrderService orderService;
	@Autowired
	CategoryDao categoryDao;
	@Autowired
	ProductService productService;
	@Autowired
	StockService stockService;
	
	@RequestMapping("/admin")
	public String cusCenter(Model model) {
		return "redirect:/admin/adminProduct";
	}
	
	@RequestMapping("/admin/adminProduct")
	public String adminProduct(Model model) {
		System.out.println("상품 등록 폼");		
		Gson gson = new Gson();
		List<CategoryDto> allcat = categoryDao.getAllCatDao();
		model.addAttribute("allcat", gson.toJson(allcat));
		
		return "/admin/addProduct";
	}
	
	@GetMapping("/admin/updateProductForm")
	public String updateProductForm(Model model, @RequestParam("pd_id")int pd_id) {
		System.out.println("상품 수정 폼");
		
		Gson gson = new Gson();
		List<CategoryDto> allcat = categoryDao.getAllCatDao();
		List<StockDto> pd_stock = stockService.productStock(pd_id);
		model.addAttribute("allcat", gson.toJson(allcat));
		model.addAttribute("pd_stock", gson.toJson(pd_stock));
		model.addAttribute("pDto", productService.adminViewProduct(pd_id));
		
		return "/admin/updateProduct";
	}
	
	@RequestMapping("/admin/adminQna")
	public String adminQna(@RequestParam(defaultValue="1") int page, Model model) {
		
		Map<String, Object> map=service.adminQnaService(page);
		model.addAttribute("list", map.get("dto"));
		model.addAttribute("page", map.get("page"));
	
		return "/admin/qna_main";
	}
	
	@RequestMapping("/admin/adminQnaView")
	public String adminQnaView(@RequestParam("id")int id, Model model) {
		model.addAttribute("dto", service.adminQnaViewService(id));
		return "/admin/qna_view";
	}
	
	@RequestMapping("/admin/adminQnaUpdate")
	public String adminQnaUpdate(@RequestParam("id")int id, @RequestParam("answer")String answer, Model model) {
		if(answer.trim().length()==0 || answer==null) {
			model.addAttribute("result", 1);
			return "admin/qna_view";
		}
		service.adminQnaUpdateService(id, answer);
		model.addAttribute("result", 10);
		return "/admin/qna_view";
	}
	
	@RequestMapping("/admin/adminQnaDelete")
	public String adminQnaDelete(@RequestParam("id")int id, HttpServletRequest req) {
		String realPath=req.getServletContext().getRealPath("/resources/questionFile");
		service.adminQnaDeleteService(id,realPath);
		
		return "redirect:/admin/adminQna";
	}
	@RequestMapping("/admin/adminQnaSearch")
	public String adminQnaSearch(@RequestParam(defaultValue="1") int page, @RequestParam(name="search",defaultValue="")String search,
			@RequestParam(name="boardCat",defaultValue="")String boardCat, Model model) {
		
		Map<String, Object> map = service.adminQnaSearchService(page, search, boardCat);
		model.addAttribute("boardDto", map.get("boardDto"));
		model.addAttribute("page", map.get("page"));
		model.addAttribute("search", search);
		model.addAttribute("boardCat", boardCat);
		model.addAttribute("boardCatList", map.get("boardCatList"));
		
		return "/admin/qna_search";
	}
	
	@RequestMapping("/admin/adminMember")
	public String adminMember(@RequestParam(defaultValue="1") int page, Model model) {
		Map<String, Object> map=service.adminMemberListService(page);
		model.addAttribute("list", map.get("dto"));
		model.addAttribute("page", map.get("page"));
		
		return "/admin/member";
	}
	
	@CrossOrigin
	@RequestMapping(value="/admin/adminMemberDel", method=RequestMethod.POST)
	public @ResponseBody int adminMemDel(@RequestParam(value = "chbox[]") List<String> chArr, HttpServletRequest req) throws Exception {
		String realPath=req.getServletContext().getRealPath("/resources/questionFile");
		int result=service.adminMemDelService(chArr, realPath);
		
		return result;
	}
	
	@RequestMapping(value="/admin/adminMemSearch", method=RequestMethod.GET)
	public String adminMemSearch(@RequestParam(defaultValue="1") int page, @RequestParam(name="search",defaultValue="")String search,
			Model model) {
		
		Map<String, Object> map=service.adminMemSearch(page,search);
		model.addAttribute("list", map.get("searchList"));
		model.addAttribute("page", map.get("page"));
		model.addAttribute("search", search);
		
		return "/admin/member_search";
	}
	
	@RequestMapping("/admin/adminPdList")
	public String adminProductList(@RequestParam(defaultValue="1") int page, Model model) {
		Map<String, Object> map=service.adminPdListService(page);
		model.addAttribute("list", map.get("pdList"));
		model.addAttribute("page", map.get("page"));
		return "/admin/adminProductList";
	}
	
	@RequestMapping("/admin/adminPdSearch")
	public String adminPdSearch(@RequestParam(defaultValue="1") int page, @RequestParam(name="search",defaultValue="")String search,
			Model model) {
		Map<String, Object> map=service.adminPdListService(page,search);
		model.addAttribute("list", map.get("pdList"));
		model.addAttribute("page", map.get("page"));
		model.addAttribute("search", search);
		
		return "/admin/adminPdSearch"; 
	}
	
	@RequestMapping("/adminadminPdDelete")
	public @ResponseBody int adminPdDelete(@RequestParam("pd_id[]")List<String> pd_id, @RequestParam("pd_size[]")List<String> pd_size,
			HttpServletRequest req) {
		String realPath=req.getServletContext().getRealPath("/resources/pdImages");
		System.out.println(pd_id);
		System.out.println(pd_size);
		
		int result=service.adminPdDeleteService(pd_id, pd_size, realPath);
		
		return result;
	}
	
	@RequestMapping("/admin/adminOrderList")
	public String adOrderList(@RequestParam(defaultValue="1") int page, Model model) {
		Map<String, Object> map=service.adOrderListService(page);
		model.addAttribute("list", map.get("orderList"));
		model.addAttribute("page", map.get("page"));
		
	 //	return "admin/orderList2";
		return "/admin/orderList";
	}
	
	@RequestMapping("/admin/adOrderView")
	public String adOrderView(@RequestParam("order_id")String order_id, Model model) {
		Map<String, Object> map=service.adOrderViewService(order_id);
		model.addAttribute("order", map.get("orderList"));
		model.addAttribute("detail", map.get("detailList"));
		model.addAttribute("stockList", map.get("stockList"));
		System.out.println(map.get("orderList").toString());

		// return "admin/order_view2";
		return "/admin/order_view";
	}
	@RequestMapping("/admin/adPdMiniSearch")
	public @ResponseBody Object adPdMiniSearch(@RequestParam(defaultValue="1") int page, @RequestParam(name="search",defaultValue="")String search,
			Model model) {
		Map<String, Object> map=service.adminPdListService(page,search);
		model.addAttribute("list", map.get("pdList"));
		model.addAttribute("page", map.get("page"));
		model.addAttribute("search", search);
		System.out.println(map.get("pdList"));
		
		return map.get("pdList"); 
	}

	/*
	 * @RequestMapping("/adPdMiniSearch") public @ResponseBody Object
	 * adPdMiniSearch(@RequestParam(name="search",defaultValue="")String search) {
	 * Map<String, Object> map=service.adPdMiniSearchService(search);
	 * System.out.println(map.get("pdList"));
	 * 
	 * return map; }
	 */
	
	@RequestMapping("/admin/adOrderUpdate")
	public String adOrderUpdate(HttpServletRequest req, OrderDto oDto, Model model) {
		System.out.println("주문 수정 Controller");
		System.out.println(oDto.toString());
		
		orderService.adOrderUpdate(oDto);
		System.out.println("주문 수정 완료");
		
		String referer = req.getHeader("Referer");
	    return "redirect:"+ referer; 
	}
	
	@RequestMapping("/admin/adSelectStock")
	public @ResponseBody Object adSelectStock(@RequestParam(name="pd_id",defaultValue="")Integer pd_id) {
		List<StockDto> stock=service.adSelectStockService(pd_id);
		System.out.println(stock);
		return stock; 
	}
}
