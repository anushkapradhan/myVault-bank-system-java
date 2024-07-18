<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@ page import="myVaultPackage.connectDb" %>
    <%@ page import="java.sql.*" %>
    
<%
	String first_name = request.getParameter("first_name");
	String last_name = request.getParameter("last_name");
	String security_pin = request.getParameter("security_pin");
	
	String email = (String)session.getAttribute("user");
	
	String update_query = "UPDATE account_info SET first_name = ? , last_name = ? , security_pin = ? WHERE email = ?";
	
	try{
		Connection connection = connectDb.getConnection();
		PreparedStatement preparedStatement = connection.prepareStatement(update_query);
		preparedStatement.setString(1, first_name);
		preparedStatement.setString(2, last_name);
		preparedStatement.setString(3, security_pin);
		preparedStatement.setString(4, email);

		int affectedRows = preparedStatement.executeUpdate();
		if (affectedRows > 0){
			String update_success = "Updated Successfully!";
			response.sendRedirect("../dashboard.jsp?success="+update_success);
		}else { 
			String update_error = "Error while updating!";
			response.sendRedirect("../dashboard.jsp?error="+update_error);
		}
		
	}catch(Exception e){
		String error = e.getMessage();
		response.sendRedirect("../error.jsp?error="+error);
	}

%>