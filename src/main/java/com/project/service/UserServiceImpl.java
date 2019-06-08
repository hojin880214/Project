package com.project.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.project.domain.LoginDTO;
import com.project.domain.UserVO;
import com.project.persistence.UserDAO;

@Service
public class UserServiceImpl implements UserService {

	@Inject
	UserDAO udao;
	
	@Override
	public UserVO login(LoginDTO dto) throws Exception {
		return udao.login(dto);
	}

    @Override
    public void signup(UserVO uvo) throws Exception {
        udao.signup(uvo);
    }

    @Override
    public int idCheck(String user_id) throws Exception {
        return udao.idCheck(user_id);
    }
}
