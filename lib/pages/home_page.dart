import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  //referencia de tareas

  CollectionReference tasksReference =
      FirebaseFirestore.instance.collection('tareasfirebase');

  /*Stream<int> counter() async* {
    for (int i = 0; i < 10; i++) {
      yield i;
      await Future.delayed(const Duration(seconds: 2));
    }
  }

  Future<int> getNumber() async {
    return 1000;
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Firebase Firestore"),
      ),
      body: StreamBuilder(
        stream: tasksReference.snapshots(),
        builder: (BuildContext context, AsyncSnapshot snap) {
          if (snap.hasData) {
            QuerySnapshot collection = snap.data;
            List<QueryDocumentSnapshot> docs = collection.docs;
            List<Map<String, dynamic>> docsMap =
                docs.map((e) => e.data() as Map<String, dynamic>).toList();
            print(docsMap);
            return ListView.builder(
              itemCount: docsMap.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(docsMap[index]["title"]),
                );
              },
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),

      /* body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

  ----Primer boton-------------
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
            
  ----Segundo boton-----

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

    ----Tercer boton --------------
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

  ----Cuarto boton-------

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

  ----Quinto boton--------
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
        ),*/
    );
  }
}
