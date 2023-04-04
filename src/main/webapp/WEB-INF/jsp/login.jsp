<!DOCTYPE html>
<html data-bs-theme="dark">
<head>
    <title>Doit4u Photoblog Login</title>
</head>
<body>
<c:if test="${param.error != null}">
    <p>Login failed.</p>
</c:if>
<c:if test="${param.logout != null}">
    <p>You have logged out.</p>
</c:if>
<h2>Doit4u Photoblog Login</h2>
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
</body>
</html>

<%--<!DOCTYPE html>--%>
<%--<html data-bs-theme="dark">--%>
<%--<head>--%>
<%--    <title>Photoblog - Login</title>--%>
<%--    <%@include file="header.jsp" %>--%>
<%--</head>--%>
<%--<body>--%>
<%--<%@include file="nav.jsp" %>--%>
<%--<div class="container mt-5">--%>
<%--    <h1>Login</h1>--%>
<%--    <form action="login" method="post">--%>
<%--        <div class="mb-3">--%>
<%--            <label for="username" class="form-label">Username</label>--%>
<%--            <input type="text" class="form-control" id="username" placeholder="username"--%>
<%--                   aria-describedby="usernameHelp">--%>
<%--            &lt;%&ndash;            <div id="usernameHelp" class="form-text">user name is what you use to login</div>&ndash;%&gt;--%>
<%--        </div>--%>
<%--        <div class="mb-3">--%>
<%--            <label for="password" class="form-label">Password</label>--%>
<%--            <input type="password" class="form-control" id="password" placeholder="p@ssw0rd">--%>
<%--        </div>--%>
<%--        <button type="submit" class="btn btn-primary">Login</button>--%>
<%--    </form>--%>
<%--</div>--%>
<%--</body>--%>
<%--</html>--%>