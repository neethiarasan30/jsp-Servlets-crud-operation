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
		
		<table border="1px solid">
			<tr>			
		
				<th>Id</th>
				<th>UserName</th>
				<th>Password</th>
				<th>Mobile Number</th>
			</tr>
			
			<% 
			Class.forName("com.mysql.jdbc.Driver");  
			Connection con=DriverManager.getConnection(  
			"jdbc:mysql://localhost:3306/users","root","80155");  
			java.sql.Statement stmt=con.createStatement();
			ResultSet rs = stmt.executeQuery("select * from userDetails;");
			
			while(rs.next())
			{
				String id = rs.getString("id");
				String name = rs.getString("username");
				String pass = rs.getString("password");
				String mobile = rs.getString("MobileNumber");
			%>	
				
				<tr>
				<td><%=id%></td>
				<td><%=name%></td>
				<td><%=pass%></td>
				<td><%=mobile%></td>
				
				
				<td><a href='Edit.jsp?id=<%=id %>'>Edit</a></td>
				<td><a href="DeleteRow?id=<%=id %>">Delete</a></td>			
							
				</tr>				
				
				
			<%
			}
			%>
			
		</table>
		
</body>
</html>