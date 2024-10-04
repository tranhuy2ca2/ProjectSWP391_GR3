package ultis;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

import java.io.UnsupportedEncodingException;
import javax.mail.*;
import javax.mail.internet.*;
import java.util.Properties;



/**
 *
 *  
 */
public class EmailService {
    
    public static String getAlphaNumericString() {
        String AlphaNumericString = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
                + "0123456789"
                + "abcdefghijklmnopqrstuvxyz";
        StringBuilder sb = new StringBuilder(8);

        for (int i = 0; i < 8; i++) {
            int index
                    = (int) (AlphaNumericString.length()
                    * Math.random());
            sb.append(AlphaNumericString
                    .charAt(index));
        }
        return sb.toString();
    }

    public static int sendEmail(String to, String subject, String content) throws UnsupportedEncodingException {
        int result = 0;
        Properties properties = new Properties();
        properties.put("mail.smtp.auth", "true");
        properties.put("mail.smtp.starttls.enable", "true");
        properties.put("mail.smtp.host", "smtp.gmail.com");
        properties.put("mail.smtp.port", "587");
        properties.put("mail.smtp.ssl.protocols", "TLSv1.2");
        Session session = Session.getInstance(properties, new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication("kiennhhe163054@fpt.edu.vn","mojm wdpx vcmw sgkg");
                // đăng nhập gmail
            }
        });
        try {
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress("kiennhhe163054@fpt.edu.vn"));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to));
            message.setSubject(MimeUtility.encodeText(subject, "UTF-8", "B"));
            message.setContent(content, "text/html; charset=utf-8");
            // Send the email
            Transport.send(message);
            result = 1;
        } catch (MessagingException e) {
            e.printStackTrace();
        }
        return result; 
    }
}