programa
{

	inclua biblioteca Util
	inclua biblioteca Matematica --> mat
	inclua biblioteca Texto --> tx
	inclua biblioteca Graficos
	
	real saldoAtual=0.0
	real emprestimoEmpresa=10000.00, operacao=0.0 // variaveis para funcao ContaEmpresa e EmprestimoEmpresarial
	inteiro repita=0, numeroConta=160421, agencia=0027
	
	funcao inicio(){
			
		inteiro tipoConta=1

	     cabecalho()
		escreva("1 - CONTA POUPANÇA\n2 - CONTA CORRENTE\n3 - CONTA ESPECIAL\n4 - CONTA EMPRESA\n5 - CONTA ESTUDANTIL\n6 - SAIR\n")
          escreva("\n")
          escreva("DIGITE O CODIGO DA CONTA QUE DESEJA ACESSAR (1 - 6): ")
          leia(tipoConta)
          
          enquanto(tipoConta < 1 ou tipoConta > 6){ 
                                   	
              escreva("DIGITE UM CODIGO VALIDO (1 - 6): ")
              leia(tipoConta)        	 	
          }       
		limpa()

          se(tipoConta == 1){
          	contaPoupanca()
          }
		senao se(tipoConta == 2){
          	contaCorrente()
          }
          senao se (tipoConta ==3){
          	contaEspecial ()
          }          
          senao se(tipoConta == 4){
          	contaEmpresa()
          }
          senao se(tipoConta == 5){
          	contaEstudantil()
          }
          senao{
          	sair()
          }
	}
	
     funcao contaPoupanca(){
     	inteiro diaAniversarioPoupanca = 5
     	real correcao=0.0
     	cadeia continua , movimento    

		cabecalho()
     	escreva("DIGITE A DATA DE HOJE: ")
    		leia(diaAniversarioPoupanca)

    		limpa()
     			     	
		para(inteiro i=0; i<10; i++){
        
      		cabecalho()
		     escreva("           CONTA POUPANÇA  Nº: "+numeroConta+" AGÊNCIA: "+agencia+"\n")
		     escreva("\n")
               escreva((i+1) + "º MOVIMENTAÇÃO (MAXIMO DIARIO 10)\n")
		     escreva("\n")
     		escreva("DIA 5 - DATA DE ANIVERSARIO DE CONTA POUPANÇA\n")
     	     escreva("SALDO ATUAL: R$ " + saldoAtual + "\n")	

			faca{
				escreva("MOVIMENTO - DEBITO(D) OU CREDITO(C): ")
      			leia(movimento)
      			movimento = tx.caixa_alta(movimento)
      			limpa()
			}enquanto ((movimento != "C") e (movimento != "D"))
        		
		     se(movimento == "C"){
		     	escreva("QUANTO DESEJA DEPOSITAR R$? ")
		        	leia(operacao)
		        	se(operacao < 0){
		     	     escreva("VALOR INVALIDO! DIGITE UM VALOR POSITIVO\n")
		     	     repitaOperacao()
		               se(repita > 0){
     	                    pare	                	               	 	     		                                         	     				     		
     	               }
		     	}senao{
		        	saldoAtual += operacao
		        	 se(diaAniversarioPoupanca == 5){
                     saldoAtual = saldoAtual + (saldoAtual*0.05)
                     saldoAtual = mat.arredondar(saldoAtual,2)
                     }
                     senao{
			        saldoAtual = mat.arredondar(saldoAtual,2)
			     }
		        	escreva("SALDO ATUAL: R$ "  ,saldoAtual, "\n")
     	          escreva("=======================================================\n")
     	          repitaOperacao()
     	          se(repita > 0){
     	               	pare	                	               	 	     		                                         	     				     		
     	               }	
		          limpa()
		     	}
		     }
		     senao{
		     	escreva("QUANTO DESEJA DEBITAR R$? ")
		        	leia(operacao)
		        	se(operacao < 0){
		     	     escreva("VALOR INVALIDO! DIGITE UM VALOR POSITIVO\n")
		     	     repitaOperacao()
		               se(repita > 0){
     	                    pare	                	               	 	     		                                         	     				     		
     	               }
		     	}senao{
		     	se(operacao>saldoAtual){
					escreva ("SALDO INSUFICIENTE! O SEU SALDO ATUAL É R$" , saldoAtual, "\n")
					repitaOperacao()
					se(repita > 0){
     	               	pare	                	               	 	     		                                         	     				     		
     	               }	
			
				}senao{
			        
			        saldoAtual -= operacao			       
			        escreva("SALDO ATUAL: R$ " + saldoAtual + "\n")
	     	        escreva("=======================================================\n")
	     	        limpa()
			     }
		     	}	      
		     }
		     
		}
     }
     
     funcao contaCorrente(){
     	inteiro contadorTalao = 0, opcao = 0
		real tarifaTalao = 0.0
		
		//iniciando movimentação da conta
     	movimentarConta()
     	//limpando tela e exibindo o cabeçalho
     	limpa()
     	cabecalho()
     	escreva("           CONTA CORRENTE  Nº: "+numeroConta+" AGÊNCIA: "+agencia+"\n")
     	//verificando se possui saldo suficiente para solicitar cheque
     	se(saldoAtual<30.0){
     		escreva("SALDO ATUAL: "+saldoAtual+" REAIS\n")
			escreva("-----------------------------------------------------------\n")
     		escreva("\nDESCULPE, VOCÊ NÃO TEM SALDO SUFICIENTE PARA SOLICITAR CHEQUE\n")
     		escreva("\nRETORNANDO AO MENU PRINCIPAL...")
		     Util.aguarde(7000)
		     limpa()
		     saldoAtual = 0.0
		     inicio()
     		
     	}
		//perguntando se vai querer solicitar cheque
     	escreva("\nDESEJA SOLICITAR ALGUM CHEQUE?\n")
     	escreva("1 - SIM OU 2 - NÃO: ")
	     leia(opcao)
	     //verificando se o numero digitado está dentro do menu
		enquanto(opcao < 1 ou opcao > 2){                      	
	          escreva("DIGITE UMA OPÇÃO VALIDA (1-3): ")
	          leia(opcao)        	 	
	     }  
		//solicitando a quantidade de cheques desejada
	     se(opcao == 1){
	     	escreva("\nSALDO ATUAL: "+saldoAtual+" REAIS | TARIFA POR TALÃO: 30 REAIS")
	     	escreva("\n=======================================================")
	     	escreva("\nQUANTOS CHEQUES DESEJA SOLICITAR? (MÁXIMO 3): ")
		     leia(contadorTalao)
		     //efetuando validações
		     inteiro valida=0
		     faca{ 
		     	//verificando se a quantidade digitada está dentro do limite
		     	enquanto(contadorTalao < 1 ou contadorTalao > 3){    
			          escreva("DIGITE UMA QUANTIDADE VALIDA: ")
			          leia(contadorTalao)   
			     }
			     //efetuando a contagem da tarifa a ser paga
			     tarifaTalao = (30.0*contadorTalao)
			     //verificando se o saldo atual permite essa operação
		          se(tarifaTalao > saldoAtual){    
		          	escreva("VOCÊ NÃO TEM SALDO SUFICIENTE PARA ESSA QUANTIDADE!\n")
		          	//reiniciando a validação
		          	valida=0
		          	contadorTalao = 0
		          } senao {
		          	//debitando a tarifa do saldo da conta
		          	saldoAtual -= tarifaTalao 
		          	escreva("=======================================================\n")
	         			escreva("\nFORAM DEBITADOS "+(30.0*contadorTalao)+" REAIS PELA TARIFA DE "+contadorTalao+" TALÃO(ES)\nSEU SALDO ATUAL FICOU: "+saldoAtual+" REAIS.\n")
	         			//saindo da validação
	         			valida=1
	     		}
	     	} enquanto (valida==0)
	     }
	     //saindo da função conta corrente e voltando ao inicio
	     escreva("\nRETORNANDO AO MENU PRINCIPAL...")
	     Util.aguarde(10000)
	     limpa()
	     saldoAtual = 0.0
	     inicio()
     }
     
     funcao contaEspecial(){
     		real limite = 1000.00, valorLimite, resto
     		inteiro credito 
     		caracter opcao 

			para (inteiro repete = 1; repete <= 10; repete++){
     		
     		cabecalho() 
             	escreva("           CONTA ESPECIAL  Nº: "+numeroConta+" AGÊNCIA: "+agencia+"\n")
		     escreva("\n")
		     escreva(repete + "º MOVIMENTAÇÃO (MAXIMO DIARIO 10)\n")
		     escreva("\n")
		     escreva ("O SEU VALOR LIMITE É DE " + limite +"\n")
		     escreva ("O SEU SALDO ATUAL É NO VALOR DE " + saldoAtual +"\n")

			escreva ("MOVIMENTO - DEBITO (D) OU CRÉDITO (C) ")
			leia (opcao)

			se (opcao == 'd' ou opcao == 'D'){
				 se (saldoAtual == 0){
				 	escreva ("VOCÊ NÃO TEM SALDO PARA EFETIVAR UM DÉBITO \n")
				 }
				 senao {
				 	escreva ("QUAL VALOR VOCÊ DESEJA DEBITAR? ")
				 	leia (valorLimite)
				 	se(valorLimite < 0){
		     	          escreva("VALOR INVALIDO! DIGITE UM VALOR POSITIVO\n")
		     	          repitaOperacao()
		                    se(repita > 0){
     	                       pare	                	               	 	     		                                         	     				     		
     	                    }
		     	     }senao{
				 	se (valorLimite > saldoAtual){
				 		escreva ("ESSE VALOR NÃO ESTÁ DISPONÍVEL PARA RETIRADA, DESEJA RETIRAR DO SEU LIMITE? ")
				 		escreva ("\nDIGITE S PARA SIM OU N PARA NÃO: ")
				 		leia (opcao)
				 		escreva("===========================================================\n")
				 		se (opcao == 'S' ou opcao == 's'){
				 		resto = valorLimite - saldoAtual 
				 		limite = limite - resto 
				 		saldoAtual = 0.0
				 		escreva ("O SEU VALOR LIMITE É DE " + limite +"\n")
		   				escreva ("O SEU SALDO ATUAL É NO VALOR DE " + saldoAtual +"\n")
				 		} 
				 		senao se (opcao == 'N' ou opcao == 'n'){
				 		escreva ("O SEU VALOR LIMITE É DE " + limite +"\n")
		   				escreva ("O SEU SALDO ATUAL É NO VALOR DE " + saldoAtual +"\n")	
				 			 
				 		}
				 	}
				 	senao {
				 	saldoAtual -= valorLimite
				 	escreva ("O SEU VALOR LIMITE É DE " + limite +"\n")
		   			escreva ("O SEU SALDO ATUAL É NO VALOR DE " + saldoAtual +"\n")
				 	}
		     	    }
				 }				 
				 
			}
			se (opcao == 'c' ou opcao =='C'){
				escreva ("QUAL VALOR VOCÊ DESEJA CREDITAR EM SUA CONTA? ")
				leia (valorLimite)
				se(valorLimite < 0){
		     	   escreva("VALOR INVALIDO! DIGITE UM VALOR POSITIVO\n")
		     	   repitaOperacao()
		             se(repita > 0){
     	                 pare	                	               	 	     		                                         	     				     		
     	             }
		     	}senao{
				saldoAtual += valorLimite
				escreva ("O SEU VALOR LIMITE É DE " + limite +"\n")
		   		escreva ("O SEU SALDO ATUAL É NO VALOR DE " + saldoAtual +"\n")
		     	}
			}		     
		     
		     escreva ("CRÉDITO LIMITE DISPONÍVEL PARA USO, DIGITE 1 PARA ACEITAR, 2 PARA RECUSAR OU 3 PARA VOLTAR AO MENU INICIAL ")
		     leia (credito)
		     
		     se (credito == 1){
		     	escreva ("QUAL VALOR VOCÊ DESEJA SACAR DO LIMITE ")
		     	leia (valorLimite)
		     	se(valorLimite < 0){
		     	   escreva("VALOR INVALIDO! DIGITE UM VALOR POSITIVO\n")
		     	   repitaOperacao()
		             se(repita > 0){
     	                 pare	                	               	 	     		                                         	     				     		
     	             }
		     	}
		     senao{	
		     enquanto (valorLimite > limite){
		     		escreva ("OPÇÃO INVÁLIDA, DIGITE UM VALOR DENTRO DO LIMITE PERMITIDO \n")
		     		leia (valorLimite)
		     	}
		     	saldoAtual += valorLimite 
		     	limite -=  valorLimite
		     	limpa()
		     }
		     }
		     senao se (credito == 2){
		     	limpa ()
		     	cabecalho ()
		     	escreva("                        CONTA ESPECIAL\n")
		     	escreva("\n")
		     	escreva ("VOCÊ OPTOU POR NÃO USAR SEU SALDO LIMITE \n")
		     	limpa()
		     	
		     }
		     senao se (credito == 3){
		     	limpa ()
		     	saldoAtual = 0.0 
		     	inicio ()
		     }
			}			
     }
     
     funcao contaEmpresa(){
 
     	cadeia movimento, continua, opcao

     	para(inteiro i=1; i<=10; i++){

               // EXIBINDO O MENU AO USUARIO 
               cabecalho()
		     escreva("           CONTA EMPRESA  Nº: "+numeroConta+" AGÊNCIA: "+agencia+"\n")
		     escreva("\n")
               escreva( i, "º MOVIMENTAÇÃO (MAXIMO DIARIO 10)\n")
               escreva("\n")
     		escreva("EMPRESTIMO DISPONIVEL NO VALOR DE R$: " + emprestimoEmpresa + "\n")
     	     escreva("SALDO ATUAL: R$ " + saldoAtual + "\n")	
               
     	     // APRESENTANDO AS OPÇÕES DE DEBITO E CREDITO AO USUARIO
     		faca{
     			escreva("MOVIMENTO - DEBITO(D) - CREDITO(C) - SAIR(S): ")	
		          leia(movimento)
		          movimento = tx.caixa_alta(movimento)	 	
               }enquanto(movimento != "D" e movimento != "C" e movimento != "S")
                
               
               // CASO O USUARIO ESCOLHA DEBITO O CODIGO ENTRARÁ NESSA CONDICIONAL
		     se(movimento == "D" ou movimento == "d"){

                     se(saldoAtual <= 0){
                     	escreva("===========================================================\n")
                     	escreva("NÃO HÁ SALDO NA CONTA PARA SACAR\n")
                     	escreva("\n")
                     	emprestimoEmpresarial()
                     	repitaOperacao()
		               se(repita > 0){
     	                  pare	                	               	 	     		                                         	     				     		
     	               }        	           	
                     }
                     senao{
                     	 escreva("VALOR A RETIRAR: R$ ")
		     	      leia(operacao)
		     	      se(operacao < 0){
		     	          escreva("VALOR INVALIDO! DIGITE UM VALOR POSITIVO\n")
		     	          repitaOperacao()
		                    se(repita > 0){
     	                       pare	                	               	 	     		                                         	     				     		
     	                    }
		     	      }
		     	      senao se(operacao > saldoAtual){
		     	      	escreva("===========================================================\n")
                     	     escreva("SALDO INSUFICIENTE! SALDO DISPONIVEL: R$" + saldoAtual + "\n")
                     	     escreva("\n")
                     	     emprestimoEmpresarial()
                     	     repitaOperacao()
		                    se(repita > 0){
     	                       pare	                	               	 	     		                                         	     				     		
     	                    }
		     	      }
		     	      senao{
		     	      saldoAtual -= operacao
		     	      escreva("===========================================================\n")
                          escreva("SALDO ATUALIZADO: " + saldoAtual + "\n")
                          escreva("\n")
                          emprestimoEmpresarial() 
                          repitaOperacao()
		                    se(repita > 0){
     	                       pare	                	               	 	     		                                         	     				     		
     	                    }
		     	      }               	     	
                     }
		     }
		     senao se (movimento == "C"){
		     	escreva("VALOR A DEPOSITAR: R$ ")
		     	leia(operacao)
		     	se(operacao < 0){
		     	    escreva("VALOR INVALIDO! DIGITE UM VALOR POSITIVO\n")
		     	    repitaOperacao()
		              se(repita > 0){
     	                  pare	                	               	 	     		                                         	     				     		
     	              }
		     	}
		     	senao{
                        saldoAtual += operacao
                        escreva("===========================================================\n")                    
                        escreva("SALDO ATUALIZADO: " + saldoAtual + "\n")
                        escreva("\n")
                        emprestimoEmpresarial()
                        repitaOperacao()
		              se(repita > 0){
     	                  pare	                	               	 	     		                                         	     				     		
     	              }
		     	}
		     }
		     senao{
		     	limpa()
		     	saldoAtual = 0.00
		     	inicio()
		     }
		     	        
}
     	se(repita == 0){	
     	cabecalho()
		escreva("MAIS DE 10 MOVIMENTAÇÕES FEITAS. FAVOR RETORNAR NO DIA SEGUINTE! \n")
		escreva("\n")
     	}
     }
     
     funcao contaEstudantil(){
     	
     	real limiteEstudantil = 5000.00, valor
     	caracter opcao, opcaoEmprestimo
     	
     	
     	para(inteiro repeticoes = 1; repeticoes <= 10; repeticoes++){ 

     	cabecalho()
     	escreva("           CONTA ESTUDANTIL  Nº: "+numeroConta+" AGÊNCIA: "+agencia+"\n")
	   	escreva("\n")
          escreva(repeticoes + "º MOVIMENTAÇÃO (MAXIMO DIARIO 10)\n")
          escreva("\n")
          
     	escreva("LIMITE ESTUDANTIL DISPONIVEL NO VALOR DE: R$ ", limiteEstudantil, "\n")
     	escreva("SEU SALDO ATUAL É DE R$: ",saldoAtual, "\n")
                  
     	escreva("DESEJA REALIZAR A OPERAÇÃO DE DÉBITO(D) OU CRÉDITO(C)? ")
     	leia(opcao)

     	se (opcao == 'd' ou opcao == 'D'){
             se (saldoAtual == 0){
             	escreva("IMPOSSIVEL REALIZAR A OPERAÇÃO, SALDO ATUAL NO VALOR DE: R$ ", saldoAtual, "\n")
               repitaOperacao()
               se (repita > 0){
                  pare  
               }
             } 
             
                senao {
                escreva("QUAL O VALOR VOCÊ DESEJA RETIRAR? ")
                leia(valor)
                se(valor < 0){
		     	 escreva("VALOR INVALIDO! DIGITE UM VALOR POSITIVO\n")
		     	 repitaOperacao()
		           se(repita > 0){
     	                  pare	                	               	 	     		                                         	     				     		
     	           }
		      }senao{
                saldoAtual -= valor      
                repitaOperacao()
                    se (repita > 0){
                        pare  
                    }            
                } 
                }	
     	  }
     	senao se (opcao == 'c' ou opcao == 'C') {
     		escreva("QUAL O VALOR VOCÊ DESEJA DEPOSITAR? ")
     		leia(valor)
     		se(valor < 0){
		     	 escreva("VALOR INVALIDO! DIGITE UM VALOR POSITIVO\n")
		     	 repitaOperacao()
		           se(repita > 0){
     	                  pare	                	               	 	     		                                         	     				     		
     	           }
     		}senao{
     		saldoAtual += valor
     		limpa()
     		cabecalho()
     		escreva("SEU SALDO ATUAL AGORA É NO VALOR DE: R$ ",saldoAtual, "\n")
     	     escreva("VOCÊ TEM LIMITE ESTUDANTIL DISPONIVEL NO VALOR DE: R$ " ,limiteEstudantil, "\n")
     	     escreva("DESEJA SOLICITAR O LIMITE ? S/N ")
     	     leia(opcaoEmprestimo)

     	     se (opcaoEmprestimo == 's' ou opcaoEmprestimo == 'S'){
     	     	escreva("QUANTO VOCÊ DESEJA RETIRAR DO LIMITE ESTUDANTIL ? ")
     	     	leia(valor)
     	     	se (valor > limiteEstudantil){
     	     	   escreva("VOCÊ NÃO POSSUI ESSE LIMITE\n")
     	     	   repitaOperacao()
                       se (repita > 0){
                       pare  
                       }	   
     	     	}senao{
     	     	limiteEstudantil = limiteEstudantil - valor
     	     	saldoAtual += valor
     	     	limpa()
     		     cabecalho()
     		     escreva("SEU SALDO ATUAL AGORA É NO VALOR DE: R$ ",saldoAtual, "\n")
     		     repitaOperacao()
                    se (repita > 0){
                         pare  
                    }
     	        }
     	     }
     	     senao{
     	     	repitaOperacao()
                    se (repita > 0){
                         pare  
                    }  	     
     	     }
     		}
     	     
     	}
          }
     }
//---------------------------------------------- FUNÇÕES UTILITARIAS ---------------------------------------------------------------//
     
     funcao sair(){
     	limpa()
     	cabecalho()
		escreva("                     OPERAÇÃO FINALIZADA!\n")
          escreva("\n")
		escreva("                       VOLTE SEMPRE :)\n")
          Util.aguarde(2000)

          inteiro img = Graficos.carregar_imagem("logo.jpg")

          Graficos.iniciar_modo_grafico(verdadeiro)
          Graficos.definir_dimensoes_janela(500, 500)
          Graficos.definir_titulo_janela("TURMA 27")

          enquanto(verdadeiro){
          	Graficos.desenhar_imagem(0, 0, img)
          	Graficos.renderizar()
          }
				     
		
     }
     funcao repitaOperacao(){

     	cadeia continua
     	
     	escreva("DESEJA REPETIR A OPERAÇÃO S/N: ")
		leia(continua)
          
		se(continua == "N" ou continua == "n"){

          limpa()
          cabecalho()
		escreva("                     OPERAÇÃO FINALIZADA!\n")
          escreva("\n")
		escreva("                       VOLTE SEMPRE :)\n")		
		escreva("\n")
		repita++  
		escreva("\nRETORNANDO AO MENU PRINCIPAL...")
	     Util.aguarde(8000)
	     saldoAtual = 0.0
	     emprestimoEmpresa = 10000.00
	     limpa()
	     inicio()
		}
		senao{
			repita = 0
		       limpa()
		}
     }
     funcao cabecalho(){
     	escreva("                        G5 JEDBANK\n")
          escreva("===========================================================\n")
		escreva("SE VOCÊ NÃO CUIDA DO SEU DINHEIRO, A GENTE CUIDA PARA VOCÊ! \n")
		escreva("===========================================================\n")
		escreva("\n")
     }
     funcao movimentarConta(){

		inteiro contadorOperacao=0
		caracter tipoOperacao

		faca{
			limpa()
			cabecalho()
			escreva("                        CONTA CORRENTE\n")
			escreva("\n")
			//exibindo menu de movimentação
			escreva("SALDO ATUAL: "+saldoAtual+" REAIS\n")
			escreva("-----------------------------------------------------------\n")
			escreva("D - DEBITO\nC - CREDITO\nS - SAIR\n")
			//escolhendo a opção debito ou credito
			escreva("\n"+(contadorOperacao+1)+"º MOVIMENTAÇÃO (MÁXIMO DIÁRIO PERMITIDO = 10)")
			escreva("\n===========================================================")
			escreva("\nDIGITE A OPERAÇÃO QUE DESEJA REALIZAR (D, C ou S): ")
	          leia(tipoOperacao)
	          escreva("\n")
	         
			real valor = 0.0
			//debitando da conta
			se(tipoOperacao == 'D' ou tipoOperacao == 'd'){
				//alertando que a conta não possui dinheiro para saque
				se(saldoAtual <= 0){
					escreva("VOCÊ NÃO POSSUI SALDO PARA SAQUE! AGUARDE...\n")
					contadorOperacao++
					Util.aguarde(3000)
				}
				senao {
					escreva("INSIRA O VALOR QUE DESEJA RETIRAR DA CONTA: ")
		              	leia(valor)
		              	se(valor < 0){
		     	        escreva("VALOR INVALIDO! DIGITE UM VALOR POSITIVO\n")
		     	        repitaOperacao()
		                  se(repita > 0){
     	                       pare	                	               	 	     		                                         	     				     		
     	                  }
		     	     }
		     	     senao{
		              	//verificando se o valor de saque não é maior que o saldo
		              	  se(valor > saldoAtual){
		              		escreva("VOCÊ NÃO TEM SALDO SUFICIENTE PARA ESTE SAQUE! AGUARDE...\n")
		              		contadorOperacao++
		              		Util.aguarde(3000)
		              	  } senao {
			              	  saldoAtual -= valor
			              	  contadorOperacao++
		              	    }
		     	     }
				}
			}
			//adicionando dinheiro na conta
			se(tipoOperacao == 'C' ou tipoOperacao == 'c'){
				escreva("INSIRA O VALOR QUE DESEJA ADICIONAR NA CONTA: ")
	              	leia(valor)
	              	se(valor < 0){
		     	        escreva("VALOR INVALIDO! DIGITE UM VALOR POSITIVO\n")
		     	        repitaOperacao()
		                  se(repita > 0){
     	                       pare	                	               	 	     		                                         	     				     		
     	                  }
		     	}senao{
	              	saldoAtual += valor
	              	contadorOperacao++
		     	}
			}
			se(tipoOperacao == 'S' ou tipoOperacao == 's'){
				contadorOperacao = 10
			}	
		}enquanto(contadorOperacao<10)
     }
     funcao emprestimoEmpresarial(){
     	
          real valorParcela
          cadeia opcao
     	
     	escreva("EMPRESTIMO EMPRESARIAL DISPONIVEL NO VALOR DE R$: " + emprestimoEmpresa + "\n")
     	
          faca{
     		escreva("DESEJA ACEITAR(S) OU RECUSAR(N): ")
               leia(opcao)
               opcao = tx.caixa_alta(opcao)	 	
          }enquanto(opcao != "S" e opcao != "N")
     	
          se(opcao == "S"){
              escreva("VALOR A SOLICITAR: ")
              leia(operacao)
              se(operacao < 0){
		        escreva("VALOR INVALIDO! DIGITE UM VALOR POSITIVO: R$ ")
		        leia(operacao)		  
		    }
              enquanto(operacao > emprestimoEmpresa){
              	escreva("===========================================================\n")
              	escreva("VALOR SUPERIOR AO EMPRESTIMO DISPONIVEL!\n")
              	escreva("\n")
               pare
              }
              se(operacao <= emprestimoEmpresa){  
                 saldoAtual+=operacao
                 emprestimoEmpresa -= operacao
                 escreva("===========================================================\n")
                 escreva("SALDO ATUALIZADO: R$ " + saldoAtual + "\n")  
                 escreva("\n")
              }           
          }
          senao{
          	escreva("\n")
          	escreva("TALVEZ NA PROXIMA :)\n")
          	escreva("\n")      	
          }
     }
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 19011; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */