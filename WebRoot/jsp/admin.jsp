<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>管理员界面</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
    <table>
    <tr>
    <td><a href="jsp/upLoadGoods.jsp">修改商品信息</a></td>
    </tr>
    <tr>
    <td><a href="jsp/addNewGoods.jsp">添加商品信息</a></td>
    </tr>
    <tr>
    <td><a href="jsp/addGoodsPic.jsp">添加商品图片</a></td>
    </tr>
    <tr>
    <td><a href="jsp/showGetMoney.jsp">查看营业收入</a></td>
    </tr>
    
    </table>
  </body>
</html>
