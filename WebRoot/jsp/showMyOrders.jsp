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
    
    <title>My JSP 'showMyOrders.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<script type="text/javascript">
		function seletOrderInfo(){
		var r=new XMLHttpRequest();
		r.onreadystatechange=function(){
			if(r.readyState==4){
			    var list = r.responseText;
				if(list=='null'){
					alert("请您先登录！");
					
				}
				else{
				var returnList = eval("("+list+")");
				if(list=="[]"){
				    alert("您还没有历史完成订单~快去购物吧");
				}else{
				var tb=document.getElementById("table");
				for(var i = 0;i<returnList.length;i++){
				var newTr=document.createElement("tr"); 
				newTr.innerHTML="<td align='center'>"+returnList[i].orderId+"</td><td align='center'>"+returnList[i].goodsId+"</td><td align='center'>"+returnList[i].number+"</td><td align='center'>"+returnList[i].money+"</td><td align='center'>"+returnList[i].data+"</td><td><input type='button' value='评论商品' onclick='modalReview("+returnList[i].goodsId+")'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type='button' value='删除订单' onclick='deleteOrder("+returnList[i].orderId+")'></td>";
				
				tb.appendChild(newTr);
				
				
				}
				
				
				}
			
			}
		
		}
		};
		
		r.open("post","showOrderInfo.do",true);
		
		r.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
		
		r.send(null);
		
		}
		
		function deleteOrder(orderId){
		
		var t=new XMLHttpRequest();
		t.onreadystatechange=function(){
			if(t.readyState==4){
			var returnValue=t.responseText;
			if(returnValue=='yes'){
				alert("删除成功");
				window.location.href="jsp/showMyOrders.jsp";
				
			}
			else{
				alert("删除失败~~");
			}
			
			
			}
		
		};
		
		t.open("post","deleteOrder.do",true);
		t.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
		t.send("orderId="+orderId);
		
		}
		
    function modalReview(goodsId){
        var obj=new Object();
        obj.goodsId=goodsId.value;
        
        var returnValue = window.showModalDialog("jsp/modalReview.jsp",obj,"dialogHeight:600px;dialogWidth:800px");
    	if(returnValue==null){
    		returnValue="用户默认好评~~";
    	}
    	goodsReview(goodsId,returnValue);
    
    
    }
	function goodsReview(goodsId,review){
		
		var t=new XMLHttpRequest();
		t.onreadystatechange=function(){
			if(t.readyState==4){
			var returnValue=t.responseText;
			if(returnValue=='yes'){
				alert("评论成功!");
				//window.location.href("showMyOrders.jsp");
			}
			
			
			}
		
		};
		
		t.open("post","insertIntoGoodsReview.do",true);
		t.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
		t.send("goodsId="+goodsId+"&review="+review);
		
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
  </head>
  
  <body onload="seletOrderInfo()" class="d7">
  
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
    <table id="table" border="1.5">
    <tr>
    <td width="100px;" align="center">订单编号</td>
    <td width="100px;" align="center">商品编号</td>
    <td width="100px;" align="center">购买数量</td>
    <td width="100px;" align="center">商品金额</td>
    <td width="200px;" align="center">交易日期</td>
    <td width="200px;" align="center">订单选择</td>
    
    </tr>
    </table>
  </body>
</html>
