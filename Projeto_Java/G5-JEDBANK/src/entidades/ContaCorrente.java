package entidades;

import java.util.Scanner;

public class ContaCorrente extends Conta {

	Scanner leia = new Scanner(System.in);
	
	private int contadorTalao=3;
	private char opcao;
    private int quantidadeCheque;
    private double valorTalao = 30.00;
    private double tarifa;
	
	public ContaCorrente(int numero, String nomeCliente) {
		super(numero, nomeCliente);
	}

	public int getContadorTalao() {
		return contadorTalao;
	}

	public void setContadorTalao(int contadorTalao) {
		this.contadorTalao = contadorTalao;
	}
	
	public void solicitaCheque() {
		System.out.print("DESEJA SOLICITAR ALGUM CHEQUE (S/N): ");
		opcao = leia.next().toUpperCase().charAt(0);
		
		if(opcao == 'S') {
	        
			System.out.println("QUANTOS CHEQUES DESEJA SOLICITAR (MAXIMO 3): ");
			quantidadeCheque = leia.nextInt();
			
            while(quantidadeCheque < 1 || quantidadeCheque > 3) {
		    System.out.println("DIGITE UMA QUANTIDADE VALIDA (MAXIMO 3): ");
		    quantidadeCheque = leia.nextInt();
			}
				
			tarifa = quantidadeCheque * valorTalao;
			debito(tarifa);	
			System.out.println("TARIFA DESCONTADA: R$ " + tarifa);
			System.out.println("SALDO ATUALIZADO: R$ " + saldo);
		}
	}
	
	
	
}
