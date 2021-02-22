package org.planngo.domain;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


@Data
@NoArgsConstructor
@AllArgsConstructor
public class UsrVO {
	private Integer USRCODE;
	private String USRID;
	private String USRNICKNAME;
	private String USREMAIL;
	private String USRPASSWORD;
	private String USRNAME;
	private String USRDOB;
	private String USRGENDER;
	
	@Override
	public String toString() {
		return "UserVO [USRCODE=" + USRCODE +
					   ", USRID=" + USRID +
					   ", USRNICKNAME=" + USRNICKNAME +
					   ", USREMAIL=" + USREMAIL +
					   ", USRPASSWORD=" + USRPASSWORD +
					   ", USRNAME=" + USRNAME + 
					   ", USRDOB=" + USRDOB +
					   ", USRGENDER=" + USRGENDER + "]";
	}
}
 