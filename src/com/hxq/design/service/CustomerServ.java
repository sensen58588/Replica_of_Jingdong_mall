package com.hxq.design.service;

import com.hxq.design.beans.Customer;
public interface CustomerServ {
	
	public int insertintoUserinfo(Customer customer) throws Exception;
	public Customer selectInfoByUserUn(Customer customer)throws Exception;
}
