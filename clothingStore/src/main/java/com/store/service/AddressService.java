package com.store.service;

import java.util.List;

import com.store.dto.AddressDto;

public interface AddressService {
	public void sUpdateAddress(String email, String r_name, String address1, String address2, String address3, String address4) throws Exception;
	   
	public void sInsertSubAddress(String email, String r_name, String address1, String address2, String address3, String address4) throws Exception;  
    
	public List<AddressDto> sGetAddressList(String email);

	public int sDeleteInfoAddress(String email) throws Exception;
	
	public int sSelectAddress(String email) throws Exception;
	
	public int sUpdateSubAddress(String r_name, String address1, String address2, String address3, String address4, String user_email, int address_index) throws Exception;
   
	public AddressDto sGetAddressDto(String email, int address_index);
	
	public int sDeleteSubAddress(String email, int address_index) throws Exception;
}
