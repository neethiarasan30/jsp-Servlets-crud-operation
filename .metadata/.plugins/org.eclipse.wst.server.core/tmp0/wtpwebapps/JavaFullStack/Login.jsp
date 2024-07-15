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
		
		if(username == "")
			{
				alert("Username cannot be empty")
				return false
			}
		else if(password == "")
			{
				alert("Password cannot be empty")
				return false
			}
	}
	
</script>
</head>
<body>
	<h1 align="center">Login Form</h1>
		
		<form action = "Validation" onsubmit="return myfunction()">
		<table align="center">
		
				<tr>	
					<td><input type="text" id="username" placeholder="UserName" name = "username"/></td>
				</tr>
				<tr>
					
					<td><input type = "password" id="password" placeholder="Password" name = "password"/></td>
				</tr>
				<tr>
					<td><input type = "submit"/></td>
					<td> <a href="Register.jsp">New User</a> </td>
				</tr>
		</table>
		</form>
	

</body>
</html>