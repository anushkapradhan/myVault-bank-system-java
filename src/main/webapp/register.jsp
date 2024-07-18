<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ include file="../css/tailwind_css.jsp" %>
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
		
	<div class='grid grid-cols-2 gap-4 p-10'>

	 <div class='bg-slate-500 p-10 rounded'>
		<h2 class='text-2xl font-bold text-center'>Registration Page</h2>
		
	  <form method='POST' action='registerAction.jsp'>
	  
	  	<div class='p-6 grid grid-cols-3'>
			<span class='place-content-center text-center poppins-medium-italic text-xl'>Full Name: </span>
			<input type='text' placeholder='enter full name...' name='full_name'
			class='col-span-2 p-3 text-black rounded focus:outline-none' width='50px' required />
		</div>
	  
		<div class='p-6 grid grid-cols-3'>
			<span class='place-content-center text-center poppins-medium-italic text-xl'>Email ID: </span>
			<input type='email' placeholder='enter email...' name='email'
			class='col-span-2 p-3 text-black rounded focus:outline-none' width='50px' required />
		</div>
		
		<div class='p-6 grid grid-cols-3'>
			<span class='place-content-center text-center poppins-medium-italic text-xl'>Password: </span>
			<input type='password' placeholder='enter password...' name='password'
			class='col-span-2 p-3 text-black rounded focus:outline-none' width='50px' required />
		</div>
		
		<div class='p-6 grid grid-cols-3'>
			<span class='place-content-center text-center poppins-medium-italic text-xl'>Confirm Password: </span>
			<input type='password' placeholder='enter password again...' name='confirm_password'
			class='col-span-2 p-3 text-black rounded focus:outline-none' width='50px' required />
		</div>
		
		<div class='p-6 grid grid-cols-3'>
			<button type='submit' name='submitBtn'
			class='col-span-3 p-3 bg-black text-white hover:bg-blue-800 rounded'>Register Now</button>
		</div>
		
	  </form>
	  <div class='text-center text-sm text-blue-900 hover:text-white underline underline-offset-4'>
	  	<a href='http://localhost:8080/my-vault/home.jsp'>
	  	Already registered? Login Now!</a>
	  </div>
	  
	</div>
	
	
	<div class='bg-slate-700 p-10 rounded'>
		<span class='text-xl font-bold'><center>MyVault</center></span>
		<p class='text-justify'>
			MyVault Financial Services is a renowned banking institution established in 1985, headquartered in the vibrant city of Centerville. 
			The bank offers a wide range of services, including personal and business banking, investment management, mortgage solutions, and comprehensive insurance products.  
			The CEO, Jane Doe, leads a dedicated team of over 10,000 employees, all focused on delivering exceptional service and fostering long-term relationships with customers. 
			MyVault's core values of integrity, excellence, and community engagement drive its mission to empower individuals and businesses to achieve their financial goals.
		</p>
		
		<div class='flex flex-wrap'>
			<div class='flex-1 mt-4'>
				<img src='assets/vault_image.png' alt='vault_image' />
			</div>
			<div class='flex-2 mt-10 mb-44 p-2 px-4 place-content-center rounded text-center hover:bg-blue-800 bg-black text-white'>
				<a href='http://localhost:8080/my-vault/home.jsp' >Go back home</a>
			</div>
		</div>
		
	</div>

  </div>
  
  <% } else { %>
  <div class='mt-20'>
		<span class='text-blue-800 font-bold'>At register: <%= current_user %></span>
		<a href='http://localhost:8080/my-vault/dashboard.jsp' class='ml-6 p-3 bg-black text-white'>Dashboard</a>
		<a href='logout.jsp' class='p-3 bg-red-900 hover:bg-red-500 text-white'>Logout</a>
	</div>
  <%} %>
</div>

</body>
</html>