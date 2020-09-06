package com.store.controller;

import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.store.dto.AddressDto;
import com.store.dto.MyPageDto;
import com.store.dto.OrderDto;
import com.store.dto.UserDto;
import com.store.service.AddressServiceImpl;
import com.store.service.OrderService;
import com.store.service.UserServiceImpl;

@Controller
public class UserController {
	
	private int result; 
	private int selectCheck;
	
	@Autowired
	public JavaMailSender javaMailSender;

	@Autowired
	private UserServiceImpl userService;

	@Autowired
	private OrderService orderService;

	@Autowired
	private AddressServiceImpl addressService;
	
	Random ran = new Random();
	public String getPass() {
		String psss = "";
		for (int i = 0; i < 8; i++) {
			psss += ran.nextInt(9)+1;	
    	}
		return psss;
	}

	//  회원가입 
	@RequestMapping(value="/userSignUp", method = RequestMethod.GET)
	public String userSignUp() {
		return "/user/userSignUp";
	}	
	
	//email 중복 검사
	@RequestMapping(value="/checkEmail", method = RequestMethod.POST, produces = "application/text; charset=utf8")
	@ResponseBody
	public String checkEmail(HttpServletRequest request) throws Exception {
		String user_email = request.getParameter("user_email");
		result = userService.sUserEmail(user_email);
		return Integer.toString(result);
	}
	
	@RequestMapping(value = "/signUpForm", method = RequestMethod.POST)
	public String SignUp(@RequestParam("user_email") String user_email, 
			             @RequestParam("user_password") String user_password,
			             @RequestParam("user_password2") String user_password2,// 개인정보 동의 체크
			             @RequestParam(value="check2", required = false, defaultValue = "")String check2,
			             Model model ) throws Exception {
		    // 0: 레코드 없음,  1: 레코드 있음.
		    selectCheck = userService.sUserEmail(user_email);
		    // 이메일 폼 null 체크 
		    if( "".equals(user_email) && "".equals(user_password)) { 
 				result = 0;
 				model.addAttribute("result", result);
 				return "/user/userSignUpAction";
 			}
		    else if(null == user_email || "".equals(user_email)) { 
 				result = 2;
 				model.addAttribute("result", result);
 				return "/user/userSignUpAction";
 			}
 			// 패스워드 폼 null 체크
		    else if(null == user_password || "".equals(user_password)) {
 				result = 3;
 				model.addAttribute("result", result);
 				return "/user/userSignUpAction";
 			}	
 		    // 개인정보 동의 체크
		    else if ( null == check2 || "".equals(check2) ) {
 		    	result = 4; 
 				model.addAttribute("result", result);
 				return "/user/userSignUpAction";
 			}
		    // 중복 체크
		    else if ( 1 == selectCheck ) {
		    	result = 5; 
     			model.addAttribute("result", result);
				return "/user/userSignUpAction";
		    }
		    // 비밀번호 확인
		    else if ( !user_password.equals(user_password2) ) {
		    	result = 6; 
				model.addAttribute("result", result);
				return "/user/userSignUpAction";
		    }
		    // 비밀번호 8자리 이상 확인
		    else if ( user_password.length() < 8 ) {
		    	result = 7; 
				model.addAttribute("result", result);
				return "/user/userSignUpAction";
		    }
			
		    else{
		    	userService.sUserSignUp(user_email, user_password, check2);
				return "/user/userSignUpAction";
		    }
	}
	
    // 로그인	
	@RequestMapping(value="/login", method = RequestMethod.GET)
	public String login() {
		return "/user/login";
	}	
	
	@RequestMapping(value="/loginForm", method = RequestMethod.POST)
	public String UserLogin(@RequestParam("user_email") String email, 
			                 @RequestParam("user_password") String password,
			                 Model model, HttpSession session) {		
		try {            // 20200804 UserEmail = UserLogin
			result = userService.sUserLogin(email, password);
		} catch(Exception e) {
			e.printStackTrace();
			result = 0;
		}
		if ( 4 == result ) {
			 model.addAttribute("result", result);
			 session.setAttribute("manager", email);	 
			 return "/user/loginAction";
		}
		else{
		model.addAttribute("result", result);
		session.setAttribute("email", email);
		return "/user/loginAction";
		}
	}
	
	// 로그아웃
	@RequestMapping(value="/logout", method = RequestMethod.GET)
	public String logout( HttpSession session ) {
		 userService.sLogout(session);
		return "/user/logout";
	}	
	
	// MyPage 페이지
	@RequestMapping(value="/myPage", method = RequestMethod.GET)
	public String MyPage(HttpSession session, HttpServletRequest request, Model model) throws Exception {
		String user_email = (String)session.getAttribute("email");
		
		String user_name = (String)userService.sGetUserInfo(user_email).getUser_name();
		List<OrderDto> oDto = orderService.selectOrderList(user_email);
		List<MyPageDto> mDto = orderService.selectPdMyPage(user_email);
		
		model.addAttribute("user_name", user_name);
	    model.addAttribute("oDto", oDto);
	    model.addAttribute("mDto", mDto);
		   	
	   	return "/user/myPage";
	}
		
	// 내설정
	@RequestMapping(value="/myPage/setting", method = RequestMethod.GET)
	public String MyPageSet(Model model, HttpSession session) throws Exception {
		String email = (String) session.getAttribute("email");
		result = addressService.sSelectAddress(email);
		if ( result < 3 ) {
			model.addAttribute("result", result);
			model.addAttribute("user", userService.sGetUserInfo(email));
			return "/user/setting";
		}
		model.addAttribute("user", userService.sGetUserInfo(email));
		return "/user/setting";	
	}
	
	// 회원 상세정보 편집
	@RequestMapping(value="/myPage/updateForm", method = RequestMethod.GET)
	public String updateForm(Model model, HttpSession session)throws Exception {
		String email = (String) session.getAttribute("email");
		model.addAttribute("u", userService.sGetUserInfo(email));
		return "/user/updateForm";
	}

	@RequestMapping(value="/myPage/userUpdate", method = RequestMethod.POST)
	public String updateForm(@RequestParam("user_name")String name,
						     @RequestParam("user_birth")String birth,
							 @RequestParam("user_phone")String phone,
							 @RequestParam("user_gender")String gender,
			                 HttpSession session, Model model) throws Exception {
		String emails = (String)session.getAttribute("email");
		if ( null != emails) {
			userService.sUserUpdate(name, birth, phone, gender, emails);
        	return "/user/updateFormAction";
		}
		return "forward:/user/MyPageSet";
	}
	
	// 회원 주소록
	@RequestMapping(value="/myPage/address", method = RequestMethod.GET)
	public String address(Model model, HttpSession session) throws Exception {
		String email = (String)session.getAttribute("email");
		model.addAttribute("user", userService.sGetUserInfo(email));
		model.addAttribute("address", addressService.sGetAddressList(email));
		return "/user/address";
	}
	
	 @PostMapping("/myPage/updateMainAddress") public void updateMainAddress(UserDto
	   uDto) throws Exception{ userService.sUpdateMainAddress(uDto.getUser_email(),
	   uDto.getMain_address1(), uDto.getMain_address2(), uDto.getMain_address3(),
	   uDto.getMain_address4()); }
	  
	// 주문페이지 유저 정보 수정
	@PostMapping("/myPage/updateOrderUserInfo")
	@ResponseBody
	public void updateOrderUserInfo(HttpServletRequest req, 
			@RequestParam("main_address1")String main_address1,
			@RequestParam("main_address2")String main_address2,
			@RequestParam("main_address3")String main_address3,
			@RequestParam("main_address4")String main_address4,
			@RequestParam("user_email")String user_email,
			@RequestParam("user_name")String user_name,
			@RequestParam("user_phone")String user_phone) throws Exception{
		System.out.println(main_address1);
		System.out.println(main_address2);
		System.out.println(main_address3);
		System.out.println(main_address4);
		System.out.println(user_email);
		System.out.println(user_name);
		System.out.println(user_phone);
		
		userService.sUpdateOderUserInfo(user_email, user_name, main_address1, main_address2, main_address3, main_address4, user_phone);
	}
	
	// 배송 주소 수정
	@PostMapping("/myPage/updateDeliveryAddress")
	public void updateDeliveryAddress(AddressDto aDto) throws Exception{
		addressService.sUpdateAddress(aDto.getEmail(), aDto.getR_name(), aDto.getAddress1(), aDto.getAddress2(), aDto.getAddress3(), aDto.getAddress4());
	}
	
	// 회원 주소록 등록
	@RequestMapping(value="/myPage/setMainAddress", method = RequestMethod.GET)
	public String setMainAddress(HttpSession session, Model model) throws Exception {
		String email = (String)session.getAttribute("email");
		if ( null != email ) {
			model.addAttribute("address", userService.sGetUserInfo(email));
		}
	   return "/user/setMainAddress";
	}
	
	@RequestMapping(value="/myPage/setMainAddressForm", method = RequestMethod.POST) // update
	public String setMainAddress(@RequestParam("main_address1")String main_address1,
			                     @RequestParam("main_address2")String main_address2,
			                     @RequestParam("main_address3")String main_address3,
			                     @RequestParam("main_address4")String main_address4,
			                      HttpSession session, Model model ) throws Exception{
		String emails = (String)session.getAttribute("email");
		if ( null != emails ) {
			userService.sUpdateMainAddress(main_address1, main_address2, main_address3, main_address4, emails);
			model.addAttribute("address", userService.sGetUserInfo(emails));
		    return "/user/myPage/setMainAddressAction";
		}
		 return "/user/setMainAddressAction";
	}
	
	// 계정 삭제
	@RequestMapping(value="/myPage/deleteInfoUser", method = RequestMethod.GET)
	public String deleteInfoUser(HttpSession session, Model model) throws Exception{
		String email = (String)session.getAttribute("email");
		if ( null != email ) {
			result = userService.sDeleteInfoUser(email);
			addressService.sDeleteInfoAddress(email);
			model.addAttribute("result", result);
			userService.sLogout(session);
			return "/user/deleteInfoUserAction";
		}
		return "/user/deleteInfoUserAction";
	}
	
	// 회원 임시 비밀번호 전송
	@RequestMapping(value="/sendEmailForm", method = RequestMethod.GET)
	public String sendEmail() throws Exception {
	   return "/user/sendEmailForm";
	}
	
	@Async
	@RequestMapping(value="/sendEmail", method = RequestMethod.POST)
	public String sendEmailForm(String email, HttpServletRequest request) throws Exception{
		SimpleMailMessage simpleMessage = new SimpleMailMessage();
		// simpleMessage.setFrom("보낸사람@naver.com"); // NAVER, DAUM, NATE일 경우 넣어줘야 함
		String pass = getPass();
		simpleMessage.setTo(email);
		simpleMessage.setSubject("옷가게 쇼핑몰 입니다. 임시 비밀번호 발송 했습니다.");
		simpleMessage.setText("임시 비밀번호 :" + pass);
		javaMailSender.send(simpleMessage); 
		String getEmail = request.getParameter("getEmail");
		userService.sUpdatePassword(pass, getEmail);

		return "/user/login";	
  }
	
	// 비밀번호 변경
	@RequestMapping(value="/myPage/updatePassword", method = RequestMethod.GET)
	public String updatePassword() throws Exception{
		return "/user/updatePassword";
	}
	
	@RequestMapping(value="/myPage/updatePasswordForm", method = RequestMethod.POST)
	public String updatePasswordForm(@RequestParam("getPassword")String getPassword,
			                         @RequestParam("updatePassword1")String updatePassword1,
			                         @RequestParam("updatePassword2")String updatePassword2,
			                         HttpSession session, Model model) throws Exception {
		String email = (String)session.getAttribute("email");
		int passCheck = userService.sUserLoginCheck(email, getPassword);
	    System.out.println(passCheck);
		if (updatePassword1.length() < 8 || updatePassword2.length() < 8) {
	    	result = 1;
			model.addAttribute("result", result);
			return "/user/updatePasswordAction";
		}
		else if(!updatePassword1.equals(updatePassword2)) {
	    	result = 2;
			model.addAttribute("result", result);
			return "/user/updatePasswordAction";
		}
	    // 비밀번호 변경시에 현재 비밀번호가 일치한지 확인.
	    else if ( 0 == passCheck ) {
	    	result = 3;
			model.addAttribute("result", result);
			return "/user/updatePasswordAction";
		}else {
			result = 0;
			model.addAttribute("result", result);
			userService.sUpdatePassword(updatePassword1, email);
			return "/user/updatePasswordAction";	
		}
	}
	


}
