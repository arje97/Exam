<%@ page import="java.util.Date" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>

<%! int day = 3; %>
<%! int fontSize = 20; %>

<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
</head>
<body>
<h1><%= "Hello World!" %>
</h1>
<br/>
<a href="hello-servlet">Hello Servlet</a>

<br>

<%
    int number = 100;
    number = 200;
%>

<%
    out.println("Server IP - " + request.getRemoteHost());
    number = 500;
%>

<br>

<%= new Date().toLocaleString() %>

<br>

<% if (day == 1 || day == 7) { %>
<p>Today is weekend</p>
<% } else { %>
<p>Today is not weekend</p>
<% } %>

<%
    for (int i = 30; i > fontSize; fontSize += 2) {
%>
<p style="font-size: <%=fontSize%>px">
    JSP
</p>
<%
    }
%>

<jsp:include page="data.jsp" flush="true" />

<jsp:useBean id="test" class="com.example.demo2.MessageBean" type="com.example.demo2.MessageBean">
    <jsp:setProperty name="test" property="message" value="Hello JSP"/>
</jsp:useBean>

<p>Message . . . </p>
<jsp:getProperty name="test" property="message"/>

<br>

<form action="main.jsp" method="post" target="_blank">
    First Name: <input type="text" name="first_name">
    <br>
    Last Name: <input type="text" name="last_name">
    <br>
    <input type="submit" value="Submit">
</form>

<%

    Cookie[] cookies = request.getCookies();

    if (cookies != null) {

        for (int i = 0; i < cookies.length; i++) {
            Cookie c = cookies[i];
            out.print(c.getName() + " - " + c.getValue() + "<br>");
        }

    } else {
        out.print("No cookies!");
    }

%>

<%
    session.setAttribute("NAME",  "Me");
    out.println(session.getAttribute("NAME"));
%>


<sql:setDataSource var = "snapshot" driver = "com.mysql.jdbc.Driver"
                   url = "jdbc:mysql://localhost/ug"
                   user = "root"  password = "password"/>

<sql:query dataSource = "${snapshot}" var = "result">
    SELECT * from STUDENTS;
</sql:query>

<br>

<table border="1" width="100%">

    <tr>
        <th>ID</th>
        <th>Name</th>
    </tr>

    <c:forEach var="row" items="${result.rows}">
        <tr>
            <td><c:out value="${row.id}" /></td>
            <td><c:out value="${row.name}" /></td>
        </tr>
    </c:forEach>

</table>

</body>
</html>