package com.practise.bean;

public class Captcha {

	private String value;

	public String getValue() {
		return value;
	}

	public void setValue(String value) {
		this.value = value;
	}

	@Override
	public String toString() {
		return "Captcha [value=" + value + "]";
	}
	
}
