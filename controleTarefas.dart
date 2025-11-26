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
      'Escolha uma opção:\n1 - Listar tarefas\n2 - Adicionar tarefas\n3 - Marcar tarefa como concluída\n4 - Excluír tarefa\n5 - Filtrar tarefas\n6 - Sair\n',
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
            );
            print('-' * 70);
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
        if (tarefas.isEmpty) {
          print('Não há tarefas a serem concluídas.');
          break;
        }
        for (int i = 0; i < tarefas.length; i++) {
          print(
            '${i + 1}.${tarefas[i]['titulo']} - ${tarefas[i]['descricao']} | Concluída: ${tarefas[i]['concluida']}',
          );
          print('-' * 70);
        }
        stdout.write('Insira o número da tarefa a ser concluída:');
        int? idTarefa = int.tryParse(stdin.readLineSync() ?? '');
        if (idTarefa == null || idTarefa < 1 || idTarefa > tarefas.length) {
          print('Não há tarefas com esse número. Informe um número válido.');
          break;
        }
        //marcando como concluida
        tarefas[idTarefa - 1]['concluida'] = true;
        print('Tarefa concluída com sucesso!');

        break;
      case 4: // excluir
        List<Map<String, dynamic>> concluidas = [];
        if (tarefas.isEmpty) {
          print('Não há tarefas a serem excluídas.');
          break;
        }
        // criando a lista de concluidas e listando
        for (var tarefa in tarefas) {
          if (tarefa['concluida'] == true) {
            concluidas.add(tarefa);
            print('-' * 70);
          }
        }
        if (concluidas.isEmpty) {
          print('Não há tarefas concluídas a serem excluídas');
          break;
        }
        for (int i = 0; i < concluidas.length; i++) {
          print('${i + 1}.${concluidas[i]['titulo']}');
        }
        stdout.write('Insira o número da tarefa a ser excluída:');
        int? idTarefa = int.tryParse(stdin.readLineSync() ?? '');
        if (idTarefa == null || idTarefa < 1 || idTarefa > concluidas.length) {
          print('Não há tarefas com esse número. Informe um número válido.');
          break;
        }
        //removendo da lista
        tarefas.remove(concluidas[idTarefa - 1]);
        print('Tarefa excluída com sucesso!');
        break;
      case 5:
        if (tarefas.isEmpty) {
          print('Não há tarefas agendadas.');
        }
        stdout.write('Digite o título da tarefa que deseja visualizar:');
        String tituloTarefa = stdin.readLineSync()!.trim().toLowerCase();

        break;
      case 6: //sair e mostrar resumo
        List<Map<String, dynamic>> concluidas = [];
        List<Map<String, dynamic>> pendentes = [];
        for (var tarefa in tarefas) {
          if (tarefa['concluida'] == true) {
            concluidas.add(tarefa);
          }
        }
        for (var tarefa in tarefas) {
          if (tarefa['concluida'] == false) {
            pendentes.add(tarefa);
          }
        }
        var numConcluidas = concluidas.length;
        var numPendentes = pendentes.length;
        print('-' * 70);
        print('Panorama das suas tarefas:');
        print('$numConcluidas tarefas concluídas');
        print('$numPendentes tarefas pendentes');
        print('Até mais..');
        exit(0);
      default:
        print('Opção inválida');
    }
  }
}
