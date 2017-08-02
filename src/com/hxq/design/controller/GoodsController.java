package com.hxq.design.controller;

import java.io.File;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.hxq.design.beans.Goods;
import com.hxq.design.service.impl.GoodsServImpl;
@Controller
public class GoodsController {
	@Autowired
	private GoodsServImpl goodsimpl;
	@RequestMapping("insterintoGoods.do")//插入
	public ModelAndView insterintoGoods(HttpServletRequest req, HttpServletResponse resp)throws Exception{
		ModelAndView modal=new ModelAndView();
		
		String getgoodsId=req.getParameter("goodsId");
		String goodsName=req.getParameter("goodsName");
		String goodsType=req.getParameter("goodsType");
		String getGoodsPrice=req.getParameter("goodsPrice");
		
		String getgoodsNumber=req.getParameter("goodsNumber");
		String getgoodsPricePer=req.getParameter("goodsPricePer");
		String goodsText=req.getParameter("goodsText");
		String getgoodsOrderNum=req.getParameter("goodsOrderNum");
		String goodsKey=req.getParameter("goodsKey");
		String getflag=req.getParameter("flag");
		
		float goodsPrice=Float.parseFloat(getGoodsPrice);
		int goodsId=Integer.parseInt(getgoodsId);
		float goodsPricePer=Float.parseFloat(getgoodsPricePer);
		int goodsNumber=Integer.parseInt(getgoodsNumber);
		int goodsOrderNum=Integer.parseInt(getgoodsOrderNum);
		int flag=Integer.parseInt(getflag);
		Goods upGoods=new Goods();
		upGoods.setFlag(flag);
		upGoods.setGoodsId(goodsId);
		upGoods.setGoodsKey(goodsKey);
		upGoods.setGoodsName(goodsName);
		upGoods.setGoodsNumber(goodsNumber);
		upGoods.setGoodsOrderNum(goodsOrderNum);
		upGoods.setGoodsPrice(goodsPrice);
		upGoods.setGoodsPricePer(goodsPricePer);
		upGoods.setGoodsType(goodsType);
		upGoods.setGoodsText(goodsText);
		
		
		int i=goodsimpl.insertIntoGoods(upGoods);
		if(i>0){
			modal.setViewName("jsp/updateSuccess.jsp");
		}
		else{
			modal.setViewName("jsp/Error.jsp");
		}
		return modal;
	}
	@RequestMapping("selectGoodsAllInfoById.do")//详细查询
	public ModelAndView selectGoodsAllInfoById(HttpServletRequest request, HttpServletResponse response)throws Exception{
		request.setCharacterEncoding("utf-8");
		String goodsIdValue=request.getParameter("goodsId");
		System.out.println(goodsIdValue);
		int goodsId=Integer.parseInt(goodsIdValue);
		ModelAndView modelAndView=new ModelAndView();
		Goods goods=goodsimpl.selectGoodsAllInfoById(goodsId);
		modelAndView.addObject("goods", goods);
		modelAndView.setViewName("jsp/selectOnegoods.jsp");
		
		return modelAndView;
	}
	
	@RequestMapping("selectGoodsSomeInfoByLike.do")//模糊查询
	public ModelAndView selectGoodsSomeInfoByLike(HttpServletRequest request, HttpServletResponse response)throws Exception{
		request.setCharacterEncoding("utf-8");
		String value=request.getParameter("id");
		System.out.println(value);
		
		ModelAndView modelAndView=new ModelAndView();
		List<Goods> list=new ArrayList<Goods>();
		list=goodsimpl.selectGoodsSomeInfoByLike(value);
		modelAndView.addObject("list", list);
		modelAndView.setViewName("jsp/goodsType.jsp");
		return modelAndView;
	}
	
	@RequestMapping("selectFromGoods.do")
	public void selectGoodsById(HttpServletRequest req,HttpSession session, HttpServletResponse resp)throws Exception{
		
		req.setCharacterEncoding("utf-8");
		resp.setCharacterEncoding("utf-8");
		PrintWriter out=resp.getWriter();
		Gson gson = new Gson();
		String goodsId=req.getParameter("goodsId");
		System.out.println(goodsId);
		int getGoodsId=Integer.parseInt(goodsId);
		
		Goods getGoods=goodsimpl.selectGoodsAllInfoById(getGoodsId);
		if(getGoods==null){
			out.print("null");//新的编号，可用
			
		}
		else{
			session.setAttribute("goodsId", goodsId);
			String toJson = gson.toJson(getGoods);
			out.print(toJson);
			System.out.println("toJson内容："+toJson);
		}
		out.flush();
		out.close();
		
	}
	
	@RequestMapping("updateGoodsInfo.do")
	public ModelAndView updateGoodsInfo(HttpServletRequest req, HttpServletResponse resp)throws Exception{
		
		ModelAndView modal=new ModelAndView();
		String getgoodsId=req.getParameter("goodsId");
		String goodsName=req.getParameter("goodsName");
		String goodsType=req.getParameter("goodsType");
		String getGoodsPrice=req.getParameter("goodsPrice");
		
		String getgoodsNumber=req.getParameter("goodsNumber");
		String getgoodsPricePer=req.getParameter("goodsPricePer");
		String goodsText=req.getParameter("goodsText");
		String getgoodsOrderNum=req.getParameter("goodsOrderNum");
		String goodsKey=req.getParameter("goodsKey");
		String getflag=req.getParameter("flag");
		float goodsPrice=Float.parseFloat(getGoodsPrice);
		int goodsId=Integer.parseInt(getgoodsId);
		float goodsPricePer=Float.parseFloat(getgoodsPricePer);
		int goodsNumber=Integer.parseInt(getgoodsNumber);
		int goodsOrderNum=Integer.parseInt(getgoodsOrderNum);
		int flag=Integer.parseInt(getflag);
		Goods upGoods=new Goods();
		upGoods.setFlag(flag);
		upGoods.setGoodsId(goodsId);
		upGoods.setGoodsKey(goodsKey);
		upGoods.setGoodsName(goodsName);
		upGoods.setGoodsNumber(goodsNumber);
		upGoods.setGoodsOrderNum(goodsOrderNum);
		upGoods.setGoodsPrice(goodsPrice);
		upGoods.setGoodsPricePer(goodsPricePer);
		upGoods.setGoodsType(goodsType);
		upGoods.setGoodsText(goodsText);
		int vt=goodsimpl.updateGoodsInfo(upGoods);
		
		if(vt>0){
			modal.setViewName("jsp/updateSuccess.jsp");
			}
		else{
			modal.setViewName("jsp/Error.jsp");
			
		}
		return modal;
		
	}
	
	//uploadPic.do
	@RequestMapping("uploadPic.do")
	public ModelAndView upLoadGoodsPic(MultipartFile goodsPic,HttpSession session,HttpServletRequest request)throws Exception{
		ModelAndView modal=new ModelAndView();
		String imageName = goodsPic.getOriginalFilename();//获取图片的名字
		System.out.println(imageName);
		
		String tomcatPath = request.getSession().getServletContext().getRealPath("/")+"image";
		System.out.println(tomcatPath);
		
		File file = new File(tomcatPath+"\\"+"goods"+"\\"+imageName);
		goodsPic.transferTo(file);//相当于对接
		
		System.out.println("图片位置："+tomcatPath+"\\"+"goods"+"\\"+imageName);
		Goods goods=new Goods();
		goods.setGoodsPic(imageName);
		String getgoodsId=session.getAttribute("goodsId").toString();
		int goodsId=Integer.parseInt(getgoodsId);
		goods.setGoodsId(goodsId);
		int t=goodsimpl.uploadGoodsPic(goods);
		if(t>0){
			modal.setViewName("jsp/updateSuccess.jsp");
			
		}
		else{
			modal.setViewName("jsp/Error.jsp");
			
		}
		return modal;
	}

}
