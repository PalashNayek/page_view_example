import 'package:get_it/get_it.dart';

import '../view_models/page_view_model.dart';

final getIt = GetIt.instance;

void setupLocator() {
  getIt.registerLazySingleton(() => PageViewModel());
}
