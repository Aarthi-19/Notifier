package project;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import GetterSetter.Notesgetset;
import database.NotesConnection;

@WebServlet("/addNotes")
public class AddNotes extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=request.getSession();
		
		String Email=(String)session.getAttribute("email");
		String NotebookName=(String)session.getAttribute("NotebookName");
		String NotesName=request.getParameter("notename");
		String StartDate=request.getParameter("startdate");
		String EndDate=request.getParameter("enddate");
		String RemainderDate=request.getParameter("remainderdate");
		String Status=request.getParameter("status");
		String Tag=request.getParameter("tag");
		String Description=request.getParameter("description");
		
		Notesgetset obj=new Notesgetset();
		obj.setDescription(Description);
		obj.setEmail(Email);
		obj.setEndDate(EndDate);
		obj.setNotebookName(NotebookName);
		obj.setNotesName(NotesName);
		obj.setRemainderDate(RemainderDate);
		obj.setStartDate(StartDate);
		obj.setStatus(Status);
		obj.setTag(Tag);
		
		try {
			
			int out=NotesConnection.toAddNotes(obj);
			if(out!=0)
			{
				RequestDispatcher rd=request.getRequestDispatcher("Notebookview.jsp");
				rd.forward(request, response);
			}
		} catch (ClassNotFoundException e) 
		{	
			e.printStackTrace();
		} 
		catch (SQLException e) 
		{
			e.printStackTrace();
		}
		
		
		
	}

}
