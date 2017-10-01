package br.com.resource.webservice_spedfiscal.service;


import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

import br.com.resource.webservice_spedfiscal.beans.Produto;
import br.com.resource.webservice_spedfiscal.beans.SpedFiscal;
import br.com.resource.webservice_spedfiscal.dao.SpedFiscalDao;
import br.com.resource.webservice_spedfiscal.vo.AberturaBlocoK001VO;
import br.com.resource.webservice_spedfiscal.vo.EstoqueEscrituradoK200VO;
import br.com.resource.webservice_spedfiscal.vo.IndustrializadoEmTerceirosK255VO;
import br.com.resource.webservice_spedfiscal.vo.IndustrializadoPorTerceirosK250VO;
import br.com.resource.webservice_spedfiscal.vo.InsumosConsumidosK235VO;
import br.com.resource.webservice_spedfiscal.vo.ItensProduzidosK230VO;
import br.com.resource.webservice_spedfiscal.vo.MovimentacaoInternaK220VO;
import br.com.resource.webservice_spedfiscal.vo.PeriodoApuracaoK100VO;

@Service
public class SpedFiscalServiceImpl implements SpedFiscalService {

	@Autowired
	ProdutoService produtoService;
	@Autowired
	ProdutorService produtorService;
	@Autowired
	SpedFiscalDao spedFiscalDao;
	
	public static final String SEPARATOR = "\r\n";  
	
	/* (non-Javadoc)
	 * @see br.com.resource.webservice_spedfiscal.service.SpedFiscalService#readerXML(java.io.File)
	 */
	public String geraSpedAutomatico(Document doc,String dataInicio, String dataFim) throws Exception{
		
		StringBuilder blocoK = new StringBuilder("");
	    try {  
		   // File file = new File(files.getPath());
	    	//DocumentBuilderFactory dbFactory = DocumentBuilderFactory.newInstance();
	    	//DocumentBuilder dBuilder = dbFactory.newDocumentBuilder();
	    	//Document doc = dBuilder.parse(new File(file.getPath()));  
	 
			//optional, but recommended
			//read this - http://stackoverflow.com/questions/13786607/normalization-in-dom-parsing-with-java-how-does-it-work
			doc.getDocumentElement().normalize();
	 
	
			NodeList emitList = doc.getElementsByTagName("emit");
			NodeList destList = doc.getElementsByTagName("dest");
			NodeList detList = doc.getElementsByTagName("det");
			NodeList prodList = doc.getElementsByTagName("prod");
	 
			List<Produto> produtos = new ArrayList<Produto>();
	
			for (int temp = 0; temp < prodList.getLength(); temp++) {
				Produto produto = new Produto(); 
				Node nNode = prodList.item(temp); 
				
				if (nNode.getNodeType() == Node.ELEMENT_NODE) {
	
					Element eElement = (Element) nNode;
					produto.setCodProduto(eElement.getElementsByTagName("cProd").item(0).getTextContent());
					produto.setQtdEstoque(eElement.getElementsByTagName("qCom").item(0).getTextContent().
							replace(".0000", ""));
					produto.setTipoProduto("0");
					produto.setCodProdutor("");
					produtos.add(produto); 
	  
				}
			}
			Calendar calendar = Calendar.getInstance(); 
			 
			//K230
			calendar.set(Calendar.DATE, 10);
			Date dateInicioOP = calendar.getTime();
			Date dateFimOP = null; 
			//K235
			calendar.set(Calendar.DATE, 28);
			Date dataSaidaEstoque = calendar.getTime(); 
			// produto Por/Em terceiros
			calendar.set(Calendar.DATE, 18);
			Date dataConsProd = calendar.getTime();  
			SimpleDateFormat sdf = new SimpleDateFormat("ddMMyyyy");
			
			AberturaBlocoK001VO abertura = new AberturaBlocoK001VO("0");		
			PeriodoApuracaoK100VO periodoApuracao = new PeriodoApuracaoK100VO(dataInicio, dataFim);
	
			List<EstoqueEscrituradoK200VO> estoquesEscriturado = new ArrayList<EstoqueEscrituradoK200VO>();
			List<MovimentacaoInternaK220VO> movimentacoes = new ArrayList<MovimentacaoInternaK220VO>();
			List<ItensProduzidosK230VO> itensProduzidos = new ArrayList<ItensProduzidosK230VO>();
			List<InsumosConsumidosK235VO> insumosConsumidos = new ArrayList<InsumosConsumidosK235VO>();
			List<IndustrializadoPorTerceirosK250VO> indsPorTerceiros = new ArrayList<IndustrializadoPorTerceirosK250VO>();
			List<IndustrializadoEmTerceirosK255VO> indsEmTerceiros = new ArrayList<IndustrializadoEmTerceirosK255VO>();
			for(Produto estoque : produtos){
				
				//"00", "01", "02", "03", "04", "05", "06" e "10" 
				//K200
				EstoqueEscrituradoK200VO estoqueEscriturado = new EstoqueEscrituradoK200VO(dataFim
						,estoque.getCodProduto(),estoque.getQtdEstoque()
						,estoque.getTipoProduto(),estoque.getCodProdutor());
				estoquesEscriturado.add(estoqueEscriturado);

				//tipoProduto = 00, 01, 02, 03, 04, 05 e 10.
				//K220 - cod item destino
				MovimentacaoInternaK220VO movimentacaoInterna = new MovimentacaoInternaK220VO(dataInicio,
						estoque.getCodProduto(),"32"+estoque.getCodProduto(),estoque.getQtdEstoque());
				movimentacoes.add(movimentacaoInterna);

				//tipoProduto = 02, 03 - posse = 2 - datinicioProd - dataFimProd - OP
				//K230
				ItensProduzidosK230VO itemProduzido = new ItensProduzidosK230VO(sdf.format(dateInicioOP),
						"","OSP27"+estoque.getCodProduto(),estoque.getCodProduto(),estoque.getQtdEstoque());
				itensProduzidos.add(itemProduzido);
				
				//TipoProduto = 00, 01, 02, 03, 04, 05 e 10. - posse = 1
				//K235
				InsumosConsumidosK235VO insumoConsumido =  new InsumosConsumidosK235VO(sdf.format(dataSaidaEstoque)
						,estoque.getCodProduto(),estoque.getQtdEstoque(), "");
				insumosConsumidos.add(insumoConsumido);

				//TipoProduto = 00, 01, 02, 03, 04, 05 e 10. - posse = 2 - data de produção (dataConsProd)
				//K250
				IndustrializadoPorTerceirosK250VO indPorTerceiros =  new IndustrializadoPorTerceirosK250VO(sdf.format(dataConsProd)
						,estoque.getCodProduto(),estoque.getQtdEstoque());
				indsPorTerceiros.add(indPorTerceiros);

				//TipoProduto = 00, 01, 02, 03, 04, 05 e 10. - posse = 1 - data de produção (dataConsProd)
				//K255
				IndustrializadoEmTerceirosK255VO indEmTerceiros =  new IndustrializadoEmTerceirosK255VO(sdf.format(dataConsProd)
						,estoque.getCodProduto(),estoque.getQtdEstoque(), "");
				indsEmTerceiros.add(indEmTerceiros);
				
			} 
			 
			blocoK.append(montaSpedFiscal(abertura, periodoApuracao, estoquesEscriturado,movimentacoes,itensProduzidos,
					insumosConsumidos,indsPorTerceiros,indsEmTerceiros));
		
	    } catch (Exception e) {
			e.printStackTrace();
			throw new Exception("Erro ao ler o arquivo, entre em contato com a equipe de desenvolvimento.");
	    }
		return blocoK.toString();
	}
  

	public String geraSpedManual(List<String> produtos, String dataInicio, String dataFim) throws Exception {
		StringBuilder blocoK = new StringBuilder("");
	    try {  
			List<Produto> listaProdutos = new ArrayList<Produto>();
			for(String produtoIterator : produtos){
				Produto produto = new Produto(); 
				//Busca Produto por Codigo
				produto = produtoService.buscarProdutoPorCodigo(produtoIterator);
				produto.setCodProdutor(!produto.getProdutor().getCodProdutor().equals("00000") ? produto.getProdutor().getCodProdutor() : "");
				 
				listaProdutos.add(produto);			
			}
			
			AberturaBlocoK001VO abertura = new AberturaBlocoK001VO("0");		
			PeriodoApuracaoK100VO periodoApuracao = new PeriodoApuracaoK100VO(dataInicio, dataFim);
	
			List<EstoqueEscrituradoK200VO> estoquesEscriturado = new ArrayList<EstoqueEscrituradoK200VO>();
			List<MovimentacaoInternaK220VO> movimentacoes = new ArrayList<MovimentacaoInternaK220VO>();
			List<ItensProduzidosK230VO> itensProduzidos = new ArrayList<ItensProduzidosK230VO>();
			List<InsumosConsumidosK235VO> insumosConsumidos = new ArrayList<InsumosConsumidosK235VO>();
			List<IndustrializadoPorTerceirosK250VO> indsPorTerceiros = new ArrayList<IndustrializadoPorTerceirosK250VO>();
			List<IndustrializadoEmTerceirosK255VO> indsEmTerceiros = new ArrayList<IndustrializadoEmTerceirosK255VO>();
	
			for(Produto produto : listaProdutos){
				
				EstoqueEscrituradoK200VO estoqueEscriturado = new EstoqueEscrituradoK200VO(dataFim
						,produto.getCodProduto(),produto.getQtdEstoque()
						,produto.getTipoProduto(),produto.getCodProdutor() != "" ? produto.getCodProdutor() : "");
				
				estoquesEscriturado.add(estoqueEscriturado);
				//Fluxo para k230 e k220
				if(("k230").equals(produto.getBlocoTipoProduto())){
					//K220
					MovimentacaoInternaK220VO movimentacaoInterna = new MovimentacaoInternaK220VO(dataInicio,
							produto.getCodItemDestino(),produto.getCodProduto(),produto.getQtdEstoque());
					movimentacoes.add(movimentacaoInterna);
					//K230
					ItensProduzidosK230VO itemProduzido = new ItensProduzidosK230VO(formataDataSped(produto.getDataProducao()),
							"",produto.getOrdemProducao(),produto.getCodProduto(),produto.getQtdEstoque());
					itensProduzidos.add(itemProduzido);
					//K250
					IndustrializadoPorTerceirosK250VO indPorTerceiros =  new IndustrializadoPorTerceirosK250VO(
							formataDataSped(produto.getDataProducao())
							,produto.getCodProduto(),produto.getQtdEstoque());
					indsPorTerceiros.add(indPorTerceiros);
	
				}
				//Fluxo para k235 e k
				else if(("k235").equalsIgnoreCase(produto.getBlocoTipoProduto())){
					//K235
					InsumosConsumidosK235VO insumoConsumido =  new InsumosConsumidosK235VO(produto.getDataSaidaEstoque()
							,produto.getCodProduto(),produto.getQtdEstoque(), "");
					insumosConsumidos.add(insumoConsumido);
				}				
				//Fluxo para k220 e k255
				else{ 
					//K235
					InsumosConsumidosK235VO insumoConsumido =  new InsumosConsumidosK235VO(
							formataDataSped(produto.getDataSaidaEstoque())
							,produto.getCodProduto(),produto.getQtdEstoque(), "");
					insumosConsumidos.add(insumoConsumido);
					
					IndustrializadoEmTerceirosK255VO indEmTerceiros =  new IndustrializadoEmTerceirosK255VO(
							formataDataSped(produto.getDataProducao())
							,produto.getCodProduto(),produto.getQtdEstoque(), "");
					indsEmTerceiros.add(indEmTerceiros);
					
					
				}
			}
			blocoK.append(montaSpedFiscal(abertura, periodoApuracao, estoquesEscriturado,movimentacoes,itensProduzidos,
					insumosConsumidos,indsPorTerceiros,indsEmTerceiros));
			}catch(Exception e){
				throw new Exception("Erro processar as informações,"
						+ " entre em contato com a equipe de desenvolvimento.");
			}
			
	    return blocoK.toString();
	}
	
	public String formataDataSped(String data){
		
		String obj[] = data.split("-");
		String ano = obj[0];
		String mes = obj[1];
		String dia = obj[2]; 
		
		return dia+mes+ano;
	}
	 
	private String montaSpedFiscal(AberturaBlocoK001VO abertura, PeriodoApuracaoK100VO periodoApuracao, List<EstoqueEscrituradoK200VO> estoquesEscriturado,
			List<MovimentacaoInternaK220VO> movimentacoes, List<ItensProduzidosK230VO> itensProduzidos,
			List<InsumosConsumidosK235VO> insumosConsumidos, List<IndustrializadoPorTerceirosK250VO> indsPorTerceiros,
			List<IndustrializadoEmTerceirosK255VO> indsEmTerceiros) {
		StringBuilder blocoK = new StringBuilder("");
		//Inicializa com 2 devido a abertura e o periodo de apuração 
		int contadorK990 = 2;
		blocoK.append(abertura.toString());
		blocoK.append(SEPARATOR);
		blocoK.append(periodoApuracao.toString());
		blocoK.append(SEPARATOR);
		for(EstoqueEscrituradoK200VO estoqueVo : estoquesEscriturado){
			blocoK.append(estoqueVo.toString());
			blocoK.append(SEPARATOR);
			contadorK990++;
		} 
		//k220
		for(MovimentacaoInternaK220VO movimentacao : movimentacoes){
			blocoK.append(movimentacao.toString());
			blocoK.append(SEPARATOR);
			contadorK990++;
		} 
		//k230
		for(ItensProduzidosK230VO itemProduzido : itensProduzidos){
			blocoK.append(itemProduzido.toString());
			blocoK.append(SEPARATOR);
			contadorK990++;
		} 
		//k235
		for(InsumosConsumidosK235VO insumoConsumido : insumosConsumidos){
			blocoK.append(insumoConsumido.toString());
			blocoK.append(SEPARATOR);
			contadorK990++;
		} 
		//k250
		for(IndustrializadoPorTerceirosK250VO indPorTerceiros : indsPorTerceiros){
			blocoK.append(indPorTerceiros.toString());
			blocoK.append(SEPARATOR);
			contadorK990++;
		} 
		//k255
		for(IndustrializadoEmTerceirosK255VO indEmTerceiros : indsEmTerceiros){
			blocoK.append(indEmTerceiros.toString());
			blocoK.append(SEPARATOR);
			contadorK990++;
		} 
		contadorK990++;
		blocoK.append("|K990|"+ contadorK990 + "|");
		
		return blocoK.toString();
	}


	public List<SpedFiscal> listarProcessosManuais() throws Exception {
		List<SpedFiscal> spedFiscal = new ArrayList<SpedFiscal>();
		List<SpedFiscal> processos = new ArrayList<SpedFiscal>();
		processos = spedFiscalDao.listarProcessos("M");
		for(SpedFiscal processo : processos){
			List<Produto> produtos = spedFiscalDao.listarProdutosAssProcesso(processo.getId());		
			processo.setProdutos(produtos);
			processo.setDataProcessamentoFormatada(processo.getDataProcessamento());
			spedFiscal.add(processo); 
		}
		
		return spedFiscal;
	}


	public List<SpedFiscal> listarProcessosAutomaticos() throws Exception {
		List<SpedFiscal> spedFiscal = new ArrayList<SpedFiscal>();
		List<SpedFiscal> processos = new ArrayList<SpedFiscal>();
		processos = spedFiscalDao.listarProcessos("A");
		for(SpedFiscal processo : processos){  
			processo.setDataProcessamentoFormatada(processo.getDataProcessamento());
			spedFiscal.add(processo); 
		}
		
		return spedFiscal;
	}


	public void insereProcessoManual(SpedFiscal sped, List<String> listProduto) throws Exception {
		spedFiscalDao.insereProcesso(sped);
		int idSped = spedFiscalDao.listarUltimoProcesso();
		for(String produtoIterator: listProduto){
			Produto produto = new Produto();  
			produto = produtoService.buscarProdutoPorCodigo(produtoIterator);
			spedFiscalDao.insereAssSpedProduto(idSped,produto.getId());
		}
	}


	public void insereProcessoAutomatico(SpedFiscal sped) throws Exception {
		spedFiscalDao.insereProcesso(sped);		
	}
}
