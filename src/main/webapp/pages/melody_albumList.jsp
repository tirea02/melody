<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR" %>
<%@ include file="melody_db.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>album List</title>
<link rel="stylesheet" href="../css/melody_css.css">
</head>

<body>

<%
//페이징 처리
int itemsPerPage = 6; 

String pageNumParam = request.getParameter("pageNum");
pageNUM = 1;
if (pageNumParam != null && !pageNumParam.isEmpty()) {
 pageNUM = Integer.parseInt(pageNumParam);
}

int startIndex = (pageNUM - 1) * itemsPerPage; 
int endIndex = startIndex + itemsPerPage - 1; 

 %>    
 <h3>최신 앨범	<a href="melody_songList.jsp" target="_blank">최신 노래</a></h3>
 <%
 String albumID = request.getParameter("albumID");
 String albumDetail = "melody_albumDetail.jsp?albumID=" + albumID;
 String albumList1 = "SELECT  * " +
		" FROM (SELECT MIN(Album.Cover_Photo) AS Cover_Photo, Album.Album_Title, MIN(Singer.Singer_Name) AS Singer_Name, " + 
         "Album.Album_ID, ROWNUM AS rnum FROM Album " + 
         "INNER JOIN Song ON Album.Album_ID = Song.Album_ID " + 
         "INNER JOIN Singer ON Song.Singer_ID = Singer.Singer_ID " +
         "GROUP BY Album.Album_ID, Album.Album_Title, ROWNUM) " +
         "WHERE rnum BETWEEN " + (startIndex + 1) + " AND " + (endIndex + 1);

 RS=ST.executeQuery(albumList1);
 while(RS.next()==true){
	M_albumID = RS.getInt("Album_ID");
 	M_albumCover=RS.getString("Cover_Photo");
 	M_albumTitle=RS.getString("Album_Title");
 	M_singerName=RS.getString("Singer_Name");
 %>

    <table border="0" cellspacing="0" cellpadding="10">
        <tr>
            <td rowspan="3" align="center">
                <a href="<%=M_albumCover %>">
					<img src="<%=M_albumCover %>" alt="앨범 사진">
				</a>
            </td>
        </tr>
        <tr>
            <td>앨범명 | <a href="melody_albumDetail.jsp?albumID=<%=M_albumID%>"target="_blank"><%=M_albumTitle%></a></td>
        </tr>
        <tr>
            <td>가수 | <%=M_singerName %></td>
        </tr>
<%
}//while
%>
	<tr>
     <td colspan="6">
       <% 
	       int totalDataCount = 25; 
	       int totalPages = (int) Math.ceil(totalDataCount / (double) itemsPerPage); 
	
	       int startPage = Math.max(1, pageNUM - 5); 
	       int endPage = Math.min(totalPages, pageNUM + 5); 
	
	       if (pageNUM > 1) {
	           out.print("<a href=melody_songList.jsp?pageNum=" + (pageNUM - 1) + ">[이전]</a>"); 
	       }
	
	       for (int i = startPage; i <= endPage; i++) {
	           if (i == pageNUM) {
	               out.print("<font style='font-size:16pt;color:gray;'>[" + i + "]</font>"); 
	           } else {
	               out.print("<a href=melody_songList.jsp?pageNum=" + i + ">[" + i + "]</a>");
	           }
	       }
	
	       if (pageNUM < totalPages) {
	           out.print("<a href=melody_songList.jsp?pageNum=" + (pageNUM + 1) + ">[다음]</a>"); 
	       }
   %>
      </td> 
  </tr> 
 </table>
</body>
</html>
