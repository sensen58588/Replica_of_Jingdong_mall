<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
    
    <title>My JSP 'up.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	

	<script type="text/javascript">
		/*  function addGoodsToMyCar(){
			var goodsId=document.getElementById("goodsId");
			alert(goodsId.value);

		}  */
	</script>
  </head>
  
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
		width: 100%;
		height: 440px;
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
<body>
	
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
	<div class="d2">
		<div class="d21"></div>
	</div>
	<div class="d3">
		<div class="d31"></div>
		<div class="d32">
			<form>
				<span><input id="i1" type="text" value="荣耀4X" name="WB"></span>
				<span><input id="i2" type="submit" value="搜索" name="SS"></span>
			</form>
			<table class="d321" cellspacing="0">
				<tr height="30px">
					<td class="d322"><a href="#" id="a2">12道锋味</a></td>
					<td class="d322"><a href="#" id="a1">千元优惠</a></td>
					<td class="d322"><a href="#" id="a1">5件7折</a></td>
					<td class="d322"><a href="#" id="a1">立减100</a></td>
					<td class="d322"><a href="#" id="a1">大牌9.9元</a></td>
					<td class="d322"><a href="#" id="a1">运动相机</a></td>
					<td class="d322"><a href="#" id="a1">智能科技</a></td>
					<td class="d322"><a href="#" id="a1">保暖衬衫男</a></td>
				</tr>
			</table>
		</div>
		<div class="d33">
			<button id="i3"><img src="image/image/gouwuche..png"> <a href="#" id="a1">我的购物车<sup><img src="image/image/TAP12X@@F{FZ_R156IA@{UE.png"></sup></a>&nbsp;&#62;</button>
		</div>
	</div>
	<div id="clear"></div>
	<div class="d4">
		<div class="d41">
			<div class="d411">
				<div class="d4111">全部商品分类</div>
			</div>
				<div class="d4122"></div> 
				<table class="d4121">
					<tr>
					<td id="L4" ><a href="#" id="a1">酒水饮料</a></td>
					<td id="L4" ><a href="#" id="a1">男装</a></td>
					<td id="L4" ><a href="#" id="a1">女装</a></td>
					<td id="L4"><a href="#" id="a1">童装</a></td>
					<td id="L4"><a href="#" id="a1">闪购</a></td>
					<td id="L4"><a href="#" id="a1">团购</a></td>
					<td id="L4"><a href="#" id="a1">拍卖</a></td>
					<td id="L4"><a href="#" id="a1">金融</a></td>
					<td id="L41"><a href="#" id="a1">智能</a></td>
					</tr>
				</table>
		</div>
		<div class="d42">
			<table>
				<tr>
				
					<td class="d421"><a href="selectGoodsSomeInfoByLike.do?id=market" id="a0">京东超市</a></td>
					<td class="d422">&#62;</td>
				</tr>
				<tr>
					<td class="d421"><a href="#" id="a0">男装会场</a></td>
					<td class="d422">&#62;</td>
				</tr>
				<tr>
					<td class="d421"><a href="#" id="a0">女装会场</a></td>
					<td class="d422">&#62;</td>
				</tr>
				<tr>
					<td class="d421"><a href="#" id="a0">童装天地</a></td>
					<td class="d422">&#62;</td>
				</tr>
				<tr>
					<td class="d421"><a href="#" id="a0">珠宝首饰</a></td>
					<td class="d422">&#62;</td>
				</tr>
				<tr>
					<td class="d421"><a href="#" id="a0">个户化妆</a></td>
					<td class="d422">&#62;</td>
				</tr>
				<tr>
					<td class="d421"><a href="#" id="a0">钟表、奢侈品</a></td>
					<td class="d422">&#62;</td>
				</tr>
				<tr>
					<td class="d421"><a href="#" id="a0">运动户外</a></td>
					<td class="d422">&#62;</td>
				</tr>
				<tr>
					<td class="d421"><a href="#" id="a0">汽车用品</a></td>
					<td class="d422">&#62;</td>
				</tr>
				<tr>
					<td class="d421"><a href="#" id="a0">玩具乐器</a></td>
					<td class="d422">&#62;</td>
				</tr>
				<tr>
					<td class="d421"><a href="#" id="a0">生鲜特产</a></td>
					<td class="d422">&#62;</td>
				</tr>
				<tr>
					<td class="d421"><a href="#" id="a0">营养保健</a></td>
					<td class="d422">&#62;</td>
				</tr>
				<tr>
					<td class="d421"><a href="#" id="a0">图书音像</a></td>
					<td class="d422">&#62;</td>
				</tr>
				<tr>
					<td class="d421"><a href="#" id="a0">充值票务</a></td>
					<td class="d422">&#62;</td>
				</tr>
				<tr>
					<td class="d421"><a href="#" id="a0">白条保险</a></td>
					<td class="d422">&#62;</td>
				</tr>
			</table>
		</div>   <!-- 左侧导航栏 -->
		
   		<div class="d434">
   		<table border="1.5">
   		<tr>
   		<td width="70px" align="center" >商品编号</td>
   		<td width="100px" align="center">商品名称</td>
   		 <td width="70px" align="center">商品价格</td> 
   		 <td width="200px" align="center">商品图片</td>
   		 <td width="70px" align="center">查看详情</td>
   		</tr>
   		
   		<c:forEach items="${list}" var="goods">
   		<form action="selectGoodsAllInfoById.do" method="post" enctype="application/x-www-form-urlencoded">  
   		<tr>
   		<td id="goodsId">${goods.goodsId}<input type="hidden" id="goodsId" name="goodsId" value="${goods.goodsId}"></td>
   		<td id="goodsName">${goods.goodsName}</td>
   		<td id="goodsPrice">${goods.goodsPrice}RMB</td>
   		<td id="goodsPic" ><img src="image/goods/${goods.goodsPic}" width="200" height="180" ></td>
   		<!-- <td><input type="hidden" id="userId" name="userId" value="1111"></td> -->
   		<td><input type="submit" value="查看详情"></td>
   		</tr>
   		</form>
   		</c:forEach>
   		</table>
   		</div>
  </body>
</html>
