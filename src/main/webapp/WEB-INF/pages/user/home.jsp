<%-- 
    Document   : home
    Created on : Oct 25, 2020, 2:59:40 PM
    Author     : lamde
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <sec:authorize access="!isAuthenticated()">
            <p><a href="<c:url value="/login"/>">login</a></p>
        </sec:authorize>
        <sec:authorize access="isAuthenticated()">
            <p><a href="<c:url value="/logout"/>">logout</a></p>
        </sec:authorize>
    </body>
</html>
