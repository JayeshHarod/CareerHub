<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit Profile Page</title>
<%@include file="Frontend/allCSS.jsp" %>
</head>
<body>
<c:if test="${empty userobj }">
	<c:redirect url="login.jsp"/>
</c:if>

	<%@include file="Frontend/navbar.jsp" %>
	<div class="container-fluid">
		<div class="row p-4">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">
						<div class="text-center">
							<i class="fa fas-user-plus fa-2x" aria-hidden="true"></i>
							
							<h5>Edit Profile</h5>
						</div>
						
						<form action="update_profile" method="post">
							<input type="hidden" name="id" value="${userobj.id }">
							<div class="form-group">
								<label>Enter Full Name</label> <input type="text"
								required="required"  class="form-control"
								id="exampleInputEmail1" aria-describedby="email-help"
								name="name" value="${userobj.name }">
							</div>
							
							<div class="form-group">
								<label>Enter Qualification</label> <input type="text"
								required="required"  class="form-control"
								id="exampleInputEmail1" aria-describedby="email-help"
								name="qua" value="${userobj.qualification }">
							</div>
							
							<div class="form-group">
								<label>Enter Full Name</label> <input type="email"
								required="required"  class="form-control"
								id="exampleInputEmail1" aria-describedby="email-help"
								name="email" value="${userobj.email }">
							</div>
							
							<div class="form-group">
								<label for="exampleInputPassword1">Enter Password</label>
								<input required="required" type="password" class="form-control"
								id="exampleInputPassword1" name="ps"
								value="${userobj.password }">
							</div>
						
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>	
</body>
</html>