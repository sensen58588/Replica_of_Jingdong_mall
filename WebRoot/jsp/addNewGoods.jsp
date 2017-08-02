<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'addNewGoods.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
  </head>
   <script type="text/javascript">
  	function selectFromGoods(){
  	var goodsId=document.getElementById("goodsId").value;
  	var r=new XMLHttpRequest();
  	r.onreadystatechange = function(){
			if(r.readyState==4){
			var value=r.responseText;
			if(value=='null'){
				alert("这是新的商品编号，可以使用");
			}else{
			
			alert("该编号已存在，不可以使用！！！");
			
			
			}
			}
			};
			
  	r.open("post", "selectFromGoods.do", true);
  	r.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
  	r.send("goodsId="+goodsId);
  	
  	}
  
  </script>
  <body>
  	<form action="insterintoGoods.do" method="post" enctype="application/x-www-form-urlencoded">
   <table id="table" >
   
   <tr>
   <td align="left" width="600px;">商品编号：<input type="text" id="goodsId" name="goodsId" onblur="selectFromGoods()"></td>
   </tr>
   <tr>
   <td align="left" width="600px;">商品名称：<input type="text" id="goodsName" name="goodsName"></td>
   </tr>
   <tr>
   <td align="left" width="600px;">商品类别：<input type="text" id="goodsType" name="goodsType"></td>
   </tr>
   <tr>
   <td align="left" width="600px;">商品价格：<input type="text" id="goodsPrice" name="goodsPrice"></td>
   </tr>
   <tr>
   <td align="left" width="600px;">商品数量：<input type="text" id="goodsNumber" name="goodsNumber"></td>
   </tr>
   <tr>
   <td align="left" width="600px;">商品折扣：<input type="text" id="goodsPricePer" name="goodsPricePer"></td>
   </tr>
   <tr>
   <td align="left" width="600px;">商品介绍：<input type="text" id="goodsText" name="goodsText"></td>
   </tr>
   <tr>
   <td align="left" width="600px;">商品销售：<input type="text" id="goodsOrderNum" name="goodsOrderNum" value="0"></td>
   </tr>
   <tr>
   <td align="left" width="600px;">商品关键字：<input type="text" id="goodsKey" name="goodsKey"></td>
   </tr>
   <tr>
   <td align="left" width="600px;">上架/下架：<input type="text" id="flag" name="flag">(上架：1   下架：0)</td>
   </tr>
   <tr>
   <td align="left"><input type="submit" value="确认添加"></td>
   </tr>
   </table>
   </form>
  </body>
</html>
