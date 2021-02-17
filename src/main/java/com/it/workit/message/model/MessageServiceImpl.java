package com.it.workit.message.model;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;

import com.it.workit.getmessage.model.GetMessageDAO;
import com.it.workit.getmessage.model.GetMessageVO;
import com.it.workit.getposition.model.GetPositionsuggestVO;
import com.it.workit.position.model.PositionsuggestVO;

@Service
public class MessageServiceImpl implements MessageService{
	
	@Autowired private MessageDAO messageDao;
	@Autowired private GetMessageDAO getMessageDao;

	@Override
	@Transactional
	public int insertMessage(MessageVO vo, int getUserNo) {
		int cnt = messageDao.insertMessage(vo);
		
		//시퀀스 번호 얻기위해 조회
		vo = messageDao.selectMsgJustNow(vo.getUserNo());
		
		//보내면 받는 사람도 insert
		GetMessageVO gVo =  new GetMessageVO();
		gVo.setUserNo(getUserNo);
		gVo.setMessageNo(vo.getMessageNo());
		cnt = getMessageDao.insertGetMessage(gVo);
		
		return cnt;
	}

	@Override
	public List<Map<String, Object>> selectSentMessage(int userNo) {
		return messageDao.selectSentMessage(userNo);
	}
	
	@Override
	public List<Map<String, Object>> selectSentMyself(int userNo) {
		return messageDao.selectSentMyself(userNo);
	}

	@Override
	public List<Map<String, Object>> selectGetMessage(int userNo) {
		return messageDao.selectGetMessage(userNo);
	}
	
	@Override
	public Map<String, Object> selectByMessageNo(int messageNo) {
		return messageDao.selectByMessageNo(messageNo);
	}
	
	//보낸 메세지 삭제 (플래그 업데이트) - 개별
	@Override
	public int updateMsgDelflag(int messageNo) {
		return messageDao.updateMsgDelflag(messageNo);
	}
	
	//보낸 메세지 삭제 (플래그 업데이트) - 다중
	@Override
	@Transactional
	public int updateMsgDelflagMulti(List<MessageVO> msgList) {
		int cnt=0;
		try {
			for(MessageVO vo : msgList) {
				int messageNo = vo.getMessageNo();
				if(messageNo!=0) {	//체크된것만 
					cnt=messageDao.updateMsgDelflag(messageNo);	//삭제
				}
			}//commit
		} catch (RuntimeException e) {	
			e.printStackTrace();
			cnt=-1;	
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
		}
		return cnt;
	}

}
