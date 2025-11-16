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
  List<Map<String, dynamic>> tarefas = [];
  while (true) {
    print('-' * 70);
    print('GERENCIADOR DE TAREFAS');
    print('-' * 70);

    print(
      'Escolha uma opção:\n1 - Listar tarefas\n2 - Adicionar tarefas\n3 - Marcar tarefa como concluída\n4 - Excluír tarefa\n5 - Sair',
    );
    stdout.write('Digite a opção escolhida:');
    int? opcao = int.tryParse(stdin.readLineSync() ?? '');
    if (opcao == null) {
      print('Opção inválida');
      continue;
    }
    switch (opcao) {
      case 1: // listando tarefas
        if (tarefas.isEmpty) {
          print('Não há tarefas agendadas.');
        } else {
          for (int i = 0; i < tarefas.length; i++) {
            print(
              '${i + 1}.${tarefas[i]['titulo']} - ${tarefas[i]['descricao']} | Concluída: ${tarefas[i]['concluida']}',
            ); // colocar outros status
          }
        }
        break;
      case 2: // adicionando tarefas
        stdout.write('Insira o título da tarefa: ');
        String? titulo = stdin.readLineSync() ?? '';
        if (titulo.trim().isEmpty) {
          print('Informe um valor válido.');
          continue;
        }
        stdout.write('Descrição da tarefa: ');
        String? descricao = stdin.readLineSync() ?? '';
        if (descricao.trim().isEmpty) {
          descricao = 'Não informado';
        }
        tarefas.add({
          'titulo': titulo,
          'descricao': descricao,
          'concluida': false,
        });
        print('Tarefa adicionada com sucesso!');
        break;
      case 3: // marcar como concluida
        break;
      case 4: // excluir
        break;
      case 5: //sair
        break;
      default:
        print('Opção inválida');
    }
  }
}
