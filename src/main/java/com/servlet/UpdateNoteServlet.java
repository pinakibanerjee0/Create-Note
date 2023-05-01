package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.entities.Notes;
import com.helper.FactoryProvider;


public class UpdateNoteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public UpdateNoteServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			String title = request.getParameter("title");
			String content = request.getParameter("content");
			Long id = Long.parseLong(request.getParameter("Note_Id"));
			
			
			Session session = FactoryProvider.getSessionFactory().openSession();
			Transaction transaction = session.beginTransaction();
			
			Notes note = (Notes)session.get(Notes.class, id);
			note.setName(title);
			note.setContent(content);
			note.setAddedDate(new Date());
			System.out.println("Id: "+note.getId()+", Title: "+note.getName()+", content: "+note.getContent());

			session.save(note);
			transaction.commit();
			session.close();
			
			response.sendRedirect("allNotes.jsp");
		
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
