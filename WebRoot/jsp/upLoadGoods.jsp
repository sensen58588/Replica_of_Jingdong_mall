<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'upLoadGoods.jsp' starting page</title>
    
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
				alert("该商品编号不存在");
			}else{
			var returnList = eval("("+value+")");
			//alert(returnList);
			
			var goodsId4=returnList.goodsId;
			//alert(goodsId4+"goodsId4");
			var tb=document.getElementById("table");
			document.getElementById("goodsName").value=""+returnList.goodsName+"";
			document.getElementById("goodsType").value=""+returnList.goodsType+"";
			document.getElementById("goodsPrice").value=""+returnList.goodsPrice+"";
			document.getElementById("goodsNumber").value=""+returnList.goodsNumber+"";
			document.getElementById("goodsPricePer").value=""+returnList.goodsPricePer+"";
			document.getElementById("goodsText").value=""+returnList.goodsText+"";
			document.getElementById("goodsOrderNum").value=""+returnList.goodsOrderNum+"";
			document.getElementById("goodsKey").value=""+returnList.goodsKey+"";
			document.getElementById("flag").value=""+returnList.flag+"";
			
			
			}
			}
			};
			
  	r.open("post", "selectFromGoods.do", true);
  	r.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
  	r.send("goodsId="+goodsId);
  	
  	}
  
  </script>
  <body>
   <form action="updateGoodsInfo.do" method="post" enctype="application/x-www-form-urlencoded">
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
   <td align="left"><input type="submit" value="确认修改"></td>
   </tr>
   </table>
   
  
   </form>
   
   
  </body>
</html>
