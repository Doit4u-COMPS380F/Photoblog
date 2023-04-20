<!DOCTYPE html>
<html data-bs-theme="dark">
<head>
    <title>Photoblog - Error</title>
    <%@include file="header.jsp" %>
</head>
<body>
<h2>Error page</h2>
<c:choose>
  <c:when test="${empty message}">
    <p>Something went wrong.</p>
  </c:when>
  <c:otherwise>
    <p>${message}</p>
  </c:otherwise>
</c:choose>
<a href="<c:url value="/index" />">Return to list tickets</a>
</body>
</html>
