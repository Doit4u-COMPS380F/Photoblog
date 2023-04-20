<h1>Create Comment</h1>
<form:form method="post" action="/Doit4u/Photoblog/comment/create-comment" enctype="multipart/form-data" modelAttribute="commentForm">
    <table>
        <tr>
            <td>Content: </td>
            <td><form:input path="content"/></td>
        </tr>
        <tr>
            <td></td>
            <td><input type="submit" value="Create"/></td>
        </tr>
    </table>
</form:form>
