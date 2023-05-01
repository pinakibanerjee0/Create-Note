package com.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.entities.Notes;
import com.helper.FactoryProvider;

/**
 * Servlet implementation class DeleteNoteServlet
 */
public class DeleteNoteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
    public DeleteNoteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try{
			Long noteId = Long.parseLong(request.getParameter("Note_Id").trim());
			
			Session session = FactoryProvider.getSessionFactory().openSession();
			Transaction transaction = session.beginTransaction();
			
			Notes note = session.get(Notes.class, noteId);
			session.delete(note);
			transaction.commit();
			session.close();
			//FactoryProvider.closeFactory();
			
			response.sendRedirect("allNotes.jsp");
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

	
}
