package com.jhta.delivery.mail;

import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;

public class SimpleMailSender {
private MailSender mailSender;
	
	public void setMailSender(MailSender mailSender) {
		this.mailSender = mailSender;
	}
	
	public boolean sendMial(String title, String msg, String toEmail, String fromEmail) {
		try {
			SimpleMailMessage mailMsg = new SimpleMailMessage();
			mailMsg.setSubject(title);
			mailMsg.setText(msg);
			mailMsg.setTo(toEmail);
			mailMsg.setFrom(fromEmail);
			mailSender.send(mailMsg);
			
			return true;
		}catch(Exception e) {
			e.printStackTrace();
			return false;
		}
	}
}
