import 'package:flutter/material.dart';
import 'package:skybooker/controller/services.dart';
import 'package:skybooker/model/travel_model.dart';

class EditData extends StatefulWidget {
  final Travel data;
  const EditData({super.key, required this.data});

  @override
  State<EditData> createState() => _EditDataState();
}

class _EditDataState extends State<EditData> {
  var destinyController = TextEditingController();
  var priceController = TextEditingController();
  var descriptionController = TextEditingController();

  @override
  void initState() {
    super.initState();
    destinyController.text = widget.data.destiny.toString();
    priceController.text = widget.data.price.toString();
    descriptionController.text = widget.data.description.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Editar dados"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: destinyController,
              decoration: const InputDecoration(hintText: "Nome"),
            ),
            TextField(
              controller: descriptionController,
              decoration: const InputDecoration(hintText: "Descrição"),
            ),
            TextField(
              controller: priceController,
              decoration: const InputDecoration(hintText: "Preço"),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () async {
                try {
                  if (widget.data.id != null) {
                    // Verificações para garantir que os campos estão preenchidos
                    if (destinyController.text.isNotEmpty &&
                        descriptionController.text.isNotEmpty &&
                        priceController.text.isNotEmpty) {
                      await Api.updateTravel(widget.data.id!, {
                        "travelDestiny": destinyController.text,
                        "travelDescription": descriptionController.text,
                        // Converta o preço para o tipo desejado (por exemplo, double)
                        "travelPrice": priceController.text.toString() ?? '',
                      });
                      // Atualização bem-sucedida
                      // Navegar para a página anterior
                      Navigator.pop(context);
                    } else {
                      debugPrint("Erro: Preencha todos os campos.");
                    }
                  } else {
                    debugPrint("Erro: widget.data.id é nulo");
                  }
                } catch (e) {
                  // Se ocorrer um erro durante a atualização
                  debugPrint("Erro durante a atualização: $e");
                }
              },
              child: const Text("Atualizar"),
            )
          ],
        ),
      ),
    );
  }
}
