<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
 pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css">
<script>
function check()
{ 
     var username = document.form.username.value; 
     var password = document.form.password.value;

      
   
     if (username==null || username=="")
     { 
     alert("Username field can't be blank."); 
     return false; 
     }
     else if(password==null || password=="")
     { 
     alert("Password field can't be blank."); 
     return false; 
     } 
 } 
</script> 
</head>
<body>
 <%@include file="../resources/header.jsp" %>
 <div align="center">
  <h1>Login Form</h1>
  <form name="form" action="<%=request.getContextPath()%>/login" method="post" onsubmit="return check()">
   <table style="with: 100%">
    <tr>
     <td>Username</td>
     <td><input type="text" name="username" /></td>
    </tr>
    <tr>
     <td>Password</td>
     <td><input type="password" name="password" /></td>
    </tr>
    
    	 <tr>
         <td></td>
         <td><input type="submit" value="Login"></input><input
         type="reset" value="Reset"></input></td>
         </tr>
         

   </table>
  </form>
  </div>
  <%@include file="../resources/footer.jsp" %>
</body>
</html>