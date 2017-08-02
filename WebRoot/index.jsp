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
    
    <title>My JSP 'up.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	
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
<body onload="recive()">
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
			<form action="selectGoodsSomeInfoByLike.do" method="post" enctype="application/x-www-form-urlencoded">
				<span><input id="i1" type="text" name="id"></span>
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
			<button id="i3"><img src="image/image/gouwuche..png"> <a href="jsp/ShoppingCar.jsp" id="a1">我的购物车<sup><img src="image/image/TAP12X@@F{FZ_R156IA@{UE.png"></sup></a>&nbsp;&#62;</button>
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
					<td id="L4"><a href="#" id="a1">酒水饮料</a>
					<td id="L4"><a href="#" id="a1">男装</a>
					<td id="L4"><a href="#" id="a1">女装</a>
					<td id="L4"><a href="#" id="a1">童装</a>
					<td id="L4"><a href="#" id="a1">闪购</a>
					<td id="L4"><a href="#" id="a1">团购</a>
					<td id="L4"><a href="#" id="a1">拍卖</a>
					<td id="L4"><a href="#" id="a1">金融</a>
					<td id="L41"><a href="#" id="a1">智能</a>
					</tr>
				</table>
		</div>
		<div class="d42">
			<table>
				<tr>
					<td class="d421" ><a href="selectGoodsSomeInfoByLike.do?id=market"id="a0" >京东超市</a></td>
					<td class="d422">&#62;</td>
				</tr>
				<tr>
					<td class="d421"><a href="selectGoodsSomeInfoByLike.do?id=man" id="a0">男装会场</a></td>
					<td class="d422">&#62;</td>
				</tr>
				<tr>
					<td class="d421"><a href="selectGoodsSomeInfoByLike.do?id=gril" id="a0">女装会场</a></td>
					<td class="d422">&#62;</td>
				</tr>
				<tr>
					<td class="d421"><a href="selectGoodsSomeInfoByLike.do?id=kid" id="a0">童装天地</a></td>
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
		<div class="d43">
			<div class="d431"></div><!-- 中间图片 -->
			<div class="d432">
				<div class="d4321">
					<div class="d43211">京东快报</div>
					<div class="d43212">更多 &#62;</div>
				</div>
				<div class="d4322">
						<p id="L5"><a href="#" id="a1"><b>[特惠]</b>吉列爆款直降部分满199减100</a></p>
						<p id="L5"><a href="#" id="a1"><b>[公告]</b>京东配送阳澄湖大闸蟹服务开启</a></p>
						<p id="L5"><a href="#" id="a1"><b>[特惠]</b>哙哙推荐零食低至6元！</a></p>
						<p id="L5"><a href="#" id="a1"><b>[公告]</b>全新京豆回馈规则发布</a></p>
						<p id="L5"><a href="#" id="a1"><b>[特惠]</b>12道锋味  超市满199减100</a></p>
				</div>
				<div class="d4321">
					<div class="d43211">生活服务</div>
				</div>
				<div class="d4323">
					<div id="td1"><a href="#" id="a1">游戏</a></div>
					<div id="td2"><a href="#" id="a1">电影票</a></div>
					<div id="td3"><a href="#" id="a1">机票</a></div>
					<div id="td4"><a href="#" id="a1">话费</a></div>
					<div id="td5"><a href="#" id="a1">水电煤</a></div>
					<div id="td6"><a href="#" id="a1">酒店</a></div>
					<div id="td7"><a href="#" id="a1">团购</a></div>
					<div id="td8"><a href="#" id="a1">彩票</a></div>
					<div id="td9"><a href="#" id="a1">白条</a></div>
					<div id="td10"><a href="#" id="a1">礼品卡</a></div>
					<div id="td11"><a href="#" id="a1">理财</a></div>
					<div id="td12"><a href="#" id="a1">众筹</a></div>
				</div>
			</div>
		</div>
	</div>
	<div class="d0"></div>
	<div class="d5">
		<a href="#"><div class="d51"></div></a>
		<a href="#"><div class="d52"></div></a>
		<a href="#"><div class="d53"></div></a>
		<a href="#"><div class="d54"></div></a>
		<a href="#"><div class="d55"></div></a>
	</div>
	<div class="d0"></div>
	<div class="d0"></div>
	<div class="d0"></div>
	<div class="d6">
		<div class="d61">
			<div class="d611">猜你喜欢</div>
			<div class="d612">根据你的喜好精心为你推荐</div>
			<div class="d613"><a href="#" id="a1">换一批<img src="image/image/huanyihuan.png"></a></div>
		</div>
		<div class="d62">
			<div class="d621">
				<div class="d6211"></div>
				<div class="d6212"></div>
				<div class="d6213"></div>
				<div class="d6214"></div>
				<div class="d6215"></div>
				<div class="d6216"></div>
			</div>
			<div class="d622">
				<div class="d6221"><a href="#" id="a1">九牧（JOMOO）74038/44038-156 全铜</a></div>
				<div class="d6221"><a href="#" id="a1">潜水艇（Submarine）　TF50-</a></div>
				<div class="d6221"><a href="#" id="a1">龚氏阳澄湖大闸蟹尝鲜款A型实物现货礼盒8</a></div>
				<div class="d6221"><a href="#" id="a1">【送2只】现货金甲将牌阳澄湖大闸蟹实物公</a></div>
				<div class="d6221"><a href="#" id="a1">维艾 保温壶家用保温瓶不锈钢热水瓶暖壶 不锈</a></div>
				<div class="d6221"><a href="#" id="a1">象印（ZO JIRUSHI）保温保冷壶 1500ml不锈钢</a></div>
			</div>
			<div class="d623">
				<div class="d6231">¥139.00</div>
				<div class="d6231">¥89.00</div>
				<div class="d6231">¥138.00</div>
				<div class="d6231">¥168.00</div>
				<div class="d6231">¥139.00</div>
				<div class="d6231">¥259.00</div>
			</div>
		</div>
	</div>
	<div class="d0"></div>
	<div class="d0"></div>
	<div class="d7">
		<div class="d71">京东特色购</div>
		<div class="d72">
			<div class="d721">
				<div class="d7211">
					<p id="L6">-科技精品-</p>
				</div>
				<div class="d7212"> 
					<a href="#" id="a2">双屏水墨屏智能手机</a>
				</div>
			</div>
			<div class="d722">
				<div class="d7221"><p id="L7">耐克清仓特卖</p></div>
				<div class="d7222"><p id="L8">低至79元</p></div>
				<div class="d7223"><button id="L9">品牌街 &#62;</button></div>
			</div>
			<div class="d723">
				<div class="d7211">
					<p id="L6">-<span id="font">趣购</span>好东西-</p>
				</div>
				<div class="d7212"> 
					<a href="#" id="a2">红米2A低至549</a>
				</div>
			</div>
			<div class="d724">
				<div class="d7211">
					<p id="L6">-<span id="font">享新</span>大NEW货-</p>
				</div>
				<div class="d7212"> 
					<a href="#" id="a2">亿览电波蓝牙音箱 晒单送充电宝</a>
				</div>
			</div>
			<div class="d725">
				<div class="d7211">
					<p id="L6">-<span id="font">白条</span>大牌免息-</p>
				</div>
				<div class="d7212"> 
					<a href="#" id="a2">三星Gear S2 腕表 现货！</a>
				</div>
			</div>
		</div>
		<div class="d73">
			<div class="d731">
				<div class="d7211">
					<p id="L6">-清仓-</p>
				</div>
				<div class="d7212"> 
					<a href="#" id="a2">耐克79元抢</a>
				</div>
			</div>
			<div class="d732">
				<div class="d7211">
					<p id="L6">-国际服饰-</p>
				</div>
				<div class="d7212"> 
					<a href="#" id="a2">大牌整点免单 全场低至5折</a>
				</div>
			</div>
			<div class="d733">
				<div id="d7331"></div>
				<div id="d7332"></div>
				<div id="d7333"></div>
				<div id="d7334"></div>
				<div id="d7335"></div>
				<div id="d7336"></div>
				<div id="d7337"></div>
				<div id="d7338"></div>
				<div id="d7339"></div>
				<div id="d73310"></div>
			</div>
			<div class="d734">
				<div class="d7211">
					<p id="L6">-<span id="font">低价</span>12道锋味-</p>
				</div>
				<div class="d7212"> 
					<a href="#" id="a2">京东超市满199减100</a>
				</div>
			</div>
			<div class="d735">
				<div class="d7211">
					<p id="L6">-<span id="font">预售</span>新品抢鲜-</p>
				</div>
				<div class="d7212"> 
					<a href="#" id="a2">三星蓝牙wifi手表 时尚设计旋转表带 智能新浪潮</a>
				</div>
				<div class="d7351">
					<ul>
						<li id="L8"><a href="#" id="a1">【手机】nubia Z9 mini 直降200</a>
						<li id="L8"><a href="#" id="a1">【家电】LG55英寸智能电视预约</a>
						<li id="L8"><a href="#" id="a1">【生鲜】金丝蜜柚 2个24.9</a>
						<li id="L8"><a href="#" id="a1">【试用】汪峰FIIL耳机免费试用</a>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<div class="d0"></div>
	<div class="d0"></div>
	<div class="d8">
		<div class="d81"></div>
		<div class="d82"></div>
		<div class="d83"></div>
	</div>
	<div class="d9">
		<div class="d91">
			<div class="d911">服装鞋包</div>
			<div class="d912">
		<!-- 	<a href="#" id="a1">大牌</a> -->
			&nbsp;&nbsp;<a href="#" id="a1">男装</a>&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;<a href="#" id="a1">女装</a>&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;<a href="#" id="a1">鞋靴</a>&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;<a href="#" id="a1">箱包</a>&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;<a href="#" id="a1">内衣配饰</a>&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;<a href="#" id="a1">珠宝首饰</a>&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;<a href="#" id="a1">奢品礼品</a>&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;<a href="#" id="a1">奢华腕表</a></div>
		</div>
		<div class="d92">
			<div class="d921">
				<div class="d9201"></div>
				<div class="d9202">
					<div class="d92021">
						<p id="Lp"><a href="#" id="a2">女装上新</a> <a href="#" id="a1">品质男鞋</a></p>
						<p id="Lp"><a href="#" id="a1">服装城 羊绒围巾</a></p>
						<p id="Lp"><a href="#" id="a1"">热卖女靴</a> <a href="#" id="a2">男装热卖</a></p>
						<p id="Lp"><a href="#" id="a1">舒适内衣 奢侈品</a></p>
					</div>
					<div class="d92022">
						<p id="Lp"><a href="#" id="a1">菩提手串</a> <a href="#" id="a2">水晶手链</a></p>
						<p id="Lp"><a href="#" id="a1">时尚女包 精品男包</a></p>
						<p id="Lp"><a href="#" id="a1">小叶紫檀</a> <a href="#" id="a2">奢品名表</a></p>
						<p id="Lp"><a href="#" id="a1">人气腕表 潮流名表</a></p>
					</div>
				</div>
			</div>
			<div class="d922"></div>
			<div class="d923"></div>
			<div class="d924"></div>
			<div class="d925"></div>
			<div class="d926"></div>
			<div class="d927"></div>
			<div class="d928"></div>
			<div class="d9212"></div>
			<div class="d929"></div>
			<div class="d9210"></div>
			<div class="d9211"></div>
		</div>
	</div>
	<div class="d0"></div>
	<div class="d10">
	<div class="d11">
		<div class="d101"></div>
		<div class="d102"></div>
		<div class="d103"></div>
		<div class="d104"></div>
		<div class="d105"></div>
		<div class="d106"></div>
		<div class="d107"></div>
		<div class="d108"></div>
		<div class="d109"></div>
		<div class="d1010"></div>
	</div>
	</div>
	<div class="d0"></div>
	<div class="d0"></div>
	</body>
	</html>
	