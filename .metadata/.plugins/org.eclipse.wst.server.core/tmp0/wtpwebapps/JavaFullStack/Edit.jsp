<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	
	<form action="Update" method="post">
	<table border="1px">
			<tr>
				<th>Id</th>
				<th>UserName</th>
				<th>Password</th>
				<th>Mobile Number</th>
			</tr>
			
		
			<% 
			String id = request.getParameter("id");
			
			Class.forName("com.mysql.jdbc.Driver");  
			Connection con=DriverManager.getConnection(  
			"jdbc:mysql://localhost:3306/users","root","80155");  
			java.sql.Statement stmt=con.createStatement();
			ResultSet rs = stmt.executeQuery("select * from userDetails where id = '"+id+"';");
			
			while(rs.next())
			{
				String idVal = rs.getString("id");
				String name = rs.getString("username");
				String pass = rs.getString("password");
				String mobile = rs.getString("MobileNumber");
				%>
				
				<tr>
				<td><input type="text" value=<%=idVal %> name="idVal"></td>	
				<td><input type="text" value=<%=name %> name="uname"></td>
				<td><input type="text" value=<%=pass %> name = "pw"></td>
				<td><input type="text" value=<%=mobile %> name= "mn"></td>
				<td><input type="submit" value="Update"></td>
				
			</tr>

			<%
			} 
			%>	
			
		</table>
		</form>
</body>
</html>