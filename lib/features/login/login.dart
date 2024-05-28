import 'package:get_it/get_it.dart';
import 'package:weather/features/login/controllers/login_controller.dart';
import 'package:weather/features/login/views/bloc/login_cubit.dart';

export 'views/login_page.dart';

final _getIt = GetIt.instance;

void initLoginFeature() {
  _getIt.registerFactory<LoginCubit>(LoginCubit.new);
  _getIt.registerFactory<LoginController>(LoginControllerImpl.new);
}
