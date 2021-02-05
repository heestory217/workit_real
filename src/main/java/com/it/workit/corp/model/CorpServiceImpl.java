package com.it.workit.corp.model;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;

import com.it.workit.common.SearchVO;
import com.it.workit.corpsearch.model.MatchSearchVO;
import com.it.workit.users.model.UsersDAO;

@Service
public class CorpServiceImpl implements CorpService {

	@Autowired private CorpDAO corpDao;
	@Autowired private UsersDAO userDao;
	
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
		int userNo = vo.getUserNo();
		cnt = userDao.updateUserCorpCheck(userNo);
		return cnt;
	}

	@Override
	public CorpVO selectCorp(int corpNo) {
		return corpDao.selectCorp(corpNo);
	}

	@Override
	public List<CorpimgVO> corpImgList(int corpNo) {
		return corpDao.corpImgList(corpNo);
	}

	@Override
	public List<CorpRecruitViewVO> selectRecruit(int userNo) {
		return corpDao.selectRecruit(userNo);
	}

	@Override
	public int editCorp(CorpVO vo) {
		return corpDao.editCorp(vo);
	}

	@Override
	public int editCorpImg(List<CorpimgVO> imgList) {
		int cnt=0;
		System.out.println("서비스에 들어온 imgList사이즈"+imgList.size());
		try {
			if(imgList.size()!=0 || !imgList.isEmpty()) {
				for(CorpimgVO vo : imgList) {
					System.out.println("서비스에 들어온 vo : "+vo);
					cnt = corpDao.editCorpImg(vo);
				}
			}
		}catch(RuntimeException e) {
			e.printStackTrace();
			cnt=-1;
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
		}
		return cnt;
	}

	@Override
	public int selectCorpNo(int userNo) {
		return corpDao.selectCorpNo(userNo);
	}

	@Override
	public List<Map<String, Object>> selectRecruitList(int userNo) {
		return corpDao.selectRecruitList(userNo);
	}

	@Override
	public List<AppResumeUserAllVO> selectResumeView(int recruitannounceNo) {
		return corpDao.selectResumeView(recruitannounceNo);
	}

	@Override
	public List<AreaListView> selectAreaList(int resumeNo) {
		return corpDao.selectAreaList(resumeNo);
	}

	@Override
	public List<LanguageListView> selectLanguageList(int resumeNo) {
		return corpDao.selectLanguageList(resumeNo);
	}

	@Override
	public List<Integer> selectResumeNoList(List<MatchSearchVO> mList) {
		List<Integer> resumeNo = new ArrayList<Integer>();
		if(!mList.isEmpty() || mList.size()>0) {
			for(int i=0;i<mList.size();i++) {
				resumeNo = corpDao.selectResumeNoList(mList.get(i));
			}
		}
		return resumeNo;
	}

	@Override
	public int insertCorpReview(CorpreviewVO vo) {
		return corpDao.insertCorpReview(vo);
	}

	
	//admin
	@Override
	public List<CorpVO> selectCorpList(SearchVO searchVo) {
		return corpDao.selectCorpList(searchVo);
	}

	@Override
	public int selectCorpListCount(SearchVO searchVo) {
		return corpDao.selectCorpListCount(searchVo);
	}

	@Override
	public List<CorpAllVo> selectCorpWaitingList() {
		return corpDao.selectCorpWaitingList();
	}

	@Override
	public List<CorpimgVO> selectCorpWaitingImgList(int corpNo) {
		return corpDao.selectCorpWaitingImgList(corpNo);
	}

	@Override
	public int corpOkCheck(String corpNo) {
		return corpDao.corpOkCheck(corpNo);
	}

	@Override
	public int corpReject(String corpNo) {
		return corpDao.corpReject(corpNo);
	}

	@Override
	public int corpWating(String corpNo) {
		return corpDao.corpWaiting(corpNo);
	}


}
