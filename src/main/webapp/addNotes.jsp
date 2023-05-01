<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<%@include file="all_js_css_includes.jsp"%>

<title>Insert New Note</title>
</head>
<body>
	<div class="container-fluid">

		<%@include file="navBar.jsp"%>

	</div>
	<div class="container">

		<h3>Create New Note</h3>
		<!--Create Note Form  -->
		<form action="SaveNoteServlet" method="Post">
			<div class="form-group">
				<label for="title">Title</label> <input name="title" required
					type="text" class="form-control" id="title"
					placeholder="Enter Note Title">

			</div>
			<div class="form-group">
				<label for="content">Content</label>
				<textarea name="content" required id="content"
					placeholder="Enter Note Content Here" class="form-control"
					style="height: 300px"></textarea>
			</div>
			<div class="container text-center">
				<button type="submit" class="btn btn-primary">Save Note</button>
			</div>
		</form>
	</div>

</body>
</html>