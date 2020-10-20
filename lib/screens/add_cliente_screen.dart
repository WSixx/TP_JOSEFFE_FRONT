import 'package:flutter/material.dart';
import 'package:tp_final/services/cliente_metodos.dart';
import 'package:tp_final/widgets/formfield_add.dart';
import 'package:tp_final/widgets/snack_bar.dart';

class AddCliente extends StatefulWidget {
  @override
  _AddClienteState createState() => _AddClienteState();
}

class _AddClienteState extends State<AddCliente> {
  final nomeClienteController = TextEditingController();
  final enderecoClienteController = TextEditingController();
  final emailClienteController = TextEditingController();
  final telefoneClienteController = TextEditingController();

  ClienteMetodos clienteMetodos = ClienteMetodos();

  _clearController() {
    nomeClienteController.clear();
    enderecoClienteController.clear();
    emailClienteController.clear();
    telefoneClienteController.clear();
  }

  bool _checkControlle() {
    if (nomeClienteController.text == '' ||
        enderecoClienteController.text == '' ||
        emailClienteController.text == '' ||
        telefoneClienteController.text == '') {
      print('entrou no false');
      return false;
    } else {
      print('entrou no true');
      return true;
    }
  }

  @override
  void dispose() {
    super.dispose();
    nomeClienteController.dispose();
    enderecoClienteController.dispose();
    emailClienteController.dispose();
    telefoneClienteController.dispose();
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
                controller: nomeClienteController,
                title: 'Nome Cliente',
                inputType: TextInputType.name,
              ),
              FormFieldAdd(
                controller: enderecoClienteController,
                title: 'Endereço Cliente',
                inputType: TextInputType.streetAddress,
              ),
              FormFieldAdd(
                controller: emailClienteController,
                title: 'Email Cliente',
                inputType: TextInputType.emailAddress,
              ),
              FormFieldAdd(
                controller: telefoneClienteController,
                title: 'Telefone Cliente',
                inputType: TextInputType.phone,
              ),
              SizedBox(
                height: 20.0,
              ),
              RaisedButton(
                child: Text('Salvar'),
                onPressed: () {
                  if (_checkControlle()) {
                    clienteMetodos.createCliente(
                      nomeClienteController.text,
                      enderecoClienteController.text,
                      emailClienteController.text,
                      telefoneClienteController.text,
                    );
                    snackBAr(context, 'Cliente Adicionado',
                        'Cliente Adicionado com sucesso!!', Colors.blue);
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
