import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tp_final/constants/colors.dart';
import 'package:tp_final/constants/constants.dart';
import 'package:tp_final/helpers/produtos.dart';
import 'package:tp_final/services/produto_metodos.dart';
import 'package:tp_final/widgets/produtos_box.dart';
import 'package:tp_final/widgets/snack_bar.dart';

class ProdutosScreen extends StatefulWidget {
  @override
  _ProdutosScreenState createState() => _ProdutosScreenState();
}

class _ProdutosScreenState extends State<ProdutosScreen> {
  ProdutosMetodos produtosMetodos = ProdutosMetodos();

  deletarProdutos(int id) {
    produtosMetodos.deleteProdutos(id);
    setState(() {
      produtosMetodos.pegaDados();
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Produtos>>(
        future: produtosMetodos.pegaDados(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              return Scaffold(
                  appBar: AppBar(
                    title: Text("Produtos"),
                    centerTitle: true,
                  ),
                  body: myList(snapshot.data));
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }
          }
          return Center(child: CircularProgressIndicator());
        });
  }

  Widget myList(List<Produtos> produtos) {
    return ListView.builder(
      itemCount: produtos.length,
      itemBuilder: (context, index) {
        return Column(
          children: [
            MyBoxProdutos(
              key: UniqueKey(),
              color: kRedColor,
              icone: FontAwesomeIcons.amazon,
              nomeProduto: produtos[index].produtoNome,
              precoCustoProduto: produtos[index].produtoPrecoCusto,
              precoVendaProduto: produtos[index].produtoPrecoVenda,
              qtdProduto: produtos[index].produtoQtd,
              id: produtos[index].id,
            ),
            RaisedButton(
              child: Text('DELETE'),
              onPressed: () {
                deletarProdutos(produtos[index].id);
                snackBAr(context, kSnackDeleteTitle, kSnackDeleteMessage,
                    kSnackBarColor);
              },
            ),
          ],
        );
      },
    );
  }
}
