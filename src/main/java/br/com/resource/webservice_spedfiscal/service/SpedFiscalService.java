package br.com.resource.webservice_spedfiscal.service;

import java.util.List;

import org.w3c.dom.Document;

import br.com.resource.webservice_spedfiscal.beans.SpedFiscal;

public interface SpedFiscalService {

	String geraSpedAutomatico(Document doc, String dataInicio, String dataFim) throws Exception;
	String geraSpedManual(List<String> list, String dataInicio, String dataFim) throws Exception;
	List<SpedFiscal> listarProcessosManuais() throws Exception;
	List<SpedFiscal> listarProcessosAutomaticos() throws Exception;
	void insereProcessoManual(SpedFiscal sped, List<String> list) throws Exception;
	void insereProcessoAutomatico(SpedFiscal sped) throws Exception;
}
