import 'package:flutter/material.dart';
import 'package:reparaai/core/presentation/pages/base_page_state.dart';
import 'package:reparaai/features/search/domain/entities/search_details_arguments.dart';
import 'package:reparaai/features/search/presentation/controllers/search_detail_controller.dart';
import 'package:reparaai/core/presentation/widgets/appbar_detail.dart';

class SearchDetailsPage extends StatefulWidget {
  static const String nameRoute = "searchDetails";

  final SearchDetailController controller;

  final SearchDetailsArguments arguments;

  const SearchDetailsPage({required this.controller, required this.arguments});

  @override
  _SearchDetailsPageState createState() =>
      _SearchDetailsPageState(controller, false);
}

class _SearchDetailsPageState
    extends BasePageState<SearchDetailsPage, SearchDetailController> {
  _SearchDetailsPageState(super.controller, super.hasAuthenticate);

  @override
  void initState() {
    super.initState();
    controller.init(widget.arguments);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidgetDetail(title: widget.arguments.serviceSelected!.name),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Imagem do topo
            Stack(
              alignment: Alignment.bottomRight,
              children: [
                Image.asset(
                  widget.arguments.serviceSelected!.pathName,
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  color: Colors.blue,
                  child: Text(
                    widget.arguments.serviceSelected!.name,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),

            // Card com serviços
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                elevation: 4,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.blue.shade100,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: const Text(
                          'Garantia da Reparai',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SizedBox(height: 12),
                      ...List.generate(
                        widget.arguments.serviceSelected!.description.length,
                        (index) => Padding(
                          padding: const EdgeInsets.symmetric(vertical: 2.0),
                          child: Text(
                            "• ${widget.arguments.serviceSelected!.description[index]}",
                          ),
                        ),
                      ),
                      const SizedBox(height: 12),
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {},
                          child: const Text("Ver mais informações"),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // Profissionais disponíveis
            // Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: 16),
            //   child: Text(
            //     "${dados["profissionaisDisponiveis"]} profissionais disponíveis em sua região",
            //     style: const TextStyle(color: Colors.blue),
            //   ),
            // ),
            // const SizedBox(height: 10),

            // Botão "Procurar"
            ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.search),
              label: Text("dados!"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 12,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Publicidade / Mapa
            // const Text('Publicidades', style: TextStyle(color: Colors.grey)),
            // const SizedBox(height: 10),
            // Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: 16.0),
            //   child: Column(
            //     children: [
            //       const Align(
            //         alignment: Alignment.centerLeft,
            //         child: Text("Encontre profissionais em sua região"),
            //       ),
            //       const SizedBox(height: 10),
            //       ClipRRect(
            //         borderRadius: BorderRadius.circular(10),
            //         child: Image.asset(dados["imagemMapa"]!, fit: BoxFit.cover),
            //       ),
            //     ],
            //   ),
            // ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
