<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:set var="cp" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <link type="text/css" rel="stylesheet" href="${cp}/resources/css/style.css">
    <title>Item Detail</title>
</head>
<body>

<div class="container">
    <div class="inside-container">
        <header>
            <%@include file="/WEB-INF/view/header.jsp" %>
            <nav><h3><a href="../login/login.jsp"> login </a></h3></nav>
        </header>

        <!-- item list table -->
        <form:form action="${cp}/details/user/save" modelAttribute="aItem" method="post">
            <label> Name </label>
            <form:input path="name"/>

            <br><br>

            <label> Sizes </label>
             <form:select path="detail" items="${detailList}" itemLabel="size" itemValue="id">
<%--            <c:forEach var="tempDetail" items="${items.detail}">--%>
<%--                ${tempDetail.size}&nbsp;--%>
<%--            </c:forEach>--%>
             </form:select>
            <form:hidden path="id"/>

            <br><br>

            <input type="submit" value="Save" class="button"/>

        </form:form>

        <%@include file="/WEB-INF/view/footer.jsp"%>
    </div>
</div>

</body>
</html>
