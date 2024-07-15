package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/DeleteRow")
public class DeleteRow extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		try(PrintWriter out = response.getWriter())
		{
			String id = request.getParameter("id");
			

			Class.forName("com.mysql.jdbc.Driver");  
			Connection con=DriverManager.getConnection(  
			"jdbc:mysql://localhost:3306/users","root","80155");  
			java.sql.Statement stmt=con.createStatement();
			
			
			int val = stmt.executeUpdate("delete from userDetails where id = '"+id+"' ");
			
			if(val == 1)
			{
				RequestDispatcher rd	= request.getRequestDispatcher("Data.jsp");
				rd.include(request, response);
			}
			else {
				out.print("Sorry");

			}
		}catch(Exception e)
		{
			System.out.println(e);
		}
	
	}

}
