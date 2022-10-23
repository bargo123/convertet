import 'package:injectable/injectable.dart';
import 'package:objectbox/objectbox.dart';

import '../../../objectbox.g.dart';

@injectable
class ObjectBox {
  late final Store store;
  ObjectBox._create(this.store);
  @factoryMethod
  static Future<ObjectBox> create() async {
    final store = await openStore();
    return ObjectBox._create(store);
  }
}
