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
    
    <title>My JSP 'modalCar.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	

  </head>
  <script type="text/javascript">
  	function recive(){
  	    //从数据库获取支付密码
  		var arg=window.dialogArguments;
  		var userName=arg.userName;//获取到用户名
  		//alert(arg.orderId);获取到订单编号
  		//var orderId=arg.orderId;
  		document.getElementById("fromIndex").value=arg.userName;
  		
  		
  		
  		var r=new XMLHttpRequest();
  		r.onreadystatechange = function(){
  			if(r.readyState==4){
  			
  			   var getPw=r.responseText;
  			   var tb=document.getElementById("table");
  			   var tr=document.createElement("tr");
  			   tr.innerHTML="<input type='hidden' id='getUserPw' name='getUserPw' value='"+getPw+"'>";
  			   tb.appendChild(tr);
  			   var test=document.getElementById("getUserPw").value;
  			   
  			} 
  		};
  		
  		r.open("post","selectPassword.do",true);
		
		r.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
		//2:send方法被调用
		r.send("userName="+userName);//发送用户名和订单编号
  		
  	
  	}
  function returnValueFromModal(){
  		
  	    var password = document.getElementById("password").value;
		//把要返回的值返回去
		
		var getPassword=document.getElementById("getUserPw").value;
		if(getPassword==password){
		    window.returnValue = "yes";
		    window.close();//关闭模态窗体才能把值传回去
		}else{
			alert("密码错误！！");
		
		}
		
		
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
  <body onload="recive()">
  <div class="d1">
		<div class="d01"><a href="#" id="a3">送至：长春 ∨</a></div>
			<ol>
				<li id="L3"><a href="jsp/showMyOrders.jsp" id="a3">我的订单</a>
				<li id="L2"><a href="index.jsp" id="a3">主页</a>
				<li id="L2"><a href="jsp/ShoppingCar.jsp" id="a3">我的购物车 </a>
				<li id="L2"><a href="#" id="a1"><img src="image/image/shouji.png" style="vertical-align: top;">手机京东 ∨</a>
				<li id="L1"><a href="#" id="a1">我的会员</a>
				<li id="L1"><a href="jsp/register.jsp" id="a2">免费注册</a>
				<li id="L5"><a href="jsp/login.jsp" id="a1">你好，<%=userName%></a>
				</ol>
		
	</div>
   
   <input type="hidden" id="fromIndex"  name="fromIndex">
   
   <div style="margin-top: 200px;margin-left: 350px;">支付密码：<input type="password" id="password" name="password" value="" placeholder="输入支付密码">
   </div>
   <div style="margin-top:50px;margin-left:400px;">
	<input type="button" onclick="returnValueFromModal()" value="确认支付">   
   </div>
   <table id="table">
   	
   </table>
   <!-- </form> -->
  </body>
</html>
