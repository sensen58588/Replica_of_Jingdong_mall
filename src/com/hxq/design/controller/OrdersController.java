package com.hxq.design.controller;

import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.hxq.design.beans.DealInfo;
import com.hxq.design.beans.Goods;
import com.hxq.design.beans.Orders;
import com.hxq.design.beans.ShoppingCar;
import com.hxq.design.service.OrdersServImpl;
import com.hxq.design.service.impl.DealInfoServImpl;
import com.hxq.design.service.impl.GoodsServImpl;
import com.hxq.design.service.impl.ShoppingCarServImpl;

@Controller
public class OrdersController {
	@Autowired
	private OrdersServImpl orderServImpl;
	@Autowired
	private ShoppingCarServImpl shopCarServImple;
	
	@Autowired
	private GoodsServImpl goodsimpl;
	
	@Autowired
	private DealInfoServImpl dealInfoServImpl;
	
	/*@RequestMapping("dealingOrderById.do")
	public ModelAndView dealingOrderById(int orderId) throws Exception{
		ModelAndView modelAndView=new ModelAndView();
		Orders order=orderServImpl.dealingOrderById(orderId);
		modelAndView.addObject("order", order);
		modelAndView.setViewName("order.jsp");
		return modelAndView;
	}*/
	@RequestMapping("createOrder.do")
	public ModelAndView addGoodsToMyCar(HttpServletRequest req,HttpSession session,HttpServletResponse resp)throws Exception{
		ModelAndView modelAndView=new ModelAndView();
		req.setCharacterEncoding("utf-8");
		
		
		Object user=session.getAttribute("UserName");
		if(user==null){
			modelAndView.setViewName("index.jsp");//未登录，返回错误信息
			
		}
		else{
			
			String userAddress=req.getParameter("userAddress");
			String userPhone=req.getParameter("userPhone");
			String userName=user.toString();
			System.out.println(userName);
			ShoppingCar userCar=new ShoppingCar();
			userCar.setUserName(userName);
			List<ShoppingCar> list=shopCarServImple.selectShoppingCarByUserName(userCar);
			System.out.println(list);
			Date date=new Date();
			long orderIdNumber=date.getTime();
			System.out.println("************");
			System.out.println(orderIdNumber);
			System.out.println("************");
			String orderId=orderIdNumber+"";
			
			int value=0;
			for(int i=0;i<list.size();i++){
				int goodsId=list.get(i).getGoodsId();
				int number=list.get(i).getShopNumber();
				float money=list.get(i).getShopMoney();
				
				
				SimpleDateFormat formater = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
				
				String data=formater.format(date);
				System.out.println("++++++++++++++");
				System.out.println(data);
				System.out.println("++++++++++++++");
				Orders order=new Orders();
				order.setData(data);
				order.setGoodsId(goodsId);
				order.setUserName(userName);
				order.setNumber(number);
				order.setMoney(money);
				order.setOrderId(orderId);
				order.setUserAddress(userAddress);
				order.setUserPhone(userPhone);
				
				int vt=orderServImpl.createOrder(order);
				
				value=value+vt;
			}
			if(value>0){
			 modelAndView.addObject("orderId", orderId);
			 
			 modelAndView.setViewName("jsp/newOrder.jsp");
			}
			
		}
		
		return modelAndView;
	}
	@RequestMapping("getOrderInfo.do")
	public void getOrderInfo(HttpServletRequest req,HttpSession session,HttpServletResponse resp) throws Exception{
		req.setCharacterEncoding("utf-8");
		resp.setCharacterEncoding("utf-8");
		Gson gson = new Gson();
		PrintWriter out = resp.getWriter();
		Object user=session.getAttribute("UserName");
		String orderId=req.getParameter("orderId");
		System.out.println("~~~~~~~~~~~~~~");
		System.out.println(orderId);
		System.out.println("~~~~~~~~~~~~~~");
		if(user==null){
			out.print("0");//未登录，返回错误信息
			
		}
		else{
			String userName=user.toString();
			Orders order=new Orders();
			order.setOrderId(orderId);
			order.setUserName(userName);
			
			List<Orders> list=orderServImpl.dealingOrderById(order);
			if(list==null){
				out.print("null");
				
			}else{
				String toJson = gson.toJson(list);
				out.print(toJson);
				System.out.println(toJson);
				}
			
			
		}
		out.flush();
		out.close();
		
	}
	
	@RequestMapping("dealOrder.do")
	public ModelAndView dealOrder(HttpServletRequest req,HttpSession session,HttpServletResponse resp) throws Exception{
		ModelAndView model=new ModelAndView();
		
		req.setCharacterEncoding("utf-8");
		
		
		Object user=session.getAttribute("UserName");
		if(user==null){
			model.setViewName("index.jsp");//未登录，返回
			
		}
		else{
			
		String userName=user.toString();
		
		String orderMoney=req.getParameter("orderMoney");
		
		System.out.println(orderMoney+"人民币");
		String orderId=req.getParameter("orderId");
		System.out.println(orderId+"订单编号");
		model.addObject("orderMoney",orderMoney);
		model.addObject("orderId",orderId);
		model.addObject("userName",userName);
		
		model.setViewName("jsp/dealOrder.jsp");
		
		}
		return model;
	}
	
	@RequestMapping("doneOrder.do")
	public void doneOrder(HttpServletRequest req,HttpSession session,HttpServletResponse resp) throws Exception{
		req.setCharacterEncoding("utf-8");
		resp.setCharacterEncoding("utf-8");
		String orderId=req.getParameter("orderId");
		String userName=req.getParameter("userName");
		PrintWriter out=resp.getWriter();
		Orders orders=new Orders();
		orders.setOrderId(orderId);
		orders.setUserName(userName);
		
		List<Orders> list=orderServImpl.dealingOrderById(orders);
		int vt=0;
		int j=0;
		float dealMoney=0;//一次订单的交易额
		for(int i=0;i<list.size();i++){
			dealMoney=dealMoney+list.get(i).getMoney();
			int goodsId=list.get(i).getGoodsId();
			int shopNumber=list.get(i).getNumber();
			String getUserName=list.get(i).getUserName();
			
			ShoppingCar userCar=new ShoppingCar();
			userCar.setGoodsId(goodsId);
			userCar.setUserName(getUserName);
			shopCarServImple.deleteDoneGoods(userCar);
			
			Goods goods=new Goods();
			goods.setGoodsId(goodsId);
			goods.setGoodsOrderNum(shopNumber);
			vt=goodsimpl.updateGoodsNumber(goods);
			Orders myOrder=list.get(i);
			
			j=orderServImpl.submitOrderById(myOrder);
			
		}
		Calendar data = Calendar.getInstance(); 
		
		int year=data.get(Calendar.YEAR);
		int month=(data.get(Calendar.MONTH))+1;
		int day=data.get(Calendar.DATE);
		
		DealInfo dealInfo=new DealInfo();
		dealInfo.setDealDataYear(year);
		dealInfo.setDealDataMonth(month);
		dealInfo.setDealDataDay(day);
		dealInfo.setDealMoney(dealMoney);
		dealInfo.setDealNumber(1);
		DealInfo getDealInfo =dealInfoServImpl.selectDealInfoByDay(dealInfo);
		System.out.println("查询结果："+getDealInfo);
		int m=0;
		if(getDealInfo==null){
			System.out.println("111111111111111111111111");
			m=dealInfoServImpl.insertIntodealInfo(dealInfo);
			
		}else{
			System.out.println("2222222222222222222222222");
			
				
				int getNumber=getDealInfo.getDealNumber();
				float getMoney=getDealInfo.getDealMoney();
				dealInfo.setDealNumber(getNumber+1);
				dealInfo.setDealMoney(dealMoney+getMoney);
			    m=dealInfoServImpl.updateDealInfo(dealInfo);
				
				}
		
		
		
		if(vt>0&&j>0){
			out.print("yes");
			
		}
		else{
			
			out.print("no");
		}
		out.flush();
		out.close();
		
	}
	
	@RequestMapping("showOrderInfo.do")
	public void showMyShoppingCar(HttpServletRequest req,HttpSession session,HttpServletResponse resp) throws Exception{
		req.setCharacterEncoding("utf-8");
		resp.setCharacterEncoding("utf-8");
		Gson gson = new Gson();
		PrintWriter out = resp.getWriter();
		Object user=session.getAttribute("UserName");
		
		
		if(user==null){
			out.print("0");//未登录，返回错误信息
			
		}
		else{
			String userName=user.toString();
			Orders myOrder=new Orders();
			myOrder.setUserName(userName);
			List<Orders> list=orderServImpl.selectOrderInfo(myOrder);
			
			String toJson = gson.toJson(list);
			out.print(toJson);
			
			
		}
		out.flush();
		out.close();
		
	}
	
	@RequestMapping("deleteOrder.do")
	public void deleteOrder(HttpServletRequest req,HttpSession session,HttpServletResponse resp)throws Exception{
		req.setCharacterEncoding("utf-8");
		resp.setCharacterEncoding("utf-8");
		String orderId=req.getParameter("orderId");
		System.out.println(orderId+"~~~~~~");
		PrintWriter out=resp.getWriter();
		Orders deleOrder=new Orders();
		deleOrder.setOrderId(orderId);
		int i=orderServImpl.deleteOrder(deleOrder);
		if(i>0){
			
			out.print("yes");
			
		}else{
			out.print("no");
		}
		
		out.flush();
		out.close();
		
	}
	
}
