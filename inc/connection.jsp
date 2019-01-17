<%@include file="config.jsp"%>
<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %>

<%
    request.setAttribute("root", "http://" +request.getServerName()+":8080/supero/");
    request.setAttribute("bootstrapCssRoot", "http://" + request.getServerName() + ":8080/supero/node_modules/bootstrap/dist/css/");
    request.setAttribute("bootstrapJsRoot", "http://" + request.getServerName() + ":8080/supero/node_modules/bootstrap/dist/js/");

    String connectionURL = "jdbc:mysql://localhost/"+db+"?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";
    Connection connection = null; 
    try {
        
        Class.forName("com.mysql.jdbc.Driver").newInstance(); 
        connection = DriverManager.getConnection(connectionURL, user, pass);
    } catch (Exception ex) {
        out.println("Não foi possível conectar ao banco de dados "+ex);
    }

%>