<%@page import="Model.User"%>
<%@page import="Connection.UserDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

</head>
<body>
<% 
 String name=request.getParameter("name");  
 String email=request.getParameter("email");  
 String phone=request.getParameter("phone");  
 
 User e=new User();  
 
 e.setName(name);  
 e.setEmail(email);  
 e.setPhone(phone);  
 
 int status= UserDao.save(e);
 
 if(status >0)
 {
	out.print("Data Inserted");
    request.getRequestDispatcher("index.jsp").include(request, response);  
 }   
 else
 {  
     out.println("Sorry! unable to save record");  
 }  
 out.close(); 
 %>
</body>
</html>