package com.store.service;

import org.springframework.stereotype.Service;

@Service
public class DefaultService {
	
	public DefaultService() {
	}
	
	public boolean check(int n) {
		if(n==0) {
			return true; 
		}
		return false;
	}
	
	public boolean check(String st) {
		if(st.trim().length()==0 || st==null) {
			return true; 
		}
		return false;
	}
	
	public boolean check(String st1, String st2) {
		if(st1.trim().length()==0 || st1==null) {
			return true; 
		}
		if(st2.trim().length()==0 || st2==null) {
			return true; 
		}
		return false;
	}
}
