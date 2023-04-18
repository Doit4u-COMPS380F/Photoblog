<h1>Read Comments</h1>
<table border="2" width="70%" cellpadding="2">
    <tr>
        <th>Id</th>
        <th>Content</th>
        <th>Author</th>
        <th>Reference</th>
        <th>Delete</th>
    </tr>
    <c:forEach var="comment" items="${comments}">
        <tr>
            <td>${comment.id}</td>
            <td>${comment.content}</td>
            <td>${comment.author}</td>
            <td>${comment.reference}</td>
            <td><a href="/Doit4u/Photoblog/comment/delete-comment/${comment.id}">Delete</a></td>
        </tr>
    </c:forEach>
</table>
<br/>
<a href="/Doit4u/Photoblog//comment/create-comment">Create Comment</a>
