<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style type="text/css">
	
	body{
		background-color:beige;	
	}

</style>

<script type="text/javascript">
	
	function myfunction(){
		let username = document.getElementById("username").value
		
		let password = document.getElementById("password").value
		
		let mob = document.getElementById("mob").value

		if(username == "")
			{
				alert("Username cannot be empty")
				return false
			}
		if(password == "")
			{
				alert("Password cannot be empty")
				return false
			}
		if(mob == "")
		{
			alert("Mobile Number cannot be empty")
			return false
		}
		
	}
	
</script>

</head>
<body>

			<h1 align="center">Register</h1>
		
		<form action = "AddUser" onsubmit="return myfunction()" method="post">
		<table align="center">
		
				<tr>	
					<td><input type="text" id="username" placeholder="UserName" name="username"/></td>
				</tr>
				<tr>
					
					<td><input type = "password" id="password" placeholder="Password" name="password"/></td>
				</tr>
				
				<tr>
					
					<td><input type = "text" id="mob" placeholder="Mobile Number" name="mobileNumber"/></td>
				</tr>
				
				<tr>
					<td><input type = "submit" value="signUp"/></td>
				</tr>
		</table>
		</form>

</body>
</html>