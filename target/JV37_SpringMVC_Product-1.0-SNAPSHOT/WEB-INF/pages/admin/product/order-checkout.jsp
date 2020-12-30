<%-- 
    Document   : order-checkout
    Created on : Oct 8, 2020, 4:20:20 PM
    Author     : lamde
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="mvc"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="<c:url value="/webjars/bootstrap/3.4.1/css/bootstrap.min.css"/>"
              type="text/css" rel="stylesheet"/>
        <title>JSP Page</title>
    </head>
    <body>
        <div class="container">
            <div class="row">
                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" style="text-align: center">
                    <h1>Customer Info</h1>
                </div>
            </div>

            <mvc:form action="${pageContext.request.contextPath}/admin/orderdetail/saveOrder"
                      method="POST" modelAttribute="order" enctype="multipart/form-data">
                <div class="row">
                    <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
                        <div class="form-group">
                            <label>Name: </label>
                            <input type="text" class="form-control" 
                                   placeholder="Enter name" name="name" value="${order.name}">
                            <p style="color: red"><mvc:errors path="name"/></p>
                        </div>
                    </div>
                    <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
                        <div class="form-group">
                            <label>Email: </label>
                            <input type="text" class="form-control" 
                                   placeholder="Enter Email" name="email" value="${order.email}">
                            <p style="color: red"><mvc:errors path="email"/></p>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
                        <div class="form-group">
                            <label>Address: </label>
                            <input type="text" class="form-control" 
                                   placeholder="Enter address" name="address" value="${order.address}">
                            
                            <p style="color: red"><mvc:errors path="address"/></p>
                        </div>
                    </div>
                    <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
                        <div class="form-group">
                            <label>SĐT: </label>
                            <input type="text" class="form-control" 
                                   placeholder="Enter sdt" name="phone" value="${order.phone}">
                            <p style="color: red"><mvc:errors path="phone"/></p>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" style="text-align: right">
                        <button class="btn btn-success" type="submit">Confirm</button>
                    </div>
                </div>
            </mvc:form>
        </div>	
    </body>
</html>
