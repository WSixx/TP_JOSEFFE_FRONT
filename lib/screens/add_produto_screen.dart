import 'package:flutter/material.dart';
import 'package:tp_final/services/produto_metodos.dart';
import 'package:tp_final/widgets/formfield_add.dart';
import 'package:tp_final/widgets/snack_bar.dart';

class AddProduto extends StatefulWidget {
  @override
  _AddProdutoState createState() => _AddProdutoState();
}

class _AddProdutoState extends State<AddProduto> {
  final nomeProdutoController = TextEditingController();
  final precoCustoProdutoController = TextEditingController();
  final precoVendaProdutoController = TextEditingController();
  final qtdProdutoController = TextEditingController();

  ProdutosMetodos produtoMetodo = ProdutosMetodos();

  _clearController() {
    nomeProdutoController.clear();
    precoCustoProdutoController.clear();
    precoVendaProdutoController.clear();
    qtdProdutoController.clear();
  }

  bool _checkControlle() {
    if (nomeProdutoController.text == '' ||
        precoCustoProdutoController.text == '' ||
        precoVendaProdutoController.text == '' ||
        qtdProdutoController.text == '') {
      print('entrou no false');
      return false;
    } else {
      print('entrou no true');
      return true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Adicionar Produto'),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          height: 550,
          width: 550,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FormFieldAdd(
                controller: nomeProdutoController,
                title: 'Nome do Produto',
                inputType: TextInputType.streetAddress,
              ),
              FormFieldAdd(
                controller: precoCustoProdutoController,
                title: 'Preco de custo',
                inputType: TextInputType.name,
              ),
              FormFieldAdd(
                controller: precoVendaProdutoController,
                title: 'Preco de venda',
                inputType: TextInputType.emailAddress,
              ),
              FormFieldAdd(
                controller: qtdProdutoController,
                title: 'QTD',
                inputType: TextInputType.number,
              ),
              SizedBox(
                height: 20.0,
              ),
              RaisedButton(
                child: Text('Salvar'),
                onPressed: () {
                  if (_checkControlle()) {
                    produtoMetodo.createProduto(
                      nomeProdutoController.text,
                      double.parse(precoCustoProdutoController.text),
                      double.parse(precoVendaProdutoController.text),
                      int.parse(qtdProdutoController.text),
                    );
                    snackBAr(context, 'Produto Adicionado',
                        'Produto Adicionado com sucesso!!', Colors.blue);
                    _clearController();
                  } else {
                    snackBAr(context, 'Digite todos os campos',
                        'Campos inválido!!', Colors.red);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
