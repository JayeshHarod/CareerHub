<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ page isELIgnored="false" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin</title>
<%@include file="Frontend/allCSS.jsp" %>
</head>
<style type="text/css">
.back-img{
background: url("images/img2.jpg");
width:100%;
height:100vh;
background-repeat:no-repeat;
background-size:cover;
}
</style>
<body>

<c:if test="${userobj.role ne 'admin' }">
<c:redirect url="login.jsp"></c:redirect>
</c:if>
<%@include file="Frontend/navbar.jsp" %>

<div class ="container-fluid back-img">
	<div class="text-center">
		<h1 class="text-black" p-4>Welcome Admin</h1>
	</div>

</div>

</body>
</html>