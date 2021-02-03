package com.it.workit.getposition.model;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class GetPositionServiceImpl implements GetPositionService {
	@Autowired private GetPositionDAO getPositionDao;

}
