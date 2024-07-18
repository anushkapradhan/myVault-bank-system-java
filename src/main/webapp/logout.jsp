<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ include file="../css/tailwind_css.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
</head>
<body>

<% session.invalidate(); %>
<jsp:forward page='home.jsp'/>

</body>
</html>