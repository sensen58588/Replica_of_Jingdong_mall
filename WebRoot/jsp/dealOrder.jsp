<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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
    
    <title>订单页</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	

  </head>
  <script type="text/javascript">
  	function dealOrder(orderId){
  	     
  	     var obj=new Object();
  	     var Name=document.getElementById("userName");
  	     
  	     obj.orderId=orderId.value;
  	     obj.userName=Name.value;
  	     
  	     var returnValue = window.showModalDialog("jsp/modalCar.jsp",obj,"dialogHeight:600px;dialogWidth:800px");
		 //如果密码正确，订单支付完成，更新订单和商品数据库
		 
		 if(returnValue=="yes"){
		  updateOrder(orderId);
		 
		 
		 }else{
		 
		 
		 
		 }
		 
  	
  	}
  	function updateOrder(orderId){
  		var ordId=orderId;
  		var userName=document.getElementById("userName").value;
  	     var r=new XMLHttpRequest();
  	     r.onreadystatechange = function(){
			
			if(r.readyState==4){
					var returnValue=r.responseText;
					
					if(returnValue=="yes"){
					alert("支付成功！");
					window.location.href="../design/index.jsp";
					}
					else{
					alert("操作错误");
					}
					
				}
			
			};
			
		r.open("post","doneOrder.do",true);
		
		r.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
		
		r.send("orderId="+ordId+"&userName="+userName);	
  	
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
  <body class="d7">
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
  	
    <table border="1.5">
    <tr>
    <td width="100px" align="center">订单编号</td>
     <td width="100px" align="center">支付金额</td>
      <td width="200px" align="center">用户</td>
    </tr>
    <tr>
    <td width="100px" align="center">${orderId}</td>
     <td width="100px" align="center">${orderMoney}</td>
      <td width="200px" align="center" >${userName}<input type="hidden" value="${userName}" id="userName" name="userName"></td>
    </tr>
    <tr>
    <td colspan="3" align="center"><input type="button" onclick="dealOrder(${orderId})" value="确认支付"></td>
    </tr>
    
    </table>
    
  </body>
</html>
