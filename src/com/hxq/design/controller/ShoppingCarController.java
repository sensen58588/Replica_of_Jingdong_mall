package com.hxq.design.controller;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.google.gson.Gson;
import com.hxq.design.beans.ShoppingCar;
import com.hxq.design.service.impl.ShoppingCarServImpl;

@Controller
public class ShoppingCarController {
	@Autowired
	private ShoppingCarServImpl shopCarServImple;
	
@RequestMapping("addOneGoodsToMyCar.do")
	public void addGoodsToMyCar(HttpServletRequest req,HttpSession session,HttpServletResponse resp)throws Exception{
		//Ajax动态加入购物车
		req.setCharacterEncoding("utf-8");
		PrintWriter out = resp.getWriter();
		
		Object user=session.getAttribute("UserName");
		if(user==null){
			out.print("no");//未登录，返回错误信息
			
		}
		else{
			String userName=user.toString();
			
			int goodsId=Integer.parseInt(req.getParameter("goodsId"));
			String goodsName=req.getParameter("goodsName");
			float goodsPrice=Float.parseFloat(req.getParameter("goodsPrice"));
			int shopNumber=Integer.parseInt(req.getParameter("shopNumber"));
			float shopMoney=goodsPrice*shopNumber;
			ShoppingCar myCar=new ShoppingCar();
			
			myCar.setGoodsId(goodsId);
			myCar.setUserName(userName);
			myCar.setGoodsName(goodsName);
			myCar.setGoodsPrice(goodsPrice);
			myCar.setShopMoney(shopMoney);
			
			myCar.setShopNumber(shopNumber);
			int value=shopCarServImple.addGoodsToMyCar(myCar);
			
			if(value>0){
				out.print("yes");//成功加入则返回成功信息
			}
			else{
				out.print("no");
			}
		}
		out.flush();
		out.close();
		
		}
	
	@RequestMapping("showMyShoppingCar.do")
	public void showMyShoppingCar(HttpServletRequest req,HttpSession session,HttpServletResponse resp)throws Exception{
		
		req.setCharacterEncoding("utf-8");
		resp.setCharacterEncoding("utf-8");
		
		Gson gson = new Gson();
		PrintWriter out = resp.getWriter();
		
		Object user=session.getAttribute("UserName");
		
		if(user==null){
			out.print("null");//未登录，返回错误信息
			
		}
		else{
			String userName=user.toString();
			System.out.println(userName);
			ShoppingCar userCar=new ShoppingCar();
			userCar.setUserName(userName);
			List<ShoppingCar> list=shopCarServImple.selectShoppingCarByUserName(userCar);
			
			if(list==null){
				out.print("null");
				
			}else{
				String toJson = gson.toJson(list);
				out.print(toJson);//返回登录信息
				System.out.println(toJson);
				}
			
			
		}
		out.flush();
		out.close();
	}
	
	@RequestMapping("updateMyShoppingCar.do")
	public void updateMyShoppingCar(HttpServletRequest req,HttpSession session,HttpServletResponse resp)throws Exception{
		
		req.setCharacterEncoding("utf-8");
		resp.setCharacterEncoding("utf-8");
		
		PrintWriter out = resp.getWriter();
		Object user=session.getAttribute("UserName");
		
		if(user==null){
			out.print("null");//未登录，返回错误信息
			
		}
		else{   //数据库减1
			String userName=user.toString();
			System.out.println(userName);
			ShoppingCar userCar=new ShoppingCar();
			userCar.setUserName(userName);
			String goodsId=req.getParameter("goodsId");
			userCar.setGoodsId(Integer.parseInt(goodsId));
			String op=req.getParameter("op");
			System.out.println(goodsId+"/"+op);
			ShoppingCar newCar=shopCarServImple.selectShoppingCarByUnAndGd(userCar);
			int shopNumber=newCar.getShopNumber();
			if(op.equals("0")){
				
				
				if (shopNumber==1){//删除记录
					shopNumber=shopNumber-1;
					float goodsPrice=newCar.getGoodsPrice();
					float money=shopNumber*goodsPrice;
					userCar.setShopNumber(shopNumber);
					userCar.setShopMoney(money);
					int i=shopCarServImple.updateShoppingCarDelOne(userCar);
					int t=shopCarServImple.deleteGoods();
					if(t>0&&i>0){
						out.print("yes");
					}
					else{
						out.print("no");
					}
					
				}
				else{
					
					shopNumber=shopNumber-1;
					float goodsPrice=newCar.getGoodsPrice();
					float money=shopNumber*goodsPrice;
					userCar.setShopNumber(shopNumber);
					userCar.setShopMoney(money);
					int i=shopCarServImple.updateShoppingCarDelOne(userCar);
					if(i>0){
						out.print("yes");
					}
				}
				
			}
			else{
				
				//数据库加1
				shopNumber=shopNumber+1;
				float goodsPrice=newCar.getGoodsPrice();
				float money=shopNumber*goodsPrice;
				userCar.setShopNumber(shopNumber);
				userCar.setShopMoney(money);
				int i=shopCarServImple.updateShoppingCarAddOne(userCar);
				if(i>0){
					out.print("yes");
				}
			}
			out.flush();
			out.close();
			
		}
	}




}
