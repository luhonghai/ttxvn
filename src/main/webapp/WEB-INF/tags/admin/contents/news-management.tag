<%@ tag import="com.project.ttxvn.model.Category" %>
<%@ tag import="com.project.ttxvn.model.User" %>
<%@ tag import="com.project.ttxvn.service.CategoryService" %>
<%@ tag import="com.project.ttxvn.service.NewsService" %>
<%@ tag import="java.util.List" %>
<%@ tag import="com.project.ttxvn.model.News" %>
<%@tag description="User management" pageEncoding="UTF-8" %>
<%@attribute name="type" required="true" %>
<%
	int pageType = Integer.parseInt(type);
	if (pageType == 0) {
		NewsService newsService = new NewsService();
		newsService.fetchNewsFromProvider();
	}
	User user = (User) session.getAttribute("admin");
	CategoryService categoryService = new CategoryService();
	List<Category> categoryList = categoryService.findAll();
%>
<a href=""><h1>News <%=pageType == 0 ? "Review" : "Management"%></h1></a>
<script>
	var postAuthor = "<%=user.getEmail()%>";
	var pageType = <%=pageType%>;
	var statusList = [];
	<%
		for (News.Status status : News.Status.values()) {
	%>
	statusList[<%=status.getId()%>] = "<%=status.toString()%>";
	<%
		}
	%>

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
		<% if (pageType == 0) {%>
		<!-- Button trigger modal -->
		<button type="button" class="btn btn-primary btn-send table-action">
			<span class="glyphicon glyphicon-envelope" aria-hidden="true"></span> Send News request
		</button>
		<hr>
		<button type="button" class="btn btn-primary btn-import table-action">
			<span class="glyphicon glyphicon-download-alt" aria-hidden="true"></span> Import NewsML-G2
		</button>
		<div class="col-xs-6">
			<input type="text" class="form-control" id="txtImport" placeholder="NewsML-G2 URL"/>
		</div>
		<hr>
		<div id="fileuploader">Upload NewsML-G2</div>
		<hr>
		<%}%>
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

<!-- Modal -->
<div class="modal fade" id="dataModalSend"  tabindex="-1" role="dialog"
	 aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog" style="width: 800px">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">
					<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
				</button>
				<h4 class="modal-title">Send News request</h4>
			</div>
			<div class="modal-body" style="padding: 10px">
				<form class="form-horizontal" role="form">
					<div class="form-group">
						<div class="col-xs-8">
							<input type="text" class="form-control" placeholder="Email" name="txtEmail" id="txtEmail"/>
						</div>
					</div>
					<div class="form-group">
						<div class="col-xs-12">
							<textarea name="txtMessage" id="txtMessage" style="width: 100%" placeholder="Message"></textarea>
						</div>
					</div>
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				<button type="button" class="btn btn-primary btn-send-request"><span class="glyphicon glyphicon-envelope" aria-hidden="true"></span> Send</button>
			</div>
		</div>
	</div>
</div>

<script>
	var target = "news";

	function initUploadForm() {
		$("#fileuploader").empty();
		$div = $(document.createElement("div"));
		$div.attr("id", "fileUploaderContainer");
		$("#fileuploader").html($div);
		$("#fileUploaderContainer").uploadFile({
			url: App.contextPath  + "/rest/news/upload/newsmlg2",
			fileName:"xml",
			maxFileCount: 1,
			allowedTypes: "xml",
			onSuccess:function(files,data,xhr,pd)
			{
				if (data)
				{
					swal("Upload successfully!", "", "success");
					App.loadTableData();
				} else {
					swal("Error!", "Could not complete", "warning");
				}
				initUploadForm();
			},
			onError: function() {
				swal("Error!", "Could not complete", "warning");
				initUploadForm();
			}
		});
	}

	function getStatusClass(status) {
		var statusClass = "";
		switch (status) {
			case 0:
				statusClass = "btn-warning";
				break;
			case 1:
				statusClass = "btn-success";
				break;
			case 2:
				statusClass = "btn-primary";
				break;
		}
		return statusClass;

	}

	var TableData = {
		saveUrl: App.contextPath + "/rest/" + target + "/save",
		deleteUrl: App.contextPath + "/rest/" + target + "/delete",
		findUrl: App.contextPath + "/rest/" + target + "/find",
		listUrl : App.contextPath + "/rest/" + target + "/findByCategory?id=" + 0 + "&pageType=" + pageType,
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

				var status = data[i].status;
				var statusClass = getStatusClass(status);
				data[i].strStatus = '<a class="btn-status ' + statusClass + '" href="javascript:void(0);">' +  statusList[status] + '</a>';


				var btnCommands = [];
				btnCommands.push('<div class="table-action-group">');
				if (data[i].status != <%=News.Status.APPROVED.getId()%>) {
					btnCommands.push('<button type="button" item-id="' + data[i].id + '" status-id="' + (status + 1) + '" class="btn ' + getStatusClass(status + 1) + ' table-action btn-update-status btn-xs">');
					btnCommands.push('<span class="glyphicon glyphicon-ok" aria-hidden="true"></span>');
					btnCommands.push(' Submit ' + statusList[status + 1]);
					btnCommands.push('</button>');
				}
				btnCommands.push('</div>');

				data[i].action = btnCommands.join("");

				data[i].strDateTime =
						(typeof data[i].dateTime == 'undefined' || data[i].dateTime <= 0)
								? ""
								: new Date(data[i].dateTime).customFormat("#DD#/#MM#/#YYYY#");
				data[i].newsmlg2 = "<a href='<%=request.getContextPath()%>/rest/news/newsmlg2/" + data[i].id + "' target='_blank'>NewsML-G2 format</a>";
			}
			return data;
		},
		init: function() {
			if (pageType == 0) {
				initUploadForm();
			}

			$('select[name=selFilterCategory]').on('change', function (e) {
				var optionSelected = $("option:selected", this);
				var valueSelected = this.value;
				TableData.listUrl = App.contextPath + "/rest/" + target + "/findByCategory?id=" + valueSelected + "&pageType=" + pageType;
				App.loadTableData();
			});

			$('body').on('click', '.btn-update-status', function() {
				var nid = parseInt($(this).attr("item-id"));
				var status = parseInt($(this).attr("status-id"));
				$.ajax({
					type: "GET",
					url: App.contextPath + "/rest/" + target + "/update/status",
					contentType: "application/json",
					dataType: "json",
					data: {
						nid: nid,
						status: status
					}
				}).done(function( data ) {
					if (data)
					{
						swal("Update successfully!", "", "success");
						App.loadTableData();
					} else {
						swal("Error!", "Could not complete", "warning");
					}
				}).error(function() {
					swal("Error!", "Could not complete", "warning");
					$("#dataModalSend").modal("hide");
				});
			});

			$('body').on('click', '.btn-send', function() {
				$("#txtEmail").val("");
				$("#txtMessage").val("");
				$("#dataModalSend").modal("show");
			});

			$('body').on('click', '.btn-send-request', function() {
				$.ajax({
					type: "GET",
					url: App.contextPath + "/rest/" + target + "/send/request",
					contentType: "application/json",
					dataType: "json",
					data: {
						email: $("#txtEmail").val(),
						message: $("#txtMessage").val()
					}
				}).done(function( data ) {
					if (data)
					{
						swal("Send request successfully!", "", "success");
					} else {
						swal("Error!", "Could not complete", "warning");
					}
					$("#dataModalSend").modal("hide");
				}).error(function() {
					swal("Error!", "Could not complete", "warning");
					$("#dataModalSend").modal("hide");
				});
			});

			$('body').on('click', '.btn-import', function() {
				$.ajax({
					type: "GET",
					url: App.contextPath + "/rest/" + target + "/import/newsmlg2",
					contentType: "application/json",
					dataType: "json",
					data: {
						dataUrl: $("#txtImport").val()
					}
				}).done(function( data ) {
					if (data)
					{
						swal("Import successfully!", "", "success");
						$("#txtImport").val("");
						App.loadTableData()
					} else {
						swal("Error!", "Could not complete", "warning");
					}

				}).error(function() {
					swal("Error!", "Could not complete", "warning");

				});
			});

			$('#dataModal').on('shown.bs.modal', function () {
				console.log("init tinymce");
				tinymce.init({
					selector:"textarea[name=taContent]",
						height: 250,
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
			{data : "strStatus", title: "Status"},
			{data : "action", title: "Action"},
			{data: "command", title: ""}
		]
	}
</script>
