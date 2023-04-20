<!DOCTYPE html>
<html data-bs-theme="dark">
<head>
    <title>Create User</title>
    <%@include file="header.jsp" %>
</head>
<body>
<%@include file="nav.jsp" %>
<div class="container mt-5">
    <h2>Read Comments</h2>
    <table class="table">
        <thead>
        <tr>
            <th scope="col">ID</th>
            <th scope="col">Content</th>
            <th scope="col">Author</th>
            <th scope="col">Actions</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="comment" items="${comments}">
            <tr>
                <td>${comment.id}</td>
                <td>${comment.content}</td>
                <td>${comment.author}</td>
                <td><a href="<c:url value='/view/${comment.reference}'/>" class="btn btn-primary btn-sm">Goto</a><a
                        href="/Doit4u/Photoblog/comment/delete-comment/${comment.id}" class="btn btn-danger btn-sm ms-3">Delete</a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <br/><br/>
</div>
</body>
</html>
<%--<a href="/Doit4u/Photoblog/comment/create-comment">Create Comment</a>--%>
