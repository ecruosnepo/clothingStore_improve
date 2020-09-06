package com.store.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired; 
import org.springframework.stereotype.Service;

import com.store.dao.AddressDao; import com.store.dto.AddressDto;

@Service 
public class AddressServiceImpl implements AddressService {
	@Autowired 
	private AddressDao dao;
	
	// address update
	@Override
	public void sUpdateAddress(String email, String r_name, String address1, String address2, String address3, String address4) throws Exception {
	      dao.updateDeliveryAddress(email, r_name, address1, address2, address3, address4);
	} 
	
	// address insert
	@Override 
	public void sInsertSubAddress(String email, String r_name, String address1, 
			                      String address2, String address3, String address4) throws Exception{ 
		dao.insertSubAddress(email, r_name, address1, address2, address3, address4 );	
	}
	
	// address select	
	@Override 
	public List<AddressDto> sGetAddressList(String email) { 
		return dao.getAddressList(email); 
	}
	
	// address delete
	@Override
	public int sDeleteInfoAddress(String email) throws Exception {
		return dao.deleteInfoAddress(email);
	}
	
	@Override
	public int sSelectAddress(String email) throws Exception{
        int result = dao.selectAddress(email);		
		return result;
	}

//	@Override
//	public int sUpdateSubAddress(String address1, String address2, String address3, String address4, String r_name)
//			throws Exception {
//		return dao.updateSubAddress(address1, address2, address3, address4, r_name);
//	}

	@Override
	public AddressDto sGetAddressDto(String email, int address_index) {
		return dao.getAddressDto(email,address_index);
	}

	@Override
	public int sUpdateSubAddress(String r_name, String address1, String address2, String address3, String address4, String user_email, int address_index) throws Exception {
		return dao.updateSubAddress(r_name, address1, address2 ,address3, address4, user_email, address_index);
	}

	@Override
	public int sDeleteSubAddress(String email, int address_index) throws Exception {
		return dao.deleteSubAddress(email, address_index);
	}
}	
