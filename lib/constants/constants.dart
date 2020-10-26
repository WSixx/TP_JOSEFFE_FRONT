import 'package:flutter/material.dart';
import 'package:tp_final/constants/colors.dart';

const kStyleEditarButton = TextStyle(
  fontSize: 18.0,
  fontWeight: FontWeight.bold,
);

const kInputStyleSearchButton = InputDecoration(
    prefixIcon: Icon(Icons.search, color: kWhiteColor),
    hintText: "pesquisando...",
    hintStyle: TextStyle(color: kWhiteColor));

const kTextEditar = Text('Editar', style: TextStyle(fontSize: 18.0));
const kSalvarStyle = TextStyle(color: kWhiteColor, fontSize: 20);

const String kSnackUpdateTitle = 'Dados Atualizados';
const String kSnackUpdateMessage = 'Dados foram atualizados com sucesso!!';

const String kSnackDeleteTitle = 'Dado apagado';
const String kSnackDeleteMessage = 'Dados foram apagados com sucesso!!';
