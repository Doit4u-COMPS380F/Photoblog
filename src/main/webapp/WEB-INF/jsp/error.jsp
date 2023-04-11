<!DOCTYPE html>
<html>
<head>
  <title>Photoblog</title>
</head>
<body>
<security:authorize access="hasAnyRole('USER', 'ADMIN')">
  <c:url var="logoutUrl" value="/logout"/>
  <form action="${logoutUrl}" method="post">
    <input type="submit" value="Log out" />
    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
  </form>
</security:authorize>
<security:authorize access="isAnonymous()">
  <c:url var="loginUrl" value="/login"/>
  <form action="${loginUrl}">
    <input type="submit" value="Login" />
  </form>
</security:authorize>
<h2>Error page</h2>
<c:choose>
  <c:when test="${empty message}">
    <p>Something went wrong.</p>
  </c:when>
  <c:otherwise>
    <p>${message}</p>
  </c:otherwise>
</c:choose>
<a href="<c:url value="/" />">Back to home</a>
</body>
</html>
