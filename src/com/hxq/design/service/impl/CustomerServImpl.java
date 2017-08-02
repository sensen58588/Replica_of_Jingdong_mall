package com.hxq.design.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hxq.design.beans.Customer;
import com.hxq.design.mapper.CustomerMapper;
import com.hxq.design.service.CustomerServ;
@Service
public class CustomerServImpl implements CustomerServ{
	@Autowired
	private CustomerMapper customermapper;
	public int insertintoUserinfo(Customer customer) throws Exception {
		
		return customermapper.insertintoUserinfo(customer);
	}
	public Customer selectInfoByUserUn(Customer customer) throws Exception {
		
		return customermapper.selectInfoByUserUn(customer);
	}

}
