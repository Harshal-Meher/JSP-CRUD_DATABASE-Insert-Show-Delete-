<%@page import="java.util.List"%>
<%@page import="Connection.UserDao"%>
<%@page import="Model.User"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>JSP-CRUD</title>   
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
    
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
            margin: 0;
            padding: 0;
        }

        h1 {
            background-color: #333;
            color: #fff;
            padding: 10px;
            text-align: center;
        }

        form {
            background-color: #fff;
            padding: 20px;
            margin: 20px auto;
            width: 400px;
            border-radius: 5px;
            box-shadow: 0px 0px 10px #888888;
        }

        form input[type="text"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        form input[type="submit"] {
            width: 100%;
            padding: 10px;
            background-color: #333;
            color: #fff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        table {
            width: 80%;
            margin: 20px auto;
            border-collapse: collapse;
        }

        table, th, td {
            border: 1px solid #ccc;
        }

        th, td {
            padding: 10px;
            text-align: left;
        }

        th {
            background-color: #333;
            color: #fff;
        }

       
    </style>
</head>
<body>
    <!-- Form -->
    <form action="save.jsp">
        <h1>JSP-CRUD</h1>
        Name : <input type="text" name="name"><br>
        Email : <input type="text" name="email"><br>
        Phone : <input type="text" name="phone"><br>
        <input type="submit" value="Go">
    </form>
    <br><br>

    <%
List<User> list = UserDao.getAllEmployees();
int userIdCounter = 1;
%>

<table>
    <thead>
        <tr>
            <th>id</th>
            <th>Name</th>
            <th>Email</th>
            <th>Phone</th>
            <th>Edit</th>
            <th>Delete</th>
        </tr>
    </thead>
    <tbody>
        <% for (User user : list) { %>
            <tr>
                <td><%= userIdCounter %></td>
                <td><%= user.getName() %></td>
                <td><%= user.getEmail() %></td>
                <td><%= user.getPhone() %></td>
                <td><a href="#" class="btn btn-outline-primary">Edit</a></td>
                <td><a href="delete.jsp?id=<%= user.getId() %>" class="btn btn-outline-warning">Delete</a></td>
            </tr>
            <% userIdCounter++; %>
        <% } %>
    </tbody>
</table>

</body>
</html>
