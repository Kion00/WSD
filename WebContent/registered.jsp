<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="uts.wsd.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
   String gender = request.getParameter("gender");
   String id = request.getParameter("id");
   String firstname = request.getParameter("firstname");
   String lastname = request.getParameter("lastname");
   String email = request.getParameter("email");
   String password;
   String password1=request.getParameter("password1");
   String password2=request.getParameter("password2");
   if (password1=password2)
   {
	   return password=password1;
   }else {
	   system.out.println("password doesn't match, please try again.");
   }
%>
<%User user = new User(email, firstname,lastname, password, gender);
session.setAttribute("user", user);

%>
</body>
</html>