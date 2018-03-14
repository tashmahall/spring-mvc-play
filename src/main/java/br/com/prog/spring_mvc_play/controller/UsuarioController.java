package br.com.prog.spring_mvc_play.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import br.com.prog.spring_mvc_play.dao.UsuarioDAO;
import br.com.prog.spring_mvc_play.modelo.Usuario;

@Controller
public class UsuarioController {
	private UsuarioDAO uDao;
	@Autowired
	public UsuarioController(UsuarioDAO uDao) {
		this.uDao = uDao;
	}
	@RequestMapping("loginForm")
	public String loginForm() {
		return "usuario/loginForm";
	}
	@RequestMapping("efetuarLogin")
	public String efetuarLogin(Usuario user, HttpSession session) {
		if(uDao.existeUsuario(user)) {
			session.setAttribute("usuarioLogado", user);
			return "redirect:/conta/listarContas" ;
		}
		return "usuario/loginForm";
	}
	@RequestMapping("deslogar")
	public String deslogar(HttpSession session) {
		session.invalidate();
		return "usuario/loginForm";
	}
}
