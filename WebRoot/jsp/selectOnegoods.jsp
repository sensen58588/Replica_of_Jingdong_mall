<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%	
    Object user=session.getAttribute("UserName");
    String userName;
    if(user==null){
    	userName="请登录";
    }else{
     userName=user.toString();
	}
   
 %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>商品详情</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">

 <link href="css/JD.css" rel="stylesheet" type="text/css">
	<style type="text/css">
	*{
		margin: 0px auto;
		font-family: Microsoft YaHei;
	}
	a{
		text-decoration: none;
	}
	.d1{
		width: 100%;
		height: 30px;
		background-color: rgb(241,241,241);
	}
	.d2{
		width: 100%;
		height: 80px;
		background-color: rgb(255,40,81);
	}
	.d3{
		width: 100%;
		height: 100px;
	}
	.d4{
		width: 100%;
		height: 513px;
	}
	.d5{
		width: 100%;
		height: 150px;
	}
	.d6{
		width: 100%;
		height: 275px;
	}
	.d7{
		width: 100%;
		height: 440px;
	}
	.d8{
		width: 100%;
		height: 126px;
	}
	.d9{
		width: 100%;
		height: 680px;
	}
	.d10{
		width: 100%;
		height: 67px;
	}
	.d11{
		width: 1212px;
		height: 67px;
		background-color: rgb(247,247,247);
	}
	</style>
 
	
</head>
	<script type="text/javascript">
		function getGoodsReview(){ //获取商品评论
			
			var goodsId=document.getElementById("goodsId").value;
			
			var r = new XMLHttpRequest();
			r.onreadystatechange = function(){
			if(r.readyState==4){
			
			var list=r.responseText;
			
			if(list=="[]"){
			    var tb=document.getElementById("table");
				var tTr=document.createElement("tr");
				tTr.innerHTML="<tr><td colspan='7'>该商品暂时无任何用户评论...<td></tr>";
				tb.appendChild(tTr);
			}
			else{
			    var returnList = eval("("+list+")");
				var tb=document.getElementById("table");
				
				for(var i = 0;i<returnList.length;i++)
				{
				var newTr=document.createElement("tr"); 
				newTr.innerHTML="<td align='center' colspan='2'>"+returnList[i].userName+"</td><td colspan='5'>"+returnList[i].review+"</td>";
				tb.appendChild(newTr);
				}
				}
				}
			};
			
			
			r.open("post","selectGoodsReview.do",true);
		
			r.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
			r.send("goodsId="+goodsId);
		
		} 
		
		function addOneGoodsToMyCar(){
			
			var goodsId=document.getElementById("goodsId").value;
			var goodsName=document.getElementById("goodsName").value;
			var goodsPrice=document.getElementById("goodsPrice").value;
			var shopNumber=document.getElementById("shopNumber").value;
			var r = new XMLHttpRequest();
			r.onreadystatechange = function(){
			
			if(r.readyState==4){
				var returnValue = r.responseText;
				if(returnValue=='yes'){
					alert("添加成功！");
				}
				else{
				alert("添加失败！请您先登录！");
				}
			}
			
		};
		r.open("post","addOneGoodsToMyCar.do",true);
		
		r.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
		//2:send方法被调用
		r.send("goodsId="+goodsId+"&goodsName="+goodsName+"&goodsPrice="+goodsPrice+"&shopNumber="+shopNumber);
		}
		
		
		
		
		
	</script>


<body onload="getGoodsReview()">
	<div class="d1">
		<div class="d01"><a href="#" id="a3">送至：长春 ∨</a></div>
			<ol>
				<li id="L3"><a href="jsp/showMyOrders.jsp" id="a3">我的订单</a>
				<li id="L2"><a href="#" id="a3">商城主页</a>
				<li id="L2"><a href="jsp/ShoppingCar.jsp" id="a3">我的购物车 </a>
				<li id="L2"><a href="#" id="a1"><img src="image/image/shouji.png" style="vertical-align: top;">手机京东 ∨</a>
				<li id="L1"><a href="#" id="a1">我的会员</a>
				<li id="L1"><a href="jsp/register.jsp" id="a2">免费注册</a>
				<li id="L5"><a href="jsp/login.jsp" id="a1">你好，<%=userName%></a>
				</ol>
		
	</div>
  <div style="margin-top: 20px;margin-left: 100px;">
  <form action="addOneGoodsToMyCar.do" method="post" enctype="application/x-www-form-urlencoded">
 <div>
  <table border="1" id="table">
  
  <tr>
  	<td width="70px" align="center" >商品编号</td>
   		<td width="100px" align="center">商品名称</td>
   		 <td width="70px" align="center">商品价格</td> 
   		 <td width="200px" align="center">商品图片</td>
   		 <td width="70px" align="center">商品介绍</td>
   		 <td width="70px" align="center">最新折扣</td>
   		 <td width="100px" align="center">商品销售量</td>
  </tr>
    	<tr>
    	<td align="center">${goods.goodsId}<input type="hidden" id="goodsId" name="goodsId" value="${goods.goodsId }"></td>
   		<td  align="center">${goods.goodsName}<input type="hidden" id="goodsName" name="goodsName" value="${goods.goodsName }"></td>
   		<td  align="center">${goods.goodsPrice}RMB<input type="hidden" id="goodsPrice" name="goodsPrice" value="${goods.goodsPrice}"></td>
   		<td ><img src="image/goods/${goods.goodsPic}" width="200" height="180" ></td>
    	<td>${goods.goodsText}</td>
    	<td align="center">${goods.goodsPricePer }折</td>
    	<td align="center">${goods.goodsOrderNum}</td>
    </tr>
    <tr>
    <td colspan="2">购买用户</td><td colspan="5">用户评论</td>
    </tr>
    </table>
     </div>
     <!-- <div>
    <table id="tableTwo" border="1.5">
    </table>
    </div> -->
    <div >购买数量：<input type="text" name="shopNumber" id="shopNumber"></div>
    <div><input type="button" value="加入购物车" onclick="addOneGoodsToMyCar()"></div>
    </form>
    </div>
  </body>
</html>
