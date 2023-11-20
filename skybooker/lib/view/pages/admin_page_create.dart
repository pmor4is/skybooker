import 'package:flutter/material.dart';
import 'package:skybooker/controller/services.dart';

class CreateData extends StatefulWidget {
  const CreateData({super.key});

  @override
  State<CreateData> createState() => _CreateDataState();
}

class _CreateDataState extends State<CreateData> {
  // Controllers
  var destinyController = TextEditingController();
  var descriptionController = TextEditingController();
  var priceController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold (
      appBar: AppBar(),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: destinyController,
                decoration: const InputDecoration(
                  hintText: "Nome"
                ),
              ),
              TextField(
                controller: descriptionController,
                decoration: const InputDecoration(
                  hintText: "Descrição"
                ),
              ),
              TextField(
                controller: priceController,
                decoration: const InputDecoration(
                  hintText: "Preço"
                ),
              ),
              const SizedBox(height: 20,),
              ElevatedButton(
                onPressed: (){
                  var data = {
                    "travelDestiny": destinyController.text,
                    "travelDescription": descriptionController.text,
                    "travelPrice": priceController.text,
                  };
                  Api.addTravel(data);
                  Navigator.pop(context);
                }, 
                child: const Text("Criar viagem"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}