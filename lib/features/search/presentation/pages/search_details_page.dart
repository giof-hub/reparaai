import 'package:flutter/material.dart';
import 'package:reparaai/core/presentation/pages/base_page_state.dart';
import 'package:reparaai/features/search/domain/entities/search_details_arguments.dart';
import 'package:reparaai/features/search/presentation/controllers/search_detail_controller.dart';
import 'package:reparaai/core/presentation/widgets/appbar_detail.dart';
import 'package:reparaai/features/search/presentation/widgets/search_bottom.dart';
import 'package:reparaai/features/search/presentation/widgets/search_detail_card.dart';
import 'package:reparaai/features/search/presentation/widgets/search_detail_description.dart';

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
  void dispose() {
    super.dispose();
    controller.clean();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidgetDetail(title: widget.arguments.serviceSelected!.name),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Imagem do topo
            SearchDetailCard(
              pathName: widget.arguments.serviceSelected!.pathName,
              name: widget.arguments.serviceSelected!.name,
            ),
            // Card com serviços
            SearchDetailDescription(
              description: widget.arguments.serviceSelected!.description,
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
            SearchBottom(),
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
