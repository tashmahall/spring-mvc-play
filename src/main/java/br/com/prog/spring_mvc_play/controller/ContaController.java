package br.com.prog.spring_mvc_play.controller;

import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import br.com.prog.spring_mvc_play.dao.ContaDAO;
import br.com.prog.spring_mvc_play.modelo.Conta;

@Controller
public class ContaController {
	private ContaDAO cDao;
	@Autowired
	public ContaController(ContaDAO cDao) {
		this.cDao = cDao;
	}
	
	@RequestMapping("/conta/formularioAddConta")
	public String adicionarConta() {
		return "/conta/formulario";
	}
	
	@RequestMapping("/conta/adicionarConta")
	public String adicionaConta(@Valid Conta conta, BindingResult result) {
		if(result.hasFieldErrors("descricao")==true) {
			return "/conta/formulario"	;		
		}
		cDao.adiciona(conta);
		return "/conta/contaAdicionada";
	}
	@RequestMapping("/conta/listarContas")
	public ModelAndView listaTodasContas() {
		List<Conta> todasContas =cDao.lista();
		ModelAndView mav = new ModelAndView("/conta/listaContas");
		mav.addObject("todasContas", todasContas);
		return mav;
	}
	@RequestMapping("/conta/deletarConta")
	public String deletarConta(Conta conta) {
		cDao.remove(conta);
		return "redirect:/conta/listarContas" ;
	}
	
	@RequestMapping("/conta/mostrarConta")
	public String mostrarConta(Conta idConta, Model model) {
		Conta conta = cDao.buscaPorId(idConta.getId());
		model.addAttribute("conta",conta);
		return "/conta/editarContaForm" ;
	}
	@RequestMapping("/conta/editarConta")
	public String editarConta(@Valid Conta conta, BindingResult result) {
		if(result.hasFieldErrors("descricao")==true) {
			return "/conta/formulario"	;		
		}
		cDao.altera(conta);
		return "redirect:/conta/listarContas" ;
	}
	@RequestMapping("/conta/pagarConta")
	public void pagarConta(Conta conta,HttpServletResponse response ) {
		Conta cTemp = cDao.buscaPorId(conta.getId());
		if(cTemp == null ) {
			return;
		}
		cDao.paga(cTemp.getId());
		response.setStatus(200);
	}
}
