package com;

import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message.RecipientType;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class Email {
	
	private String user;
	private String pass;
	private String smtp;
	private Properties props;
	private Session session;
	private Authenticator authenticator;
	
	public Email(String user,String pass)
	{
		this.setUser("sduxhxcwlb@163.com");
		this.setPass("xuanwang2013");
		authenticator = new MyAuthenticator(user,pass);
		props = new Properties();
	}
  
	public void connect()
	{
		smtp="smtp."+user.split("@")[1];
		props.put("mail.smtp.auth", "true");
	    props.put("mail.smtp.host", smtp);
		session=Session.getDefaultInstance(props, authenticator);
	}
	public void senEmail(String to,String sub,String content) throws AddressException, MessagingException 
	{
		MimeMessage message=new MimeMessage(session);
		message.setRecipients(RecipientType.TO, to);
		message.setSubject(sub);
		message.setContent(content,"text/html;charset=utf-8");
		message.setFrom(new InternetAddress(user));
		Transport.send(message);
	}

	public String getUser() {
		return user;
	}

	public void setUser(String user) {
		this.user = user;
	}

	public String getPass() {
		return pass;
	}

	public void setPass(String pass) {
		this.pass = pass;
	}
	
}

class MyAuthenticator extends Authenticator
{
	private String user;
	private String pass;
	
	public MyAuthenticator(String user,String pass)
	{
		this.user=user;
		this.pass=pass;
	}
	
	@Override
	public PasswordAuthentication getPasswordAuthentication()
	{
		return new PasswordAuthentication(user,pass);
	}
	
}