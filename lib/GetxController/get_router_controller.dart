import 'package:get/get.dart';
import 'package:getxstate_practice/routes/app_routes.dart';

import '../registration/sign_in.dart';
import '../registration/sign_up.dart';
import '../screens/add_notes.dart';
import '../screens/dashboard.dart';
import '../startUp/start_up.dart';


class GetAppRouter{

  List<GetPage> getRoutes()=> [

  GetPage(name: App_Routes.initial, page: () => const startUp(),),
  GetPage(name: App_Routes.signIn, page: () => const SignIn(),),
  GetPage(name: App_Routes.signUp, page: () => const SignUp(),),
  GetPage(name: App_Routes.dashboard, page: () => const Dashboard(),),
  GetPage(name: App_Routes.addNotes, page: () => const AddNotes(),),

  ];
}