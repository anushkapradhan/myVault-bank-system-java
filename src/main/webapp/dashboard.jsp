<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ include file="../css/tailwind_css.jsp" %>
    <%@ page import="myVaultPackage.connectDb" %>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

</head>
<body>
<% 
	// String email = request.getParameter("email"); 
	String error_update = request.getParameter("error");
	String success_update = request.getParameter("success");

	String current_user = (String)session.getAttribute("user");
	
	if (current_user == null){ %>
		<jsp:forward page="error.jsp" />
<%	}else { %>
<div class='poppins-regular text-white p-3'>

<!-- NavBar -->
	<div class='grid grid-cols-5 bg-black p-3 rounded items-center justify-center'>
		
		<h1 class='text-4xl text-center font-bold'>
			My Vault
		</h1>
		<div class='col-span-2 text-center ml-60'>
			Welcome!!
			<span class='text-blue-800 font-bold'><%= current_user %></span>
		</div>
		<div class='flex flex-row gap-8 ml-44'>
			<div class=' text-center hover:bg-blue-500 rounded py-2 px-3 bg-blue-800'>
				<a href='http://localhost:8080/my-vault/home.jsp'>Home</a>
			</div>
			<div class=' text-center hover:bg-blue-500 rounded py-2 px-3 bg-blue-800'>
				<a href='http://localhost:8080/my-vault/logout.jsp'>Logout</a>
			</div>
		</div>
	</div>
	
	<!-- Body -->
	<%!double balance = 0.0; %>
	<%
		String check_account_query = "SELECT * FROM account_info WHERE email = ?";
		
		try{
			Connection connection = connectDb.getConnection();
			PreparedStatement preparedStatement = connection.prepareStatement(check_account_query);
			preparedStatement.setString(1, current_user);
			ResultSet resultSet = preparedStatement.executeQuery();
			
			if (resultSet.next()){ 
				long account_number = resultSet.getLong("account_number");
				String first_name = resultSet.getString("first_name");
				String last_name = resultSet.getString("last_name");
				balance = resultSet.getDouble("balance");
				String security_pin = resultSet.getString("security_pin");
				
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
	<form method='POST' action='account/updateAccountAction.jsp'>
		<div class="max-w-sm mx-auto"> 
			
			<div class='ml-52 flex text-red-900 font-bold'>
				<p class='flex-1 '>Account Number: </p>
				<p class='flex-2 '><%=account_number %></p>
			</div>
			
  			<label for="email" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Your email</label>
  			<input type="email" name="email" aria-describedby="helper-text-explanation" 
  			value=<%=current_user %>
  			class="cursor-not-allowed bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5  dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500" 
  			placeholder="name@flowbite.com" disabled readonly>

  			<p id="helper-text-explanation" class="mt-1 text-sm text-gray-500 dark:text-gray-400">Email cannot be changed.</p>
		</div>
		
		<div class="mt-2 max-w-sm mx-auto grid grid-cols-2 gap-2"> 
		  <div>
  			<label for="first_name" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Your First Name</label>
  			<input type="text" name="first_name" aria-describedby="helper-text-explanation" 
  			value=<%=first_name %>
  			class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5  dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500" 
  			placeholder="eg. abc" required>
  		  </div>
  		  <div>
  			<label for="last_name" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Your Last Name</label>
  			<input type="text" name="last_name" aria-describedby="helper-text-explanation" 
  			value=<%=last_name %>
  			class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5  dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500" 
  			placeholder="eg. xyz" required>
  		   </div>
		</div>
		
		<div class="mt-2 max-w-sm mx-auto"> 
		  
		  	<label for="balance" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Your Balance</label>
  			<input type="text" name="balance" aria-describedby="helper-text-explanation" 
  			value=<%=balance %>
  			class="cursor-not-allowed bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5  dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500" 
  			placeholder="0.00" disabled readonly>
  			<p id="helper-text-explanation" class="mt-1 text-sm text-gray-500 dark:text-gray-400">Balance cannot be changed.</p>
		  
		</div>
		
		<div class="mt-2 max-w-sm mx-auto"> 
  			<label for="security_pin" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">
  			Your Security Pin <span class='text-xs text-gray-600'>(you can update your security pin)</span>
  			</label>
  			<input type="password" name="security_pin" aria-describedby="helper-text-explanation" 
  			value=<%=security_pin %>
  			class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5  dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500" 
  			placeholder="eg. 123 or 1234" required>
		</div>
		
		<div class="mt-3 max-w-sm mx-auto"> 
  			<button type="submit" name="updateBtn"
  			class="bg-blue-800 text-white text-sm rounded-lg block w-full p-2.5 hover:bg-blue-500" >
  				Update</button>
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
				<a href="account/credit.jsp"
				class='bg-blue-900 px-28 py-2 rounded hover:bg-blue-500 cursor-pointer'>
				Credit Amount</a>
				<a href="account/debit.jsp"
				class='bg-blue-900 px-28 py-2 rounded hover:bg-blue-500 cursor-pointer'>
				Debit Amount</a>
				<a href="account/transfer.jsp"
				class='bg-blue-900 px-28 py-2 rounded hover:bg-blue-500 cursor-pointer'>
				Transfer Amount</a>
		</div>
	</div>

</div>
				
	<%		}else{		%>
				
				<jsp:include page ="account/createAccount.jsp" >
					<jsp:param name="current_user" value="<%=current_user %>" />
				</jsp:include>
		<%		}
			
		}catch (Exception e){
			String error = e.getMessage();
    		response.sendRedirect("error.jsp?error="+error);
		}
	%>
	
</div>
<% } %>
</body>
</html>