<%@tag description="User management" pageEncoding="UTF-8" %>
<a href=""><h1>News category</h1></a>
<hr>
<div class="row">
	<div class="col-md-12">
		<!-- Button trigger modal -->
		<button type="button" class="btn btn-primary btn-add table-action">
			<span class="glyphicon glyphicon-plus" aria-hidden="true"></span> Add new category
		</button>
		<hr>
		<div class="table-responsive" id="tableContainer">
		</div>
	</div>
</div>

<!-- Modal -->
<div class="modal fade" id="dataModal" tabindex="-1" role="dialog"
	 aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">
					<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
				</button>
				<h4 class="modal-title" id="dataModelTitle"></h4>
			</div>
			<div class="modal-body">
				<form class="form-horizontal" role="form" id="dataModelForm">
					<div class="form-group" id="dataModelID" style="display: none">
						<label class="col-sm-2 control-label">ID</label>
						<div class="col-xs-4">
							<input type="text" class="form-control" name="txtId" value="-1" />
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">Title</label>
						<div class="col-xs-4">
							<input type="text" class="form-control" name="txtTitle"/>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">Description</label>
						<div class="col-xs-4">
							<textarea class="form-control" name="txtDescription"></textarea>
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
	var target = "category";
	var TableData = {
		saveUrl: App.contextPath + "/rest/" + target + "/save",
		deleteUrl: App.contextPath + "/rest/" + target + "/delete",
		findUrl: App.contextPath + "/rest/" + target + "/find",
		listUrl : App.contextPath + "/rest/" + target + "/list",
		showAddForm: function() {
			$("#dataModelTitle").html("Add category");
			$("input[name=txtId]").val("-1");
			$("input[name=txtTitle]").val("");
			$("textarea[name=txtDescription]").val("");
			$("#dataModelID").hide();
			$("#dataModal").modal("show");
		},
		showEditForm: function(obj) {
			$("#dataModelTitle").html("Edit category");
			$("input[name=txtId]").val(obj.id);
			$("input[name=txtId]").prop("disabled", "disabled");
			$("input[name=txtTitle]").val(obj.title);
			$("textarea[name=txtDescription]").val(obj.description);
			$("#dataModelID").show();
			$("#dataModal").modal("show");
		},
		checkForm: function() {
			return true;
		},
		prepareObject: function() {
			var obj = {
				id : $("input[name=txtId]").val(),
				title: $("input[name=txtTitle]").val(),
				description : $("textarea[name=txtDescription]").val()
			};
			return obj;
		},
		processData: function(data) {
			if (data.length == 0) return data;
			var i;
			for (i = 0; i < data.length; i++) {
				data[i].newsmlg2 = "<a href='<%=request.getContextPath()%>/rest/news/newsmlg2/category/" + data[i].id + "' target='_blank'>NewsML-G2 format</a>";
			}
			return data;
		},
		name : "Category",
		columns : [
			{data: "id", title: "ID"},
			{data: "title", title: "Title"},
			{data: "description", title: "Description"},
			{data: "newsCount", title: "News count"},
			{data : "newsmlg2", title: "NewsML-G2"},
			{data: "command", title: ""}
		]
	}
</script>
