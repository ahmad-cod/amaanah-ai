import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import '../../features/shipments/data/datasources/db/schemas/shipment_schema.dart';
import '../../features/inventory/data/datasources/db/schemas/inventory_schema.dart';

class IsarService {
  static Future<Isar> init() async {
    final dir = await getApplicationDocumentsDirectory();
    
    if (Isar.instanceNames.contains('amaanah_db')) {
      return Isar.getInstance('amaanah_db')!;
    }

    final isar = await Isar.open(
      [
        ShipmentSchemaSchema,
        InventorySchemaSchema,
      ],
      directory: dir.path,
      name: 'amaanah_db',
    );

    return isar;
  }
}
