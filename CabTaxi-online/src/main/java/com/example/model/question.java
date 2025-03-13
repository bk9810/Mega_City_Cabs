package com.example.model;

public class question {
	
	private int question_id;
	private int id;
	private String question;
	private String answer;
	
	public question(int question_id, int id, String question, String answer) {
		this.question_id = question_id;
		this.id = id;
		this.question = question;
		this.answer = answer;
	}

	public int getQuestion_id() {
		return question_id;
	}

	public void setQuestion_id(int question_id) {
		this.question_id = question_id;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}
	public String getQuestion() {
		return question;
	}
	public void setQuestion(String question) {
		this.question = question;
	}
	public String getAnswer() {
		return answer;
	}

	public void setAnswer(String answer) {
		this.answer = answer;
	}

	
	
	

}
