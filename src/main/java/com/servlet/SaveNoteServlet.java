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

public class SaveNoteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public SaveNoteServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			String title = request.getParameter("title");
			String content = request.getParameter("content");

			Notes note = new Notes(title, content, new Date());
			System.out.println("Id: "+note.getId()+", Title: "+note.getName()+", content: "+note.getContent());
			
			Session session = FactoryProvider.getSessionFactory().openSession();
			Transaction transaction = session.beginTransaction();
			session.save(note);
			transaction.commit();
			session.close();
			
			response.setContentType("text/html");
			PrintWriter writer = response.getWriter();
			writer.println("<h1 style = 'text-align:center;'> Note Added Sucessfully </h1>");
			writer.println("<h1 style = 'text-align:center;'><a href='allNotes.jsp'>"
					+ " Show All Notes</a> </h1>");

		
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
