<!DOCTYPE html>
<html data-bs-theme="dark">
<head>
    <title>Create User</title>
    <%@include file="header.jsp" %>
    <style>
        .error {
            color: red;
            font-weight: bold;
            display: block;
        }
    </style>
</head>
<body>
<%@include file="nav.jsp" %>
<div class="container mt-5">
    <c:url var="logoutUrl" value="/logout"/>
    <h2>Create a User</h2>
    <form:form method="POST" modelAttribute="photoUser">
        <form:label path="username">Username</form:label><br/>
        <form:errors path="username" cssClass="error" />
        <form:input type="text" path="username"/><br/><br/>

        <form:label path="password">Password</form:label><br/>
        <form:errors path="password" cssClass="error" />
        <form:input type="text" path="password"/><br/><br/>

        <form:label path="confirm_password">Confirm Password</form:label><br/>
        <form:errors path="confirm_password" cssClass="error" />
        <form:input type="text" path="confirm_password" /><br/><br/>

        <form:label path="roles">Roles</form:label><br/>
        <form:errors path="roles" cssClass="error" />
        <form:checkbox path="roles" value="ROLE_USER"/>ROLE_USER
        <form:checkbox path="roles" value="ROLE_ADMIN"/>ROLE_ADMIN
        <br/><br/>
        <input type="submit" value="Add User"/>
    </form:form>
</div>
</body>
</html>