<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Efetuar Login</title>
</head>
<body>
	<h3>Efetuar Login</h3>
	<form action="efetuarLogin" method="post">
		Usuário:<input name="login" type="text"/> 
		<br/>
		Senha  :<input name="senha" type="password"/>
		<br/>
		<input type="submit" value="Efetuar Login"/>		
	</form>
</body>
</html>