package com.spr.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table
public class Question implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue
	private Integer questionId;

	private Integer um;
	private Integer dois;
	private Integer tres;
	private Integer quatro;
	private Integer cinco;
	private Integer seis;
	private Integer sete;
	private Integer oito;
	private Integer nove;
	private Integer dez;
	private Integer onze;
	private Integer doze;
	private Integer treze;
	private Integer quatorze;
	private Integer quinze;
	private Integer dezeseis;
	private Integer dezessete;
	
	@Column(length=100)
	private String idade;
	
	@Column(length=100)
	private String curso;
	
	@Column(length=3000)
	private String description;
	
	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Integer getQuestionId() {
		return questionId;
	}

	public void setQuestionId(Integer questionId) {
		this.questionId = questionId;
	}

	public Integer getUm() {
		return um;
	}

	public void setUm(Integer um) {
		this.um = um;
	}

	public Integer getDois() {
		return dois;
	}

	public void setDois(Integer dois) {
		this.dois = dois;
	}

	public Integer getTres() {
		return tres;
	}

	public void setTres(Integer tres) {
		this.tres = tres;
	}

	public Integer getQuatro() {
		return quatro;
	}

	public void setQuatro(Integer quatro) {
		this.quatro = quatro;
	}

	public Integer getCinco() {
		return cinco;
	}

	public void setCinco(Integer cinco) {
		this.cinco = cinco;
	}

	public Integer getSeis() {
		return seis;
	}

	public void setSeis(Integer seis) {
		this.seis = seis;
	}

	public Integer getSete() {
		return sete;
	}

	public void setSete(Integer sete) {
		this.sete = sete;
	}

	public Integer getOito() {
		return oito;
	}

	public void setOito(Integer oito) {
		this.oito = oito;
	}

	public Integer getNove() {
		return nove;
	}

	public void setNove(Integer nove) {
		this.nove = nove;
	}

	public Integer getDez() {
		return dez;
	}

	public void setDez(Integer dez) {
		this.dez = dez;
	}

	public Integer getOnze() {
		return onze;
	}

	public void setOnze(Integer onze) {
		this.onze = onze;
	}

	public Integer getDoze() {
		return doze;
	}

	public void setDoze(Integer doze) {
		this.doze = doze;
	}

	public Integer getTreze() {
		return treze;
	}

	public void setTreze(Integer treze) {
		this.treze = treze;
	}

	public Integer getQuatorze() {
		return quatorze;
	}

	public void setQuatorze(Integer quatorze) {
		this.quatorze = quatorze;
	}

	public Integer getQuinze() {
		return quinze;
	}

	public void setQuinze(Integer quinze) {
		this.quinze = quinze;
	}

	public Integer getDezeseis() {
		return dezeseis;
	}

	public void setDezeseis(Integer dezeseis) {
		this.dezeseis = dezeseis;
	}

	public Integer getDezessete() {
		return dezessete;
	}

	public void setDezessete(Integer dezessete) {
		this.dezessete = dezessete;
	}

	public String getIdade() {
		return idade;
	}

	public void setIdade(String idade) {
		this.idade = idade;
	}

	public String getCurso() {
		return curso;
	}

	public void setCurso(String curso) {
		this.curso = curso;
	}

}
