<!DOCTYPE html>
<html data-bs-theme="dark">
<head>
    <title>User admin</title>
    <%@include file="header.jsp" %>
</head>
<body>
<%@include file="nav.jsp" %>
<div class="container mt-5">
    <h2>Account admin</h2>

    <a href="<c:url value="/user/create" />" class="btn btn-primary">Create a User</a><br/><br/>

    <c:choose>
        <c:when test="${fn:length(photoUsers) == 0}">
            <i>There are no users in the system.</i>
        </c:when>
        <c:otherwise>
            <table class="table">
                <tr>
                    <th scope="col">Username</th>
                    <th scope="col">Password</th>
<%--                    <th scope="col">Phone</th>--%>
<%--                    <th scope="col">Email</th>--%>
                    <th scope="col">Roles</th>
                    <th scope="col">Action</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${photoUsers}" var="user">
                    <tr>
                        <td>${user.username}</td>
<%--                        <td>${fn:substringAfter(user.password, '{noop}')}</td>--%>
                        <td>${user.password}</td>
<%--                        <td>${user.phone}</td>--%>
<%--                        <td>${user.email}</td>--%>
                        <td>
                            <c:forEach items="${user.roles}" var="role" varStatus="status">
                                <c:if test="${!status.first}">, </c:if>
                                ${role.role}
                            </c:forEach>
                        </td>
                        <td>
                            <a href="<c:url value="/user/edit//${user.username}" />" class="btn btn-danger">Edit</a>
                        </td>
                        <td>
                            <a href="<c:url value="/user/delete/${user.username}" />" class="btn btn-danger">Delete</a>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </c:otherwise>
    </c:choose>
</div>
</body>
</html>