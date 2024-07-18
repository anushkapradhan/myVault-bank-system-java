<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ include file="../css/tailwind_css.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
</head>
<body>
<div>
 <% String error = request.getParameter("error"); %>
	<h1 class='text-center mt-10 text-3xl font-bold hover:text-red-500'>Something went wrong!!</h1>
	<% if (error == null) { %>
	<span class='p-20 text-red-900 font-bold text-3xl'>Login first!</span>
	<%} else { %>
	<span class='p-20 text-red-900 font-bold text-3xl'><%=error %></span>
	<% } %>
	<br><br><br>
	<a href='http://localhost:8080/my-vault/home.jsp' class='ml-6 p-3 bg-black text-white'>Go back home</a>
</div>
</body>
</html>