import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tp_final/helpers/clientes.dart';
import 'package:tp_final/services/cliente_metodos.dart';
import 'package:tp_final/widgets/cliente_box.dart';

class ClienteScreen extends StatefulWidget {
  @override
  _ClienteScreenState createState() => _ClienteScreenState();
}

class _ClienteScreenState extends State<ClienteScreen> {
  ClienteMetodos clientesMetodos = ClienteMetodos();
  TextEditingController _searchQueryController = TextEditingController();
  deletarCliente(int id) {
    setState(() {
      clientesMetodos.deleteCliente(id);
    });
  }

  String seuNome = '';
  bool temTexto = false;
  Widget appBarTitle = new Text("AppBar Title");
  Icon actionIcon = new Icon(Icons.search);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Clientes>>(
        key: UniqueKey(),
        future: clientesMetodos.pegaDadosWhere(seuNome),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              return Scaffold(
                  appBar: AppBar(
                      centerTitle: true,
                      title: appBarTitle,
                      actions: <Widget>[
                        IconButton(
                          icon: actionIcon,
                          onPressed: () {
                            setState(() {
                              seuNome = '';
                              _searchQueryController.clear();
                              if (this.actionIcon.icon == Icons.search) {
                                this.actionIcon = Icon(Icons.close);
                                this.appBarTitle = TextField(
                                  controller: _searchQueryController,
                                  onSubmitted: (value) async {
                                    _searchQueryController.text = value;
                                    setState(() {
                                      seuNome = value;
                                    });
                                    print(_searchQueryController.text);
                                  },
                                  onEditingComplete: () {
                                    setState(() {
                                      clientesMetodos.pegaDados();
                                      seuNome = '';
                                    });
                                  },
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                  decoration: InputDecoration(
                                      prefixIcon: Icon(Icons.search,
                                          color: Colors.white),
                                      hintText: "Search...",
                                      hintStyle:
                                          new TextStyle(color: Colors.white)),
                                );
                              } else {
                                this.actionIcon = Icon(Icons.search);
                                this.appBarTitle = Text("AppBar Title");
                              }
                            });
                          },
                        ),
                      ]),
                  body: myList(snapshot.data, UniqueKey()));
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }
          }
          return Center(child: CircularProgressIndicator());
        });
  }

  Widget myList2(List<Clientes> clientes, UniqueKey uniqueKey) {
    return ListView.builder(
      itemCount: clientes.length,
      itemBuilder: (context, index) {
        return Column(
          children: [
            MyBoxCliente(
              key: ValueKey(clientes[index]),
              id: clientes[index].idCliente,
              nomeCliente: clientes[index].nomeCliente,
              enderecoCliente: clientes[index].enderecoCliente,
              emailCliente: clientes[index].emailCliente,
              telefoneCliente: clientes[index].telefoneCliente,
              statusCliente: clientes[index].statusCliente,
              color: Colors.red,
              icone: FontAwesomeIcons.female,
            ),
            RaisedButton(
              child: Text('DELETE'),
              onPressed: () {
                deletarCliente(clientes[index].idCliente);
                print("-----------DELETED----------");
              },
            ),
          ],
        );
      },
    );
  }

  Widget myList(List<Clientes> clientes, UniqueKey uniqueKey) {
    return ListView.builder(
      itemCount: clientes.length,
      itemBuilder: (context, index) {
        return Column(
          children: [
            MyBoxCliente(
              key: ValueKey(clientes[index]),
              id: clientes[index].idCliente,
              nomeCliente: clientes[index].nomeCliente,
              enderecoCliente: clientes[index].enderecoCliente,
              emailCliente: clientes[index].emailCliente,
              telefoneCliente: clientes[index].telefoneCliente,
              statusCliente: clientes[index].statusCliente,
              color: Colors.red,
              icone: FontAwesomeIcons.female,
            ),
            RaisedButton(
              child: Text('DELETE'),
              onPressed: () {
                deletarCliente(clientes[index].idCliente);
                print("-----------DELETED----------");
              },
            ),
          ],
        );
      },
    );
  }
}
