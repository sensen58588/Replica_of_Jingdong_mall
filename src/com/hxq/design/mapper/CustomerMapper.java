package com.hxq.design.mapper;

import com.hxq.design.beans.Customer;

public interface CustomerMapper {
	public int insertintoUserinfo(Customer customer)throws Exception;
	public Customer selectInfoByUserUn(Customer customer)throws Exception;
}
