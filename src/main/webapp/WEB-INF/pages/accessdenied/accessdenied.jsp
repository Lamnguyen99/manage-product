<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Access Denied</title>

</head>
<body>

	<div class="breadcrumb-area">
		<div class="container">
			<div class="breadcrumb-content">
				<ul>
                                    <li><a href="${pageContext.request.contextPath}/user/home">Home</a></li>
					<li class="active">404 Error</li>
				</ul>
			</div>
		</div>
	</div>
	<div class="error404-area pt-30 pb-60">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="error-wrapper text-center ptb-50 pt-xs-20">
						<div class="error-text">
							<h1 style="font-size: 100px;">Accessdenied</h1>
							<h2>Opps! PAGE NOT BE FOUND</h2>
							<p>
								Sorry but the page you are looking for does not exist, have been
								removed, <br> name changed or is temporarity unavailable.
							</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>