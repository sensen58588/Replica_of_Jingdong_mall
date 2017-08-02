<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'addGoodsPic.jsp' starting page</title>
    
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
			if(value=='yes'){
				alert("该商品编号不存在");
			}
			
			}
			};
			
  	r.open("post", "selectFromGoods.do", true);
  	r.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
  	r.send("goodsId="+goodsId);
  	
  	}
  
  
  </script>
  <body>
  <div style="width:200px;">商品编号：<input type="text" id="goodsId"  onblur="selectFromGoods()"></div>
  <form action="uploadPic.do" method="post" enctype="multipart/form-data">
    <table>
    <tr>
    
    <td width="80px;" align="left"><input type="file"  name="goodsPic"></td>
    </tr>
    <tr>
    <td>
    <input type="submit" value="上传图片">
    </td>
    </tr>
    </table>
    </form>
  </body>
</html>
