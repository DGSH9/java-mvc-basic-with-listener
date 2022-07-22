<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!-- For form -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!-- For JSTL -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored='false'%>

<!doctype html>
<html lang="en">
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">

<title><c:out value="${page}"></c:out></title>
</head>
<body>
	<div class="container mt-3">
		<h1 class="text-center">Welcome to TODO Manager</h1>



		<!-- Checking todo is added or not post method-->
		<c:if test="${not empty message}">
			<div class="alert alert-success">
				<c:out value="${message}"></c:out>
			</div>
		</c:if>


		<!-- Creating a Form  -->
		<div class="row mt-5">

			<!-- Menu Column -->
			<div class="col-md-2">
				<div class="list-group">
					<button type="button"
						class="list-group-item list-group-item active">Menu</button>
					<a href='<c:url value="/add"></c:url>' type="button"
						class="list-group-item list-group-item">Add TODO</a> <a
						href='<c:url value="/home"></c:url>' type="button"
						class="list-group-item list-group-item">View TODO</a>
				</div>
			</div>

			<!-- Content Column -->
			<div class="col-md-10">
				<h3 class="text-center">Content</h3>
				<br />


				<!-- Printing todos by getting from listener -->
				<c:if test="${page=='views' }">
					<h1 class="text-center">Vies All TODOS</h1>

					<c:forEach items="${todos }" var="t">
						<div class="card">
							<div class="card-body">
								<h3>
									<c:out value="${t.todoTitle}"></c:out>
								</h3>
								<p>
									<c:out value="${t.todoContent}"></c:out>
								</p>
							</div>
						</div>
					</c:forEach>

				</c:if>


				<c:if test="${page=='add'}">
					<h1 class="text-center">Add TODO</h1>
					<form:form action="saveTodo" method="post" modelAttribute="todo">
						<div class="form-group">
							<form:input path="todoTitle" cssClass="form-control"
								placeholder="Enter Todo Title"></form:input>
						</div>

						<div class="form-group">
							<form:textarea path="todoContent" cssClass="form-control "
								placeholder="Eneter Todo Content" cssStyle="height:300px;"></form:textarea>
						</div>
						<div class="container text-center">
							<button class="btn btn-outline-success">Add Todo</button>
						</div>

					</form:form>
				</c:if>
			</div>

		</div>


	</div>






















	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
		integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"
		integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"
		integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
		crossorigin="anonymous"></script>
</body>
</html>