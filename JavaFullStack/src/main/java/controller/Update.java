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


@WebServlet("/Update")
public class Update extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		response.setContentType("text/html");

		try(PrintWriter out = response.getWriter())
		{
			String idVal = request.getParameter("idVal");
			String name = request.getParameter("uname");
			String pass = request.getParameter("pw");
			String mobile = request.getParameter("mn");
			
			Class.forName("com.mysql.jdbc.Driver");  
			Connection con=DriverManager.getConnection(  
			"jdbc:mysql://localhost:3306/users","root","80155");  
			java.sql.Statement stmt=con.createStatement();
			
			int val = stmt.executeUpdate("update userDetails set username='"+name+"',password='"+pass+"', MobileNumber='"+mobile+"' where id='"+idVal
					+"' ");

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
			System.out.print(e);
		}
	
	}

}
