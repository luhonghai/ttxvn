<%@ tag import="com.project.ttxvn.service.CategoryService" %>
<%@ tag import="com.project.ttxvn.model.Category" %>
<%@ tag import="java.util.List" %>
<%@ tag import="com.project.ttxvn.model.User" %>
<%@tag description="User management" pageEncoding="UTF-8" %>
<%
	User user = (User) session.getAttribute("admin");
	CategoryService categoryService = new CategoryService();
	List<Category> categoryList = categoryService.findAll();
%>
<a href=""><h1>NewsML-G2</h1></a>
<script>
	var postAuthor = "<%=user.getEmail()%>";
</script>
<hr>
Select by category <select name="selFilterCategory">
	<option value="0">All category</option>
	<%
		if (categoryList != null && !categoryList.isEmpty()) {
			for (Category category : categoryList) {
	%>
	<option value="<%=category.getId()%>"><%=category.getTitle()%></option>
	<%
			}
		}
	%>
</select>
<hr>
<div class="row">
	<div class="col-md-12">
		<!-- Button trigger modal -->
		<button type="button" class="btn btn-primary btn-preview table-action">
			<span class="glyphicon glyphicon-pencil" aria-hidden="true"></span> Preview
		</button>
		<hr>
		<div id="divPreview">
		</div>
	</div>
</div>
<script>
	var TableData = {
		init: function() {
			console.log("Init here!");
		}
	}
</script>