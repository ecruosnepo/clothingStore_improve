package com.store.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.store.dto.AddressDto;

@Mapper
public interface AddressDao {
	 public void updateDeliveryAddress(@Param("user_email")String email, @Param("r_name")String r_name,
			 				   @Param("address1")String address1, @Param("address2")String address2,
					           @Param("address3")String address3, @Param("address4")String address4)throws Exception;

     public int insertSubAddress(@Param("user_email")String email,
    		                     @Param("r_name")String r_name,
    		                     @Param("address1")String address1, 
					             @Param("address2")String address2, 
					             @Param("address3")String address3,
					             @Param("address4")String address4) throws Exception;

     public List<AddressDto> getAddressList(@Param("user_email")String email);
     
     public AddressDto getAddressDto(@Param("user_email")String email, @Param("address_index")int address_index);
     
     public int deleteInfoAddress(@Param("user_email")String email);
     
     public int selectAddress(@Param("user_email")String email);
     
     public int updateSubAddress(@Param("r_name")String r_name,
    		                     @Param("address1")String address1,
					             @Param("address2")String address2,
					             @Param("address3")String address3,
					             @Param("address4")String address4,
					             @Param("user_email")String user_email,
					             @Param("address_index")int address_index
					             ) throws Exception;	    
     
     public int deleteSubAddress(@Param("user_email")String user_email,
					             @Param("address_index")int address_index) throws Exception;
}
