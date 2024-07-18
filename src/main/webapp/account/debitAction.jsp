<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
	<%@ page import="myVaultPackage.connectDb" %>
    <%@ page import="java.sql.*" %>
    
 <%
 
	String debit_amt_input = request.getParameter("debitAmt");
	double debit_amt = Double.valueOf(debit_amt_input);
	String security_pin = request.getParameter("security_pin");

	String email = (String)session.getAttribute("user");
	
	String balance_query = "SELECT balance FROM account_info WHERE email = ?"; 
	String debit_amt_query = "UPDATE account_info SET balance = balance - ? WHERE email = ? AND security_pin = ?";

	try{
		Connection connection = connectDb.getConnection();
		
		PreparedStatement preparedStatementBalance = connection.prepareStatement(balance_query);
		preparedStatementBalance.setString(1, email);
		ResultSet resultSet = preparedStatementBalance.executeQuery();
		double balance = 0;
		if (resultSet.next()){
			balance = resultSet.getDouble("balance");
		}
		
		PreparedStatement preparedStatement = connection.prepareStatement(debit_amt_query);
		
		int affectedRows = 0;
		
		if (balance > debit_amt){
			preparedStatement.setDouble(1, debit_amt);
			preparedStatement.setString(2, email);
			preparedStatement.setString(3, security_pin);

			affectedRows = preparedStatement.executeUpdate();
			
		}
		
		if (affectedRows > 0){
			String update_success = "Amount debited Successfully!";
			response.sendRedirect("debit.jsp?success="+update_success);
		}else { 
			String update_error = "Debit amount cannot be greater than balance!!!";
			response.sendRedirect("debit.jsp?error="+update_error);
		}
	
	}catch(Exception e){
		String error = e.getMessage();
		response.sendRedirect("../error.jsp?error="+error);
	}
%>