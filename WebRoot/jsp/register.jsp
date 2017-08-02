<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>新用户注册</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link href="css/register.css" rel="stylesheet" type="text/css">

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
		height: 120px;
		background-image: url("image/register.jpg");
	}
	.d3{
	align:center;
		width: 150px;
	height: 30px;
	font-size: 22px;
	color: rgb(102,102,102);
	}
	.d4{
	    width:800px;
	    heigth:800px;
		margin-left:350px;
		margin-top:80px;
	}
	.d5{
		width: 300px;
		height: 30px;
	}
	.d6{
	width: 150px;
	height: 40px;
	font-size: 22px;
	color: rgb(12,102,102);
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
	 <script type="text/javascript">
	var bSubmit = false;
   function vaild(){
   var userName=document.getElementById("UserName");
   var userPw=document.getElementById("UserPw");
   var rePw=document.getElementById("ReUserPw");
   var userPhone=document.getElementById("UserPhone");
   var userAddress=document.getElementById("UserAddress");
   	if(userName.value==""){
   	    alert("账户名为必填项");
   	 	return false;
   	}
   	
   	else if(userPw.value==""){
   		alert("密码为必填项");
   		return false;
   	}
   	else if(rePw.value==""){
   		alert("确认密码为必填项");
   		return false;
   	}
   
   
   	else if(userPhone.value==""){
   		alert("手机号不能为空");
   		return false;
   	}
   
   	else if(userAddress.value==""){
   		alert("地址不能为空");
   		return false;
   	}
   	else if(rePw.value!=userPw.value){
   		alert("两次输入的密码不一致");
   		return false;
   	
   	}
   else{
   		bSubmit=true;
        return bSubmit;
   }
   
   }
   
   function validUn(){
		var unObj = document.getElementById("UserName");
		var r = new XMLHttpRequest();
		r.onreadystatechange = function(){
			
			if(r.readyState==4){
				var returnValue = r.responseText;
				if(returnValue=='yes'){
					bSubmit = true;
				}
				else{
				alert("此用户名已存在");
				}
			}
			
		};
		
		//1：open方法被调用  参数1：提交表单的方式  参数2：要提交的servlet 参数3：异步传输
		//【准备】请求servlet
		r.open("post","registerServ.do",true);
		
		r.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
		//2:send方法被调用
		r.send("userName="+unObj.value);
		}
    
    </script>
  </head>
   
  <div class="d2"></div><!-- Logo -->
  
    
   <body class="d7">
   <div class="d4">
   <form action="insertintoUserinfo.do" onsubmit="return vaild()" method="post" onsubmit="return vaild()" enctype="application/x-www-form-urlencoded">
   <table>
   <tr>
   		<td class="d3">用户名：</td><td ><input class="d5" type="text" id="UserName" name="userName"  placeholder="您的账户名和登录名" maxlength="20" onblur="validUn()"></td>
   </tr>
   <tr>
   <td class="d3">密码：</td><td> <input class="d5" type="password" id="UserPw" name="userPw"  placeholder="建议以数字和字母结合，不允许使用非法字符" maxlength="20"></td>
   </tr>
   <tr>
   <td class="d3">确认密码：</td><td> <input class="d5" type="password" id="ReUserPw" name="reUserPw"  placeholder="请再一次确认密码" maxlength="20"></td>
   </tr>
   <tr>
   <td class="d3">手机号：</td><td> <input class="d5" type="text" id="UserPhone" name="userPhone"  placeholder="您的联系手机号" maxlength="20"></td>
   </tr>
   <tr>
   <td class="d3">邮箱：</td><td> <input class="d5" type="text"  name="userEmail" placeholder="您的邮箱地址" maxlength="20"></td>
   </tr>
   <tr>
   <td class="d3">地址：</td><td> <input type="hidden" name="userLevel" value="1"><input class="d5" type="text" id="UserAddress" name="userAddress" placeholder="您的配送地址" maxlength="20"></td>
   </tr>
   
   <tr align="center">
   <td colspan="2"><input class="d6" type="submit" value="注册"></td>
   </tr>
   </table>
   </form>
   </div>
  </body>
</html>
