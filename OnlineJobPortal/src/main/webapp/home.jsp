<%@ page import="com.DB.DBConnect" %>
<%@page import="java.sql.Connection" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User Home</title>
<%@include file ="Frontend/allCSS.jsp" %>

<style type="text/css">
.back-img{

background:	url("images/img3.jpg");
width:100%;
height:100vh;
background-repeat:no-repeat;
background-size:cover;

}	
</style>
</head>
<body>
<%@include file ="Frontend/navbar.jsp" %>

<%Connection conn = DBConnect.getConn();
%>
<div class="container-fluid back-img">

<div class="text-center">
<h1 class="text-blue p-4">
<i class="fa fa-book"aria-hidden="true"></i> Welcome to CareerHub</h1>
<p>Your one-stop solution for job searching and recruitment</p>
</div>
</div>

</body>
</html>