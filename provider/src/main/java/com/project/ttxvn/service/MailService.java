package com.project.ttxvn.service;


import com.project.ttxvn.constant.Common;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import java.io.IOException;
import java.util.Date;
import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 * Created by luhonghai on 5/8/15.
 */
public class MailService {

    public  interface MessageListener {
        void onMessage(String message);

        void onError(String error);
    }

    private static final Logger logger = Logger.getLogger(MailService.class.getName());

    private MessageListener messageListener;

    private void log(String message) {
        log(Level.INFO, message, null);
    }

    private void log(Level level, String message) {
        log(level, message, null);
    }

    private void log(Level level, String message, Throwable ex) {
        if (messageListener != null) {
            if (ex != null || level != Level.INFO) {
                if (ex != null) {
                    messageListener.onError(message + ". Message: " + ex.getMessage());
                } else {
                    messageListener.onError(message );
                }

            } else {
                messageListener.onMessage(message);
            }
        }
        if (ex != null) {
            logger.log(level, message, ex);
        } else {
            logger.log(level, message);
        }
    }

    public void sendEmail(String[] recipients, String subject, String message) throws MessagingException {
        sendEmail(recipients, subject, message, null);
    }

    public void sendEmail(String[] recipients, String subject, String message, String[] attachFiles)
            throws MessagingException {
        // SMTP info
        String host = "smtp.gmail.com";
        String port = "465";
        // sets SMTP server properties
        Properties properties = new Properties();
        properties.put("mail.smtp.host", host);
        properties.put("mail.smtp.port", port);
        properties.put("mail.smtp.auth", "true");
        properties.put("mail.smtp.starttls.enable", "true");
        properties.put("mail.smtp.socketFactory.class",
                "javax.net.ssl.SSLSocketFactory");
        properties.put("mail.user", Common.EMAIL_SENDER);
        properties.put("mail.password", Common.EMAIL_SENDER_PASSWORD);

        // creates a new session with an authenticator
        Authenticator auth = new Authenticator() {
            public PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(
                        Common.EMAIL_SENDER,
                        Common.EMAIL_SENDER_PASSWORD);
            }
        };

        Session session = Session.getInstance(properties, auth);

        // creates a new e-mail message
        Message msg = new MimeMessage(session);

        msg.setFrom(new InternetAddress(Common.EMAIL_SENDER));
        for (String recipient : recipients) {
            recipient = recipient.trim();
            if (recipient.length() > 0) {
                msg.addRecipient(Message.RecipientType.TO, new InternetAddress(
                        recipient));
            }
        }
        msg.setSubject(subject);
        msg.setSentDate(new Date());
        // creates message part
        MimeBodyPart messageBodyPart = new MimeBodyPart();
        messageBodyPart.setContent(message, "text/html");

        // creates multi-part
        Multipart multipart = new MimeMultipart();
        multipart.addBodyPart(messageBodyPart);

        if (attachFiles != null && attachFiles.length > 0) {
            for (String attachFile : attachFiles) {
                // adds attachments
                MimeBodyPart attachPart = new MimeBodyPart();
                try {

                    attachPart.attachFile(attachFile);

                } catch (IOException ex) {
                    ex.printStackTrace();
                }
                multipart.addBodyPart(attachPart);
            }
        }
        // sets the multi-part as e-mail's content
        msg.setContent(multipart);
        // sends the e-mail
        Transport.send(msg, msg.getAllRecipients());
        log(Level.ALL, "done");
    }

    public void setMessageListener(MessageListener messageListener) {
        this.messageListener = messageListener;
    }
}
