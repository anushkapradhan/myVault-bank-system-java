<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

    <%@ page import="myVaultPackage.connectDb" %>
    <%@ page import="java.sql.*" %>
    
 <%
 
	String credit_amt_input = request.getParameter("creditAmt");
	double credit_amt = Double.valueOf(credit_amt_input);
	String security_pin = request.getParameter("security_pin");

	String email = (String)session.getAttribute("user");
	
	String balance_query = "SELECT balance FROM account_info WHERE email = ?"; 
	String credit_amt_query = "UPDATE account_info SET balance = balance + ? WHERE email = ? AND security_pin = ?";

	try{
		Connection connection = connectDb.getConnection();

		
		PreparedStatement preparedStatement = connection.prepareStatement(credit_amt_query);
		
		preparedStatement.setDouble(1, credit_amt);
		preparedStatement.setString(2, email);
		preparedStatement.setString(3, security_pin);

		int affectedRows = preparedStatement.executeUpdate();
		if (affectedRows > 0){
			String update_success = "Amount credited Successfully!";
			response.sendRedirect("credit.jsp?success="+update_success);
		}else { 
			String update_error = "Error while crediting amount!";
			response.sendRedirect("credit.jsp?error="+update_error);
		}
	
	}catch(Exception e){
		String error = e.getMessage();
		response.sendRedirect("../error.jsp?error="+error);
	}
%>