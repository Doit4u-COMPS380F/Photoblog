<!DOCTYPE html>
<html data-bs-theme="dark">
<html>
<head>
    <title>Doit4u Photoblog Login<</title>
    <%@include file="header.jsp" %>
</head>
<body>
<%@include file="nav.jsp" %>
<div class="container mt-5">
    <c:if test="${param.error != null}">
        <div class="alert alert-danger" role="alert">
            Login failed.
        </div>
    </c:if>
    <c:if test="${param.logout != null}">
        <div class="alert alert-info" role="alert">You have logged out.</div>
    </c:if>
    <h2>Doit4u Photoblog Login</h2>
    <form action="login" method="POST">
        <div class="mb-3">
            <label for="username" class="form-label">Username:</label>
            <input type="text" class="form-control" id="username" name="username">
        </div>
        <div class="mb-3">
            <label for="password" class="form-label">Password:</label>
            <input type="password" class="form-control" id="password" name="password">
        </div>
        <div class="mb-3 form-check">
            <input type="checkbox" class="form-check-input" id="remember-me" name="remember-me">
            <label class="form-check-label" for="remember-me">Remember me</label>
        </div>
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        <input type="submit" class="btn btn-primary" value="Log In"/>
    </form>
</div>
</body>
</html>