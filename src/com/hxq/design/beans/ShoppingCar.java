package com.hxq.design.beans;

public class ShoppingCar {
	private int goodsId;
	private float goodsPrice;
	private int shopNumber;
	private float shopMoney;
	private String goodsName;
	private String userName;
	public String getGoodsName() {
		return goodsName;
	}
	public void setGoodsName(String goodsName) {
		this.goodsName = goodsName;
	}
	public int getGoodsId() {
		return goodsId;
	}
	public void setGoodsId(int goodsId) {
		this.goodsId = goodsId;
	}
	public float getGoodsPrice() {
		return goodsPrice;
	}
	public void setGoodsPrice(float goodsPrice) {
		this.goodsPrice = goodsPrice;
	}
	public int getShopNumber() {
		return shopNumber;
	}
	public void setShopNumber(int shopNumber) {
		this.shopNumber = shopNumber;
	}
	
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public float getShopMoney() {
		return shopMoney;
	}
	public void setShopMoney(float shopMoney) {
		this.shopMoney = shopMoney;
	}
}
