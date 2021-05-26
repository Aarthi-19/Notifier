package project;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import GetterSetter.SignUpgetset;
import database.SignUpConnection;

@WebServlet("/Register")
public class SignUp extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		String username=request.getParameter("username");
		String mobilenumber=request.getParameter("mobilenumber");
		String email=request.getParameter("email");
		String password=request.getParameter("password");
		String confirmpassword=request.getParameter("confirmpassword");
		System.out.println(username);
		System.out.println(password);
		
		SignUpgetset obj = new SignUpgetset();
		obj.setUsername(username);
		obj.setMobilenumber(mobilenumber);
		obj.setEmail(email);
		obj.setPassword(confirmpassword);
		obj.setConfirmpassword(confirmpassword);
		
		try {
			int Register=SignUpConnection.tosignUp(obj);
	            if(Register==1)
	            {
				RequestDispatcher rd=request.getRequestDispatcher("SignUpSuccess.jsp");
				rd.forward(request, response);
	            }
	            else if(Register==2)
	            {
	            	RequestDispatcher rd=request.getRequestDispatcher("SignUpError.jsp");
	    			rd.forward(request, response);
	            }
			}
			catch(Exception e)
			{
				e.printStackTrace();
			}
		

			}

}
