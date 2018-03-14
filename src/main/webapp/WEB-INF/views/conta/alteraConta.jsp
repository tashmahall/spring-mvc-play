<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Formulário Adicionar Conta</title>
</head>
<body>
	<h3>Adicionar Nova Conta</h3>
	<form action="adicionarConta" method="post">
		Descrição: <br/>
		<textarea name="descricao" rows="5" cols="100"></textarea> <br/>
		Valor:
		<input name="valor" type="text"/>
		<br/>
		Tipo:
		<select name="tipo">
			<option value="" selected="selected">Selecione Tipo</option>
			<option value="ENTRADA">Entrada</option>
			<option value="SAIDA">Saída</option>
		</select>
		<br/>
		<br/>
		<input type="submit" value="Adicionar"/>		
	</form>
</body>
</html>