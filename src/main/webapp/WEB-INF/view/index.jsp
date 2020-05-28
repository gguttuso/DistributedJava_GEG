<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:set var="cp" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <link type="text/css" rel="stylesheet" href="${cp}/resources/css/style.css">
    <title>Home</title>
</head>
<body>
<div class="container">

            <header>
                <%@include file="/WEB-INF/view/header.jsp" %>
            </header>

        <div class="inside-container">
            <section class="menu">

                <security:authorize access="hasRole('USER')">
                <a href="details/user/showAddItemForm"> Add Item</a>
                </security:authorize><br><br>
                <a href="list/listPage"> List Items / Details</a><br><br>
                <a href="showLoginForm"> Login </a><br><br>
            </section>
 <h1> my store </h1>
            <%@include file="/WEB-INF/view/footer.jsp"%>
        </div>

</div>

</body>
</html>
