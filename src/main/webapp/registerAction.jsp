<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

    <%@ page import='myVaultPackage.connectDb' %>
    <%@ page import='java.sql.*' %>

    
    <%
    String full_name = request.getParameter("full_name");
    String email = request.getParameter("email");
    String password = request.getParameter("password");
    String confirm_password = request.getParameter("confirm_password");
    
    try{
    	String register_query = "INSERT INTO user(full_name, email, password) VALUES (?, ?, ?)";
    	Connection connection = connectDb.getConnection();
    	PreparedStatement preparedStatement = connection.prepareStatement(register_query);
    	preparedStatement.setString(1, full_name);
    	preparedStatement.setString(2, email);
    	preparedStatement.setString(3, password);
    	int affectedRows = preparedStatement.executeUpdate();
    		
    		if (affectedRows > 0){
    			session.setAttribute("user", email);
    			response.sendRedirect("dashboard.jsp?email="+email);
    		}else{
    			response.sendRedirect("error.jsp");
    		}
    	}catch (Exception e){
    		String error = e.getMessage();
    		response.sendRedirect("error.jsp?error="+error);
    	}
    
    %>