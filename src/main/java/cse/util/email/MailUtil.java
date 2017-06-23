package cse.util.email;

import java.util.HashMap;
import java.util.Map;

import javax.mail.internet.MimeMessage;
import org.apache.velocity.app.VelocityEngine;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.ui.velocity.VelocityEngineUtils; 
import org.springframework.mail.javamail.JavaMailSenderImpl;

/**
 * Send email notification 
 * @author Liangqin
 *
 */
public class MailUtil
{
	private VelocityEngine velocityEngine;
	private JavaMailSenderImpl mailSender;

	public void setMailSender(JavaMailSenderImpl mailSender) {
		this.mailSender = mailSender;
	}

	public void setVelocityEngine(VelocityEngine velocityEngine){
		this.velocityEngine = velocityEngine;
	}
	public void setFromEmail(){
		
	}

	/**
	 * Email  token URL to applicant
	 * @param to
	 * @param subject
	 * @param firstName
	 * @param lastName
	 * @param company
	 * @param ssn4
	 * @param token
	 * @throws Exception
	 */
	public void sendTokenNotification(
								final String from,
								final String to,
								final String subject,
								final String firstName,
								final String lastName,
								final String company,
								final String ssn4,
								final String token)throws Exception {
		  MimeMessagePreparator preparator = new MimeMessagePreparator() {
		        @SuppressWarnings({ "unchecked" })
		        public void prepare(MimeMessage mimeMessage) throws Exception {
		             MimeMessageHelper mimeMessageHelper = new MimeMessageHelper(mimeMessage);
		             mailSender.setUsername(from);
		             mimeMessageHelper.setTo(to);
		             mimeMessageHelper.setSubject(subject);
		             	
		             //Send attributes into VM template
		             Map model = new HashMap();
		     		 model.put("applicantFirstName", firstName); 
		     		 model.put("applicantLastName", lastName);
	     			 model.put("company", company); 
		     		 model.put("ssn", ssn4); 
		     		 model.put("email", to);  
	     			 String enc=TokenCryptUtil.encrypt(TokenCryptUtil.key, token);
	     			 model.put("link", "http://localhost:8080/cse/forms/form/"+enc);
		             String content = VelocityEngineUtils.mergeTemplateIntoString(velocityEngine,"token.vm","UTF-8",model);
		             mimeMessageHelper.setText(content, true);
		          }
		   };
		   mailSender.send(preparator);     
		 
		}


	/**
	 *  Email authorized signer notification of the completed form
	 * @param to
	 * @param subject
	 * @param authorizedSigner
	 * @param firstName
	 * @param lastName
	 * @throws Exception
	 */
	public void sendNotification( 
								final String from,
								final String to,
								final String subject,
								final String authorizedSigner,
								final String firstName,
								final String lastName )throws Exception {
		  MimeMessagePreparator preparator = new MimeMessagePreparator() {
		        @SuppressWarnings({ "unchecked" })
		        public void prepare(MimeMessage mimeMessage) throws Exception {
		             MimeMessageHelper mimeMessageHelper = new MimeMessageHelper(mimeMessage);
		             mailSender.setUsername(from);
		             mimeMessageHelper.setTo(to);
		             mimeMessageHelper.setSubject(subject);
    
		             //Send attributes into VM template
		             Map model = new HashMap();
		     		 model.put("signerName", authorizedSigner); 
		     		 model.put("applicantFirstName", firstName); 
		     		 model.put("applicantLastName", lastName); 
		             String content = VelocityEngineUtils.mergeTemplateIntoString(velocityEngine,"formSubmitNotification.vm","UTF-8",model);
		             mimeMessageHelper.setText(content, true);
		          }
		   };
		   mailSender.send(preparator);         
		}
}