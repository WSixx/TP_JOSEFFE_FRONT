import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tp_final/constants/colors.dart';
import 'package:tp_final/constants/constants.dart';
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

  String seuNome = '';

  Widget appBarTitle = Text('Clientes');
  Icon searchBarIcon = Icon(Icons.search);

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
                          icon: searchBarIcon,
                          onPressed: () {
                            setState(() {
                              seuNome = '';
                              _searchQueryController.clear();
                              if (this.searchBarIcon.icon == Icons.search) {
                                this.searchBarIcon = Icon(Icons.close);
                                this.appBarTitle = TextField(
                                  controller: _searchQueryController,
                                  onSubmitted: (value) async {
                                    _searchQueryController.text = value;
                                    setState(() {
                                      seuNome = value;
                                    });
                                  },
                                  onEditingComplete: () {
                                    setState(() {
                                      clientesMetodos.pegaDados();
                                      seuNome = '';
                                    });
                                  },
                                  style: TextStyle(
                                    color: kWhiteColor,
                                  ),
                                  decoration: kInputStyleSearchButton,
                                );
                              } else {
                                this.searchBarIcon = Icon(Icons.search);
                                this.appBarTitle = Text("Clientes");
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

  Widget myList(List<Clientes> clientes, UniqueKey uniqueKey) {
    return ListView.builder(
      itemCount: clientes.length,
      itemBuilder: (context, index) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            FittedBox(
              fit: BoxFit.fitWidth,
              child: MyBoxCliente(
                key: ValueKey(clientes[index]),
                id: clientes[index].idCliente,
                nomeCliente: clientes[index].nomeCliente,
                enderecoCliente: clientes[index].enderecoCliente,
                emailCliente: clientes[index].emailCliente,
                telefoneCliente: clientes[index].telefoneCliente,
                statusCliente: clientes[index].statusCliente,
                color: kRedColor,
                icone: FontAwesomeIcons.female,
              ),
            ),
          ],
        );
      },
    );
  }
}
