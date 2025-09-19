import 'package:reparaai/features/home/domain/entities/work_entity.dart';

class WorkUseCase {
  final List<WorkEntity> repair;

  final workUseCase = WorkUseCase(
    repair: [
      WorkEntity(pathImage: 'assets/eletricista.png', name: 'Eletricista'),
      WorkEntity(pathImage: 'assets/encanador.png', name: 'Encanador'),
    ],
  );

  WorkUseCase({required this.repair});
}
