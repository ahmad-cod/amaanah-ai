import '../../../../core/utils/result.dart';
import '../entities/shipment.dart';
import '../repositories/shipment_repository.dart';

class GetShipments {
  final ShipmentRepository repository;

  const GetShipments(this.repository);

  Future<Result<List<Shipment>>> execute() {
    return repository.getShipments();
  }
}
