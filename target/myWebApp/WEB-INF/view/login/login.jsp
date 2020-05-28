<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<c:set var="cp" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <%--    <link rel="stylesheet" href="${cp}/resources/css/style.css">--%>
    <link type="text/css" rel="stylesheet" href="${cp}/resources/css/style.css">
    <title>Login</title>
</head>
<body>

<div class="container">
    <div class="inside-container">
        <header>
            <jsp:include page="/WEB-INF/view/header.jsp" />
        </header>

        <form:form action="${cp}/authenticate" method="POST">

            <!-- Only show this message if the user has been logged out -->
            <c:if test="${param.logout != null}">

                You have been logged out

            </c:if>

            <br>
                <label for="username"> Username </label>
                <input type="text" name="username" id="username">

            <br>

                <label for="password"> Password </label>
                <input type="password" name="password" id="password">

            <br>

                <input type="submit" value="Login" class="button"/>

            <!-- Only show this row if there was a login error -->
            <c:if test="${param.error != null}">

                    Invalid login

            </c:if>
        </form:form>


        <%@include file="/WEB-INF/view/footer.jsp"%>
    </div>
</div>
</body>
</html>
