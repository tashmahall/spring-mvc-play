<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Formulário Editar Conta</title>
</head>
<body>
	<h3>Adicionar Nova Conta</h3>
	<form action="editarConta" method="post">
		Id Conta: <input name="id" value="${conta.id}" type="text" readonly="readonly"><br/>
		Descrição: <br/>
		<textarea name="descricao" rows="5" cols="100">${conta.descricao}</textarea> 
		<form:errors path="conta.descricao"/>
		<br/>
		Valor: <input name="valor" value="${conta.valor}" type="text"/><br/>
		Tipo:
		<select name="tipo">
			<option  value="ENTRADA" ${conta.tipo == 'ENTRADA' ? 'selected' : ''}>Entrada</option>
			<option value="SAIDA" ${conta.tipo == 'SAIDA' ? 'selected' : '' }>Saída</option>
		</select>
		<br/>
		<br/>
		<input type="submit" value="Editar"/>
	</form>
	<form action="listarContas" method="post"><input type="submit"  value="Listar Contas"></form>	
</body>
</html>