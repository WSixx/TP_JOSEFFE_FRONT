import 'package:flutter/material.dart';
import 'package:tp_final/services/pedido_metodos.dart';
import 'package:tp_final/widgets/formfield_add.dart';
import 'package:tp_final/widgets/snack_bar.dart';

class AddPedido extends StatefulWidget {
  @override
  _AddPedidoState createState() => _AddPedidoState();
}

class _AddPedidoState extends State<AddPedido> {
  final itemPedidoController = TextEditingController();
  final nomePedidoController = TextEditingController();
  final precoPedidoController = TextEditingController();
  final idClienteController = TextEditingController();

  PedidosMetodo pedidosMetodo = PedidosMetodo();

  _clearController() {
    itemPedidoController.clear();
    nomePedidoController.clear();
    precoPedidoController.clear();
    idClienteController.clear();
  }

  bool _checkControlle() {
    if (itemPedidoController.text == '' ||
        nomePedidoController.text == '' ||
        precoPedidoController.text == '' ||
        idClienteController.text == '') {
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
        title: Text('Adicionar Cliente'),
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
                controller: nomePedidoController,
                title: 'Nome Pedido',
                inputType: TextInputType.name,
              ),
              FormFieldAdd(
                controller: itemPedidoController,
                title: 'QTD items do Pedido',
                inputType: TextInputType.streetAddress,
              ),
              FormFieldAdd(
                controller: precoPedidoController,
                title: 'Total do pedido',
                inputType: TextInputType.emailAddress,
              ),
              FormFieldAdd(
                controller: idClienteController,
                title: 'CD Cliente',
                inputType: TextInputType.number,
              ),
              SizedBox(
                height: 20.0,
              ),
              RaisedButton(
                child: Text('Salvar'),
                onPressed: () {
                  if (_checkControlle()) {
                    pedidosMetodo.createPedido(
                      nomePedidoController.text,
                      int.parse(itemPedidoController.text),
                      double.parse(precoPedidoController.text),
                      int.parse(idClienteController.text),
                    );
                    snackBAr(context, 'Pedido Adicionado',
                        'Pedido Adicionado com sucesso!!', Colors.blue);
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
