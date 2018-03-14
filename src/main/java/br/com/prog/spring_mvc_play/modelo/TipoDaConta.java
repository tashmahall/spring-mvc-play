package br.com.prog.spring_mvc_play.modelo;

public enum TipoDaConta {
	ENTRADA("ENTRADA"),
	SAIDA ("SAIDA");
	private String nome;
	private TipoDaConta(String nome) {
		this.nome = nome;
	}
	public String getNome() {
		return nome;
	}
}
