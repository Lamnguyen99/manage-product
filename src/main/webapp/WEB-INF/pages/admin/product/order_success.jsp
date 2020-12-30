<%-- 
    Document   : order_success
    Created on : Nov 7, 2020, 5:41:43 PM
    Author     : lamde
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Order Success</title>
        <link href="<c:url value="/webjars/bootstrap/3.4.1/css/bootstrap.min.css"/>"
              type="text/css" rel="stylesheet"/>
    </head>
    <body>
        <div class="col-lg-12" style="text-align: center">
            <div class="error-wrapper text-center ptb-50 pt-xs-20">
                <div class="error-text">
                    <h1 style="font-size: 50px;">Successful Booking!!!</h1>
                    <h2>
                        Your room has been booked</h2>
                    <p>
                    </p>
                </div>
                <button onclick="location.href = '<c:url value="/admin/product"/>'"
                        class="btn btn-primary">back to home</button> 
            </div>
        </div>
    </body>
</html>
