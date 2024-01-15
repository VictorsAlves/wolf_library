import 'package:flutter/material.dart';

class SearchComponent extends StatefulWidget {
  @override
  _SearchComponentState createState() => _SearchComponentState();
}

class _SearchComponentState extends State<SearchComponent> {
  final TextEditingController _searchController = TextEditingController();
  String _searchTerm = '';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.all(10), // Espaçamento ao redor do campo de pesquisa
          decoration: BoxDecoration(
            color: Colors.white, // Cor de fundo
            borderRadius: BorderRadius.circular(30), // Cantos arredondados
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5), // Sombra com transparência
                spreadRadius: 2,
                blurRadius: 7,
                offset: Offset(0, 3), // Posição da sombra
              ),
            ],
          ),
          child: TextField(
            controller: _searchController,
            decoration: InputDecoration(
              labelText: 'Pesquisar',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30), // Bordas arredondadas
                borderSide: BorderSide.none, // Sem borda visível
              ),
              filled: true,
              fillColor: Colors.white, // Cor de preenchimento
              suffixIcon: IconButton(
                icon: Icon(Icons.search),
                onPressed: () {
                  setState(() {
                    _searchTerm = _searchController.text;
                  });
                  // Implemente a lógica de pesquisa aqui
                },
              ),
            ),
          ),
        ),
        // Adicione botões ou widgets de filtro aqui
        // ...
      ],
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }}