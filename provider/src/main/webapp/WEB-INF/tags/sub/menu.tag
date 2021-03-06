<%@ tag import="com.project.ttxvn.model.User" %>
<%@tag description="Menu" pageEncoding="UTF-8" %>
<%@attribute name="index"%>
<%
	User user = (User) session.getAttribute("admin");
	if (user != null) {
%>
	<ul class="list-unstyled">
		<%
			if (user.isRole(User.Role.ADMINISTRATOR)) {
		%>
		<li class="nav-header"><a href="#" data-toggle="collapse"
			data-target="#userMenu">
				<h5>
					User management <i class="glyphicon glyphicon-chevron-down"></i>
				</h5>
			</a>
			<ul class="list-unstyled collapse in" id="userMenu">
				<li><a href="<%=request.getContextPath() %>/user.jsp?role=<%=User.Role.ADMINISTRATOR.getId()%>"><i class="glyphicon glyphicon-user"></i>
						Manager</a></li>
				<li><a href="<%=request.getContextPath() %>/user.jsp?role=<%=User.Role.EDITOR.getId()%>"><i class="glyphicon glyphicon-user"></i>
						Editor</a></li>
				<li><a href="<%=request.getContextPath() %>/user.jsp?role=<%=User.Role.REPORTER.getId()%>"><i class="glyphicon glyphicon-user"></i>
						Reporter</a></li>
			</ul>
		</li>
		<%}%>
		<li class="nav-header"><a href="#" data-toggle="collapse"
								  data-target="#categoryMenu">
			<h5>
				News management <i class="glyphicon glyphicon-chevron-down"></i>
			</h5>
		</a>
			<ul class="list-unstyled collapse in" id="categoryMenu">
				<%if (user.isRole(User.Role.ADMINISTRATOR)) {%>
				<li><a href="<%=request.getContextPath() %>/category.jsp"> <i class="glyphicon glyphicon-list-alt"></i>
					Category </a></li>
				<%}%>
				<li><a href="<%=request.getContextPath() %>/news.jsp"> <i class="glyphicon glyphicon-pencil"></i>
					News </a></li>
				<%if (user.isRole(User.Role.ADMINISTRATOR)) {%>
				<li><a href="<%=request.getContextPath() %>/news-request.jsp"> <i class="glyphicon glyphicon-envelope"></i>
					News request </a></li>
				<%}%>
			</ul>
		</li>
		<%--<li class="nav-header"><a href="<%=request.getContextPath() %>/newsml-g2.jsp" >--%>
				<%--<h5>--%>
					<%--NewsML-G2--%>
				<%--</h5>--%>
		<%--</a></li>--%>
	</ul>

<%}%>