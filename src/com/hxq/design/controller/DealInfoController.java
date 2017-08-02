package com.hxq.design.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.hxq.design.service.impl.DealInfoServImpl;

@Controller
public class DealInfoController {
	@Autowired
	private DealInfoServImpl dealInfoServImpl;

}
