<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
</head>
<body>
<section class="my-5">
  <div class="container">
    <div class="row">
      <div class="col-md-8 mx-auto">
        <h2>Upload Image Example</h2>
        <p th:text="${message}" th:if="${message ne null}" class="alert alert-primary"></p>
        <form method="post" th:action="@{/upload}" enctype="multipart/form-data">
          <div class="form-group">
            <input type="file" name="image" accept="image/*" class="form-control-file">
          </div>
          <button type="submit" class="btn btn-primary">Upload image</button>
        </form>
        <span th:if="${msg != null}" th:text="${msg}"></span>
      </div>
    </div>
  </div>
</section>
</body>
</html>
