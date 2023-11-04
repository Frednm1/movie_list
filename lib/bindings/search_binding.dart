import 'package:get/get.dart';
import 'package:movie_list/controllers/search_page_controller.dart';

/*
  A injestão de dependencias do Getx coloca na memória do dispositivo
  uma instância de SearchPageController, evitando a criação de novas instâncias
*/
setUpSearch() {
  Get.put(SearchPageController());
}
