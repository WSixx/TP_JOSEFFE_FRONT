import 'dart:math';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:tp_final/constants/colors.dart';
import 'package:tp_final/constants/constants.dart';
import 'package:tp_final/services/cliente_metodos.dart';
import 'package:tp_final/widgets/alert_edit_widget.dart';
import 'package:tp_final/widgets/snack_bar.dart';
import 'package:tp_final/widgets/widgets.dart';

class MyBoxCliente extends StatefulWidget {
  final int id;
  final String nomeCliente;
  final String enderecoCliente;
  final String emailCliente;
  final String telefoneCliente;
  final bool statusCliente;

  final IconData icone;
  final Color color;

  MyBoxCliente({
    Key key,
    this.nomeCliente,
    this.enderecoCliente,
    this.emailCliente,
    this.telefoneCliente,
    this.icone,
    this.color,
    this.id,
    this.statusCliente,
  }) : super(key: key);

  @override
  _MyBoxClienteState createState() => _MyBoxClienteState();
}

class _MyBoxClienteState extends State<MyBoxCliente> {
  final nomeController = TextEditingController();
  final emailController = TextEditingController();
  final enderecoController = TextEditingController();
  final telefoneController = TextEditingController();
  final statusController = TextEditingController();

  ClienteMetodos clienteMetodos = ClienteMetodos();

  @override
  void dispose() {
    nomeController.dispose();
    emailController.dispose();
    enderecoController.dispose();
    telefoneController.dispose();
    statusController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      key: widget.key,
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: kBoxDeco,
        width: MediaQuery.of(context).size.width * 1.010,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  widget.icone,
                  size: 60.0,
                  color: widget.color,
                ),
              ),
              Wrap(
                //crossAxisAlignment: CrossAxisAlignment.start,
                direction: Axis.vertical,
                children: [
                  Text(
                    "Cliente: " + widget.nomeCliente,
                    style: TextStyle(fontSize: 22.0),
                  ),
                  Text("Endereco: " + widget.enderecoCliente),
                  Text(
                    "Email: " + widget.emailCliente,
                  ),
                  Text("Contato: " + widget.telefoneCliente),
                  Text(
                    "Status: " + widget.statusCliente.toString(),
                    style: styleStatusButton(widget.statusCliente),
                  ),
                  SizedBox(height: 10.0),
                  SizedBox(
                    width: 100.0,
                    height: 35.0,
                    child: RaisedButton(
                      onPressed: () {
                        editUserAlert(
                          context,
                          widget.nomeCliente,
                          widget.enderecoCliente,
                          widget.emailCliente,
                          widget.telefoneCliente,
                          widget.id,
                          widget.statusCliente,
                        );
                        //Navigator.
                      },
                      child: kEditRow,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  editUserAlert(context, String nome, String enderecoCliente,
      String emailCliente, String telefoneCliente, int id, bool status) {
    Random random = new Random();
    int randomNumber = random.nextInt(99 - 20);

    Alert(
      context: context,
      title: "Editar Usuario: $nome",
      content: StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
        return Container(
          height: 450,
          width: 500,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CachedNetworkImage(
                imageUrl:
                    "http://placekitten.com/2$randomNumber/3$randomNumber",
                placeholder: (context, url) => CircularProgressIndicator(),
                errorWidget: (context, url, error) => Icon(Icons.error),
                imageBuilder: (context, imageProvider) => Container(
                  width: 110.0,
                  height: 110.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              alertTextField(nomeController, nome, null, Icons.account_circle),
              alertTextField(
                  enderecoController, enderecoCliente, null, Icons.money),
              alertTextField(emailController, emailCliente, null, Icons.email),
              alertTextField(
                  telefoneController, telefoneCliente, null, Icons.phone),
              Row(
                children: [
                  Text('Status: '),
                  RaisedButton(
                    child: Text('${status.toString()}'),
                    color: status == true ? kClienteAtivoColor : kRedColor,
                    onPressed: () {
                      setState(() {
                        if (status == false) {
                          status = true;
                          statusController.text = 'true';
                        } else {
                          status = false;
                          statusController.text = 'false';
                        }
                      });
                    },
                  ),
                ],
              ),
            ],
          ),
        );
      }),
      buttons: [
        DialogButton(
          onPressed: () {
            _atualizarCliente(
              clienteMetodos,
              widget,
              id,
              nomeController,
              enderecoController,
              emailController,
              telefoneController,
              statusController,
            );
            Navigator.of(context).pushNamedAndRemoveUntil(
                '/homePage', (Route<dynamic> route) => false);
            snackBAr(context, kSnackUpdateTitle, kSnackUpdateMessage,
                kSnackBarColor);
          },
          child: Text(
            "Salvar",
            style: kSalvarStyle,
          ),
        )
      ],
    ).show();
  }
}

_atualizarCliente(
  ClienteMetodos clienteMetodos,
  MyBoxCliente widget,
  int id,
  TextEditingController nomeController,
  TextEditingController enderecoController,
  TextEditingController emailController,
  TextEditingController telefoneController,
  TextEditingController statusController,
) {
  clienteMetodos.updateCliente(
    id,
    nomeController.text == '' ? widget.nomeCliente : nomeController.text,
    enderecoController.text == ''
        ? widget.enderecoCliente
        : enderecoController.text,
    emailController.text == '' ? widget.emailCliente : emailController.text,
    telefoneController.text == ''
        ? widget.telefoneCliente
        : telefoneController.text,
    statusController.text.toString() == ''
        ? widget.statusCliente.toString()
        : statusController.text.toString(),
  );
}
