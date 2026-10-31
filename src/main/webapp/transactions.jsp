
<%@ page import="java.sql.*" %>
<%@ page import="com.bankfraud.DBConnection" %>
<%@ page contentType="text/html;charset=UTF-8" %>

<!DOCTYPE html>
<html>
<head>
<title>Bank Transactions</title>
<style>
body{font-family:Arial;background:#f1f5f9;text-align:center;padding:20px}
.box{background:white;padding:25px;margin:25px auto;
width:350px;border-radius:12px;box-shadow:0 2px 10px #ccc}
input,select,button{width:90%;padding:12px;margin:10px}
button{background:#14213d;color:white;border:0;cursor:pointer}
table{width:100%;background:white;border-collapse:collapse;margin-top:20px}
th,td{padding:12px;border:1px solid #ddd}
th{background:#14213d;color:white}
</style>
</head>
<body>

<div class="box">
<h2>Bank Transaction</h2>

<form action="TransactionServlet" method="post">
<input type="number" name="accountId" placeholder="Account ID" required>

<select name="type">
<option value="DEPOSIT">Deposit</option>
<option value="WITHDRAWAL">Withdraw</option>
</select>

<input type="number" name="amount" placeholder="Enter Amount"
min="1" step="0.01" required>

<button type="submit">Submit Transaction</button>
</form>
</div>

<h2>Transaction History</h2>

<table>
<tr>
<th>ID</th>
<th>Account ID</th>
<th>Type</th>
<th>Amount</th>
<th>Status</th>
</tr>

<%
try(Connection con=DBConnection.getConnection();
Statement st=con.createStatement();
ResultSet rs=st.executeQuery("SELECT * FROM transactions ORDER BY transaction_id DESC")){

while(rs.next()){
%>
<tr>
<td><%=rs.getInt("transaction_id")%></td>
<td><%=rs.getInt("account_id")%></td>
<td><%=rs.getString("transaction_type")%></td>
<td><%=rs.getBigDecimal("amount")%></td>
<td><%=rs.getString("status")%></td>
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
