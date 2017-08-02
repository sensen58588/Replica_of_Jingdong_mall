<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'modalReview.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<script type="text/javascript">
	function returnValueFromModal(){
	
	var review=document.getElementById("review");
	if(review==null){
		review="默认好评~";
	}
	window.returnValue=review.value;
	window.close();
	
	}
	
	</script>
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
  </head>
  
  <body class="d7">
  
    <table>
    <tr>
    <td width="100px;">评论：<textarea rows="4" cols="30" id="review" name="review"></textarea></td>
    </tr>
    <tr>
    <td><input type="button" onclick="returnValueFromModal()" value="提交评论"></td>
    </tr>
    </table>
  </body>
</html>
