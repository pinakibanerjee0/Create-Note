<%@page import="java.util.List"%>
<%@page import="org.hibernate.Query"%>
<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page import="com.helper.FactoryProvider"%>
<%@page import="com.entities.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<%@include file="all_js_css_includes.jsp"%>
<title>My Notes</title>
</head>
<body>
	<div class="container-fluid">
		<%@include file="navBar.jsp"%>
	</div>
	<div class="container text-center">
		<h3>My Notes</h3>
	</div>
	<div class="container-fluid">
		<%
			Session s = FactoryProvider.getSessionFactory().openSession();
			Query q = s.createQuery("From Notes");
			List<Notes> noteList = q.list();

			for (Notes note : noteList) {
		%>

		<div class="card m-4" style="background: #fcba03;">
			<img class="card-img-top m-4" style="max-width: 30px;"
				src="img/note.png" alt="Card image cap">
			<div class="card-body">
				<h5 class="card-title"><%=note.getId() + " : " + note.getName()%></h5>
				<p class="card-text"><%=note.getContent()%></p>
				<div class="container text-center" m-4>
					<a href="DeleteNoteServlet?Note_Id=<%=note.getId()  %>" class="btn btn-danger">Delete</a> 
					<a href="editNote.jsp?Note_Id=<%=note.getId()  %>" class="btn btn-primary">Update</a>
				</div>
			</div>
		</div>
		<%
			}

			s.close();
		%>
	</div>


</body>
</html>