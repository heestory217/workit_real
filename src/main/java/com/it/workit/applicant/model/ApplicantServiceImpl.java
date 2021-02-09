package com.it.workit.applicant.model;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.it.workit.indivMypage.model.IndivpagingVO;

@Service
public class ApplicantServiceImpl implements ApplicantService{

	@Autowired ApplicantDAO applicantDao;

	@Override
	public ApplicantlistVO selectByUserNo(int userNo) {
		return applicantDao.selectByUserNo(userNo);
	}

	@Override
	public int selectApplyCountByUserNo(int userNo) {
		return applicantDao.selectApplyCountByUserNo(userNo);
	}

	@Override
	public int selectPassCountByUserNo(int userNo) {
		return applicantDao.selectPassCountByUserNo(userNo);
	}

	@Override
	public int selectFailCountByUserNo(int userNo) {
		return applicantDao.selectFailCountByUserNo(userNo);
	}

	@Override
	public List<ApplicantlistVO> selectApplyAllByUserNo(IndivpagingVO vo) {
		return applicantDao.selectApplyAllByUserNo(vo);
	}

	@Override
	public List<ApplicantlistVO> selectPassAllByUserNo(IndivpagingVO vo) {
		return applicantDao.selectPassAllByUserNo(vo);
	}

	@Override
	public List<ApplicantlistVO> selectFailAllByUserNo(IndivpagingVO vo) {
		return applicantDao.selectFailAllByUserNo(vo);
	}

	@Override
	public List<ApplicantlistVO> selectAllApplicantFromCorp(int userNo) {
		return applicantDao.selectAllApplicantFromCorp(userNo);
	}

	@Override
	public List<Map<String, Object>> selectAllApplicantView(CorpApplicantPagingVO vo) {
		return applicantDao.selectAllApplicantView(vo);
	}

	@Override
	public int updateReadCount(int applicantlistNo) {
		return applicantDao.updateReadCount(applicantlistNo);
	}

	@Override
	public ApplicantlistVO selectOneApplication(int applicantlistNo) {
		return applicantDao.selectOneApplication(applicantlistNo);
	}

	@Override
	public int updaeApplyPass(int applicantlistNo) {
		return applicantDao.updaeApplyPass(applicantlistNo);
	}

	@Override
	public int updaeApplyFail(int applicantlistNo) {
		return applicantDao.updaeApplyFail(applicantlistNo);
	}

	@Override
	public int selectAllAppliedCount(CorpApplicantPagingVO vo) {
		return applicantDao.selectAllAppliedCount(vo);
	}

	@Override
	public int selectPassCount(CorpApplicantPagingVO vo) {
		return applicantDao.selectPassCount(vo);
	}

	@Override
	public int selectFailCount(CorpApplicantPagingVO vo) {
		return applicantDao.selectFailCount(vo);
	}

	@Override
	public int selectReadCount(CorpApplicantPagingVO vo) {
		return applicantDao.selectReadCount(vo);
	}

}
