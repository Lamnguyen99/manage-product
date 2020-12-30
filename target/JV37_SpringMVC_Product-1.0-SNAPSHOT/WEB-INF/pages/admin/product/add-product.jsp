<%-- 
    Document   : product.jsp
    Created on : Sep 29, 2020, 10:59:03 PM
    Author     : lamde
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="mvc"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="<c:url value="/webjars/bootstrap/3.4.1/css/bootstrap.min.css"/>"
              type="text/css" rel="stylesheet"/>
        <title>Create Product</title>
    </head>
    <body>
        <div class="container">
            <div class="row">
                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" style="text-align: center">
                    <c:if test="${action == 'add'}">
                        <h1>Create Product</h1>
                    </c:if>
                    <c:if test="${action == 'update'}">
                        <h1>Update Product</h1>
                    </c:if>
                </div>
            </div>
            <mvc:form action="${pageContext.request.contextPath}/admin/product/${action}"
                      method="POST" modelAttribute="product" enctype="multipart/form-data">
                <c:if test="${action == 'update'}">
                    <input value="${product.id}" name="id" hidden />
                </c:if>

                <div class="row">
                    <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
                        <div class="form-group">
                            <label>Name Product:</label>
                            <input type="text" class="form-control" 
                                   placeholder="Enter name" name="name" value="${product.name}">
                        </div>
                    </div>

                    <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
                        <div class="form-group">
                            <label>Description:</label></td>
                            <textarea name="description" rows="5"
                                      class="md-textarea form-control">${product.description}</textarea>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
                        <div class="form-group">
                            <label>Price:</label>
                            <input name="price" type="number" 
                                   class="form-control" value="${product.price}"/>
                        </div>
                    </div>

                    <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
                        <div class="form-group">
                            <label for="publishDate">Publish Date:</label></td>
                            <input name="publishDate" class="form-control" 
                                   type="date" value="${product.publishDate}"/>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
                        <div class="custom-control custom-checkbox">
                            <c:if test="${product.active}">
                                <input type="checkbox" name="active"
                                       class="custom-control-input" id="active" checked>
                                <label class="custom-control-label" for="active">Active</label>
                            </c:if>
                            <c:if test="${!product.active}">
                                <input type="checkbox" name="active" 
                                       class="custom-control-input" id="active">
                                <label class="custom-control-label" for="active">Active</label>
                            </c:if>
                        </div>
                    </div>

                    <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
                        <div class="form-group">
                            <label>Category:</label>
                            <select name="category.id" class="form-control">
                                <c:forEach items="${categories}" var="c">
                                    <c:if test="${c.id == product.category.id}">
                                        <option value="${c.id}" selected>${c.name}</option>
                                    </c:if>
                                    <c:if test="${c.id != product.category.id}">
                                        <option value="${c.id}">${c.name}</option>
                                    </c:if>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
                        <div class="form-group">
                            <label for="images">Images</label>
                            <input type="file" class="form-control-file" 
                                   id="images" name="file">
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12"
                         style="text-align: right">
                        <c:if test="${action == 'add'}">
                            <button class="btn btn-success" type="submit">Add Product</button>
                        </c:if>
                        <c:if test="${action == 'update'}">
                            <button class="btn btn-warning" type="submit">Update Product</button>
                        </c:if>
                    </div>
                </div>
            </mvc:form>
        </div>
    </body>
</html>
