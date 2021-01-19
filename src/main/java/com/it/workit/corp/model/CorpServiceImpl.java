package com.it.workit.corp.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class CorpServiceImpl implements CorpService {

	@Autowired private CorpDAO corpDao;
	
	@Override
	@Transactional
	public int insertCorp(CorpVO vo, List<CorpimgVO> imgList) {
		int cnt = corpDao.insertCorp(vo);
		int corpNo = vo.getCorpNo();
		System.out.println("corpNo : "+corpNo);
		for(int i=0;i<imgList.size();i++) {
			CorpimgVO imgVo = imgList.get(i);
			imgVo.setCorpNo(corpNo);
			System.out.println("coprimgVO = "+imgList.get(i));
			cnt = corpDao.insertImg(imgList.get(i));
		}
		return cnt;
	}

	@Override
	public CorpVO selectCorp(int corpNo) {
		return corpDao.selectCorp(corpNo);
	}

}
