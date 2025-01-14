package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/Validation")
public class Validation extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		response.getWriter().append("Served at: ").append(request.getContextPath());
		
		response.setContentType("text/html");
		
		try(PrintWriter out = response.getWriter()){
			
			String name = request.getParameter("username");
			
			String password = request.getParameter("password");
			
			Class.forName("com.mysql.jdbc.Driver");  
			Connection con=DriverManager.getConnection(  
			"jdbc:mysql://localhost:3306/users","root","80155");  
			java.sql.Statement stmt=con.createStatement();
			
			ResultSet rs = stmt.executeQuery("select * from userDetails;");
			
			
			boolean temp = false;
			while(rs.next())
			{
				String username = rs.getString("username");
				
				String pass = rs.getString("password");
				
				if(name.equals(username) && password.equals(pass))
				{
					out.println("welcome " + name);
					temp = true;
					out.print("Hello");
					
					RequestDispatcher rd	= request.getRequestDispatcher("UserHome.jsp");
					rd.forward(request, response);
					break;
					
				}
				else if(name.equals("admin") && password.equals("admin@123"))
				{
					out.println("welcome " + "admin");
					temp = true;
					RequestDispatcher rd	= request.getRequestDispatcher("AdminHome.jsp");
					rd.include(request, response);
					break;
				}
				
			}
			
			if(temp == false)
			{
				out.println("Incorrect UserName or Password");

			}
		}catch(Exception e)
		{
			System.out.println(e);
		}
	}

}
