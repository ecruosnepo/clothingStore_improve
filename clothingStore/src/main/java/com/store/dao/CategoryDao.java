package com.store.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.store.dto.CategoryDto;

@Mapper
public interface CategoryDao {
	public List<CategoryDto> getAllCatDao();
	public CategoryDto getCatDao(@Param("cat_id") int catId);	
}
