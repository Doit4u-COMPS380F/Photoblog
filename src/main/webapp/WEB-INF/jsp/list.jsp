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
  <c:url var="RegisterUrl" value="/user/create"/>
  <form action="${RegisterUrl}">
    <input type="submit" value="Register" />
  </form>
</security:authorize>
<h2>Photoblog</h2>
<security:authorize access="hasRole('ADMIN')">
  <a href="<c:url value="/user" />">Manage User Accounts</a><br /><br />
</security:authorize>
<security:authorize access="hasAnyRole('USER', 'ADMIN')">
<a href="<c:url value="/ticket/create" />">Create a Ticket</a><br/><br/>
</security:authorize>
<c:choose>
  <c:when test="${fn:length(ticketDatabase) == 0}">
    <i>There are no Photos in the system.</i>
  </c:when>
  <c:otherwise>
    <c:forEach items="${ticketDatabase}" var="entry">
      Ticket ${entry.id}:
      <a href="<c:url value="/ticket/view/${entry.id}" />">
        <c:out value="${entry.subject}"/></a>
      (Uploader: <c:out value="${entry.customerName}"/>)
      <!-- COMMENT -->
      [<a href="<c:url value="/comment/create-comment/${entry.id}" />">Comment</a>]
      <!-- EDIT -->
      <security:authorize access="hasRole('ADMIN') or
                                principal.username=='${entry.customerName}'">
        [<a href="<c:url value="/ticket/edit/${entry.id}" />">Edit</a>]
      </security:authorize>
      <!-- DELETE -->
      <security:authorize access="hasRole('ADMIN')">
        [<a href="<c:url value="/ticket/delete/${entry.id}" />">Delete</a>]
      </security:authorize>
      <br />
    </c:forEach>
  </c:otherwise>
</c:choose>
</body>
</html>
