<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
 pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css">
<title>Register</title>
<script> 
function validate()
{ 
	 var firstname = document.form.firstname.value;
	 var lastname = document.form.lastname.value;
     var email = document.form.email.value;
     var username = document.form.username.value; 
     var password = document.form.password.value;
     var conpassword= document.form.conpassword.value;
      
     if (firstname==null || firstname=="")
     { 
     alert("Firstname field is blank."); 
     return false; 
     }
     else if(lastname== null || lastname=="")
     {
    	 alert("Lastname field is blank.")
    	 return false;
     }
     else if (email==null || email=="")
     { 
     alert("Email field is blank."); 
     return false; 
     }
     else if (username==null || username=="")
     { 
     alert("Username field is blank."); 
     return false; 
     }
     else if(password.length<6)
     { 
     alert("Password must be at least 6 characters long."); 
     return false; 
     } 
     else if (password!=conpassword)
     { 
     alert("Confirm Password should match with the password."); 
     return false; 
     } 
 } 
</script> 
</head>
<body>
 <%@include file="../resources/header.jsp" %>
<center><h2>Register page</h2></center>
    <form name="form" action="<%=request.getContextPath()%>/register" method="post" onsubmit="return validate()">
        <table align="center">
         <tr>
         <td>Firstname</td>
         <td><input type="text" name="firstname" /></td>
         </tr>
            <tr>
         <td>Lastname</td>
         <td><input type="text" name="lastname" /></td>
         </tr>
         <tr>
         <td>Email</td>
         <td><input type="text" name="email" /></td>
         </tr>
         <tr>
         <td>Username</td>
         <td><input type="text" name="username" /></td>
         </tr>
         <tr>
         <td>Password</td>
         <td><input type="password" name="password" /></td>
         </tr>
         <tr>
         <td>Confirm Password</td>
         <td><input type="password" name="conpassword" /></td>
         </tr>
         <tr>
         <td><%=(request.getAttribute("errMessage") == null) ? ""
         : request.getAttribute("errMessage")%></td>
         </tr>
         <tr>
         <td></td>
         <td><input type="Submit" value="Register"></input><input
         type="reset" value="Reset"></input></td></tr>
         
        </table>
    </form>
        
    
 <%@include file="../resources/footer.jsp" %>
</body>
</html>