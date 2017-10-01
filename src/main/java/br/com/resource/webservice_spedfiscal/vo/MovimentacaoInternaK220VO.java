package br.com.resource.webservice_spedfiscal.vo;

public class MovimentacaoInternaK220VO extends BlocoKVO{

	public MovimentacaoInternaK220VO(String dataMovimentacao,String codItemDestino,
			String codItemOrigem,String qtdMovimentada){
		setReg("K220"); 
		setDataMovimentacao(dataMovimentacao);
		setCodItemDestino(codItemDestino);
		setCodItemOrigem(codItemOrigem);
		setQtdMovimentada(qtdMovimentada);
	}

	private String dataMovimentacao;
	private String codItemOrigem;
	private String codItemDestino;
	private String qtdMovimentada;

	public String getDataMovimentacao() {
		return dataMovimentacao;
	}


	public void setDataMovimentacao(String dataMovimentacao) {
		this.dataMovimentacao = dataMovimentacao;
	}

	public String getCodItemOrigem() {
		return codItemOrigem;
	}
	
	public void setCodItemOrigem(String codItemOrigem) {
		this.codItemOrigem = codItemOrigem;
	}
	
	public String getCodItemDestino() {
		return codItemDestino;
	}
	
	public void setCodItemDestino(String codItemDestino) {
		this.codItemDestino = codItemDestino;
	}
	
	public String getQtdMovimentada() {
		return qtdMovimentada;
	}
	
	public void setQtdMovimentada(String qtdMovimentada) {
		this.qtdMovimentada = qtdMovimentada;
	}

	@Override
	public String toString() { 
        return  SEPARATOR + getReg() + SEPARATOR + getDataMovimentacao() + SEPARATOR + getCodItemOrigem() + SEPARATOR
        		 + getCodItemDestino() + SEPARATOR + getQtdMovimentada() + SEPARATOR;
     } 
}

