package com.project.persistence;

import com.project.domain.LoginDTO;
import com.project.domain.UserVO;

public interface UserDAO {
	public UserVO login(LoginDTO dto) throws Exception; 
	public void signup(UserVO uvo) throws Exception;
    public int idCheck(String user_id);
}
