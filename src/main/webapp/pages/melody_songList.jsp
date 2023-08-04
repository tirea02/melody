<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR" %>
<%@ include file="melody_db.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>song List</title>
<link rel="stylesheet" href="../css/melody_css.css">
</head>
<body>
<h3>�ֽ� �뷡	<a href="melody_albumList.jsp" target="_blank">�ֽ� �ٹ�</a></h3>
<%
// ����¡ ó��
int itemsPerPage = 6; 

String pageNumParam = request.getParameter("pageNum");
pageNUM = 1;
if (pageNumParam != null && !pageNumParam.isEmpty()) {
    pageNUM = Integer.parseInt(pageNumParam);
}

int startIndex = (pageNUM - 1) * itemsPerPage; 
int endIndex = startIndex + itemsPerPage - 1;

String songList = "SELECT * " +
        "FROM (SELECT MIN(Album.Cover_Photo) AS Cover_Photo, Song.Title, MIN(Singer.Singer_Name) AS Singer_Name, Song.Song_ID, ROWNUM AS rnum " + 
        "FROM Album " + 
        "INNER JOIN Song ON Album.Album_ID = Song.Album_ID " + 
        "INNER JOIN Singer ON Song.Singer_ID = Singer.Singer_ID "+
        "GROUP BY Album.Album_ID, Song.Title, Song.Song_ID, ROWNUM) " +
        "WHERE rnum BETWEEN " + (startIndex + 1) + " AND " + (endIndex + 1);

RS=ST.executeQuery(songList);
while(RS.next()){
    M_songID=RS.getInt("Song_ID");
    M_songTitle=RS.getString("Title");
    M_albumCover=RS.getString("Cover_Photo");
    M_singerName = RS.getString("Singer_Name");
%>

<table border="0" cellspacing="0" cellpadding="10">
    <tr>
        <td rowspan="3" align="center">
            <a href="<%=M_albumCover %>">
                <img src="<%=M_albumCover %>" alt="�ٹ� ����">
            </a>
        </td>
    </tr>
    <tr>
        <td>�� �� |  <a href="melody_songDetail.jsp?songID=<%=M_songID%>"target="_blank"><%=M_songTitle %></a></td>
    </tr>
    <tr>
        <td>���� | <%=M_singerName %></td>
    </tr>
<%
}//while
%>		
</table>

<tr>
    <td colspan="6">
    <% 
        // ����¡ ó�� ��ũ ���
        int totalDataCount = 101; 
        int totalPages = (int) Math.ceil(totalDataCount / (double) itemsPerPage); 

        int startPage = Math.max(1, pageNUM - 5); 
        int endPage = Math.min(totalPages, pageNUM + 5); 

        if (pageNUM > 1) {
            out.print("<a href=melody_songList.jsp?pageNum=" + (pageNUM - 1) + ">[����]</a>"); 
        }

        for (int i = startPage; i <= endPage; i++) {
            if (i == pageNUM) {
                out.print("<font style='font-size:16pt;color:gray;'>[" + i + "]</font>"); 
            } else {
                out.print("<a href=melody_songList.jsp?pageNum=" + i + ">[" + i + "]</a>");
            }
        }

        if (pageNUM < totalPages) {
            out.print("<a href=melody_songList.jsp?pageNum=" + (pageNUM + 1) + ">[����]</a>"); 
        }
    %>
    </td> 
</tr> 
</table>
</body>
</html>
