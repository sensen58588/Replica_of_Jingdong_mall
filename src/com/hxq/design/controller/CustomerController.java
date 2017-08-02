package com.hxq.design.controller;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.google.gson.Gson;
import com.hxq.design.beans.Customer;
import com.hxq.design.service.impl.CustomerServImpl;

@Controller
public class CustomerController {
	@Autowired
	private CustomerServImpl customerServImpl;
	
	@RequestMapping("insertintoUserinfo.do")
	public void insterUserinfo(Customer customer,HttpSession session,HttpServletResponse response) throws Exception{
		int i=customerServImpl.insertintoUserinfo(customer);
		if(i>0){
			String userName=customer.getUserName();
			session.setAttribute("UserName", userName);
			response.sendRedirect("index.jsp");
		}
		
		else{
			response.sendRedirect("jsp/fail.jsp");
			}
	}
	
	@RequestMapping("registerServ.do")//ajax访问数据库是否该用户名已存在
	public void registerServlet(HttpServletRequest request, HttpServletResponse response)throws Exception{
		request.setCharacterEncoding("utf-8");
		String un = request.getParameter("userName");
		System.out.println(un);
		PrintWriter out = response.getWriter();
		Customer user=new Customer();
		user.setUserName(un);
		Customer cust=customerServImpl.selectInfoByUserUn(user);
		
		if(cust!=null){
			out.print("no");
		}
		else{
			out.print("yes");
		}
		out.flush();
		out.close();
	}
	
	
	@RequestMapping("userLogin.do")
	public void userLogin(HttpServletRequest request, HttpSession session,HttpServletResponse response) throws Exception{
		request.setCharacterEncoding("utf-8");
		String un = request.getParameter("userName");
		String pw=request.getParameter("userPw");
		Customer user=new Customer();
		user.setUserName(un);
		user.setUserPw(pw);
		Customer cust=customerServImpl.selectInfoByUserUn(user);
		String userPw=cust.getUserPw();
		if(pw.equals(userPw)){
			session.setAttribute("UserName",un);
			response.sendRedirect("index.jsp");
		}
		else{
			response.sendRedirect("jsp/login.jsp");
			
		}
	}
	
	
	@RequestMapping("selectPassword.do")
	public void selectPassword(HttpServletRequest req, HttpSession session,HttpServletResponse resp) throws Exception{
		req.setCharacterEncoding("utf-8");
		resp.setCharacterEncoding("utf-8");
		String userName=req.getParameter("userName");
		System.out.println("userName:"+userName);
		Customer user=new Customer();
		user.setUserName(userName);
		Customer cust=customerServImpl.selectInfoByUserUn(user);
		String userPw=cust.getUserPw();
		System.out.println("userPw:"+userPw);
		
		PrintWriter out = resp.getWriter();
		out.print(userPw);
		out.flush();
		out.close();
		
		
		
		
	}
	
	@RequestMapping("showUserInfo.do")
	public void showUserInfo(HttpServletRequest req, HttpSession session,HttpServletResponse resp)throws Exception{
		req.setCharacterEncoding("utf-8");
		resp.setCharacterEncoding("utf-8");
		Object user=session.getAttribute("UserName");
		PrintWriter out=resp.getWriter();
		
		Gson gson = new Gson();
		if(user==null){
			out.print("null");
		}
		else{
			String userName=user.toString();
			Customer cust=new Customer();
			cust.setUserName(userName);
			
			Customer getUser=customerServImpl.selectInfoByUserUn(cust);
			
			if(getUser==null){
				out.print("null");
			}
			else{
				
				String toJson = gson.toJson(getUser);
				out.print(toJson);
				System.out.println(toJson);
			}
			
		}
		out.flush();
		out.close();
		
	}
	
	
}
