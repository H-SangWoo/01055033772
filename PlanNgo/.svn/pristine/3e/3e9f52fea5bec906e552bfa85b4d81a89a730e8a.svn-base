package org.planngo.mapper;

import java.util.Date;

import org.apache.ibatis.annotations.Param;
import org.planngo.domain.UsrVO;
import org.planngo.dto.LoginDTO;

public interface UserMapper {
	
	public UsrVO login(LoginDTO dto) throws Exception; 
	
	public void keepLogin(@Param("USRID") String USRID, @Param("sessionId")String sessionId,  @Param("next")Date next) throws Exception;
	
	public UsrVO checkUserWithSessionKey(String value) throws Exception;
	
	public void register(UsrVO usrVO) throws Exception;
	

	public int idChk(String USRID) throws Exception;

	//public int idChk(UsrVO usrVO) throws Exception;


	public void delete(UsrVO usrVO) throws Exception;
	
	public void update(UsrVO usrVO) throws Exception;
	
	public void findPw(UsrVO usrVO) throws Exception;
	
	public UsrVO readUser(String USRID) throws Exception;
	
}
