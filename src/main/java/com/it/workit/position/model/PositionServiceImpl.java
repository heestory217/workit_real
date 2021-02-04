package com.it.workit.position.model;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;

import com.it.workit.getposition.model.GetPositionDAO;
import com.it.workit.getposition.model.GetPositionsuggestVO;
import com.it.workit.hrm.controller.HrmController;
import com.it.workit.indivMypage.model.IndivpagingVO;
import com.it.workit.message.model.MessageVO;

@Service
public class PositionServiceImpl implements PositionService {
	private static final Logger logger = LoggerFactory.getLogger(PositionServiceImpl.class);
	
	@Autowired private PositionDAO positionDao;
	@Autowired private GetPositionDAO getPositionDao;

	@Override
	public List<PositionsuggestVO> selectPositionFlag2ByUserno(IndivpagingVO vo) {
		return positionDao.selectPositionFlag2ByUserno(vo);
	}

	@Override
	public int positionGetTotalRecord(IndivpagingVO vo) {
		return positionDao.positionGetTotalRecord(vo);
	}
	
	@Override
	@Transactional
	public int insertPositionSuggest(PositionsuggestVO vo, int getUserNo) {
		int cnt = positionDao.insertPositionSuggest(vo);
		
		//시퀀스 번호 얻기위해 조회
		vo = positionDao.selectPositionJustNow(vo.getUserNo());
		
		//제안 보내면 받는 사람도 insert
		GetPositionsuggestVO gVo = new GetPositionsuggestVO();
		gVo.setUserNo(getUserNo);
		gVo.setPositionsuggestNo(vo.getPositionsuggestNo());
		cnt = getPositionDao.insertGetPositionSuggest(gVo);
		
		return cnt;
	}

	@Override
	public List<Map<String, Object>> selectPositionSuggest(int userNo) {
		return positionDao.selectPositionSuggest(userNo);
	}
	
	@Override
	public List<Map<String, Object>> selectPositionForm(int userNo) {
		return positionDao.selectPositionForm(userNo);
	}

	@Override
	public Map<String, Object> selectByPositionNo(int positionsuggestNo) {
		return positionDao.selectByPositionNo(positionsuggestNo);
	}

	@Override
	public int deletePSG(int positionsuggestNo) {
		return positionDao.deletePSG(positionsuggestNo);
	}
	
	//보낸 제안 다중 삭제 (플래그 업데이트)
	@Override
	@Transactional
	public int deleteMultiPosi(List<PositionsuggestVO> posiList) {
		int cnt=0;
		try {
			for(PositionsuggestVO vo : posiList) {
				int positionsuggestNo = vo.getPositionsuggestNo();
				if(positionsuggestNo!=0) {	//체크된것만 
					cnt=positionDao.deletePSG(positionsuggestNo);	//삭제
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
