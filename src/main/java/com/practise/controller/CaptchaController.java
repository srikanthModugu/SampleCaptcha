package com.practise.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.practise.bean.Captcha;
import com.practise.bean.GenericResponse;
import com.practise.bean.GenericResponse;
import com.practise.service.CaptchaService;

@Controller
public class CaptchaController {

	@Autowired
	private CaptchaService captchaService;
	private static String captcha;
	
	@RequestMapping(value = "/",method = RequestMethod.GET)
	public String  getView(ModelMap model) {
	
		captcha = captchaService.generateCaptcha();
		model.addAttribute("captcha", captcha);
		return "captcha";
	}


	@RequestMapping(value = { "/validate" }, method = RequestMethod.POST)
	public @ResponseBody String validateCaptcha(@RequestBody Captcha captchaObj) {
		GenericResponse genericResponse  = new GenericResponse();
		Gson gson = new GsonBuilder().serializeNulls().create();
		if(captcha.equals(captchaObj.getValue())) {
			genericResponse.setSuccess(true);
			genericResponse.setStatusCode(200);
			genericResponse.setMessage("Success");
		} else {
			genericResponse.setMessage("Failed");
			genericResponse.setStatusCode(500);
			genericResponse.setSuccess(false);
		}
		
		String response = gson.toJson(genericResponse);
		return response;
	}
}
