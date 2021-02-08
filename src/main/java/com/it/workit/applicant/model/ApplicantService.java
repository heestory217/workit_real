package com.it.workit.applicant.model;

import java.util.List;
import java.util.Map;

import com.it.workit.indivMypage.model.IndivpagingVO;

public interface ApplicantService {
	public ApplicantlistVO selectByUserNo(int userNo);
	public int selectApplyCountByUserNo(int userNo);
	public int selectPassCountByUserNo(int userNo);
	public int selectFailCountByUserNo(int userNo);
	public List<ApplicantlistVO> selectApplyAllByUserNo(IndivpagingVO vo);
	public List<ApplicantlistVO> selectPassAllByUserNo(IndivpagingVO vo);
	public List<ApplicantlistVO> selectFailAllByUserNo(IndivpagingVO vo);
	
	//희정 기업 지원자 관리
	public List<ApplicantlistVO> selectAllApplicantFromCorp(int userNo);
	public List<Map<String, Object>> selectAllApplicantView(int userNo);
}
