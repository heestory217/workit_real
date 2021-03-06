package com.it.workit.qna.model;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.it.workit.common.SearchVO;

@Repository
public class QnaDAOMybatis implements QnaDAO{

	@Autowired SqlSessionTemplate sqlSession;
	
	private String namespace="config.mybatis.mapper.oracle.qna.";

	@Override
	public List<QnaVO> qaseletAll(SearchVO searchVo) {
		List<QnaVO> list =sqlSession.selectList(namespace+"qaseletAll",searchVo);
		return list;
	}

	@Override
	public int qaTotalRecord(SearchVO searchVo) {
		return sqlSession.selectOne(namespace+"qaTotalRecord",searchVo);
	}

	@Override
	public int qaInsert(QnaVO qaVo) {
		return sqlSession.insert(namespace+"qaInsert", qaVo);
	}

	@Override
	public int qaViewCount(int qaNo) {
		return sqlSession.update(namespace+"qaViewCount",qaNo);
	}

	@Override
	public QnaUsersVO qaSelectByNo(int qaNo) {
		return sqlSession.selectOne(namespace+"qaSelectByNo",qaNo);
	}

	@Override
	public int qaDelete(Map<String, String> map) {
		return sqlSession.delete(namespace+"qaDelete",map);
	}

	@Override
	public int qaUpdate(QnaUsersVO qauVo) {
		return sqlSession.update(namespace+"qaUpdate",qauVo);
	}

	@Override
	public String chkPassword(int qaNo) {
		return sqlSession.selectOne(namespace+"chkPassword",qaNo);
	}

	@Override
	public int updateSortno(QnaUsersVO qauVo) {
		return sqlSession.update(namespace+"updateSortno",qauVo);
	}

	@Override
	public int insertReply(QnaUsersVO qauVo) {
		return sqlSession.insert(namespace+"insertReply", qauVo);
	}

	
	
}
