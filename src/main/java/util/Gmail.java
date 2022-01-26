package util;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

//using library
public class Gmail extends Authenticator {

    @Override
    protected PasswordAuthentication getPasswordAuthentication() {
    	//실제 이메일주소와 실제 패스워드
        return new PasswordAuthentication("songmia23","real password");
    }
}
