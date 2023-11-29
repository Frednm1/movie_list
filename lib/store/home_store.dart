import 'package:mobx/mobx.dart';
part 'home_store.g.dart';

class HomeStore = _HomeStore with _$HomeStore;

abstract class _HomeStore with Store {
  @observable
  int currentIndex = 0;

  @action
  changeView(int i) {
    currentIndex = i;
  }
}
