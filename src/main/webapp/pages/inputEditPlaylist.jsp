<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Create MyPlaylist</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
</head>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.min.js" integrity="sha384-Rx+T1VzGupg4BHQYs2gCW9It+akI2MM/mndMCy36UVfodzcJcF0GGLxZIzObiEfa" crossorigin="anonymous"></script>
<body>

	<!-- Edit Playlist -->
	<section>
		<form action="${pageContext.request.contextPath}/EditPlaylist?playlistId=<%= request.getParameter("playlistId") %>" method="post" class="EditPlaylist" name="EditPlaylist">
		
			<div class="card">
					<div class="card-header">
						<h1>Create My PlayList</h1>
					</div>
				<div class="card-body">
					
					<div>
						<label>MyList Name</label><br>
						<input type="text" name="playlistname">
					</div>
					
					<div>
						<label>Description</label><br>
						<input type="text" name="playlistdescription">
					</div>
					
					<div>
						<label>HasgTag</label><br>
						<input type="text" name="playlisthashtags">
					</div>
					
					<p></p>
					
					<div>
						<input type="submit" value="EditPlaylist" class="btn btn-primary" id="submitButton">
					</div>
				</div>
			</div>
		</form>
	</section>


</body>
</html>