package database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import GetterSetter.Notebookgetset;
import GetterSetter.Notesgetset;

public class NotesConnection {

	
	static int out=0;
	
	public static int toAddNotes(Notesgetset obj) throws ClassNotFoundException, SQLException {
        try
         {	
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/notifier","root","Aarthi@123");
       
		ResultSet rs,rs1;
	    Statement st=conn.createStatement();
		String sql="insert into notifiernotes(EmailId,BookName,NotesName,StartDate,EndDate,RemainderDate,Status,Tag,Description) values(?,?,?,?,?,?,?,?,?)";
			PreparedStatement ps=conn.prepareStatement(sql);
		ps.setString(1, obj.getEmail());
		ps.setString(2, obj.getNotebookName());
		ps.setString(3, obj.getNotesName());
		ps.setString(4,obj.getStartDate());
		ps.setString(5, obj.getEndDate());
		ps.setString(6, obj.getRemainderDate());
		ps.setString(7, obj.getStatus());
		ps.setString(8, obj.getTag());
		ps.setString(9, obj.getDescription());
	        out=ps.executeUpdate();
	        
         }
	
	catch(Exception e)
	{
	e.printStackTrace();
	}	
	return out;

	
	
	
	}
}
