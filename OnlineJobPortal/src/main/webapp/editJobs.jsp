<%@page import="com.dao.JobDao" %>
<%@page import="com.DB.DBConnect" %>
<%@page import="com.entity.Jobs" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit Job</title>
<%@include file="Frontend/allCSS.jsp" %>
</head>
<body>
<c:if test="${userobj.role ne 'admin' }">
<c:redirect url="login.jsp"></c:redirect>
</c:if>

<%@include file="Frontend/navbar.jsp" %>

<div class="container p-2">
	<div class="col-md-10 offset-md-1">
		<div class="card">
			<div class="card-body">
				<div class="text-center text-success">
					<i class="fas fa-user-friends fa-3x"></i>
					
				
					<%
						int id = Integer.parseInt(request.getParameter("id"));
						JobDao dao = new JobDao(DBConnect.getConn());
						Jobs j = dao.getJobsById(id);
						
					%>						
						
						
						<h5>Edit Jobs</h5>
				</div>
				<form action="update" method="post">
					<input type="hidden" value="<%=j.getId() %>" name="id">
					<div class="form-group">
						<label>Enter Title </label> <input type="text" name="title"
							required class="form-control" value="<%=j.getTitle()%>">
					</div>	
					
					<div class="form-row">
						<div class="form-group col-md-4">
							<label>Location</label> <select name="location"
							class="custom-select" id="inlineFormCustomSelectpref">
								<option value="<%=j.getLocation() %>"><%=j.getLocation() %></option>
								<option value="Pune">Pune</option>
								<option value="Banglore">Banglore</option>
								<option value="Hydrabad">Hydrabad</option>
								<option value="Mumbai">Mumbai</option>
								<option value="Gurugram">Gurugram</option>
								<option value="Noida">Indore</option>
								<option value="Indore">Noida</option>
								<option value="Chennai">Chennai</option>
							</select>
						</div>
						
						<div class="form-group col-md-4">
							<label>Category</label> <select class="custom-select "
								id="inlineformCustoSelectPref" name="category">
									<option value="<%=j.getCategory() %>"><%=j.getCategory() %></option>
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
									<option value="<%= j.getExperience() %>"><%=j.getExperience() %></option>
								<option value="Fresher">Fresher</option>
								<option value="1-5">1-5</option>
								<option value="5-10">5-10</option>
								</select>
						</div>
						<div class="form-group col-md-4">
							<label>Status</label> <select class="form-control " name="status">
								<option class="Active" value="<%=j.getStatus() %>"><%=j.getStatus() %></option>
								<option class="Active" value="Active">Active </option>
								<option class="InActive" value="InActive">InActive </option>
								</select>
						</div>
					</div>	
					
					<div class="form-group">
						<label>Enter Description</label>
						<textarea required rows="6" cols="" name="desc"
							class="form-control"><%=j.getDescription() %></textarea>
					</div>	
					<button class="btn btn-success">Update Job</button>
				</form>
			</div>
		</div>
	</div>
</div>
</body>
</html>