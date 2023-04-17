<h1>Create Comment</h1>
<form:form method="post" action="/create-comment">
    <table>
        <tr>
            <td>Content: </td>
            <td><form:input path="content"/></td>
        </tr>
        <tr>
            <td>Author: </td>
            <td><form:input path="author"/></td>
        </tr>
        <tr>
            <td>Original Post: </td>
            <td><form:input path="reference"/></td>
        </tr>
        <tr>
            <td></td>
            <td><input type="submit" value="Create"/></td>
        </tr>
    </table>
</form:form>
