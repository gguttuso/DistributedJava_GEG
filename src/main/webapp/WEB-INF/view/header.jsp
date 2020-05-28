<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:set var="cp" value="${pageContext.request.contextPath}"/>
<img src="${cp}/resources/img/coffee_and_cats_coffee_cats.png" alt="logo">

    <div class="container">
        <c:choose>
            <c:when test="${pageContext.request.userPrincipal !=null}">
                Hello <strong> ${pageContext.request.userPrincipal.name} </strong>
                |
                <a href="${cp}/logout"> Logout </a>
            </c:when>
            <c:otherwise>
                <a href="${cp}/showLoginForm"> Login </a>
            </c:otherwise>
        </c:choose>
    </div>
