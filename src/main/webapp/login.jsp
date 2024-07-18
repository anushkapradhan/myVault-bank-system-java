<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ include file="css/tailwind_css.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

</head>
<body class='poppins-regular'>
<div class='grid grid-cols-2 gap-4 p-10'>

	<div class='bg-slate-500 p-10 rounded'>
		<h2 class='text-2xl font-bold text-center'>Login Page</h2>
		
	  <form method='POST' action='loginAction.jsp'>
	  
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
			<button type='submit' name='submitBtn'
			class='col-span-3 p-3 bg-black text-white hover:bg-blue-800 rounded'>Login Now</button>
		</div>
		
	  </form>
	  <div class='text-center text-sm text-blue-900 hover:text-white underline underline-offset-4'>
	  	<a href='http://localhost:8080/my-vault/register.jsp'>
	  	Haven't registered? Register Now!</a>
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
	</div>

</div>
</body>
</html>