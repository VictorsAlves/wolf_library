import 'package:flutter/material.dart';

class SearchComponent extends StatefulWidget {
  final Function(String text) onSearchCompleted;

  SearchComponent(this.onSearchCompleted);

  @override
  _SearchComponentState createState() => _SearchComponentState();
}

class _SearchComponentState extends State<SearchComponent> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();

    // Ouve as mudanças no campo de texto
    _searchController.addListener(() {
      _notify(_searchController.text);
    });
  }

  void _notify(String searchTerm) {
    // Chama a função de callback diretamente sem setState
    widget.onSearchCompleted(searchTerm);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 7,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: TextField(
            controller: _searchController,
            decoration: InputDecoration(
              labelText: 'Pesquisar',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide.none,
              ),
              filled: true,
              fillColor: Colors.white,
              suffixIcon: IconButton(
                icon: Icon(Icons.search),
                onPressed: () {
                  // Chama diretamente sem setState
                  _notify(_searchController.text);
                },
              ),
            ),
          ),
        ),
        // Outros widgets...
      ],
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}
