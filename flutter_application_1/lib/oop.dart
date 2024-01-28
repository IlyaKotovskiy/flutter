import 'package:flutter/material.dart';

void oop() {
  // ЭКЗЕМПЛЯР КЛАССА

  // неименованный тип конструктора
  // User user = User(1, 'Ilya', 'Kotovskiy');

  // именованный тип конструктора
  User user = User(id: 1, name: 'Ilya', surName: 'Kotovskiy');

  user.printUser();
  
  // В таком случае кнопка будет зеленая, по заготовленном ранее шаблону
  AppButton.prymary(child: child);
  // А в таком, синяя
  AppButton.secondary(child: child);


  // Теперь мы можем использовать через дочерний класс, метод родительского класса
  Nikita nikita1 = Nikita(secondName: 'Nikitovich');
  nikita1.sayName();
}

// КЛАССЫ
class User {
  // Такой тип констурктора, называется неименованным.
  // User(
  //   this.id,
  //   this.name,
  //   this.surName
  // );

  // Такой тип констурктора, называется именнованым.
  User({
    required this.id,
    required this.name,
    required this.surName
  });

  // Методы
  void printUser() {
    print(id);
    print(name);
    print(surName);
  }

  static void doSthm() {
    print('1234');
  }

  int id;
  String name;
  String surName;
}

class AppButton {
  AppButton({
    required this.radius,
    required this.color,
    required this.child,
  });

  double radius;
  Color color;
  Widget child;

  // Фабричный конструктор
  // Это шаблон для использования класса (cm. 15 строчку)
  factory AppButton.prymary({ required Widget child }) => AppButton(radius: 8, color: Colors.green, child: child);
  factory AppButton.secondary({ required Widget child }) => AppButton(radius: 8, color: Colors.blue, child: child);
  factory AppButton.tetriary({ required Widget child }) => AppButton(radius: 8, color: Colors.red, child: child);
}

// УНАСЛЕДОВАННЫЕ КЛАССЫ
class Person {
  Person({
    required this.name,
    required this.secondName
  });

  String name;
  String secondName;

  // ИНКАПСУЛЯЦИЯ
  // Таким образом, мы закрываем наши методы (и не только методы, можно и свойства) от использования ими, другими программистами
  void sayName() {
    if (_isNameEmpty()) {
      _errorHandler('Name is Empty');
    } else {
      final res = _getName();
      print(res);
    }
  }

  String _getName() {
    return name;
  }

  bool _isNameEmpty() {
    return name.isEmpty;
  }

  void _errorHandler(String e) {
    print(e);
  }
}

// Когда мы унаследуемся от какого-то класса(у которого есть конструктор),
// мы обязаны в дочернем классе указать все те же самые атрибуты родительского класса,
// через ключевое слово super
class Nikita extends Person {
  Nikita({
    super.name = 'Nikita',
    required super.secondName,
  });

  // ПОЛИМОРФИЗМ
  // Это возможность класса, переопределять методы родительского класса.
  @override
  void sayName() {
    print('My name is $name $secondName');
  }
  // Теперь когда мы вызовем этот метод класса Nikita, он переопределен только у этого класса.
  
}


// АБСТРАКЦИЯ
// 1. Можно просто объявить метод без его реализации.
// 2. Абстрактный класс, если в нем метод без реализации, мы обязаны его переопределить.
//    Использовать ПОЛИМОРФИЗМ и написать свою реализацию в каждом дочернем классе
abstract class Animal {
  Animal({
    required this.id,
    required this.name
  });

  int id;
  String name;

  void doSthm();
}