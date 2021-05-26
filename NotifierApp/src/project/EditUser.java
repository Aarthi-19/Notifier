package project;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import GetterSetter.EditUsergetset;

@WebServlet("/EditUser1")

public class EditUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html");
		String username1=request.getParameter("username1");
		String mobilenumber1=request.getParameter("mobilenumber1");
		String email1=request.getParameter("email1");
		String password1=request.getParameter("password1");
		String confirmpassword1=request.getParameter("confirmpassword1");
		System.out.println(username1);
		System.out.println(password1);
		
		HttpSession session=request.getSession();
		String email=(String) session.getAttribute("email");
        session.setAttribute("email", email);		
		EditUsergetset object = new EditUsergetset();
		object.setUsername(username1);
		object.setMobilenumber(mobilenumber1);
		object.setEmail(email1);
		object.setPassword(password1);
		object.setConfirmpassword(confirmpassword1);
	    System.out.println(email);
	    System.out.println(email1);
		int Register = 0;
				try
				{
					/*Class.forName("com.mysql.jdbc.Driver");
					Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:/chatbot","root","");
					String sql="Update registeration set Password=? where Email_Id=?";
					PreparedStatement ps=conn.prepareStatement(sql);
					ps.setString(1,NewPassword);
					ps.setString(2, EmailId);
					int i=ps.executeUpdate();
					response.sendRedirect("ResetCompleted.jsp");*/
			//		================================
					Class.forName("com.mysql.jdbc.Driver");
					Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/notifier","root","Aarthi@123");
				    ResultSet rs,rs1;
				    Statement st=conn.createStatement();
				    String sql="Update signup set username=?,mobilenumber=?,email=?,password=?,confirmpassword=? where email=?";
				    String sql1="select * from signup where email='"+email+"'";		
					rs=st.executeQuery(sql1);
					rs.next();
					System.out.println(rs.getRow());
					
						PreparedStatement ps=conn.prepareStatement(sql);
						ps.setString(1, object.getUsername());
						System.out.println(object.getUsername()+"hello");
				        ps.setString(2, object.getMobilenumber());
				        ps.setString(3, object.getEmail());
				        System.out.println(object.getEmail());
				        ps.setString(4, object.getPassword());
				        ps.setString(5,object.getConfirmpassword());
				        ps.setString(6, email);
				        Register=ps.executeUpdate();
				        System.out.println(Register);
					
				}
				catch(Exception e)
				{
				e.printStackTrace();
				}	
			if(Register!=0)
			{
				RequestDispatcher rd=request.getRequestDispatcher("EditUserSuccess.jsp");
				rd.forward(request, response);
			}
	}
}
