package project;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import GetterSetter.Notebookgetset;
import database.AddNotebookConnection;

@WebServlet("/add")
public class AddNoteBook extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String notebook=request.getParameter("notebook");	
		System.out.println(notebook);
		HttpSession session=request.getSession();
		session.setAttribute("notebook", notebook);
		String email=(String) session.getAttribute("email");		
		System.out.println(email);
		Notebookgetset obj=new Notebookgetset();
		obj.setEmail(email);
		obj.setNotebook(notebook);
		int i=0;
		try
		{
		int ins=AddNotebookConnection.toAdd(obj);
		if(ins==1)
		{
			RequestDispatcher rd=request.getRequestDispatcher("Notebookview.jsp");
			rd.forward(request, response);		
		}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
}
}