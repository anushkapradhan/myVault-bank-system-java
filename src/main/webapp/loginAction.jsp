<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@ page import='myVaultPackage.connectDb' %>
    <%@ page import='java.sql.*' %>

    
    <%
    String email = request.getParameter("email");
    String password = request.getParameter("password");
    
    if(email.equals("admin@test.com") && password.equals("admin")){
    	response.sendRedirect("admin/adminHome.jsp");
    }else{
    	try{
    		String login_query = "SELECT * FROM user WHERE email=? AND password=?";
    		Connection connection = connectDb.getConnection();
    		PreparedStatement preparedStatement = connection.prepareStatement(login_query);
    		preparedStatement.setString(1, email);
    		preparedStatement.setString(2, password);
    		ResultSet resultSet = preparedStatement.executeQuery();
    		
    		if (resultSet.next()){
    			session.setAttribute("user", email);
    			response.sendRedirect("dashboard.jsp?email="+email);
    		}else{
    			response.sendRedirect("error.jsp");
    		}
    	}catch (Exception e){
    		String error = e.getMessage();
    		response.sendRedirect("error.jsp?error="+error);
    	}
    }
    %>