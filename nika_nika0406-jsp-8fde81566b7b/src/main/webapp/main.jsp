<%--
  Created by IntelliJ IDEA.
  User: nikolozkatsitadze
  Date: 04.10.21
  Time: 19:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%

    Cookie firstName =  new Cookie("first_name", request.getParameter("first_name"));
    Cookie lastName =  new Cookie("last_name", request.getParameter("last_name"));

    firstName.setMaxAge(60 * 60 * 24);
    lastName.setMaxAge(60 * 60 * 24);

    response.addCookie(firstName);
    response.addCookie(lastName);

%>

<html>
<head>
    <title>Title</title>
</head>
<body>

<ul>
    <li>
        <p>First name : <%= request.getParameter("first_name")%>
        </p>
    </li>
    <li>
        <p>Last name : <%= request.getParameter("last_name")%>
        </p>
    </li>
</ul>

</body>
</html>
