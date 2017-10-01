package br.com.resource.webservice_spedfiscal.controllers;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.w3c.dom.Document;

import br.com.resource.webservice_spedfiscal.beans.SpedFiscal;
import br.com.resource.webservice_spedfiscal.beans.Usuario;
import br.com.resource.webservice_spedfiscal.service.ProdutoService;
import br.com.resource.webservice_spedfiscal.service.SpedFiscalService;

@Controller
public class SpedFiscalController{
	
	@Autowired
	SpedFiscalService spedFiscalService;
	
	@Autowired
	ProdutoService produtoService;

	
	public static final String CONTEXT_PATH_FILE = 
			"C:/Users/User/workspace/WebService_SpedFiscal-master/src/main/webapp/resources/xml/";

	@RequestMapping(value="/protected/relatorios/processos", method=RequestMethod.GET)
	public String listarProcessos(Model model){
		try {
			model.addAttribute("processosManuais",spedFiscalService.listarProcessosManuais());
			model.addAttribute("processosAutomaticos",spedFiscalService.listarProcessosAutomaticos());
		} catch (Exception e) { 
			model.addAttribute("msgErro","Erro ao listar os Processos!");
			e.printStackTrace();
		}
		return "relatorios/processos";	 
	} 

	@RequestMapping(value="/protected/sped/manual", method=RequestMethod.GET)
	public String gerarManual(Model model,HttpServletRequest request,HttpServletResponse response) throws Exception{
		model.addAttribute("produtos",produtoService.ListarProdutos());
		return "sped-fiscal/gerar_manual";	 
	}  
	@RequestMapping(value="/protected/sped/emissao/manual", method=RequestMethod.POST)
	public String emissaoManual(Model model,HttpServletRequest request,HttpServletResponse response, HttpSession session,
			String produtos, String dataInicio, String dataFim) throws Exception{

		Usuario usuario = (Usuario) session.getAttribute("usuario");
		String timeStamp = new SimpleDateFormat("ddMMyyyy_HHmmss").format(Calendar.getInstance().getTime());
		String nomeArquivoTXT = usuario.getRepresentante().replace(" ", "_") + "_" + timeStamp + ".txt"; 
		
		String sped = "";
		
		try {
			  
			//Cria arquivo txt e salva em uma pasta indexada por usuário
			File arquivoTxt = new File(CONTEXT_PATH_FILE + usuario.getId() + File.separator + nomeArquivoTXT);
			BufferedOutputStream streams = new BufferedOutputStream(
					new FileOutputStream(arquivoTxt));
			 
			sped = spedFiscalService.geraSpedManual(montaListaProdutos(produtos), formataData(dataInicio),formataData(dataFim));

			byte[] byteTxt = sped.getBytes();
			streams.write(byteTxt); 
			streams.flush();
			streams.close();
			
			SpedFiscal spedFiscal = new SpedFiscal(); 
			spedFiscal.setPathTXT(arquivoTxt.getAbsolutePath()); 
			spedFiscal.setProcesso("M");  
			spedFiscalService.insereProcessoManual(spedFiscal,montaListaProdutos(produtos));
			
			model.addAttribute("sped",sped.replace("\r\n", " - "));
		
		} catch (Exception e) { 
			model.addAttribute("msgErro",e.getMessage());
			return "sped-fiscal/gerar_manual";
		} 
		model.addAttribute("produtos", produtoService.ListarProdutos());
		model.addAttribute("msgSuccessDownload","Bloco K Gerado com Sucesso."); 
		return "sped-fiscal/gerar_manual";	 
	} 
	
	@RequestMapping(value="/protected/sped/automatico", method=RequestMethod.GET)
	public String gerarAutomatico(Model model){
		return "sped-fiscal/gerar_automatico";	 
	} 
	 

	/**
	 * Upload single file using Spring Controller
	 */
	@RequestMapping(value = "/protected/sped/emissao/automatico", method = RequestMethod.POST)
	public String emissaoAutomatica(@RequestParam("file") MultipartFile file, HttpSession session,
			@RequestParam("dataInicio") String dataInicio,@RequestParam("dataFim") String dataFim,
			Model model,HttpServletResponse response) {
		
		
		Usuario usuario = (Usuario) session.getAttribute("usuario");
		String timeStamp = new SimpleDateFormat("ddMMyyyy_HHmmss").format(Calendar.getInstance().getTime());
		 
		String nomeArquivoXML = usuario.getRepresentante().replace(" ", "_") + "_" + timeStamp + ".xml"; 
		String nomeArquivoTXT = usuario.getRepresentante().replace(" ", "_") + "_" + timeStamp + ".txt"; 
		
		if (!file.isEmpty()) {
			try {
				byte[] bytes = file.getBytes();
				 
				File dir = new File(CONTEXT_PATH_FILE + usuario.getId() + File.separator);
				if (!dir.exists())
					dir.mkdirs();

				// Create the file on server
				File serverFile = new File(dir.getAbsolutePath()
						+ File.separator + nomeArquivoXML);
				BufferedOutputStream stream = new BufferedOutputStream(
						new FileOutputStream(serverFile));
				stream.write(bytes); 
				stream.close();
				
				DocumentBuilderFactory dbFactory = DocumentBuilderFactory.newInstance();
				DocumentBuilder dBuilder = dbFactory.newDocumentBuilder();
				Document doc = dBuilder.parse(serverFile);  
				
				 
				
				File arquivoTxt = new File(dir.getAbsolutePath()
						+ File.separator + nomeArquivoTXT);
				BufferedOutputStream streams = new BufferedOutputStream(
						new FileOutputStream(arquivoTxt));
				
				String sped = spedFiscalService.geraSpedAutomatico(doc,formataData(dataInicio),formataData(dataFim));
				
				byte[] byteTxt = sped.getBytes();
				streams.write(byteTxt); 
				streams.flush();
				streams.close();
				
				SpedFiscal spedFiscal = new SpedFiscal();
				spedFiscal.setPathXML(serverFile.getAbsolutePath());
				spedFiscal.setPathTXT(arquivoTxt.getAbsolutePath()); 
				spedFiscal.setProcesso("A");
				spedFiscalService.insereProcessoAutomatico(spedFiscal);
				
 
				model.addAttribute("sped",sped.replace("\r\n", " - ") );
				 
			 //////////////////Force Download//////////////////////  
				/*
				response.setContentType ("application/txt");
				response.setHeader ("Content-Disposition", "attachment; filename="+"testedownload.txt");
				ServletOutputStream outs = response.getOutputStream();
				    
				outs.write(byteTxt);
				       
				outs.flush();
				outs.close();  
				  
				 */
			} catch (Exception e) {
				model.addAttribute("msgErro",e.getMessage());
				return "sped-fiscal/gerar_automatico";
			} 
		} else {
			model.addAttribute("msgErro","Arquivo está vazio.");
			return "sped-fiscal/gerar_automatico";
		}

		model.addAttribute("msgSuccessDownload","Bloco K Gerado com Sucesso.");
		return "sped-fiscal/gerar_automatico";
	}
 	
	
	/**
	 * Upload single file using Spring Controller
	 */
	@RequestMapping(value = "/protected/processos/download/", method = RequestMethod.POST)
	public String downloadFileHandler(@RequestParam(value="arquivo") String nomeArquivo, HttpSession session,
			Model model,HttpServletResponse response) {
		
		response.setContentType ("application/txt");
		response.setHeader ("Content-Disposition", "attachment; filename="+"blocoK - Processo .txt");
		ServletOutputStream outs;
		try {
			outs = response.getOutputStream();
			
			Path fileLocation = Paths.get(nomeArquivo);
			byte[] bytes = Files.readAllBytes(fileLocation);
			    
			outs.write(bytes);
			       
			outs.flush();
			outs.close(); 
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return "sped-fiscal/gerar_automatico";	
	}
	 
	public String formataData(String data){
		
		String obj[] = data.split("-");
		String ano = obj[0];
		String mes = obj[1];
		String dia = obj[2]; 
		
		return dia+mes+ano;
	}
	
	public List<String> montaListaProdutos(String produtos){

		String[] produto = produtos.split(";");
		List<String> listaProdutos = new ArrayList<String>();
		for(int i = 0; i < produto.length;i++){
			listaProdutos.add(produto[i]);
		}
		return listaProdutos;
	}
	
}
