<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.util.Date" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Melody</title>
</head>
<body>

 <%
 
 Connection CN = null;
 Statement ST = null;
 PreparedStatement PST = null;
 ResultSet RS = null ;
 ResultSet RS2 = null;
 String msg = "";
 int OK = 0;
 
 int M_albumID=0, M_songID=0, M_singerID=0;
 int M_albumLikes=0, M_songLikes=0;
 int M_albumRating=0, M_musicCount=0;
 int M_rownum=0;
 java.util.Date M_Release=null;
 String M_albumCover="", M_genreName="";
 String M_albumHashtag="", M_videoURL="", M_albumInfo="";
 String M_albumTitle="", M_songTitle="", M_singerName="";
 
 int Mtotal=0;
 String Mdata="";
 
 String pnum ;
 int pageNUM, pagecount;  
 
 
  try{
	Class.forName("oracle.jdbc.driver.OracleDriver");
	String url="jdbc:oracle:thin:@127.0.0.1:1521:XE";
	CN=DriverManager.getConnection(url,"melodytest", "1234");
	System.out.println("------ db연결 성공했습니다 ------ ");
	//out.println("<h2> ------ db연결 성공했습니다 ------ </h2> ");
	ST = CN.createStatement();
  }catch(Exception ex){System.out.println("db에러:"+ex);}
 %>


</body>
</html>