abstract class Routes {
  static const String dashboard = '/';
  static const String shipments = '/shipments';
  static const String shipmentDetails = '/shipments/:id';
  static const String addShipment = '/shipments/add';
  static const String inventory = '/inventory';

  static String shipmentDetailsPath(String id) => '/shipments/$id';
}
