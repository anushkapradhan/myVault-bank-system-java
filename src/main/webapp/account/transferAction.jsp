<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
	<%@ page import="myVaultPackage.connectDb" %>
    <%@ page import="java.sql.*" %>
    
 <%
 	String receiver_account_input = request.getParameter("receiver_account_number");
 	long receiver_account_number = Long.valueOf(receiver_account_input);
 	
	String transfer_amt_input = request.getParameter("transferAmt");
	double transfer_amt = Double.valueOf(transfer_amt_input);
	
	String security_pin = request.getParameter("security_pin");

	String email = (String)session.getAttribute("user");
	
	String balance_query = "SELECT balance FROM account_info WHERE email = ?"; 
	
	String receiver_credit_query = "UPDATE account_info SET balance = balance + ? WHERE account_number = ?";
	String sender_debit_query = "UPDATE account_info SET balance = balance - ? WHERE email = ? AND security_pin = ?";

	try{
		Connection connection = connectDb.getConnection();
		
		PreparedStatement preparedStatementBalance = connection.prepareStatement(balance_query);
		preparedStatementBalance.setString(1, email);
		ResultSet resultSet = preparedStatementBalance.executeQuery();
		
		int affectedRowsSender = 0;
		int affectedRowsReceiver = 0;
		
		double balance = 0;
		
		if (resultSet.next()){
			balance = resultSet.getDouble("balance");
		}
		
		PreparedStatement receiverCreditStatement = connection.prepareStatement(receiver_credit_query);
		PreparedStatement senderDebitStatement = connection.prepareStatement(sender_debit_query);
		
		
		if (transfer_amt < balance){
			// debit money from sender account
			senderDebitStatement.setDouble(1, transfer_amt);
			senderDebitStatement.setString(2, email);
			senderDebitStatement.setString(3, security_pin);
			
			affectedRowsSender = senderDebitStatement.executeUpdate();
			
			// credit money to receiver account
			receiverCreditStatement.setDouble(1, transfer_amt);
			receiverCreditStatement.setLong(2, receiver_account_number);

			affectedRowsReceiver = 	receiverCreditStatement.executeUpdate();		
			
		}
		
		if (affectedRowsSender > 0 && affectedRowsReceiver > 0){
			String update_success = "Amount transfered Successfully!";
			response.sendRedirect("transfer.jsp?success="+update_success);
		}else { 
			String update_error = "Transfer amount cannot be greater than balance!!!";
			response.sendRedirect("transfer.jsp?error="+update_error);
		}
	
	}catch(Exception e){
		String error = e.getMessage();
		response.sendRedirect("../error.jsp?error="+error);
	}
%>