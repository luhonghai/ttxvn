<%@ tag import="com.project.ttxvn.model.User" %>
<%@tag description="Menu" pageEncoding="UTF-8" %>
<%@attribute name="index"%>

	<ul class="list-unstyled">
		<li class="nav-header"><a href="#" data-toggle="collapse"
			data-target="#userMenu">
				<h5>
					User management <i class="glyphicon glyphicon-chevron-down"></i>
				</h5>
			</a>
			<ul class="list-unstyled collapse in" id="userMenu">
				<li><a href="<%=request.getContextPath() %>/admin/user.jsp?role=<%=User.Role.ADMINISTRATOR.getId()%>"><i class="glyphicon glyphicon-user"></i>
						Administrator</a></li>
				<li><a href="<%=request.getContextPath() %>/admin/user.jsp?role=<%=User.Role.EDITOR.getId()%>"><i class="glyphicon glyphicon-user"></i>
						Editor</a></li>
				<li><a href="<%=request.getContextPath() %>/admin/user.jsp?role=<%=User.Role.REPORTER.getId()%>"><i class="glyphicon glyphicon-user"></i>
						Reporter</a></li>
			</ul>
		</li>
		<li class="nav-header"><a href="#" data-toggle="collapse"
								  data-target="#categoryMenu">
			<h5>
				News management <i class="glyphicon glyphicon-chevron-down"></i>
			</h5>
		</a>
			<ul class="list-unstyled collapse in" id="categoryMenu">
				<li><a href="<%=request.getContextPath() %>/admin/category.jsp"> <i class="glyphicon glyphicon-list-alt"></i>
					Category </a></li>
				<li><a href="<%=request.getContextPath() %>/admin/news.jsp"> <i class="glyphicon glyphicon-pencil"></i>
					News </a></li>
			</ul>
		</li>
		<li class="nav-header"><a href="<%=request.getContextPath() %>/admin/newsml-g2.jsp" >
				<h5>
					NewsML-G2
				</h5>
		</a></li>
	</ul>

