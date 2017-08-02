<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>登陆页面</title>
    
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
		function validUn(){
		var unObj = document.getElementById("UserName");
		var r = new XMLHttpRequest();
		r.onreadystatechange = function(){
			
			if(r.readyState==4){
				var returnValue = r.responseText;
				if(returnValue=='yes'){
					bSubmit = true;
					alert("此用户名不存在");
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
    <form action="userLogin.do" method="post" enctype="application/x-www-form-urlencoded">
    	<div class="d4">
    		<table>
    		<tr>
    		<td class="d3">用户名：</td><td><input class="d5" type="text" id="UserName" name="userName"  placeholder="您的账户名和登录名" maxlength="20" onblur="validUn()" ></td>
    		</tr>
    		<tr>
    		<td class="d3">密码：</td><td> <input class="d5" type="password" id="UserPw" name="userPw"  placeholder="建议以数字和字母结合，不允许使用非法字符" maxlength="20"></td></td>
    		</tr>
    		<tr>
    		<td colspan="2" align="center"><input type="submit" value="登录"></td>
    		</tr>
    		</table>
    	</div>
    	</form>
  </body>
</html>
