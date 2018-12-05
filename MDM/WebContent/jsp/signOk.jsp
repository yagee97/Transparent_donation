<%@page import="mdm.DBUtil" %>
<%@page import="java.sql.Connection" %>
<%@page import="java.sql.PreparedStatement" %>

<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
   PreparedStatement pstmt=null;
   request.setCharacterEncoding("UTF-8");
   String iD=request.getParameter("idx");
   int idx=Integer.parseInt(iD);
   String name=request.getParameter("name");
   String e_mail=request.getParameter("e_mail");
   String password=request.getParameter("password");
   String seed=request.getParameter("seed");
   String account=request.getParameter("account");
   String eth2=request.getParameter("eth");
   double eth=Double.parseDouble(eth2);
   String point2=request.getParameter("eth");
   double point=Double.parseDouble(request.getParameter("point"));

   Connection conn=DBUtil.getMySQLConnection();
   
   String sql="insert into MDM_member(idx, name, e_mail, password, seed, account, eth, point) values (?,?,?,?,?,?,?,?)";
   pstmt=conn.prepareStatement(sql);
   
   pstmt.setInt(1,idx);
   pstmt.setString(2,name);
   pstmt.setString(3,e_mail);
   pstmt.setString(4,password);
   pstmt.setString(5,seed);
   pstmt.setString(6,account);
   pstmt.setDouble(7,eth);
   pstmt.setDouble(8,point);
   pstmt.executeUpdate();
   
   DBUtil.close(conn);
%>
</body>
</html>