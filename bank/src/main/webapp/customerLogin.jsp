<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Customer Login</title>
    <style>
        body { font-family: Arial, sans-serif; }
        .container { width: 300px; margin: 0 auto; padding: 20px; border: 1px solid #ccc; border-radius: 5px; }
        .error { color: red; }
    </style>
</head>
<body>
    <div class="container">
        <h2>Customer Login</h2>
        <form action="CustomerLoginServlet" method="post">
            <label for="accountNumber">Account Number:</label><br>
            <input type="text" id="accountNumber" name="accountNumber" required><br><br>
            <label for="password">Password:</label><br>
            <input type="password" id="password" name="password" required><br><br>
            <input type="submit" value="Login">
        </form>
        <% 
            String error = request.getParameter("error");
            if ("1".equals(error)) { 
        %>
            <p class="error">Invalid credentials. Please try again.</p>
        <% 
            } else if ("2".equals(error)) { 
        %>
            <p class="error">Class not found error. Please contact support.</p>
        <% 
            } else if ("3".equals(error)) { 
        %>
            <p class="error">Database error. Please contact support.</p>
        <% 
            } else if ("4".equals(error)) { 
        %>
            <p class="error">Unknown error. Please contact support.</p>
        <% 
            } 
        %>
    </div>
</body>
</html>
