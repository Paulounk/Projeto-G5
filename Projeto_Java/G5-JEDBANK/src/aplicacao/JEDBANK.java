package aplicacao;

import java.util.Scanner;

import entidades.Conta;
import entidades.ContaCorrente;
import entidades.ContaEmpresa;
import entidades.ContaEspecial;
import entidades.ContaEstudantil;
import entidades.ContaPoupanca;
import entidades.MenuPrincipal;

public class JEDBANK {

	static int opcao=0;
	static String nome;
	static int numeroConta;
	static MenuPrincipal menu = new MenuPrincipal();
	static Scanner leia = new Scanner(System.in);
	
	static ContaPoupanca contaPoupanca = new ContaPoupanca(numeroConta, nome);
	static ContaCorrente contaCorrente = new ContaCorrente(numeroConta, nome);
	static ContaEspecial contaEspecial = new ContaEspecial(numeroConta, nome);
	static ContaEmpresa contaEmpresa = new ContaEmpresa(numeroConta, nome);
	static ContaEstudantil contaEstudantil = new ContaEstudantil(numeroConta, nome);
	
	public static void menu(){	
		menu.getCabecalho();
			
		// SOLICITANDO INFORMAÇÕES DO USUARIO
		System.out.print("NOME CLIENTE: ");
		nome = leia.next().toUpperCase();
		System.out.print("NUMERO DA CONTA: ");
		numeroConta = leia.nextInt();
		
		//APRESENTANDO AS OPÇÕES DE CONTAS PARA O USUARIO
		System.out.println("\n1 - CONTA POUPANÇA\n2 - CONTA CORRENTE\n3 - CONTA ESPECIAL\n4 - CONTA EMPRESA\n5 - CONTA ESTUDANTIL\n6 - SAIR\n");
    	System.out.print("INFORME A CONTA QUE DESEJA ACESSAR: ");
		opcao = leia.nextInt();
		
		while(opcao < 1 || opcao > 6) {
			System.out.print("DIGITE UMA CONTA VALIDA: ");
			opcao = leia.nextInt();
		}
	}
	
	public static void main(String[] args) {
		
		//FUNÇÃO MENU INICIAL
		menu();	
		
		//LAÇOS CONDICIONAIS RESPONSAVEL POR DIRECIONAR O USUARIO PARA A CLASSE E METODOS DE ACORDO COM A CONTA ESCOLHIDA
		if(opcao == 1) {			
			
			contaPoupanca.setNumero(numeroConta);
			contaPoupanca.setNomeCliente(nome);
			
			for(int i=1; i<=10; i++) {	
				menu.getCabecalho();
				System.out.println("\n                      CONTA POUPANÇA\n");
				System.out.println("NOME CLIENTE: " + contaPoupanca.getNomeCliente());
				System.out.println("NUMERO CONTA: " + contaPoupanca.getNumero());
				System.out.println("SALDO ATUAL: R$ " + contaPoupanca.getSaldo());
				System.out.println();
				System.out.println(i + "º MOVIMENTAÇÃO DE 10");
				
				contaPoupanca.movimentacao();
				if(contaPoupanca.getSair() == 'S') {
					System.out.println();
					System.out.println("                      FINALIZADO OPERAÇÃO!");
					main(args);
		        }
				menu.setRepete(true);
				menu.repeteOperacao();
				if(menu.isRepete() == false){
					System.out.println();
					System.out.print("INFORME O DIA: ");
					int dia = leia.nextInt();
					contaPoupanca.correcaoDeSaldo(dia);
					System.out.println();
					System.out.println("                      FINALIZADO OPERAÇÃO!");
					main(args);
			    }
			}
			System.out.println("VOCÊ REALIZOU O MAXIMO DE MOVIMENTAÇÕES DIÁRIAS. VOLTE AMANHÃ!");
			main(args);
		}	
		else if(opcao == 2) {
			
			contaCorrente.setNumero(numeroConta);
			contaCorrente.setNomeCliente(nome);
			
			for(int i=1; i<=10; i++) {
				menu.getCabecalho();
				System.out.println("\n                      CONTA CORRENTE\n");
				System.out.println("NOME CLIENTE: " + contaCorrente.getNomeCliente());
				System.out.println("NUMERO CONTA: " + contaCorrente.getNumero());
				System.out.println("SALDO ATUAL: R$ " + contaCorrente.getSaldo());
				System.out.println();
				System.out.println(i + "º MOVIMENTAÇÃO DE 10");
				
				contaCorrente.movimentacao();
				if(contaCorrente.getSair() == 'S') {
					System.out.println();
					System.out.println("                      FINALIZADO OPERAÇÃO!");
					contaCorrente.solicitaCheque();
					main(args);							
		        }
				menu.setRepete(true);
				menu.repeteOperacao();
				if(menu.isRepete() == false){
					System.out.println();
					contaCorrente.solicitaCheque();
					menu.setRepete(true);
					main(args);
			    }
			}
			System.out.println("VOCÊ REALIZOU O MAXIMO DE MOVIMENTAÇÕES DIÁRIAS. VOLTE AMANHÃ!");
			main(args);
		}
		else if(opcao == 3) {
			
			contaEspecial.setNumero(numeroConta);
			contaEspecial.setNomeCliente(nome);
			
			for(int i=1; i<=10; i++) {
				menu.getCabecalho();
				System.out.println("\n                      CONTA ESPECIAL\n");
				System.out.println("NOME CLIENTE: " + contaEspecial.getNomeCliente());
				System.out.println("NUMERO CONTA: " + contaEspecial.getNumero());
				System.out.println("LIMITE DISPONIVEL NO VALOR DE: R$ " + contaEspecial.getLimite());
				System.out.println("SALDO ATUAL: R$ " + contaEspecial.getSaldo());
				System.out.println();
				System.out.println(i + "º MOVIMENTAÇÃO DE 10");
				
				contaEspecial.movimentacao();
				if(contaEspecial.getSair() == 'S') {
					System.out.println();
					System.out.println("                      FINALIZADO OPERAÇÃO!");
					main(args);							
				}
				menu.setRepete(true);
				menu.repeteOperacao();
				if(menu.isRepete() == false){
					System.out.println();
					System.out.println("                      FINALIZADO OPERAÇÃO!");
					menu.setRepete(true);
					main(args);
				}		
		        	
		   }
		    System.out.println("VOCÊ REALIZOU O MAXIMO DE MOVIMENTAÇÕES DIÁRIAS. VOLTE AMANHÃ!");
		    main(args);
    }
		else if(opcao == 4) {
			  
			contaEmpresa.setNumero(numeroConta);
			contaEmpresa.setNomeCliente(nome);

				for(int i=1; i<=10; i++) {
					menu.getCabecalho();
					System.out.println("\n                      CONTA EMPRESA\n");
					System.out.println("NOME CLIENTE: " + contaEmpresa.getNomeCliente());
					System.out.println("NUMERO CONTA: " + contaEmpresa.getNumero());
					System.out.println("EMPRESTIMO DISPONIVEL NO VALOR DE: R$ " + contaEmpresa.getEmprestimoEmpresa());
					System.out.println("SALDO ATUAL: R$ " + contaEmpresa.getSaldo());
					System.out.println();
					System.out.println(i + "º MOVIMENTAÇÃO DE 10");
					contaEmpresa.movimentacao();
					if(contaEmpresa.getSair() == 'S') {
						System.out.println();
						System.out.println("                      FINALIZADO OPERAÇÃO!");
						menu();	
			        }	
					menu.setRepete(true);
					menu.repeteOperacao();
					if(menu.isRepete() == false){
						System.out.println();
						System.out.println("                      FINALIZADO OPERAÇÃO!");
						menu.setRepete(true);
						main(args);
				    }
			    }	
				System.out.println("VOCÊ REALIZOU O MAXIMO DE MOVIMENTAÇÕES DIÁRIAS. VOLTE AMANHÃ!");
				main(args);
		}
		else if(opcao == 5) {
			
			contaEstudantil.setNumero(numeroConta);
			contaEstudantil.setNomeCliente(nome);
			
			for(int i=1; i<=10; i++) {
				menu.getCabecalho();
				System.out.println("\n                      CONTA ESTUDANTIL\n");
				System.out.println("NOME CLIENTE: " + contaEstudantil.getNomeCliente());
				System.out.println("NUMERO CONTA: " + contaEstudantil.getNumero());
				System.out.println("EMPRESTIMO DISPONIVEL NO VALOR DE: R$ " + contaEstudantil.getLimiteEstudantil());
				System.out.println("SALDO ATUAL: R$ " + contaEstudantil.getSaldo());
				System.out.println();
				System.out.println(i + "º MOVIMENTAÇÃO DE 10");
				contaEstudantil.movimentacao();
				
				if(contaEstudantil.getSair() == 'S') {
					System.out.println();
					System.out.println("                      FINALIZADO OPERAÇÃO!");
					main(args);	
		        }	
				menu.setRepete(true);
				menu.repeteOperacao();
				if(menu.isRepete() == false){
					System.out.println();
					System.out.println("                      FINALIZADO OPERAÇÃO!");
					menu.setRepete(true);
					main(args);	
			    }
		    }
			System.out.println("VOCÊ REALIZOU O MAXIMO DE MOVIMENTAÇÕES DIÁRIAS. VOLTE AMANHÃ!");
			main(args);	
		}
		else if(opcao == 6) {
			System.out.println("\n                       FINALIZADO OPERAÇÃO");
			System.out.println("\n                         VOLTE SEMPRE! :)");
		}	
	}
}
