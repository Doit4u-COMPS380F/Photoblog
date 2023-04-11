<!DOCTYPE html>
<html>
<head>
    <title>Photoblog</title>
    <style>
        .error {
            color: red;
            font-weight: bold;
            display: block;
        }
    </style>
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

<h2>Create a User</h2>
<form:form method="POST" modelAttribute="ticketUser">
    <form:label path="username">Username</form:label><br/>
    <form:errors path="username" cssClass="error" />
    <form:input type="text" path="username"/><br/><br/>
    <form:label path="password">Password</form:label><br/>
    <form:errors path="password" cssClass="error" />
    <form:input type="password" path="password"/><br/><br/>
    <form:label path="confirm_password">Confirm Password</form:label><br/>
    <form:errors path="confirm_password" cssClass="error" />
    <form:input type="password" path="confirm_password" /><br/><br/>
    <form:label path="roles">Roles</form:label><br/>
    <form:errors path="roles" cssClass="error" />
    <form:checkbox path="roles" value="ROLE_USER"/>ROLE_USER
    <form:checkbox path="roles" value="ROLE_ADMIN"/>ROLE_ADMIN
    <br/><br/>
    <input type="submit" value="Add User"/>
</form:form>
</body>
</html>