<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Job</title>
<%@include file="Frontend/allCSS.jsp" %>
</head>
<body>

<c:if test="${userobj.role ne 'admin' }">
<c:redirect url="login.jsp"></c:redirect>
</c:if>

<%@include file="Frontend/navbar.jsp" %> 
<%-- <%@include file="Frontend/navbar2.jsp" %>--%>

<div class="container p-2">
	<div class="col-md-10 offset-md-1">
		<div class="card">
			<div class="card-body">
				<div class="text-center text-success">
					<i class="fas fa-user-friends fa-3x"></i>
					<c:if test="${not empty succMsg}">
						<div class="alert alert-success" role="alert">${ succMsg}</div>
						<c:remove var="succMsg" />
						</c:if>
						
						<h5>Add Jobs</h5>
				</div>
				<form action="addjob" method="post">
					<div class="form-group">
						<label>Enter Title </label> <input type="text" name="title"
							required class="form-control">
					</div>	
					
					<div class="form-row">
						<div class="form-group col-md-4">
							<label>Location</label> <select name="location"
							class="custom-select" id="inlineFormCustomSelectpref">
								<option selected>Choose Location</option>
								<option value="Pune">Pune</option>
								<option value="Banglore">Banglore</option>
								<option value="Hydrabad">Hydrabad</option>
								<option value="Mumbai">Mumbai</option>
								<option value="Gurugram">Gurugram</option>
								<option value="Noida">Noida</option>
								<option value="Indore">Indore</option>
								<option value="Chennai">Chennai</option>
							</select>
						</div>
						
						<div class="form-group col-md-4">
							<label>Category</label> <select class="custom-select "
								id="inlineformCustoSelectPref" name="category">
									<option selected>Choose Designation</option>
								<option value="IT-Sector">IT</option>
								<option value="Software Developer">Software Developer</option>
								<option value="BDE">Buisness Development Executive</option>
								<option value="Subjective Expert">Subjective Expert</option>
								<option value="HR Executive">HR Executive</option>
								</select>
						</div>
						
						<div class="form-group col-md-4">
							<label>Experience</label> <select class="custom-select "
								id="inlineformCustoSelectPref" name="experience">
									<option selected>Experience</option>
								<option value="Fresher">Fresher</option>
								<option value="1-5">1-5</option>
								<option value="5-10">5-10</option>
								</select>
						</div>
						<div class="form-group col-md-4">
							<label>Status</label> <select class="custom-select "
								id="inlineformCustoSelectPref" name="status">
								<option value="Active">Active</option>
								<option value="InActive">InActive</option>
								</select>
						</div>
					</div>	
					
					<div class="form-group">
						<label>Enter Description</label>
						<textarea required rows="6" cols="" name="desc"
							class="form-control"></textarea>
					</div>	
					<button class="btn btn-success">Publish Job</button>
				</form>
			</div>
		</div>
	</div>
</div>
</body>
</html>