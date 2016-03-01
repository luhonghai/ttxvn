<%@ tag import="com.project.ttxvn.model.NewsRequest" %>
<%@ tag import="com.project.ttxvn.service.NewsService" %>
<%@ tag import="com.project.ttxvn.model.News" %>
<%@ tag import="java.util.List" %>
<%@tag description="User management" pageEncoding="UTF-8" %>
<script>
	var statusList = [];
	<%
		for (NewsRequest.Status status : NewsRequest.Status.values()) {
	%>
	statusList[<%=status.getId()%>] = "<%=status.toString()%>";
	<%
		}
	%>
</script>
<a href=""><h1>News Request</h1></a>
<hr>
<div class="row">
	<div class="col-md-12">
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
					<input type="hidden" id="txtID" name="rid"/>
					<div class="form-group">
						<div class="col-xs-12">
							<input type="text" class="form-control" id="txtSubject" name="subject" placeholder="Subject"/>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">Message</label>
						<div class="col-xs-12">
							<div name="txtContent"></div>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">Select news</label>
						<div class="col-xs-8">
							<select id="selNews" name="pid">
								<%
									NewsService newsService = new NewsService();
									List<News> newsList = newsService.findByCategoryAndStatus(0, News.Status.APPROVED.getId());
									if (newsList != null && !newsList.isEmpty()) {
										for (News news : newsList) {
											%>
								<option value="<%=news.getId()%>"><%=("[" + news.getCategory().getTitle() + "] " +news.getTitle() + " (" + news.getAuthor() + ")")%></option>
								<%
										}
									}
								%>
							</select>
						</div>
					</div>
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				<button type="button" class="btn btn-primary btn-send-email"><span class="glyphicon glyphicon-envelope" aria-hidden="true"></span> Send</button>
			</div>
		</div>
	</div>
</div>
<script>
	var target = "news_request";
	var TableData = {
		saveUrl: App.contextPath + "/rest/" + target + "/save",
		deleteUrl: App.contextPath + "/rest/" + target + "/delete",
		findUrl: App.contextPath + "/rest/" + target + "/find",
		listUrl : App.contextPath + "/rest/" + target + "/list",
		showAddForm: function() {

		},
		showEditForm: function(obj) {

		},
		checkForm: function() {
			return true;
		},
		prepareObject: function() {
			return {}
		},
		processData: function(data) {
			if (data.length == 0) return data;
			var i;
			for (i = 0; i < data.length; i++) {
				var status = data[i].status;
				var statusClass = "";
				switch (status) {
					case 0:
							statusClass = "btn-warning";
						break;
					case 1:
							statusClass = "btn-primary";
						break;
				}
				data[i].strStatus = '<a class="btn-status ' + statusClass + '" href="javascript:void(0);">' +  statusList[status] + '</a>';
				data[i].skipEdit = true;

				data[i].strRequestDate =
						(typeof data[i].requestDate == 'undefined' || data[i].requestDate <= 0)
								? ""
								: new Date(data[i].requestDate).customFormat("#DD#/#MM#/#YYYY#");

				var btnCommands = [];
				btnCommands.push('<div class="table-action-group">');
				if (data[i].status != <%=NewsRequest.Status.DONE.getId()%>) {
					btnCommands.push('<button type="button" item-id="' + data[i].id + '" class="btn btn-success table-action btn-send btn-xs">');
					btnCommands.push('<span class="glyphicon glyphicon-envelope" aria-hidden="true"></span>');
					btnCommands.push(' Send email');
					btnCommands.push('</button>');
				}
				btnCommands.push('</div>');

				data[i].action = btnCommands.join("");
			}
			return data;
		},
		name : "News Request",
		columns : [
			{data: "id", title: "ID"},
			{data: "email", title: "Email"},
			{data: "message", title: "Message"},
			{data: "strRequestDate", title: "Request date"},
			{data: "strStatus", title: "Status"},
			{data : "action", title: ""},
			{data: "command", title: ""}
		],
		init: function () {
			$('#dataModal').on('shown.bs.modal', function () {
				tinymce.init({
					selector:"#txtMessage",
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
			$('body').on('click', '.btn-send', function() {
				$("#txtSubject").val("");
				var $ta = $(document.createElement("textarea"));
				$ta.attr("id", "txtMessage");
				$ta.attr("name", "message");
				//$ta.val(content);
				$("div[name=txtContent]").empty();
				$("div[name=txtContent]").html($ta);

				$("#txtID").val($(this).attr('item-id'));
				$("#dataModal").modal("show");
			})
			$('body').on('click', '.btn-send-email', function() {
				tinyMCE.triggerSave();
				$.ajax({
					type: "POST",
					url: App.contextPath + "/rest/" + target + "/send",
					data: $("#dataModelForm").serialize()
				}).done(function( data ) {
					if (data)
					{
						swal("Send email successfully!", "", "success");
						App.loadTableData();
					} else {
						swal("Error!", "Could not complete", "warning");
					}
					$("#dataModal").modal("hide");
				}).error(function() {
					swal("Error!", "Could not complete", "warning");
					$("#dataModal").modal("hide");
				});
			});
		}
	}
</script>
