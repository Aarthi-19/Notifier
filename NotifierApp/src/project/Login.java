package project;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import GetterSetter.Logingetset;
import GetterSetter.SignUpgetset;
import database.LoginConnection;
import database.SignUpConnection;
@WebServlet("/Login1")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html");
		String email=request.getParameter("email");
		String password=request.getParameter("password");
		Logingetset log = new Logingetset();
		log.setEmail(email);
		log.setPassword(password);
		HttpSession session=request.getSession();
		session.setAttribute("email",email);
		try {
			int output=LoginConnection.toLogin(log);
	            if(output==1)
	            {
				RequestDispatcher rd=request.getRequestDispatcher("LoginSuccess.jsp");
				rd.forward(request, response);
	            }
	            else if(output==2)
	            {
	            	RequestDispatcher rd=request.getRequestDispatcher("LoginError.jsp");
	    			rd.forward(request, response);
	            }
			}
			catch(Exception e)
			{
				e.printStackTrace();
			}
		
		
	}

}
