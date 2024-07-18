<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ include file="../css/tailwind_css.jsp" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
</head>
<body>
<% 
	String current_user = request.getParameter("current_user");
	//String current_user = (String)session.getAttribute("user");

	String error_update = request.getParameter("error");
	String success_update = request.getParameter("success");
%>

 <div class='grid grid-cols-2 gap-4 p-3'> 

	<div class='bg-slate-500 p-8 rounded'>
		 <% if (error_update != null) { %>
		<div>
			<%=error_update %>
		</div>
		<%} else if (success_update != null) { %>
		<div class='text-green-200'>
			<%=success_update %>
		</div>
		<%} %>
	<form method='POST' action='account/createAccountAction.jsp'>
		<div class="max-w-sm mx-auto"> 
			
			<div class='text-center text-xs text-red-900 font-bold'>
				<p class='underline'>You do not have an account yet. Create one below!</p>
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
  			<label for="first_name" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Enter First Name</label>
  			<input type="text" name="first_name" aria-describedby="helper-text-explanation" 
  			class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5  dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500" 
  			placeholder="eg. abc" required>
  		  </div>
  		  <div>
  			<label for="last_name" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Enter Last Name</label>
  			<input type="text" name="last_name" aria-describedby="helper-text-explanation" 
  			class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5  dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500" 
  			placeholder="eg. xyz" required>
  		   </div>
		</div>
		
		<div class="mt-2 max-w-sm mx-auto"> 
  			<label for="balance" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Enter Balance</label>
  			<input type="text" name="balance" aria-describedby="helper-text-explanation" 
  			class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5  dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500" 
  			placeholder="0.00" required>
  			<p id="helper-text-explanation" class="mt-1 text-sm text-gray-500 dark:text-gray-400">Balance cannot be less than 0.</p>
  			
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
  				Create Account</button>
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
				<button disabled
				class='bg-blue-900 px-28 py-2 rounded cursor-not-allowed'>
				Credit Amount</button>
				<button disabled
				class='bg-blue-900 px-28 py-2 rounded cursor-not-allowed'>
				Debit Amount</button>
				<button disabled
				class='bg-blue-900 px-28 py-2 rounded cursor-not-allowed'>
				Transfer Amount</button>
		</div>
	</div>

</div>

</body>
</html>