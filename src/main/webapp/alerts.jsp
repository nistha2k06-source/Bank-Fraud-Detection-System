
<%@ page import="java.sql.*" %>
<%@ page import="com.bankfraud.DBConnection" %>
<%@ page contentType="text/html;charset=UTF-8" %>

<!DOCTYPE html>
<html>
<head>
<title>Fraud Alerts</title>
<style>
body{font-family:Arial;background:#f1f5f9;padding:25px}
table{width:100%;background:white;border-collapse:collapse}
th,td{padding:12px;border:1px solid #ddd;text-align:center}
th{background:#14213d;color:white}
h2{color:#14213d}
</style>
</head>
<body>
<h2>Bank Fraud Alerts</h2>
<table>
<tr>
<th>Alert ID</th><th>Transaction ID</th>
<th>Reason</th><th>Status</th>
</tr>

<%
try(Connection con=DBConnection.getConnection();
Statement st=con.createStatement();
ResultSet rs=st.executeQuery("SELECT * FROM fraud_alerts")){

while(rs.next()){
%>
<tr>
<td><%=rs.getInt("alert_id")%></td>
<td><%=rs.getInt("transaction_id")%></td>
<td><%=rs.getString("alert_reason")%></td>
<td><%=rs.getString("alert_status")%></td>
</tr>
<%
}
}catch(Exception e){
out.println(e.getMessage());
}
%>
</table>
</body>
</html>

