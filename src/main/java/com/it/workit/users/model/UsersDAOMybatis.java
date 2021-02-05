package com.it.workit.users.model;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.it.workit.common.SearchVO;

@Repository
public class UsersDAOMybatis implements UsersDAO {
	@Autowired
	private SqlSessionTemplate sqlSession;

	private String namespace="config.mybatis.mapper.oracle.users.";

	//아이디 중복체크
	public int checkDup(String userid) {
		int count = sqlSession.selectOne(namespace+"dupCheck", userid);
		return count;
	}

	//개인 회원가입
	@Override
	public int insertUsers(UsersVO vo) {
		int cnt=sqlSession.insert(namespace+"insertUsers", vo);
		return cnt;
	}

	//동현 로그인 체크
	@Override
	public String loginCheck(String userid, String password) {
		String pass = sqlSession.selectOne(namespace+"loginCheck", userid);

		return pass;
	}
	
	@Override
	public int userkindcheck(String userid) {
		return sqlSession.selectOne(namespace+"userkindcheck", userid);
	}

	//회원번호로 조회
	@Override
	public UsersVO selectByUserNo(int userNo) {
		return sqlSession.selectOne(namespace+"selectByUserNo", userNo);
	}

	//회원아이디로 조회
	@Override
	public UsersVO selectByUserId(String userId) {
		return sqlSession.selectOne(namespace+"selectByUserId", userId);
	}

	//회원 수정
	@Override
	public int updateUsers(UsersVO vo) {
		return sqlSession.update(namespace+"updateUsers", vo);
	}

	//[수하] 기업 등록시 기업 회원으로 변경
	@Override
	public int updateUserCorpCheck(int userNo) {
		return sqlSession.update(namespace+"updateUserCorpCheck", userNo);
	}

	@Override
	public String findId(Map<String, Object> eMailMap) {
		return sqlSession.selectOne(namespace+"findId", eMailMap);
	}
	//비밀번호 찾기
	@Override
	public int findPwd(Map<String, Object> findPwdMap) {
		return sqlSession.selectOne(namespace+"findPwd", findPwdMap);
	}
	//임시 비밀번호 업데이트
	@Override
	public int updatePwd(Map<String, Object> tempUser) {
		return sqlSession.update(namespace+"updatePwd", tempUser);
	}

	//비밀번호 재설정시 조회하는 userSelect
	@Override
	public int selectUser(Map<String, Object> userMap) {
		return sqlSession.selectOne(namespace+"selectUser", userMap);
	}
	//비밀번호 재설정시 비밀번호 업데이트
	@Override
	public int updatePwdReal(Map<String, Object> userMap) {
		return sqlSession.update(namespace+"updatePwdReal", userMap);
	}

	@Override
	public List<UsersVO> selectIndivUsersAll(SearchVO searchVo) {
		return sqlSession.selectList(namespace+"selectIndivUsersAll",searchVo);
	}

	@Override
	public int totalUsers() {
		return sqlSession.selectOne(namespace+"totalUsers");
	}


}
