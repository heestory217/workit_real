package com.it.workit.commentRespond.model;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.it.workit.question.model.QstnPagingVO;

@Service
public class CommentRespondServiceImpl implements CommentRespondService{
	@Autowired private CommentRespondDAO comntRespondDao;

	//답변 등록
	@Override
	public int insertComnt(CommentRespondVO vo) {
		return comntRespondDao.insertComnt(vo);
	}
	
	//답변 조회
	@Override
	public List<Map<String, Object>> selectAllComnt(QstnPagingVO vo) {
		return comntRespondDao.selectAllComnt(vo);
	}
	
	//답변 개수
	@Override
	public int getTotalCmt(QstnPagingVO vo) {
		return comntRespondDao.getTotalCmt(vo);
	}

	//답변 삭제
	@Override
	public int deleteCmt(int cmtNo) {
		return comntRespondDao.deleteCmt(cmtNo);
	}
	
	//회원 답변 조회
	@Override
	public List<Map<String, Object>> userCmntSelect(QstnPagingVO vo) {
		return comntRespondDao.userCmntSelect(vo);
	}

	@Override
	public int getTotalUserCmt(QstnPagingVO vo) {
		return comntRespondDao.getTotalUserCmt(vo);
	}
	
	//답변 좋아오
	@Override
	public int updateLike(int cmtNo) {
		return comntRespondDao.updateLike(cmtNo);
		
	}
	
	//답변 좋아요 개수
	@Override
	public int selectLikeNum(int cmtNo) {
		return comntRespondDao.selectLikeNum(cmtNo);
	}
}
