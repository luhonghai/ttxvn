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
<a href=""><h1>News management</h1></a>
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
		<button type="button" class="btn btn-primary btn-add table-action">
			<span class="glyphicon glyphicon-pencil" aria-hidden="true"></span> Add News
		</button>
		<hr>
		<div class="table-responsive" id="tableContainer">
		</div>
	</div>
</div>

<!-- Modal -->
<div class="modal fade" id="dataModal"  tabindex="-1" role="dialog"
	 aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog" style="width: 800px">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">
					<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
				</button>
				<h4 class="modal-title" id="dataModelTitle"></h4>
			</div>
			<div class="modal-body" style="padding: 10px">
				<form class="form-horizontal" role="form" id="dataModelForm">
					<div class="form-group" id="dataModelID" style="display: none">
						<label class="col-sm-2 control-label">ID</label>
						<div class="col-xs-8">
							<input type="text" class="form-control" name="txtId" value="-1" />
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">Category</label>
						<div class="col-xs-8">
							<select name="selCategory">
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
						</div>
					</div>
					<div class="form-group">
						<div class="col-xs-12">
							<input type="text" class="form-control" placeholder="Title" name="txtTitle"/>
						</div>
					</div>
					<div class="form-group">
						<div class="col-xs-12">
							<div name="txtContent"></div>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">Source</label>
						<div class="col-xs-6">
							<input class="form-control" name="txtSource"/>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">Location</label>
						<div class="col-xs-6">
							<input class="form-control" name="txtLocation"/>
						</div>
					</div>
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				<button type="button" class="btn btn-primary btn-save"><span class="glyphicon glyphicon-ok" aria-hidden="true"></span> Save</button>
			</div>
		</div>
	</div>
</div>
<script>
	var target = "news";
	var TableData = {
		saveUrl: App.contextPath + "/json/" + target + "/save",
		deleteUrl: App.contextPath + "/json/" + target + "/delete",
		findUrl: App.contextPath + "/json/" + target + "/find",
		listUrl : App.contextPath + "/json/" + target + "/list",
		showAddForm: function() {
			$("#dataModelTitle").html("Add News");
			$("input[name=txtId]").val("-1");
			$("input[name=txtTitle]").val("");
			//tinymce.get('textarea[name=txtContent]').setContent("<p></p>");
			//$("textarea[name=txtContent]").val("");
			var $ta = $(document.createElement("textarea"));
			$ta.attr("name", "taContent");
			//$ta.val(content);
			$("div[name=txtContent]").empty();
			$("div[name=txtContent]").html($ta);

			$("input[name=txtSource]").val("");
			$("input[name=txtLocation]").val("");
			$("#dataModelID").hide();
			$("#dataModal").modal("show");
		},
		showEditForm: function(obj) {
			var content = "<p></p>";
			if (typeof obj.content != 'undefined' && obj.content != null && obj.content.length > 0) {
				content = obj.content;
			}
			$("#dataModelTitle").html("Edit News");
			$("input[name=txtId]").val(obj.id);
			$("input[name=txtId]").prop("disabled", "disabled");
			$("input[name=txtTitle]").val(obj.title);
			//tinymce.get('textarea[name=txtContent]').setContent(content);
			var $ta = $(document.createElement("textarea"));
			$ta.attr("name", "taContent");
			$ta.val(content);
			$("div[name=txtContent]").empty();
			$("div[name=txtContent]").html($ta);

			$("input[name=txtSource]").val(obj.source);
			$("input[name=txtLocation]").val(obj.location);
			$('select[name=selCategory] > option[value="' + obj.catId + '"]').attr("selected", "selected")
			$("#dataModelID").show();
			$("#dataModal").modal("show");
		},
		checkForm: function() {
			return true;
		},
		prepareObject: function() {
			tinyMCE.triggerSave();
			var obj = {
				id : $("input[name=txtId]").val(),
				title: $("input[name=txtTitle]").val(),
				content : $("textarea[name=taContent]").val(),
				source: $("input[name=txtSource]").val(),
				location: $("input[name=txtLocation]").val(),
				catId: parseInt($("select[name=selCategory]").val()),
				author: postAuthor,
				image: ""
			};
			return obj;
		},
		processData: function(data) {
			if (data.length == 0) return data;
			var i;
			for (i = 0; i < data.length; i++) {
				if (data[i].category == null || typeof  data[i].category == 'undefined') {
					data[i].category = {
						title: ""
					}
				}
				data[i].strDateTime =
						(typeof data[i].dateTime == 'undefined' || data[i].dateTime <= 0)
								? ""
								: new Date(data[i].dateTime).customFormat("#DD#/#MM#/#YYYY#");
			}
			return data;
		},
		init: function() {
			$('select[name=selFilterCategory]').on('change', function (e) {
				var optionSelected = $("option:selected", this);
				var valueSelected = this.value;
				TableData.listUrl = App.contextPath + "/json/" + target + "/findByCategory?id=" + valueSelected;
				App.loadTableData();
			});

			$('#dataModal').on('shown.bs.modal', function () {
				console.log("init tinymce");
				tinymce.init({
					selector:"textarea[name=taContent]",
						height: 400,
						theme: 'modern',
						plugins: [
					'advlist autolink lists link image charmap print preview hr anchor pagebreak',
					'searchreplace wordcount visualblocks visualchars code fullscreen',
					'insertdatetime media nonbreaking save table contextmenu directionality',
					'emoticons template paste textcolor colorpicker textpattern imagetools'
				],
						toolbar1: 'insertfile undo redo | styleselect | bold italic | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent | link image',
						toolbar2: 'print preview media | forecolor backcolor emoticons',
						image_advtab: true, });
			})
		},
		name : "News",
		columns : [
			{data: "id", title: "ID"},
			{data: "category.title", title: "Category"},
			{data: "title", title: "Title"},
			{data: "author", title: "Author"},
			{data: "source", title: "Source"},
			{data: "location", title: "Location"},
			{data : "strDateTime", title: "Updated Date"},
			{data: "command", title: ""}
		]
	}
</script>
