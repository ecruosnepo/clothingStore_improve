package com.store.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.store.dto.AddressDto;
import com.store.service.AddressService;

@Controller
public class AddressController {
	    
	  @Autowired
	  private AddressService addressService;
	
	    // 회원 주소록 새 주소 추가
		@RequestMapping(value="/myPage/insertSubAddress", method = RequestMethod.GET)
		public String insertsubAddress() throws Exception {
		   return "/user/insertSubAddress";
		}
		// insert
		@RequestMapping(value="/myPage/insertSubAddressForm", method = RequestMethod.POST) 
		public String insertsubAddress(@RequestParam("r_name")String r_name,
					                   @RequestParam("address1")String address1,
					                   @RequestParam("address2")String address2,
					                   @RequestParam("address3")String address3,
					                   @RequestParam("address4")String address4,
					                   HttpSession session) throws Exception{
			String email = (String)session.getAttribute("email");
			if ( null != email ) {
				addressService.sInsertSubAddress(email, r_name, address1, address2, address3, address4);
				return "/user/insertSubAddressAction";
			}
			 return "/user/insertSubAddressAction";
		}
		
		// 회원 주소록 새 주소 편집
        @RequestMapping(value="/myPage/updateSubAddress", method = RequestMethod.GET)
        public String updateSubAddress(Model model,@RequestParam("address_index") int address_index, HttpSession session, AddressDto dto) throws Exception{   	
        	String email = (String)session.getAttribute("email");
        	AddressDto aDto = addressService.sGetAddressDto(email,address_index);
        	model.addAttribute("address", aDto);
        	if ( null != email ) {
        	
            	return "/user/updateSubAddress";
			}
        	return "/user/updateSubAddress";
        } 
        // update
        @RequestMapping(value="/myPage/updateSubAddressForm", method = RequestMethod.POST)
        public String updateSubAddressForm(@RequestParam("address_index")int address_index,
        		                           @RequestParam("r_name")String r_name,
        		                           @RequestParam("address1")String address1,
					        	           @RequestParam("address2")String address2,
					                       @RequestParam("address3")String address3,
					        	           @RequestParam("address4")String address4,
						        	       HttpSession session, Model model) throws Exception{
            String user_email = (String)session.getAttribute("email");   
		    if ( null != user_email) {
			  addressService.sUpdateSubAddress(r_name, address1, address2 ,address3, address4, user_email, address_index);
			  return "/user/updateSubAddressAction";		  
		    }
		  return "/user/updateSubAddressAction";		
         }
        
        @RequestMapping(value="/myPage/deleteSubAddress", method = RequestMethod.GET)
        public String deleteSubAddress(@RequestParam("address_index")int address_index,
        		                       HttpSession session) throws Exception {
        	String email = (String)session.getAttribute("email");
        	if ( null != email) {
        	addressService.sDeleteSubAddress(email, address_index);
        	return "/user/deleteSubAddressAction";
        	}
			return "/user/deleteSubAddressAction";
        }
}
