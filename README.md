MC910 Construção de Compiladores
=============
Projeto de Implementação
-------------

Você irá implementar um interpretador para uma pequena linguagem de cálculos simples, denominada myCalc, utilizando as ferramentas lex/yacc. (No Ubuntu, essas ferramentas estão disponíveis nos pacotes flex e bison.)
Todas as variáveis são do tipo inteiro e têm valor entre 0 e 32767 (valores maiores devem ser rejeitados). Zeros à esquerda podem ser ignorados. Um identificador de variável consiste em apenas uma letra minúscula, de 'a' a 'z'. Não é necessário declarar variáveis, mas uma variável só pode ser utilizada numa operação após sua inicialização.
As operações possíveis na linguagem são:
* atribuir a uma variável; 
* soma;
* multiplicação;
* imprimir o valor de uma variável.

Cada comando deve ser finalizado por um ponto-e-vírgula.
Uma gramática simples para essa linguagem seria:
* S → C ; S
* S →
* C → id := E
* C → print(id)
* E → ( E )
* E → E + E
* E → E * E
* E → id
* E → num

Note que esta gramática não pode ser diretamente implementada no yacc. Você deve driblar isso de alguma forma, dando maior precedência aos parênteses, e em seguida à multiplicação em relação à soma. Você pode forçar associatividade à esquerda ou à direita, como preferir.
Espaços em branco, tabulação ('\t') e caracteres de nova linha ('\n') devem ser ignorados. A linguagem não permite comentários.

Você deve submeter dois arquivos no SuSy, uma especificação léxica no arquivo 'myCalc.l', e uma especificação de analisador sintático no arquivo 'myCalc.y'. O SuSy irá gerar automaticamente seu compilador, que deve receber como entrada um arquivo texto com um programa na linguagem myCalc.
O projeto será compilado com a seguinte sequência de comandos:
* lex myCalc.l
* yacc -d myCalc.y
* gcc lex.yy.c y.tab.c -o myCalc

A saída será padronizada da seguinte forma: (utilize sempre a saída padrão)
* Um comando de impressão deve imprimir um número seguido de um caractere nova linha. Por exemplo, o programa “a := 10; print(a);” deve imprimir '10\n' 
* Um programa com erro léxico ou sintático deve exibir uma mensagem 'programa invalido!\n' 
* A leitura de uma variável não inicializada (por exemplo, b na linha 10) deve exibir uma mensagem 'linha 10: variavel b nao inicializada\n' 

Seu interpretador deve executar todos os comandos até a identificação do primeiro erro. Uma vez identificado um erro, o programa deve ser finalizado.
Lembre-se que o comando exit(1) faz o SuSy entender que houve um erro na execução do seu programa. Utilize sempre exit(0). 
Para simplificar, suponha que nos seus programas nunca irá ocorrer overflow.
