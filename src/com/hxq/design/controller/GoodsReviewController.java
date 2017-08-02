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
import com.hxq.design.beans.GoodsReview;
import com.hxq.design.service.impl.GoodsReviewServImpl;

@Controller
public class GoodsReviewController {
	@Autowired
	private GoodsReviewServImpl goodsreview;
	
	@RequestMapping("insertIntoGoodsReview.do")
	public  void insertInto(HttpServletRequest req,HttpSession session,HttpServletResponse resp)throws Exception{
		req.setCharacterEncoding("utf-8");
		resp.setCharacterEncoding("utf-8");
		String goodsId=req.getParameter("goodsId");
		Object user=session.getAttribute("UserName");
		PrintWriter out=resp.getWriter();
		if(user==null){
			
		}else{
			String review=req.getParameter("review");
			System.out.println("goodsId:"+goodsId+"////"+"review:"+review);
			String userName=user.toString();
			GoodsReview Review=new GoodsReview();
			Review.setUserName(userName);
			int intgoodsId=Integer.parseInt(goodsId);
			System.out.println("intgoodsId"+intgoodsId);
			Review.setGoodsId(intgoodsId);
			Review.setReview(review);
			
			int i=goodsreview.insertIntoReview(Review);
			if(i>0){
				out.print("yes");
				
			}else{
				out.print("no");
			}
			}
	
		out.flush();
		out.close();
	}
	
	@RequestMapping("selectGoodsReview.do")
	public void selectGoodsReview(HttpServletRequest req,HttpSession session,HttpServletResponse resp)throws Exception{
		req.setCharacterEncoding("utf-8");
		resp.setCharacterEncoding("utf-8");
		PrintWriter out=resp.getWriter();
		Gson gson = new Gson();
		String Id=req.getParameter("goodsId");
		int goodsId=Integer.parseInt(Id);
		
		List<GoodsReview> list=goodsreview.selectReviewById(goodsId);
		String toJson = gson.toJson(list);
		System.out.println("ÆÀÂÛ£º"+toJson);
		out.print(toJson);
		out.flush();
		out.close();
		
	}
}
