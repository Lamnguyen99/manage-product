<%-- 
    Document   : home
    Created on : Sep 29, 2020, 8:44:47 AM
    Author     : lamde
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="tg" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="<c:url value="/webjars/bootstrap/3.4.1/css/bootstrap.min.css"/>"
              type="text/css" rel="stylesheet"/>
        <title>List product</title>
    </head>
    <body>
        <div class="container">
            <div class="row">
                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12"
                     style="text-align: center">
                    <h1>List Product</h1>
                </div>
            </div>

            <div class="row">
                <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
                    <button onclick="location.href = '<c:url value="/admin/product/add-product"/>'"
                            class="btn btn-success">create Product</button>
                </div>

                <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6" 
                     style="text-align: right">
                    <form action="${pageContext.request.contextPath }/admin/product/search" 
                          method="POST" class="form-inline">
                        <div class="form-group">
                            <input name="strSearch" class="form-control">
                            <input type="submit" value="Search" class="btn btn-primary">
                        </div>
                        <p><a href="<c:url value="/logout"/>">logout</a></p>
                    </form>
                </div>
            </div>

            <c:if test="${message != null && message != ''}">
                <div class="row">
                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12"
                         style="padding-top: 10px; background-color: #fbfdff;">
                        <c:if test="${type != null && type!= '' && type == 'error'}">
                            <div class="alert alert-danger">${message}</div>
                        </c:if>
                        <c:if test="${type != null && type!= '' && type == 'success'}">
                            <div class="alert alert-success">${message}</div>
                        </c:if>
                    </div>
                </div>
            </c:if>

            <br>

            <jsp:useBean id="pagedListHolder" scope="request"
                         type="org.springframework.beans.support.PagedListHolder" />

            <c:url value="/admin/product" var="pagedLink">
                <c:param name="p" value="~" />
            </c:url>

            <div class="row">
                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                    <div class="table-responsive">
                        <table class="table table-bordered table-hover">
                            <tr>
                                <th width="20%">name</th>
                                <th width="20%">description</th>
                                <th>price</th>
                                <th>publish Date</th>
                                <th>active</th>
                                <th>category</th>
                                <th>images</th>
                                <th>action</th>
                            </tr>
                            <c:if test="${pagedListHolder.pageList != null && fn:length(pagedListHolder.pageList)>0}">
                                <c:forEach items="${pagedListHolder.pageList}" var="p">
                                    <tr>
                                        <td>${p.name}</td>
                                        <td>${p.description}</td>
                                        <td>
                                            <fmt:formatNumber value="${p.price}" pattern="###,###" 
                                                              type="number"/>VNĐ
                                        </td>
                                        <td>
                                            <fmt:formatDate value="${p.publishDate}"
                                                            pattern="dd/MM/yyyy"/>
                                        </td>
                                        <td>${p.active}</td>
                                        <td>${p.category.name}</td>
                                        <td>
                                            <c:forEach items="${p.images}" var="img">
                                                <c:if test="${p.id == img.product.id}">
                                                    <a href="${pageContext.request.contextPath }/resources/images/${img.name}">
                                                        <img src="${pageContext.request.contextPath }/resources/images/${img.name}"
                                                             width="80" height="80"/>
                                                    </a>
                                                </c:if>
                                            </c:forEach>
                                        </td>
                                        <td>
                                            <button onclick="location.href = '<c:url value="/admin/product/update-product/${p.id}"/>'"
                                                    class="btn btn-warning">Update</button>                
                                            <button onclick="location.href = '<c:url value="/admin/product/delete-product/${p.id}"/>'"
                                                    class="btn btn-danger">Delete</button>
                                            <button onclick="location.href = '<c:url value="/admin/orderdetail/add/${p.id}"/>'"
                                                    class="btn btn-success">Order</button> 
                                        </td>
                                    </tr>
                                </c:forEach>
                            </c:if>
                            <c:if test="${pagedListHolder.pageList == null || fn:length(pagedListHolder.pageList)<=0}">
                                <tr>
                                    <td colspan="8" style="color: red ; text-align: center">
                                        Empty List!!!
                                    </td>
                                </tr>
                            </c:if>
                        </table>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" 
                     style="text-align: center">
                    <div class="pagination">
                        <tg:paging pagedListHolder="${pagedListHolder}"
                                   pagedLink="${pagedLink}"/>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
