package com.it.workit.message.model;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MessageServiceImpl implements MessageService{
	
	@Autowired private MessageDAO messageDao;

}
