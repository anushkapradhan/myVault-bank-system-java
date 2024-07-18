<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@ include file="css/tailwind_css.jsp" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/home.css">
<meta charset="ISO-8859-1">
</head>
<body>
<%
	String current_user = (String)session.getAttribute("user");
%>
<div class='poppins-regular text-white p-6'>
	<div class='bg-black p-3 rounded'>
		<h1 class='text-4xl text-center text:black font-bold'>My Vault - Bank Management System</h1>
	</div>
	<% if (current_user == null) { %>
	<div>
		<%@ include file = "login.jsp" %>
	</div>
	<%} else { %>
	<div class='mt-20'>
		<span class='text-blue-800 font-bold'><%= current_user %></span>
		<a href='http://localhost:8080/my-vault/dashboard.jsp' class='ml-6 p-3 bg-black text-white'>Dashboard</a>
		<a href='logout.jsp' class='p-3 bg-red-900 hover:bg-red-500 text-white'>Logout</a>
	</div>
	<%} %>
</div>
</body>
</html>