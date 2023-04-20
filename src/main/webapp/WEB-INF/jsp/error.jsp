<!DOCTYPE html>
<html data-bs-theme="dark">
<head>
    <title>Photoblog - Error</title>
    <%@include file="header.jsp" %>
</head>
<body>
<c:url var="logoutUrl" value="/logout"/>
<form action="${logoutUrl}" method="post">
    <input type="submit" value="Log out" />
    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
</form>
<%--<<<<<<< HEAD--%>

<h2>Error page</h2>
<c:choose>
  <c:when test="${empty message}">
    <p>Something went wrong.</p>
  </c:when>
  <c:otherwise>
    <p>${message}</p>
  </c:otherwise>
</c:choose>
<a href="<c:url value="" />">Return to list photos</a>
<%--=======--%>
<%@include file="nav.jsp" %>
<div class="container mt-5">
    <h1>Error page</h1>
    <c:choose>
        <c:when test="${empty message}">
            <p>Something went wrong.</p>
        </c:when>
        <c:otherwise>
            <p>${message}</p>
        </c:otherwise>
    </c:choose>
    <a href="javascript:history.back()">Return to last page</a>
</div>
<%-->>>>>>> userSys--%>
</body>
</html>
