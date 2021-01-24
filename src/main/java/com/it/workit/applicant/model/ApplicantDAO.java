package com.it.workit.applicant.model;

import java.util.List;

public interface ApplicantDAO {
	//은별
	public ApplicantlistVO selectByUserNo(int userNo);
	public int selectApplyCountByUserNo(int userNo);
	public int selectPassCountByUserNo(int userNo);
	public int selectFailCountByUserNo(int userNo);
	public List<ApplicantlistVO> selectApplyAllByUserNo(int userNo);
	public List<ApplicantlistVO> selectPassAllByUserNo(int userNo);
	public List<ApplicantlistVO> selectFailAllByUserNo(int userNo);
}
