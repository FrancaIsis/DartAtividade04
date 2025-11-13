/* O primeiro projeto propõe o desenvolvimento de um sistema de controle de tarefas, 
com o objetivo de organizar e acompanhar atividades do dia a dia. Nesse sistema, 
cada tarefa deverá ser armazenada como um objeto do tipo Map, contendo as chaves 
‘titulo’, ‘descricao’ e ‘concluida’, todas associadas aos seus respectivos valores. 
As tarefas devem ser mantidas dentro de uma lista principal, representada por uma 
estrutura do tipo List<Map<String, dynamic>>. O programa deve permitir ao usuário 
adicionar novas tarefas, listar as existentes, marcar uma tarefa como concluída e 
excluir aquelas já finalizadas. É fundamental que o aluno manipule diretamente os 
valores do mapa, acessando e modificando dados por meio das chaves, como tarefa['titulo'] 
ou tarefa['concluida']. O sistema deve validar entradas nulas ou vazias, substituindo-as 
por textos padrão como “Não informado”, e empregar estruturas condicionais e de repetição 
para controlar o menu de interação. Ao final, o programa deve exibir o total de tarefas 
pendentes e concluídas. Como desafio adicional, o aluno pode implementar um filtro 
de busca por título utilizando o método .where(), sem diferenciar maiúsculas e minúsculas.
 */
import 'dart:io';

void main() {
  print('-' * 70);
  print('GERENCIADOR DE TAREFAS');
  print('-' * 70);

  while (true) {
    print('Gerenciador de Tarefas');
    print('-' * 70);
    print(
      'Escolha uma opção:\n1 - Listar tarefas\n2 - Adicionar tarefas\n3 - Marcar tarefa como concluída\n4 - Excluír tarefa\n5 - Sair',
    );
  }
}
