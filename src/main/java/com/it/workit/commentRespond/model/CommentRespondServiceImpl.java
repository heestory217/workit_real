package com.it.workit.commentRespond.model;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.it.workit.getmessage.model.GetMessageVO;
import com.it.workit.message.model.MessageVO;
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
	
	//답변 조회
	@Override
	public Map<String, Object> selectCommentAbout(int commentNo) {
		return comntRespondDao.selectCommentAbout(commentNo);
	}
	
	//답변 글 수정
	@Override
	public int updateComment(CommentRespondVO vo) {
		return comntRespondDao.updateComment(vo);
	}
	
	//답변 채택 메세지 보내기
	@Override
	public int sendAdoptMsg(MessageVO vo) {
		return comntRespondDao.sendAdoptMsg(vo);
	}
	
	//답변 글쓴이 조회
	@Override
	public int selectAnswerer(int commentsNo) {
		return comntRespondDao.selectAnswerer(commentsNo);
	}
	
	//답변 채택 메세지 받기
	@Override
	public int getAdoptMsg(GetMessageVO vo) {
		return comntRespondDao.getAdoptMsg(vo);
	}
	
	//답변 채택
	@Override
	public int updateCommentLike(int commentsNo) {
		return comntRespondDao.updateCommentLike(commentsNo);
	}

	@Override
	public int getTotalAdoptComnt(int userNo) {
		return comntRespondDao.getTotalAdoptComnt(userNo);
	}
}
