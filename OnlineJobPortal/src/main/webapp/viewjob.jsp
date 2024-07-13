<%@page import="java.util.List"%>
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
<title>View Jobs</title>
<%@include file="Frontend/allCSS.jsp" %>
</head>
<body>
<c:if test="${userobj.role ne 'admin' }">
<c:redirect url="login.jsp"></c:redirect>
</c:if>
<%@include file="Frontend/navbar.jsp"%> 
<%--<%@include file="Frontend/navbar2.jsp" %>--%>
<div class="container">
	<div class="row">
		<div class="col-md-12">
			
			<h5 class="text-center text-primary">All Jobs</h5>
			<c:if test="${not empty succMsg}">
						<div class="alert alert-success" role="alert">${ succMsg}</div>
						<c:remove var="succMsg" />
			</c:if>
			<%
				JobDao dao = new JobDao(DBConnect.getConn());
				List<Jobs> lst = dao.getAllJobs();
				for(Jobs j : lst){
				%>
				<div class="card-mt-2">
					<div class="card-body">
					<div class="text-center text-primary">
						<i class="fas fa-clipboard fa-2x"></i>
					</div>
				
					<h6><%=j.getTitle() %></h6>
					<p><%=j.getDescription()%></p>
					<br>
					<div class="form-row">
						<div class="form-group col-md-3">
						<input type="text" class="form-control form-control-sm"
						 value="Location:<%=j.getLocation() %>" readonly>
						</div>
						
						<div class="form-row">
							<div class="form-group col-md-3">
						<input type="text" class="form-control form-control-sm"
						 value="Category:<%=j.getCategory() %>" readonly>
						</div>
						
						<div class="form-group col-md-3">
							<input type="text" class="form-control form-control-sm"
							value="Experience:<%=j.getExperience() %>"readonly>
						</div>
						<div class="form-group col-md-3">
						<input type="text" class="form-control form-control-sm"
						 value="Status:<%=j.getStatus() %>" readonly>
						</div>
					</div>
					
					</div>
					<h6>Publish Date:
					<%=j.getPdate() %> </h6>
					<div class="text-center ">
						<a href="editJobs.jsp?id=<%=j.getId() %>" class="btn btn-sm bg-success text-white"> Edit</a>
						<a href="delete?id=<%=j.getId() %>" class="btn btn-sm bg-danger text-white"> Delete</a>
					</div>
					</div>
					
				</div>
				
					
				<%}
			
			%>	
			
		<%-- 	<div class="card-mt-2">
				<div class="card-body">
					<div class="text-center text-primary">
						<i class="fas fa-clipboard fa-2x"></i>
					</div>
				
					<h6>Title</h6>
					<p>Description</p>
					<br>
					<div class="form-row">
						<div class="form-group col-md-3">
						<input type="text" class="form-control form-control-sm"
						 value="Location:" readonly>
						</div>
						
						<div class="form-row">
							<div class="form-group col-md-3">
						<input type="text" class="form-control form-control-sm"
						 value="Category:" readonly>
						</div>
						
						<div class="form-group col-md-3">
						<input type="text" class="form-control form-control-sm"
						 value="Status:" readonly>
						</div>
					</div>
					
					</div>
					<h6>Publish Date:2021-06-31 </h6>
					<div class="text-center ">
						<a href="#" class="btn btn-sm bg-success text-white"> Edit</a>
						<a href="#" class="btn btn-sm bg-danger text-white"> Delete</a>
					</div>
					</div>
					
				</div>
				--%>
			
		</div>
	</div>
</div>

</body>
</html>