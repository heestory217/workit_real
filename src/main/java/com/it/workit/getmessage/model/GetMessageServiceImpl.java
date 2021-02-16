package com.it.workit.getmessage.model;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;

import com.it.workit.message.model.MessageVO;

@Service
public class GetMessageServiceImpl implements GetMessageService{

	@Autowired private GetMessageDAO getMessageDao;

	@Override
	public int insertGetMessage(GetMessageVO gVo) {
		return getMessageDao.insertGetMessage(gVo);
	}

	@Override
	public int updateReadCount(int messageNo) {
		return getMessageDao.updateReadCount(messageNo);
	}

	//중요플래그 업데이트 => 받은메세지 중 보관하고 싶은 쪽지 (개별)
	@Override
	public int updategetMsgImpflag(int messageNo) {
		return getMessageDao.updategetMsgImpflag(messageNo);
	}
	
	//중요플래그 업데이트 => 받은메세지 중 보관하고 싶은 쪽지 (다중)
	@Override
	@Transactional
	public int updategetMsgImpflagMulti(List<GetMessageVO> getMsgList) {
		int cnt=0;
		try {
			for(GetMessageVO vo : getMsgList) {
				int messageNo = vo.getMessageNo();
				if(messageNo!=0) {	//체크된것만 
					cnt=getMessageDao.updategetMsgImpflag(messageNo);	//보관
				}
			}//commit
		} catch (RuntimeException e) {	
			e.printStackTrace();
			cnt=-1;	
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
		}
		return cnt;
	}
	
	//보관함 조회
	@Override
	public List<Map<String, Object>> selectImpMessage(int userNo) {
		return getMessageDao.selectImpMessage(userNo);
	}
	
	//받은 메세지 삭제 (플래그 업데이트) - 개별
	@Override
	public int updategetMsgDelflag(int getMessageNo) {
		return getMessageDao.updategetMsgDelflag(getMessageNo);
	}
	
	//받은 메세지 삭제 (플래그 업데이트) - 다중
	@Override
	@Transactional
	public int updategetMsgDelflag(List<GetMessageVO> getMsgList) {
		int cnt=0;
		try {
			for(GetMessageVO vo : getMsgList) {
				int messageNo = vo.getMessageNo();
				if(messageNo!=0) {	//체크된것만 
					cnt=getMessageDao.updategetMsgDelflag(messageNo);	//삭제
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
