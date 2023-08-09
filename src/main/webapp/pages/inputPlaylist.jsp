<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Create MyPlaylist</title>
</head>
<body>

	<!-- Create PlayList -->
	<section>
		<form action="${pageContext.request.contextPath}/AddPlaylist" method="post" class="CreateMylistForm" name="CreateMylistForm">
			<h1>Create My PlayList</h1>
			<div class="Mylist-text">
				<div>
					<label>MyList Name</label>
					<input type="text" name="playlistname">
				</div>
				
				<div>
					<label>Description</label>
					<input type="text" name="playlistdescription">
				</div>
				
				<div>
					<label>HasgTag</label>
					<input type="text" name="playlisthashtags">
				</div>
				
				<div>
					<input type="submit" value="Create Mylist" class="submitButton" id="submitButton">
				</div>
			</div>
		</form>
	</section>

</body>
</html>