<%-- 
    Document   : order-product
    Created on : Oct 8, 2020, 10:37:56 AM
    Author     : lamde
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="mvc"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="<c:url value="/webjars/bootstrap/3.4.1/css/bootstrap.min.css"/>"
              type="text/css" rel="stylesheet"/>
        <title>Order Product</title>
    </head>
    <body>
        <div class="container">
            <div class="row">
                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12"
                     style="text-align: center">
                    <h1>Order Product</h1>
                </div>
            </div>

            <div class="row">
                <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
                    <h4>Order Date: <fmt:formatDate value="${day}"
                                    pattern="dd/MM/yyyy"/>
                    </h4>
                </div>

                <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6" style="text-align: right">
                    <h4>Quantity: <c:out value="${sessionScope.cartNum}"/></h4>
                </div>
            </div>

            <div class="row">
                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                    <div class="table-responsive">
                        <table class="table table-bordered table-hover">
                            <tr>
                                <th>Name</th>
                                <th>Price</th>
                                <th>Images</th>
                                <th>Quantity</th>
                                <th>total money</th>
                                <th>Action</th>
                            </tr>
                            <c:if test="${cart != null && fn:length(cart)>0}">
                                <c:forEach var="c" items="${sessionScope.cart}">
                                    <tr>
                                        <td>${c.value.product.name}</td>
                                        <td>
                                            <fmt:formatNumber value="${c.value.product.price}" pattern="###,###" 
                                                              type="number"/>
                                            VNĐ
                                        </td>
                                        <td>
                                            <c:forEach items="${c.value.product.images}" var="img">
                                                <c:if test="${c.value.product.id == img.product.id}">
                                                    <img src="${pageContext.request.contextPath}/resources/images/${img.name}"
                                                         alt="${img.name}"
                                                         width="80" height="80"/>
                                                </c:if>
                                            </c:forEach>

                                        </td>

                                        <td><button class="btn btn-none" onclick="location.href = '<c:url value="/admin/orderdetail/update/${c.value.product.id}/reduction/${c.value.quantity}"/>'">-</button>
                                            <span class="value">${c.value.quantity}</span>
                                            <button class="btn btn-none" onclick="location.href = '<c:url value="/admin/orderdetail/update/${c.value.product.id}/increase/${c.value.quantity}"/>'">+</button></td>

                                        </td>

                                        <td>
                                            <fmt:formatNumber value="${c.value.quantity * c.value.product.price}" 
                                                              pattern="###,###" 
                                                              type="number"/>VNĐ
                                        <td>
                                            <button onclick="location.href = '<c:url value="/admin/orderdetail/remove/${c.value.product.id}"/>'"
                                                    class="btn btn-danger">Delete</button>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </c:if>
                            <c:if test="${cart == null || fn:length(cart) <= 0}">
                                <tr>
                                    <td colspan="8" style="color: red ; text-align: center">
                                        the cart is empty!!!
                                    </td>
                                </tr>
                            </c:if>
                        </table>

                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
                    <div class="total_left">
                        <button onclick="location.href = '<c:url value="/admin/product"/>'"
                                class="btn btn-primary">back</button> 

                    </div>
                </div>
                <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6" style="text-align: right">
                    Total Price:
                    <fmt:formatNumber value="${totalPrice}" pattern="###,###" 
                                      type="number"/>VNĐ <br>
                    <c:if test="${cart != null && fn:length(cart) > 0}">
                        <button onclick="location.href = '<c:url value="/admin/orderdetail/checkout"/>'"
                                class="btn btn-success">Continue</button> 
                    </c:if>
                </div>
            </div>

        </div>

    </body>
</html>
