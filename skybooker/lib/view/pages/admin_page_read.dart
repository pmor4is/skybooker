import 'package:flutter/material.dart';
import 'package:skybooker/controller/services.dart';
import 'package:skybooker/model/travel_model.dart';
import 'package:skybooker/view/pages/admin_page_edit.dart';

class AdminPageData extends StatefulWidget {
  const AdminPageData({super.key});

  @override
  State<AdminPageData> createState() => _AdminPageDataState();
}

class _AdminPageDataState extends State<AdminPageData> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder(
        future: Api.getTravel(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              List<Travel> travelData =
                  (snapshot.data as List<dynamic>).cast<Travel>();

              return ListView.builder(
                itemCount: travelData.length,
                itemBuilder: (BuildContext context, int index) {
                  final Travel travel = travelData[index];
                  return Card(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ListTile(
                          leading: const Icon(Icons.storage),
                          title: Text("${travel.destiny}"),
                          subtitle: Text("${travel.description}"),
                          trailing: Text("\$ ${travel.price}"),
                        ),
                        ButtonTheme(
                          child: ButtonBar(
                            children: [
                              ElevatedButton(
                                child: const Text("Editar"),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => EditData(data: travelData[index]),
                                    )
                                  );
                                },
                              ),
                              ElevatedButton(
                                child: const Text("Deletar"),
                                onPressed: () async {
                                  await Api.deleteTravel(travelData[index].id);
                                  travelData.removeAt(index);
                                  setState(() {});
                                },
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  );
                },
              );
            } else if (snapshot.hasError) {
              return const Center(
                child: Text("Error loading data"),
              );
            } else {
              return const Center(
                child: Text("No data received"),
              );
            }
          } else {
            return const Center(
              child: Text("Unexpected ConnectionState"),
            );
          }
        },
      ),
    );
  }
}
