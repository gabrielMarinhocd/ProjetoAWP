package modelo;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.util.Properties;

public class SendEmail {
    Config c = new Config();
    private String texto;
    
    public String getTexto() {
        return texto;
    }

    public void setTexto(String texto) {
        this.texto = texto;
    }
    
    public String sendEmailTLS(String recipient,String titulo){
        Properties prop = new Properties();
	prop.put("mail.smtp.host", c.getHost());
        prop.put("mail.smtp.port", c.getPort());
        prop.put("mail.smtp.auth", c.getAuth());
        prop.put("mail.smtp.starttls.enable", "true"); //TLS

        Session session = Session.getInstance(prop,
                new javax.mail.Authenticator() {
                    @Override
                    protected PasswordAuthentication getPasswordAuthentication() {
                        return new PasswordAuthentication(c.getUsername(), c.getPassword());
                    }
                });
        try {
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(c.getEmail()));
            message.setRecipients(Message.RecipientType.TO,InternetAddress.parse(recipient));
            message.setSubject(titulo);
            message.setContent(getTexto(), "text/html; charset=utf-8");
            Transport.send(message);
        } catch (MessagingException e) {
            
        }
        return "ok";
    }
}
