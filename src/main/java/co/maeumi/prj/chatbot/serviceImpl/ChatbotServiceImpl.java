package co.maeumi.prj.chatbot.serviceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.maeumi.prj.chatbot.service.ChatbotMapper;
import co.maeumi.prj.chatbot.service.ChatbotService;

@Repository("chatbotDao")
public class ChatbotServiceImpl implements ChatbotService {

	@Autowired
	private ChatbotMapper map;

}
