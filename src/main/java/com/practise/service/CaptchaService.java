package com.practise.service;
import org.springframework.stereotype.Service;

@Service
public class CaptchaService {


		
		public  String generateCaptcha() {
			String sample ="abcdefghijklmnopqrstuvwxyz1234567890@#$&ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890@#$&";
			String captcha ="";
			   for(int i=0;i<6;i++) {
				   int rand = (int)(Math.random() * 70);
				   char chr = sample.charAt(rand);
				   captcha  = captcha+chr;
			   }
			return captcha;
		}
		
		
}
