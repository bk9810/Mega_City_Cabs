package com.example.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.example.model.question;

public class questionDAO {
	
	public static boolean saveQuestion(question questions) {
		
		String query = "INSERT INTO drivquestion(driver_id, question, answer) VALUES (?, ?, ?)";
		try {
			Connection connection = DBConnectionFactory.getConnection();
			PreparedStatement statement = connection.prepareStatement(query);
			statement.setInt(1, questions.getId());
			statement.setString(2, questions.getQuestion());
			statement.setString(3, questions.getAnswer());
			
			int rowInserted = statement.executeUpdate();
			return rowInserted > 0;
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
		
	}
	
	public List<question> getQuestions(int id){
		List<question> questions = new ArrayList<>();
		String query = "SELECT * FROM question WHERE driver_id = ?";
		
		try {
			Connection connection = DBConnectionFactory.getConnection();
			PreparedStatement statement = connection.prepareStatement(query);
			statement.setInt(1, id);
			ResultSet rs = statement.executeQuery();
			
			while (rs.next()) {
				questions.add(new question(
						rs.getInt("question_id"),
						rs.getInt("driver_id"),
						rs.getString("question"),
						rs.getString("answer")
						));
			}
		} catch(SQLException e) {
			e.printStackTrace();
		}
		return questions;
	}

}
