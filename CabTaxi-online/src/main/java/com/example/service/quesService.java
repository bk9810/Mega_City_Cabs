package com.example.service;

import java.util.List;

import com.example.dao.questionDAO;
import com.example.model.question;

public class quesService {
	
	private static quesService instance;
	private questionDAO questionsDAO;
	
	private quesService() {
		this.questionsDAO = new questionDAO();
	}
	
	public static quesService getInstance() {
		if(instance == null) {
			synchronized (quesService.class) {
				if(instance == null) {
					instance = new quesService();
				}
			}
		}
		return instance;
	}
	
	public boolean SubmitQuestion(question questions) {
		return questionsDAO.saveQuestion(questions);
	}
	
	public List<question> getquestions(int id){
		return questionsDAO.getQuestions(id);
	}
	

}
