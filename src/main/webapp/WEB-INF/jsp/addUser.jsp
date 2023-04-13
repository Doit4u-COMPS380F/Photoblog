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
    <%--    <c:url var="logoutUrl" value="/logout"/>--%>
    <h2>Create a User</h2>
    <form:form method="POST" modelAttribute="photoUser">
        <div class="mb-3">
            <form:label path="username" class="form-label">Username</form:label>
            <form:input type="text" path="username" class="form-control"/>
            <form:errors path="username" cssClass="error" class="invalid-feedback"/>
        </div>
        <div class="mb-3">
            <form:label path="password" class="form-label">Password</form:label>
            <form:input type="text" path="password" class="form-control"/>
            <form:errors path="password" cssClass="error" class="invalid-feedback"/>
        </div>
        <div class="mb-3">
            <form:label path="confirm_password" class="form-label">Confirm Password</form:label>
            <form:input type="text" path="confirm_password" class="form-control"/>
            <form:errors path="confirm_password" cssClass="error" class="invalid-feedback"/>
        </div>
        <div class="mb-3">
            <form:label path="roles">Roles</form:label>
            <div class="form-check">
                <form:checkbox path="roles" value="ROLE_USER" class="form-check-input"/>
                <label class="form-check-label">ROLE_USER</label>
            </div>
            <div class="form-check">
                <form:checkbox path="roles" value="ROLE_ADMIN" class="form-check-input"/>
                <label class="form-check-label">ROLE_ADMIN</label>
            </div>
            <form:errors path="roles" cssClass="error" class="invalid-feedback"/>
        </div>
        <input type="submit" value="Add User" class="btn btn-primary"/>
    </form:form>
</div>
</body>
</html>