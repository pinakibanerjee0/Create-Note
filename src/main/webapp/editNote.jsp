<%@page import="com.entities.Notes"%>
<%@page import="com.helper.FactoryProvider"%>
<%@page import="org.hibernate.Session"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Edit Your Note</title>
<%@include file="all_js_css_includes.jsp"%>
</head>
<body>
	<div class="container-fluid">
		<%@include file="navBar.jsp"%>
	</div>
	<div class="container">

		<h3>Edit Note</h3>
		<!--Create Note Form  -->
		<%
			Long noteId = Long.parseLong(request.getParameter("Note_Id").trim());
			Session s = FactoryProvider.getSessionFactory().openSession();
			Notes note = (Notes) s.get(Notes.class, noteId);
		%>
		<form action="UpdateNoteServlet?Note_Id=<%=note.getId()%>"
			method="Post">
			<div class="form-group">
			<input name="Note_Id" type="hidden" value=<%=note.getId()%>>
				<label for="title">Title</label> <input name="title" type="text"
					class="form-control" id="title" value=<%=note.getName()%>>

			</div>
			<div class="form-group">
				<label for="content">Content</label>
				<textarea name="content" id="content"  class="form-control"
					style="height: 300px" > <%= note.getContent() %> </textarea>
			</div>
			<div class="container text-center">
				<button type="submit" class="btn btn-success">Save Note</button>
			</div>
		</form>
	</div>

</body>
</html>