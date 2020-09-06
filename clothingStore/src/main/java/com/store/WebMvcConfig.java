package com.store;

import java.util.Arrays;
import java.util.List;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.store.interceptor.AdminInterceptor;
import com.store.interceptor.CertificationInterceptor;

@Configuration
public class WebMvcConfig implements WebMvcConfigurer {	
    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {		
        //이미지 업로드를 위한 경로
        registry.addResourceHandler("/images/**")
        		.addResourceLocations("/resources/pdImages/");
        registry.addResourceHandler("/css/**")
		.addResourceLocations("/resources/css/");
        
        // 메인 페이지 
		registry.addResourceHandler("/mainImages/**").addResourceLocations("/resources/main/");
		// qna 첨부파일
		registry.addResourceHandler("/questionFile/**").addResourceLocations("/resources/questionFile/");
    }
    
    // 인터셉터 설정
    @Override
    public void addInterceptors(InterceptorRegistry registry) {
    	List<String> URL_PATTERNS = Arrays.asList("/checkoutForm","/myPage/**");
    	registry.addInterceptor(new CertificationInterceptor())
    		.addPathPatterns(URL_PATTERNS);
    	registry.addInterceptor(new AdminInterceptor()).addPathPatterns("/admin/**");
    }
}