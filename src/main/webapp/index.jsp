
<%@ page import="java.sql.*" %>
<%@ page import="com.bankfraud.DBConnection" %>
<%@ page contentType="text/html;charset=UTF-8" %>

<%
int customers=0, transactions=0, alerts=0;
try(Connection con=DBConnection.getConnection();
Statement st=con.createStatement()) {
    ResultSet rs=st.executeQuery("SELECT COUNT(*) FROM customers");
    if(rs.next()) customers=rs.getInt(1);

    rs=st.executeQuery("SELECT COUNT(*) FROM transactions");
    if(rs.next()) transactions=rs.getInt(1);

    rs=st.executeQuery("SELECT COUNT(*) FROM fraud_alerts");
    if(rs.next()) alerts=rs.getInt(1);
} catch(Exception e) {
    out.println(e.getMessage());
}
%>

<!DOCTYPE html>
<html>
<head>
<title>BankGuard Dashboard</title>
<style>
*{box-sizing:border-box}
body{margin:0;font-family:Arial;background:#f1f5f9;color:#14213d}
nav{background:#14213d;padding:22px 8%;display:flex;
justify-content:space-between;align-items:center}
.logo{color:#62dfc9;font-size:25px;font-weight:bold}
nav a{color:white;text-decoration:none;margin-left:25px}
nav a:hover{color:#62dfc9}
.container{padding:45px 8%}
.welcome{background:linear-gradient(120deg,#14213d,#087f80);
color:white;padding:35px;border-radius:18px;margin-bottom:30px}
.welcome h1{font-size:30px;margin:0 0 12px}
.cards{display:grid;grid-template-columns:repeat(3,1fr);gap:22px}
.card{background:white;padding:25px;border-radius:15px;
box-shadow:0 4px 15px #0001;transition:.3s}
.card:hover{transform:translateY(-7px)}
.card h2{font-size:35px;margin:12px 0;color:#14213d}
.card p{color:#64748b;margin:0}
.icon{font-size:28px}
.actions{display:flex;gap:20px;margin-top:30px}
.action{background:white;padding:25px;border-radius:15px;
flex:1;text-decoration:none;color:#14213d;
box-shadow:0 4px 15px #0001;font-weight:bold}
.action:hover{background:#e0f7f4}
footer{text-align:center;padding:20px;color:#64748b}
@media(max-width:650px){
nav{display:block;text-align:center}
nav a{display:inline-block;margin:12px 7px}
.cards{grid-template-columns:1fr}
.actions{flex-direction:column}
}
</style>
</head>
<body>

<nav>
<div class="logo">🛡 BankGuard</div>
<div>
<a href="index.jsp">Dashboard</a>
<a href="transactions.jsp">Transactions</a>
<a href="alerts.jsp">Fraud Alerts</a>
</div>
</nav>

<div class="container">

<div class="welcome">
<h1>Welcome to BankGuard!</h1>
<p>Smart Banking Security & Fraud Monitoring System</p>
<p>Monitor transactions. Detect suspicious activity. Protect accounts.</p>
</div>

<div class="cards">
<div class="card">
<div class="icon">👥</div>
<p>Total Customers</p>
<h2><%=customers%></h2>
</div>

<div class="card">
<div class="icon">💳</div>
<p>Total Transactions</p>
<h2><%=transactions%></h2>
</div>

<div class="card">
<div class="icon">🚨</div>
<p>Fraud Alerts</p>
<h2><%=alerts%></h2>
</div>
</div>

<div class="actions">
<a class="action" href="transactions.jsp">
💳 Manage Transactions →
</a>
<a class="action" href="alerts.jsp">
🛡 View Fraud Alerts →
</a>
</div>

</div>

<footer>BankGuard | Bank Fraud Detection System</footer>
</body>
</html>



