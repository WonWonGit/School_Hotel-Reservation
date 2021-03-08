<head>
<%@ page
import="java.sql.*,
javax.sql.*,
java.io.*" %>
</head>
<body>
<h1>JDBC Test</h1>

<%
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/allintonight", "allintonight" , "team1team1");
Statement stmt = conn.createStatement();
%>
<script>
alert("성공");
</script>
<%
stmt.close();
conn.close();
%>

</body>
</html>