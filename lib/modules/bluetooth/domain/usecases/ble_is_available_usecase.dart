import 'package:app/shared/usecases/usecases.dart';

import '../repositories/ble_repository.dart';

class IsAvailable extends NoParamsUseCase<bool> {
  final BLERepository repository;

  IsAvailable(this.repository);

  @override
  Future<bool> call() async {
    return await repository.isOn();
  }
}
