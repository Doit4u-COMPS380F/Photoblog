<!DOCTYPE html>
<html data-bs-theme="dark">
<head>
    <title>Edit User - #${user.username}</title>
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
    <h2>Edit User - #${user.username}</h2>
    <form:form method="POST" modelAttribute="userForm">
<%--        <div class="mb-3">--%>
<%--            <form:label path="username" class="form-label">Username</form:label>--%>
<%--            <form:input type="text" path="username" class="form-control"/>--%>
<%--            <form:errors path="username" cssClass="error" class="invalid-feedback"/>--%>
<%--        </div>--%>
        <div class="mb-3">
            <form:label path="password" class="form-label">Password</form:label>
            <form:input type="password" path="password" class="form-control"/>
            <form:errors path="password" cssClass="error" class="invalid-feedback"/>
        </div>
        <div class="mb-3">
            <form:label path="confirm_password" class="form-label">Confirm Password</form:label>
            <form:input type="password" path="confirm_password" class="form-control"/>
            <form:errors path="confirm_password" cssClass="error" class="invalid-feedback"/>
        </div>
        <div class="mb-3">
            <form:label path="phone" class="form-label">Phone</form:label>
            <form:input type="text" path="phone" class="form-control"/>
            <form:errors path="phone"/>
        </div>
        <div class="mb-3">
            <form:label path="email" class="form-label">Email</form:label>
            <form:input type="text" path="email" class="form-control"/>
            <form:errors path="email"/>
        </div>
        <security:authorize access="hasRole('ADMIN')">
            <div class="mb-3">
                <form:label path="roles">Roles</form:label>
                <div class="form-check">
                    <form:checkbox path="roles" value="ROLE_USER" class="form-check-input" checked="true"/>
                    <label class="form-check-label">ROLE_USER</label>
                </div>
                <div class="form-check">
                    <form:checkbox path="roles" value="ROLE_ADMIN" class="form-check-input"/>
                    <label class="form-check-label">ROLE_ADMIN</label>
                </div>
                <form:errors path="roles" cssClass="error" class="invalid-feedback"/>
            </div>
        </security:authorize>
        <security:authorize access="!hasRole('ADMIN')">
            <form:hidden path="roles" value="ROLE_USER" checked="true"/>
        </security:authorize>
        <input type="submit" value="Edit User" class="btn btn-primary"/>
    </form:form>
</div>
</body>
</html>