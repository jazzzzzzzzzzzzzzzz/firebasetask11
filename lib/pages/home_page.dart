import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  CollectionReference tasksReference =
      FirebaseFirestore.instance.collection('tareasfirebase');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Firebase Firestore"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                tasksReference.get().then((QuerySnapshot value) {
                  // QuerySnapshot collection = value;
                  //List<QueryDocumentSnapshot> docs = collection.docs;
                  //QueryDocumentSnapshot doc = docs[1];
                  //print(doc.id);
                  //print(doc.data());

                  QuerySnapshot collection = value;
                  collection.docs.forEach((QueryDocumentSnapshot element) {
                    Map<String, dynamic> myMap =
                        element.data() as Map<String, dynamic>;
                    print(myMap["title"]);
                  });
                });
              },
              child: Text(
                "Obtener la data",
              ),
            ),
            ElevatedButton(
              onPressed: () {
                tasksReference.add(
                  {
                    "title": "Ir de comprar al super",
                    "descrption": "Debemos de comprar comida para todo el mes",
                  },
                ).then((DocumentReference value) {
                  print(value.id);
                }).catchError((error) {
                  print("Ocurrio un eroor en el registro");
                }).whenComplete(() {
                  print("El registro ha terminado");
                });
              },
              child: Text(
                "Agregar documento",
              ),
            ),
            ElevatedButton(
              onPressed: () {
                tasksReference
                    .doc("GyD1GFkVD7p9JUPcDtF1")
                    .update({"title": "ir de paseo al campo"}).catchError(
                  (error) {
                    print(error);
                  },
                ).whenComplete(
                  () {
                    print("Actualizacion terminada");
                  },
                );
              },
              child: Text(
                "Actualizar documento",
              ),
            ),
            ElevatedButton(
              onPressed: () {
                tasksReference.doc("9TQHQz9R4Z8KLIc1ew1L").delete().catchError(
                  (error) {
                    print(error);
                  },
                ).whenComplete(
                  () {
                    print("La eliminacion esta completa");
                  },
                );
              },
              child: Text(
                "Eliminar documento",
              ),
            ),
            ElevatedButton(
              onPressed: () {
                tasksReference.doc("AB5559").set(
                  {
                    "title": "Ir al acampar",
                    "description": "Este fin de semana iremos a acampar"
                  },
                ).catchError((error) {
                  print(error);
                }).whenComplete(() {
                  print("Creacion completada");
                });
              },
              child: Text(
                "Agregar documento personalizado",
              ),
            )
          ],
        ),
      ),
    );
  }
}
