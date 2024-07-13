<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@page import="java.util.List"%>
<%@page import="com.dao.JobDao" %>
<%@page import="com.DB.DBConnect" %>
<%@page import="com.entity.Jobs" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User Home Page</title>
<%@include file="Frontend/allCSS.jsp" %>
</head>
<body style="background-color : #f0f1f2;">
	<c:if test="${empty userobj }">
		<c:redirect url="login.jsp" />
	</c:if>
	<%@include file="Frontend/navbar.jsp" %>	
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<h5 class="tetx-center text-primary">All Jobs</h5>
				<c:if test="${not empty succMsg }">
					<h4 class="text-center text-danger">${succMsg }</h4>
					<c:remove var="succMsg"/>
				</c:if>
				
				<div class="card">
					<div class="card-body">
						
						<form class="form-inline" action="more_view.jsp" method="get">
							<div class="form-group col-md-5 mt-1">
								<h5>Location</h5>
							</div>
							
							<div class="form-group col-md-4 mt-1">
								<h5>Category</h5>
							</div>
							
							<div class="form-group col-md-5">
								<select name="loc" class="custom-select "
									id="inlineFormCustomSelectpref">
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
							
							<div class="form-group col-m-5">
								<select class="custom-select "id="inlineFormCustomSelectpref"
									name="cat">
									<option selected>Choose Designation</option>
									<option value="IT-Sector">IT</option>
									<option value="Software Developer">Software Developer</option>
									<option value="Buisness Development Executive">Buisness Development Executive</option>
									<option value="Subjective Expert">Subjective Expert</option>
									<option value="HR Executive">HR Executive</option>
								</select>
							</div>
							<button class="btn btn-success">Submit</button>
						</form>
					</div>
				</div>	
				
				<%
				JobDao dao = new JobDao(DBConnect.getConn());
				List<Jobs> lst = dao.getAllJobForUser();
				for(Jobs j : lst){
				%>
				<div class="card-mt-2">
					<div class="card-body">
					<div class="text-center text-primary">
						<i class="fas fa-clipboard fa-2x"></i>
					</div>
				
					<h6><%=j.getTitle() %></h6>
					
					<%
					if(j.getDescription().length() > 0 && j.getDescription().length() < 120){
					%>
				    <p><%=j.getDescription()%></p>
					<%
					}else{
					%>
					<p><%=j.getDescription().substring(0,120) %>...</p>
					<%
					}
					%>
					
					<br>
					<div class="form-row">
						<div class="form-group col-md-3">
							<input type="text" class="form-control form-control-sm"
								value="Location: <%=j.getLocation() %>" readonly>
						</div>
						<div class="form-group col-md-3">
							<input type="text" class="form-control form-control-sm"
								value="Category: <%=j.getCategory() %>" readonly>
						</div>
					</div>
					<h6>
						Publish Date:
						<%=j.getPdate().toString() %>
					</h6>
					
					<div class="text-center">
						<a href="one_view.jsp?id=<%=j.getId() %>"
							class="btn btn-sm bg-success text-white">View More</a>
					</div>
				</div>
				</div>
				<%}
				%>
			</div>
		</div>
	</div>
	
</body>
</html>