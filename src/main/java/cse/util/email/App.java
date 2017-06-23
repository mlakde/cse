package cse.util.email;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.security.InvalidAlgorithmParameterException;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.security.spec.InvalidKeySpecException;
import javax.crypto.BadPaddingException;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.NoSuchPaddingException;

public class App 
{
	public static void testTokenCryp(){
        ///////////////////////////////////////////
        String token="90a1483a4d";
        String encToken;
		try {
			encToken = TokenCryptUtil.encrypt(TokenCryptUtil.key, token);
	        System.out.println("Original token: "+token);
	        System.out.println("Encrypted token: "+encToken);
	        String decryToken;
			//decryToken = TokenCryptUtil.decrypt(TokenCryptUtil.key, encToken);
	       // System.out.println("Original token after decryption: "+decryToken);
		} catch (InvalidKeyException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (NoSuchAlgorithmException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (InvalidKeySpecException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (NoSuchPaddingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (InvalidAlgorithmParameterException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IllegalBlockSizeException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (BadPaddingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	}
	
    public static void main( String[] args )
    {
    	
    	ApplicationContext context =
             new ClassPathXmlApplicationContext("Spring-Mail.xml");
    	MailUtil mm = (MailUtil) context.getBean("mailUtil");   
    	
    	try {
    		//Case1
    		JavaMailSenderImpl sender = (JavaMailSenderImpl) context.getBean("mailSenderToken");
//    	    sender.setUsername(username); // if send from email account is different from XML, provide password also, then uncomment these 3 lines
//    		sender.setPassword(password);
    		mm.setMailSender(sender);
    		mm.sendTokenNotification(sender.getUsername(), "zhangliangqin015@gmail.com", "Token generated", "Sam", "White","Birdi","1234","token");
    		
    		
    		//Case2
    		JavaMailSenderImpl sender2 = (JavaMailSenderImpl) context.getBean("mailSenderNotf");
//    	    sender2.setUsername(username); // if send from email account which is different from XML, provide password also
//    		sender2.setPassword(password);
    		mm.setMailSender(sender2);
    		mm.sendNotification(sender2.getUsername(),"zhangliangqin015@gmail.com", "New form submitted", "Nadine", "Janet", "Zhang");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("The recipient is not right!");
		}
        System.out.println("Sending email done!");
    	
     //   App.testTokenCryp();

		

    }
   
    
}
