<!DOCTYPE html>
<html>
<head>
    <title>Photoblog Login</title>
</head>
<body>
<security:authorize access="hasAnyRole('USER', 'ADMIN')">
    <meta http-equiv="refresh" content="0; URL=<c:url value="/" />" />
</security:authorize>
<c:if test="${param.error != null}">
    <p>Login failed.</p>
</c:if>
<c:if test="${param.logout != null}">
    <p>You have logged out.</p>
</c:if>
<h2>PhotoBlog Login</h2>
<form action="login" method="POST">
    <label for="username">Username:</label><br/>
    <input type="text" id="username" name="username"/><br/><br/>
    <label for="password">Password:</label><br/>
    <input type="password" id="password" name="password"/><br/><br/>
    <input type="checkbox" id="remember-me" name="remember-me"/>
    <label for="remember-me">Remember me</label><br/><br/>
    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
    <input type="submit" value="Log In"/>
</form>
<c:url var="RegisterUrl" value="/user/create"/>
<form action="${RegisterUrl}">
    <input type="submit" value="Register" />
</form>
<a href="<c:url value="/" />">Back to home</a>
</body>
</html>
