<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'newOrder.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	

  </head>
  <script type="text/javascript">
  	function getInfo(){
  		var r = new XMLHttpRequest();
  		var orderId=document.getElementById("orderId");
  		    
			r.onreadystatechange = function(){
			if(r.readyState==4){
			var list = r.responseText;
			
			if(list=='null'){
					alert("无待支付订单！");
					
				}
			else{
				var returnList = eval("("+list+")");
				if(list=="[]"){
				alert("无待支付订单！");
				}
				else{
				  var returnList = eval("("+list+")");
				  
				  var totalmoney=0;
				  var tb=document.getElementById("table");
				 
				  for(var i = 0;i<returnList.length;i++)
				  {
				  var newTr=document.createElement("tr");
				  newTr.innerHTML="<td align='center'>"+returnList[i].orderId+"</td><td align='center'>"+returnList[i].goodsId+"</td> <td align='center'>"+returnList[i].number+"</td><td align='center'>"+returnList[i].money+"</td>";
				  tb.appendChild(newTr);
				  totalmoney=returnList[i].money+ totalmoney;
				  
				}
				  var tot=document.createElement("tr");
				  tot.innerHTML="<td colspan='4' align='center'>支付金额："+totalmoney+"&nbsp;&nbsp;&nbsp;RMB</td>";
				  tb.appendChild(tot);
				  var add=document.createElement("tr");
				  add.innerHTML="<td align='center' colspan='4'>配送地址："+returnList[0].userAddress+"</td>";
				  tb.appendChild(add);
				  var pho=document.createElement("tr");
				  pho.innerHTML="<td align='center' colspan='4'>联系电话："+returnList[0].userPhone+"</td>";
				  tb.appendChild(pho);
				 
				  var sub=document.createElement("tr");
				  sub.innerHTML="<td align='center' colspan='2'><input type='submit' value='确认订单'><input type='hidden' id='orderMoney' name='orderMoney' value="+totalmoney+"></td><td align='center' colspan='2'><input type='button' onclick='delOrder()' value='取消订单'></td>";
				  tb.appendChild(sub);
			}
			}
			}
			};
  	    r.open("post","getOrderInfo.do",true);
		
		r.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
		
		r.send("orderId="+orderId.value);
  	
  	
  
  }
  </script>
  
  
  <body onload="getInfo()">
  <form action="dealOrder.do" method="post" enctype="application/x-www-form-urlencoded">
  	<div>
  	<table id="table" border="1.5">
  	<tr>
  			
  	     <td width="100px" align="center">订单编号<input type="hidden" id="orderId" name="orderId" value="${orderId }"></td>
  	     <td width="100px" align="center">商品编号</td>
  	     <td width="100px" align="center">购买数量</td>
  	     <td width="100px" align="center">商品金额 </td>
  	     
  	</tr>
  	
  	</table>
  	</div>
  	
  	</form>
  </body>
</html>
