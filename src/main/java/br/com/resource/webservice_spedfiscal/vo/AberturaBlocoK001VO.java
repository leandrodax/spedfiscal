package br.com.resource.webservice_spedfiscal.vo;

public class AberturaBlocoK001VO extends BlocoKVO {

	public AberturaBlocoK001VO(String indicadorMovimento){
		setReg("K001");
		setIndicadorMovimento(indicadorMovimento);
	}
	
	private String indicadorMovimento;

	public String getIndicadorMovimento() {
		return indicadorMovimento;
	}
	/*
	 * informar 0 quando haver informa��es para o bloco K e 1 para quando n�o haver informa��es.
	 */
	public void setIndicadorMovimento(String indicadorMovimento) {
		this.indicadorMovimento = indicadorMovimento;
	}
	
	@Override
	public String toString() { 
        return  SEPARATOR + getReg() + SEPARATOR + getIndicadorMovimento() + SEPARATOR;
     } 
}
