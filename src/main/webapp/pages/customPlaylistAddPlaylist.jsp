<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- Create PlayList -->
	<section>
		<form action="${pageContext.request.contextPath}/CustomPlaylistInsert" method="posts" class="CreateMylistForm" name="CreateMylistForm">
			<h1>Create MyList</h1>
			<div class="Mylist-text">
				<div>
					<label>MyList Name</label>
					<input type="text" name="name">
				</div>
				
				<div>
					<label>Description</label>
					<input type="text" name="description">		
				</div>
				
				<div>
					<label>HasgTag</label>
					<input type="text" name="hashtag">
				</div>
				
				<div>
					<input type="submit" value="Create Mylist" class="submitButton" id="submitButton">
				</div>
			</div>
		</form>
	</section>

</body>
</html>