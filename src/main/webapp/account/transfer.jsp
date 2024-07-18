<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ include file="../css/tailwind_css.jsp" %>
    <%@ page import="myVaultPackage.connectDb" %>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="../css/home.css">
</head>
<body>
<% 
	String current_user = (String)session.getAttribute("user");

	String error_update = request.getParameter("error");
	String success_update = request.getParameter("success");


if (current_user == null){ %>
		<jsp:forward page="error.jsp" />
<%	}else { %>
<div class='poppins-regular text-white p-3'>

<!-- NavBar -->
	<div class='grid grid-cols-5 bg-black p-3 rounded items-center justify-center'>
		
		<h1 class='text-4xl text-center font-bold'>
			MyVault
		</h1>
		<div class='col-span-2 text-center ml-60'>
			Welcome!!
			<span class='text-blue-800 font-bold'><%= current_user %></span>
		</div>
		<div class='flex flex-row gap-8 ml-32'>
			<div class=' text-center hover:bg-blue-500 rounded py-2 px-3 bg-blue-800'>
				<a href='http://localhost:8080/my-vault/dashboard.jsp'>Dashboard</a>
			</div>
			<div class=' text-center hover:bg-blue-500 rounded py-2 px-3 bg-blue-800'>
				<a href='http://localhost:8080/my-vault/home.jsp'>Home</a>
			</div>
			<div class=' text-center hover:bg-blue-500 rounded py-2 px-3 bg-blue-800'>
				<a href='http://localhost:8080/my-vault/logout.jsp'>Logout</a>
			</div>
		</div>
	</div>
	
	<!-- Body -->
	
	<%
		String check_account_query = "SELECT * FROM account_info WHERE email = ?";
		
		try{
			Connection connection = connectDb.getConnection();
			PreparedStatement preparedStatement = connection.prepareStatement(check_account_query);
			preparedStatement.setString(1, current_user);
			ResultSet resultSet = preparedStatement.executeQuery();
			
			if (resultSet.next()){ 
				long account_number = resultSet.getLong("account_number");
				double balance = resultSet.getDouble("balance");
				
			%>
			
				
	<div class='grid grid-cols-2 gap-4 p-3'>
	<div class='bg-slate-500 p-4 rounded'>
		<% if (error_update != null) { %>
		<div>
			<%=error_update %>
		</div>
		<% } else if (success_update != null) { %>
		<div class='text-green-200'>
			<%=success_update %>
		</div>
		<% } %>
	<form method='POST' action='transferAction.jsp'>
		<div class="max-w-sm mx-auto"> 
			<div class='mx-20 flex mt-5 text-red-900 font-bold justify-center'>
				<p class='flex-1 '>Your Account Number: </p>
				<p class='flex-2 '><%=account_number %></p>
			</div>
			<div class='flex text-blue-900 text-xl font-bold mt-5 text-center'>
				<p class='flex-1'>Transfer Amount</p>
			</div>
		</div>
		
		<div class="mt-2 max-w-sm mx-auto"> 
		  	<label for="receiver_account_number" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Enter Receiver's Account Number</label>
  			<input type="text" name="receiver_account_number" aria-describedby="helper-text-explanation" 
  			class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5  dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500" 
  			placeholder="eg. 1" required>		  
		</div>
		
		<div class="mt-2 max-w-sm mx-auto"> 
		  	<label for="transferAmt" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Enter Transfer Amount</label>
  			<input type="text" name="transferAmt" aria-describedby="helper-text-explanation" 
  			class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5  dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500" 
  			placeholder="0.00" required>		  
		</div>
		
		<div class="mt-2 max-w-sm mx-auto"> 
		  	<label for="balance" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Your Balance</label>
  			<input type="text" name="balance" aria-describedby="helper-text-explanation" 
  			value=<%=balance %>
  			class="cursor-not-allowed bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5  dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500" 
  			placeholder="0.00" disabled readonly>		  
		</div>
		
		
		<div class="mt-2 max-w-sm mx-auto"> 
  			<label for="security_pin" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Enter Security Pin</label>
  			<input type="password" name="security_pin" aria-describedby="helper-text-explanation" 
  			class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5  dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500" 
  			placeholder="eg. 123 or 1234" required>
		</div>
		
		<div class="mt-3 max-w-sm mx-auto"> 
  			<button type="submit" name="updateBtn"
  			class="bg-blue-800 text-white text-sm rounded-lg block w-full p-2.5 hover:bg-blue-500" >
  				Transfer Amount</button>
		</div>
		
		</form>
		
	  
	</div>
	
	
	<div class='bg-slate-700 p-10 rounded'>
		<span class='text-xl font-bold'><center>MyVault</center></span>
		<p class='mt-4 text-justify'>
			MyVault's core values of integrity, excellence, and 
			community engagement drive its mission to empower individuals 
			and businesses to achieve their financial goals.
			The bank offers a wide range of services, including 
			personal and business banking, investment management, 
			mortgage solutions, and comprehensive insurance products. 
		</p>
		<div class='grid grid-rows-3 mt-8 justify-center items-center gap-8'>
				<a href="credit.jsp"
				class='bg-blue-900 px-28 py-2 rounded hover:bg-blue-500 cursor-pointer'>
				Credit Amount</a>
				<a href ="debit.jsp" 
				class='bg-blue-900 px-28 py-2 rounded hover:bg-blue-500 cursor-pointer'>
				Debit Amount</a>
				<button disabled
				class='bg-slate-600 px-28 py-2 rounded border border-3'>
				Transfer Amount</button>
		</div>
	</div>

</div>
				
	<%		}else{		%>
				
				<jsp:forward page ="../dashboard.jsp" />
				
		<%		}
			
		}catch (Exception e){
			String error = e.getMessage();
    		response.sendRedirect("../error.jsp?error="+error);
		}
	%>
	
</div>
<% } %>
</body>
</html>