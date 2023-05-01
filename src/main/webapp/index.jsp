<!doctype html>
<html lang="en">
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<%@include file="all_js_css_includes.jsp"%>
<title>Welcome Page</title>
</head>
<body>

	<div class="container-fluid">
		<%@include file="navBar.jsp"%>
	</div>
	<div class="container text-center">
		<h3>Start Creating Notes</h3>
	</div>
	<div class="container text-center">
		<div class="card m-4" style="background: #34ebc0;">
			<img class="img-fluid  mx-auto" style="max-width: 300px;"
				src="img/note.png" alt="Card image cap">
			<div class="card-body">
				<h5 class="card-title text-center ">Write Anything
					Anywhere...</h5>
				<a href="addNotes.jsp" class="btn btn-success text-center m-4">Getting
					Started</a>
			</div>
		</div>
	</div>


</body>
</html>