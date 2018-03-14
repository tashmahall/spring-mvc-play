<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Todas as contas</title>
<script src="../resources/js/jquery-3.3.1.js"  type="text/javascript"></script>
<link href="../resources/style.css" rel="stylesheet" type="text/css" media="all" />
<script type="text/javascript" >
	function deuCerto(id){
		alert("aqui");
		$("#conta_"+id).html("Paga!");
	}
	function pagarContaAgora(id){
		$.get("pagarConta", {'id':id},function(){
			$("#conta_"+id).html("Paga!");
			$("#contaDt_"+id).datepicker.formatDate('dd/MM/yyyy', new Date());
		});
	}
	
</script>

</head>
<body>
	<a href="/spring-mvc-play/deslogar">Efetuar Logoff</a>
	<p>Bem vindo, ${usuarioLogado.login}</p>
	<table>
		<tr>
			<th>Id</th>
			<th>Descrição</th>
			<th>Valor</th>
			<th>Status</th>
			<th>Data Pagamento</th>			
			<th>Tipo</th>	
			<th>Ações</th>						
		</tr>
		<c:forEach items="${todasContas}" var="conta">
			<tr>
				<td>${conta.id}</td>
				<td>${conta.descricao}</td>
				<td>${conta.valor}</td>
				<td id="conta_${conta.id}">
					<c:if test="${conta.tipo.nome eq 'SAIDA'}" >
						<c:if test="${conta.paga eq true}" >Conta Paga</c:if>
						<c:if test="${conta.paga eq false}" >Conta Não Paga</c:if>
					</c:if>
					<c:if test="${conta.tipo.nome eq 'ENTRADA'}" >Não se Aplica</c:if>
				</td >
				<td id="contaDt_${conta.id}">
					<fmt:formatDate value="${conta.dataPagamento.time}" pattern="dd/MM/yyyy"/> 
				</td>			
				<td>${conta.tipo}</td>			
				<td >
					<a href="deletarConta?id=${conta.id}">Deletar</a>
					<a href="#" onclick="pagarContaAgora(${conta.id});">Pagar</a>
					<a href="mostrarConta?id=${conta.id}">Editar</a>
				</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>