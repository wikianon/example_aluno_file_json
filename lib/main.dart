import 'dart:convert';
import 'dart:async' show Future;
import 'dart:io';
import 'package:flutter/services.dart' show rootBundle;
//https://github.com/Flutterando/forum/discussions/96
//http://cogitas.net/parse-json-dart-flutter/


void main() async {
  final users = await loadUsers();
  print(users);
}

Future<List<Usuario>> loadUsers() async {
  final jsonString = await loadFile();
  final map = jsonDecode(jsonString);
  final users = List.from(map).map((e) => Usuario.fromJson(e)).toList();
  return users;
}

Future<dynamic> loadFile() async {
 return await File('assets/json/dados.json').readAsString();
}


/*
void main() async{
 
  String jsonData = await loadAsset();
 
  // Transforma o JSON numa lista de Maps.
  final lista = jsonDecode(jsonData) as List;
  
  // Transformando a lista de Maps em uma lista do tipo da sua classe Usuario
  final List<Usuario> listaDeTodos = lista.map((item) => Usuario.fromJson(item)).toList();
  
  // Para passo item a item
  for (final element in listaDeTodos) {
    print("Título: " + element.title);
  }
  
  // Para printar um item em específico
    print("\nTítulo do item 1: " + listaDeTodos[1].title);
  
}
*/
Future<String> loadAsset() async {
  return await rootBundle.loadString('assets/json/dados.json');
}


class Usuario {
  final int userId;
  final int id;
  final String title;
  final bool completed;

  Usuario({required this.userId, required this.id, required this.title, required this.completed});

  factory Usuario.fromJson(Map<String, dynamic> json){ 
    return  Usuario(
    userId: json['userId'],
    id: json['id'],
    title: json['title'],
    completed: json['completed']
    );
  }
}
