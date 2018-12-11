package com.stevlu.common;

import freemarker.core.ParseException;
import freemarker.template.*;

import javax.activation.DataHandler;
import javax.activation.DataSource;
import javax.activation.FileDataSource;
import javax.mail.*;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;

import com.stevlu.bean.Ticket;

import java.io.IOException;
import java.io.StringWriter;
import java.util.Properties;

/**
 * Created by Steven Lu on 2018/11/21.
 */
public class EmailRunnable implements Runnable {

	private Ticket ticket;

	public EmailRunnable(Ticket ticket) {
		this.ticket = ticket;
	}

	@Override
	public void run() {
		try {
			Properties properties = new Properties();
/*			properties.setProperty("mail.host", "smtp.partner.outlook.cn");
			properties.setProperty("mail.transport.protocol", "smtp");
			properties.setProperty("mail.smtp.auth", "true");
			properties.setProperty("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
			properties.setProperty("mail.smtp.port", "587");
			properties.put("mail.smtp.starttls.enable", "true");*/
            properties.setProperty("mail.host", "smtp.qq.com");
            properties.setProperty("mail.transport.protocol", "smtp");
            properties.setProperty("mail.smtp.auth", "true");
            properties.setProperty("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
            properties.setProperty("mail.smtp.port", "465");
			Session session = Session.getDefaultInstance(properties);
			session.setDebug(true);
			Transport transport = session.getTransport();
			/*transport.connect("Luke.Lu@ithelpdesk.cn", "Abc,123.");*/
			transport.connect("smtp.qq.com", "stevlu@qq.com", "eaifqnvgsszvbbha");
			MimeMessage mimeMessage = new MimeMessage(session);
			mimeMessage.addRecipients(Message.RecipientType.TO, ticket.getGemail());
			/*mimeMessage.setFrom("Luke.Lu@ithelpdesk.cn");*/
			mimeMessage.setFrom("stevlu@qq.com");
			mimeMessage.setSubject((ticket.getLogId()).concat("已派单至系统"));
			MimeMultipart mixed = new MimeMultipart("mixed");
			mimeMessage.setContent(mixed);
			MimeBodyPart content = new MimeBodyPart();
			mixed.addBodyPart(content);
			MimeMultipart bodyMimeMultipart = new MimeMultipart("related");
			content.setContent(bodyMimeMultipart);
			MimeBodyPart bodyPart = new MimeBodyPart();
			// freemarker加载图片
			MimeBodyPart image = new MimeBodyPart();
			//DataHandler dh = new DataHandler(new FileDataSource("src\\main\\resources\\ftl\\top.jpg"));
			DataHandler dh = new DataHandler(new FileDataSource("C:\\top.jpg"));
			image.setDataHandler(dh);
			image.setContentID("mailTopJpg");
			// freemarker加载文本
			Configuration cfg = new Configuration(Configuration.VERSION_2_3_25);
			//cfg.setClassLoaderForTemplateLoading(ClassLoader.getSystemClassLoader(), "ftl");
		    cfg.setClassLoaderForTemplateLoading(getClass().getClassLoader(), "ftl");
		    cfg.setDefaultEncoding("UTF-8");
			Template emailTemplate = cfg.getTemplate("email.ftl");
			StringWriter out = new StringWriter();
			emailTemplate.process(ticket, out);
			bodyPart.setContent(out.toString(), "text/html;charset=utf-8");
			bodyMimeMultipart.addBodyPart(bodyPart);
			bodyMimeMultipart.addBodyPart(image);
			mimeMessage.saveChanges();
			transport.sendMessage(mimeMessage, mimeMessage.getAllRecipients());
			transport.close();
		} catch (NoSuchProviderException e) {
			e.printStackTrace();
		} catch (MessagingException e) {
			e.printStackTrace();
		} catch (MalformedTemplateNameException e) {
			e.printStackTrace();
		} catch (ParseException e) {
			e.printStackTrace();
		} catch (TemplateNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} catch (TemplateException e) {
			e.printStackTrace();
		}
	}
}
