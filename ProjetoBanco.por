programa
{

	funcao inicio(){
		
		cadeia movimento=" "
		inteiro numero, tipoConta=1, contador=0
		real saldo, debito=0.0, credito=0.0, saldoAtual=0.0

	     escreva("                       G5 JEDBANK\n")
          escreva("========================================================\n")
		escreva("SLOGAN SLOGAN SLOGAN SLOGAN SLOGAN SLOGAN SLOGAN SLOGAN \n")
		escreva("========================================================\n")
		escreva("\n")
		escreva("1 - CONTA POUPANÇA\n2 - CONTA CORRENTE\n3 - CONTA ESPECIAL\n4 - CONTA EMPRESA\n5 - CONTA ESTUDANTIL\n6 - SAIR\n")
          escreva("\n")
          escreva("DIGITE O CODIGO DA CONTA QUE DESEJA ACESSAR (1 - 6): ")
          leia(tipoConta)
          
          enquanto(tipoConta < 1 ou tipoConta > 6){                      	
              escreva("DIGITE UM CODIGO VALIDO (1 - 6): ")
              leia(tipoConta)        	 	
          }       
		limpa()
         
	}
	
     funcao contaPoupanca(){
     	inteiro diaAniversarioPoupanca
     }
     
     funcao contaCorrente(){
     	inteiro contadorTalao
     }
     
     funcao contaEspecial(){
     	real limite
     }
     
     funcao contaEmpresa(){
     	real emprestimoEmpresa=0.0, saldoAtual=0.0, operacao=0.0
     }
     
     funcao contaEstudantil(){
     	real limiteEstudantil
     }
     
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 1238; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */