<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
	<%@ page import="myVaultPackage.connectDb" %>
    <%@ page import="java.sql.*" %>
    
<%
	String first_name = request.getParameter("first_name");
	String last_name = request.getParameter("last_name");
	String balance_input = request.getParameter("balance");
	double balance = Double.valueOf(balance_input);
	String security_pin = request.getParameter("security_pin");

	String email = (String)session.getAttribute("user");

	String create_account_query = "INSERT INTO account_info VALUES (?, ?, ?, ?, ?, ?)";

	try{
		Connection connection = connectDb.getConnection();
		PreparedStatement preparedStatement = connection.prepareStatement(create_account_query);
		
		long account_number = connectDb.generateAccountNumber();
		
		preparedStatement.setLong(1, account_number);
		preparedStatement.setString(2, first_name);
		preparedStatement.setString(3, last_name);
		preparedStatement.setString(4, email);
		preparedStatement.setDouble(5, balance);
		preparedStatement.setString(6, security_pin);

		int affectedRows = preparedStatement.executeUpdate();
		if (affectedRows > 0){
			String update_success = "Account Created Successfully!";
			response.sendRedirect("../dashboard.jsp?success="+update_success);
		}else { 
			String update_error = "Error while creating account!";
			response.sendRedirect("../dashboard.jsp?error="+update_error);
		}
	
	}catch(Exception e){
		String error = e.getMessage();
		response.sendRedirect("../error.jsp?error="+error);
	}
%>