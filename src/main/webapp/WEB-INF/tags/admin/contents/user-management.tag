<%@ tag import="com.project.ttxvn.model.User" %>
<%@tag description="User management" pageEncoding="UTF-8" %>
<%
	String mRole = request.getParameter("role");
	User user = (User) session.getAttribute("admin");
	int nRole = 0;
	if (mRole != null) {
		nRole = Integer.parseInt(mRole);
	}
	User.Role role = User.Role.fromId(nRole);
%>
<script>
	var currentUser = "<%=user.getEmail()%>";
</script>
<a href=""><h1><%=role.toString()%>  management</h1></a>
	<hr>
	<div class="row">
		<div class="col-md-12">
				<!-- Button trigger modal -->
			<button type="button" class="btn btn-primary btn-add table-action">
				<span class="glyphicon glyphicon-plus" aria-hidden="true"></span> Add new <%=role.toString()%>
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
								<label class="col-sm-2 control-label">First name</label>
				                <div class="col-xs-4">
				                  <input type="text" class="form-control" name="txtFirstName"/>
				                </div>
				              </div>
				              <div class="form-group">
				                <label class="col-sm-2 control-label">Last name</label>
				                <div class="col-xs-4">
				                  <input type="text" class="form-control" name="txtLastName"/>
				                </div>
				              </div>
				              <div class="form-group">
				                <label class="col-sm-2 control-label">Email</label>
				                <div class="col-xs-4">
				                  <input type="text" class="form-control" name="txtEmail"/>
				                </div>
				              </div>
				              <div class="form-group">
				                <label class="col-sm-2 control-label">Password</label>
				                <div class="col-xs-4">
				                  <input type="password" class="form-control" name="txtPassword"/>
				                </div>
				              </div>
				              <div class="form-group">
				                <label class="col-sm-2 control-label">Confirm Password</label>
				                <div class="col-xs-4">
				                  <input type="password" class="form-control" name="txtCPassword"/>
				                </div>
				              </div>
				              <div class="form-group">
				                <label class="col-sm-2 control-label">Gender</label>
				                <label class="checkbox-inline">
				                  <input type="radio" name="gender" value="male" checked>
				                  Male
				                </label>
				                <label class="checkbox-inline">
				                  <input type="radio" name="gender" value="female">
				                  Female
				                </label>
				              </div>
				              <div class="form-group">
				                <label for="txtDob" class="col-sm-2 control-label">Date of birth</label>
				                <div class="col-xs-4">
				                  <input type="text" class="form-control datepicker-input" name="txtDob" id="txtDob"/>
				                </div>
				              </div>
				              <div class="form-group">
				                <label class="col-sm-2 control-label">Phone</label>
				                <div class="col-xs-4">
				                  <input type="text" class="form-control" name="txtPhone"/>
				                </div>
				              </div>
				              <div class="form-group">
				                <label class="col-sm-2 control-label">Address</label>
				                <div class="col-xs-4">
				                  <textarea class="form-control" name="txtAddress"></textarea>
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
		var target = "user"
		var TableData = {
			saveUrl: App.contextPath + "/rest/" + target + "/save",
			deleteUrl: App.contextPath + "/rest/" + target + "/delete",
			findUrl: App.contextPath + "/rest/" + target + "/find",
			listUrl : App.contextPath + "/rest/" + target + "/findbyrole?role=<%=role.getId()%>",
			showAddForm: function() {
				$("#dataModelTitle").html("Add <%=role.toString()%>");
				$("input[name=txtId]").val("-1");
   				$("input[name=txtFirstName]").val("");
   				$("input[name=txtLastName]").val("");
   				$("input[name=txtEmail]").val("");
   				$("input[name=txtPassword]").val("");
   				$("input[name=txtCPassword]").val("");
   				$("input[name=txtDob]").val("");
   				$("input[name=txtPhone]").val("");
   				$("textarea[name=txtAddress]").val("");
				$("#dataModelID").hide();
				$("#dataModal").modal("show");
			},
			showEditForm: function(obj) {
				$("#dataModelTitle").html("Edit <%=role.toString()%>");
				$("input[name=txtId]").val(obj.id);
				$("input[name=txtId]").prop("disabled", "disabled");
   				$("input[name=txtFirstName]").val(obj.firstName);
   				$("input[name=txtLastName]").val(obj.lastName);
   				$("input[name=txtEmail]").val(obj.email);
   				$("input[name=txtPassword]").val("");
   				$("input[name=txtCPassword]").val("");
   				$("input[name=txtDob]").val((typeof obj.dob == 'undefined' || obj.dob <= 0) 
								? "" 
								: new Date(obj.dob).customFormat("#DD#/#MM#/#YYYY#"));
   				$("input[name=txtPhone]").val(obj.phone);
   				$("textarea[name=txtAddress]").val(obj.address);
				$("#dataModelID").show();
				$("#dataModal").modal("show");
			},
			checkForm: function() {
				if ($("input[name=txtPassword]").val() != $("input[name=txtCPassword]").val()) {
					swal("Invalid data!", "Password not match", "warning");
       				return false;
       			}
				return true;	
			},
			prepareObject: function() {
				var obj = {
						id : $("input[name=txtId]").val(),
	       	        	role: <%=role.getId()%>,
	       	        	firstName: $("input[name=txtFirstName]").val(),
	       	        	lastName : $("input[name=txtLastName]").val(),
	       	        	email: $("input[name=txtEmail]").val(),
	       	        	password: $("input[name=txtPassword]").val(),
	   					phone: $("input[name=txtPhone]").val(),
	   					address: $("textarea[name=txtAddress]").val(),
	   					gender: $('input:radio[name=gender]:nth(0)').is(':checked')
				};
				var strDob = $("input[name=txtDob]").val();
				if (strDob.length > 0) {
					obj.dob = Date.parse(strDob); 
				}
				return obj;
			},
			processData: function(data) {
				if (data.length == 0) return data;
				var i;
				for (i = 0; i < data.length; i++) {
					data[i].strGender = data[i].gender ? "Male" : "Female";
					data[i].strDob = 
						(typeof data[i].dob == 'undefined' || data[i].dob <= 0) 
							? "" 
							: new Date(data[i].dob).customFormat("#DD#/#MM#/#YYYY#");
					if (data[i].email.indexOf(currentUser) != -1 && currentUser.indexOf(data[i].email) != -1) {
						data[i].skipDelete = true;
					}
				}
				return data;
			},
			name : "<%=role.toString()%>",
			columns : [
				{data: "id", title: "ID"},
				{data: "firstName", title: "First name"},
				{data: "lastName", title: "Last name"},
				{data: "email", title: "Email"},
				{data: "strGender", title: "Gender"},
				{data: "strDob", title: "Date of birth"},
				{data: "phone", title: "Phone"},
				{data: "address", title: "Address"},
				{data: "command", title: ""}
			]
		}
	</script>
