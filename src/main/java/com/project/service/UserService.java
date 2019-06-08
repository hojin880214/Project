package com.project.service;

import com.project.domain.LoginDTO;
import com.project.domain.UserVO;

public interface UserService {
	public UserVO login(LoginDTO dto) throws Exception;
	public void signup(UserVO uvo) throws Exception;
	public int idCheck(String user_id) throws Exception;
}
