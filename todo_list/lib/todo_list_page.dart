import 'dart:math';

import 'package:flutter/material.dart';

class TodoListPage extends StatefulWidget {
  const TodoListPage({super.key});

  @override
  State<TodoListPage> createState() => _TodoListPage();
}

class _TodoListPage extends State<TodoListPage> {
  TextEditingController textEditingController = TextEditingController();
  List<String> tarefas = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Lista de Tarefas')),
      ),
      body: Container(
        //caixa1
        padding:
            const EdgeInsets.all(24), //estrutura para fazer o imput __________
        child: Column(
          //estrutura para fazer o imput __________
          children: [
            //estrutura para fazer o imput __________
            TextField(
              //estrutura para fazer o imput__________
              controller: textEditingController,
            ),

            Container(
              height: 400,
              child: ListView.separated(
                separatorBuilder: (context, index) =>
                    const Divider(), //aqui coloca uma linha separando os textos
                itemCount: tarefas.length,
                itemBuilder: (context, index) {
                  //return Text(tarefas[index]); esse codigo deixa o texto mais juntinho
                  return ListTile(
                    title: Text(tarefas[index]), //deixa o texto mais separado
                    onLongPress: () {
                      setState(() {
                        tarefas.removeAt(index);
                      });
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            //desen circulo cor padrao preenchimento inteiro
            backgroundColor: Colors.pinkAccent, // cor botão de sua preferencia
            child: const Icon(Icons.add), //add sinal +
            onPressed: () {
              if (textEditingController.text.isNotEmpty) {
                setState(() {
                  tarefas.add(textEditingController.text);
                });
                textEditingController.clear();
              }
            },
          ),
          FloatingActionButton(
            //desen circulo cor padrao preenchimento inteiro
            backgroundColor: Colors.pinkAccent, // cor botão de sua preferencia
            child: const Icon(Icons.remove), //add sinal +
            onPressed: () {
              setState(() {
                tarefas = [];
              });
              textEditingController.clear();
            },
          ),
        ],
      ),
    );
  }
}
