package com.it.workit.faq.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.it.workit.common.SearchVO;

@Repository
public class FaqDAOMybatis implements FaqDAO{

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private String namespace = "config.mybatis.mapper.oracle.faq.";
	
	@Override
	public List<FaqVO> faqselectAll() {
		List<FaqVO> list = sqlSession.selectList(namespace+"faqselectAll");
		return list;
	}

	@Override
	public int faqinsert(FaqVO faqVo) {
		return sqlSession.insert(namespace+"faqinsert",faqVo);
	}

	@Override
	public FaqVO faqselectByNo(int no) {
		return sqlSession.selectOne(namespace+"faqselectByNo", no);
	}

	@Override
	public int faqupdate(FaqVO faqVo) {
		return sqlSession.update(namespace+"faqupdate",faqVo);
	}

	@Override
	public int faqdelete(int faqNo) {
		return sqlSession.delete(namespace+"faqdelete", faqNo);
	}

	@Override
	public List<FaqVO> selectAllMng(SearchVO serchVo) {
		return sqlSession.selectList(namespace+"selectAllMng",serchVo);
	}

	@Override
	public int totalfa(SearchVO serchVo) {
		return sqlSession.selectOne(namespace+"totalfa",serchVo);
	}

}
