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
    
    <title>我的购物车</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
<script type="text/javascript">

	
	
	function showMyCarInfo(){
		    var r = new XMLHttpRequest();
			r.onreadystatechange = function(){
			
			if(r.readyState==4){
				var list = r.responseText;
				if(list=='null'){
					alert("请您先登录！");
					
				}
				else{
				var returnList = eval("("+list+")");
				if(list=="[]"){
				alert("空空如也!快去购买吧~");
				}else{
				var tb=document.getElementById("table");
				for(var i = 0;i<returnList.length;i++){
				 var newTr=document.createElement("tr"); 
				 newTr.innerHTML="<tr><td align='center'>"+returnList[i].goodsName+"</td><td align='center'>"+returnList[i].goodsId+"</td><td align='center'>"+returnList[i].goodsPrice+"</td><td align='center' ><input type='button' value='－1' onclick='deleteOne("+returnList[i].goodsId+")'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+returnList[i].shopNumber+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type='button' value='＋1' onclick='addOne("+returnList[i].goodsId+")'></td><td align='center' >"+returnList[i].shopMoney+"</td></tr>";
				 tb.appendChild(newTr); 
				} 
				 var trSub=document.createElement("tr"); 
				 var trAdd=document.createElement("tr"); 
				 var trPho=document.createElement("tr"); 
				 trSub.innerHTML="<tr id='trSub'><td colspan='5' align='center'><input type='submit' value='生成订单'></td></tr>"
				 trAdd.innerHTML="<td colspan='5'>配送地址：<input type='text' id='userAddress' name='userAddress' onfocus='getUserInfo()'></td>"
				 trPho.innerHTML="<td colspan='5'>联系电话：<input type='text' id='userPhone' name='userPhone'></td>";
				
				 tb.appendChild(trAdd);
				 tb.appendChild(trPho);
				 tb.appendChild(trSub); 
				 }
				
				
				}
				
			}
			
		};
		r.open("post","showMyShoppingCar.do",true);
		
		r.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
		//2:send方法被调用
		r.send(null);
		
	
	}//加载购物车里的信息
	
	function getUserInfo(){
	
	var r=new XMLHttpRequest();
	r.onreadystatechange = function(){
		if(r.readyState==4){
			var getInfo=r.responseText;
			if(getInfo=='null'){
			alert("错误！");
			}
			else{
			var returnList = eval("("+getInfo+")");
			
			document.getElementById("userPhone").value=""+returnList.userPhone+"";
			document.getElementById("userAddress").value=""+returnList.userAddress+"";
			}
		
		
		}
	
	};
	
	    r.open("post","showUserInfo.do",true);
		
		r.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
		//2:send方法被调用
		r.send(null);
	
	}
	
	function deleteOne(goodsId){
			var op=0;
	   		var r = new XMLHttpRequest();
			r.onreadystatechange = function(){
			if(r.readyState==4){
				var message = r.responseText;
				if(message==0){
					alert("已经没有购买此商品，请勿重复该操作！");
					}
					else if(message=="yes"){
						window.location.href="jsp/ShoppingCar.jsp";
						
					
					}
	   		}
	   };
	    r.open("post","updateMyShoppingCar.do",true);
		
		r.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
		//2:send方法被调用
		r.send("goodsId="+goodsId+"&op="+op);
	   
	   
	   }
	   
	function addOne(goodsId){
			var op=1;
	        var r = new XMLHttpRequest();
			r.onreadystatechange = function(){
			if(r.readyState==4){
				var message = r.responseText;
				if(message==0){
					alert("操作错误！");
					}
					else if(message=="yes"){
					
						window.location.href="jsp/ShoppingCar.jsp";
					}
	   		}
	   };
	   
	    r.open("post","updateMyShoppingCar.do",true);
		
		r.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
		//2:send方法被调用
		r.send("goodsId="+goodsId+"&op="+op);
	
	
	}	
</script>

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
		background-image: url("image/login/back1.jpg");
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
  
  <body onload="showMyCarInfo()" class="d7">
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
	
	<div id="DivOne" style="margin-top: 20px;margin-left: 100px;">
	<form action="createOrder.do" method="post" enctype="application/x-www-form-urlencoded">
	<table border="1.5" id="table">
		<tr>
		<td width="180px" align="center">商品名称</td>
		<td width="100px" align="center">商品编号</td>
		<td width="100px" align="center">商品单价</td>
		<td width="200px" align="center">购买数量</td>
		<td width="100px" align="center">总价</td>
		</tr>
		</table>
		</form>
		
		</div>
	
  </body>
</html>
