package com.project.persistence;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.project.domain.LoginDTO;
import com.project.domain.UserVO;

@Repository
public class UserDAOImpl implements UserDAO {
	@Inject
	private SqlSession sql;
	
	private static String namespace="com.board.mapper.UserMapper";
	
	@Override
	public UserVO login(LoginDTO dto) throws Exception {
		return sql.selectOne(namespace+".login", dto);
	}

    @Override
    public void signup(UserVO uvo) throws Exception {
        sql.insert(namespace+".signup", uvo);
    }

    @Override
    public int idCheck(String user_id) {
        return sql.selectOne(namespace+".checkId",user_id);
    }
	
	
}
