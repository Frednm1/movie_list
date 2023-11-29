// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SearchStore on _SearchStore, Store {
  late final _$movieListAtom =
      Atom(name: '_SearchStore.movieList', context: context);

  @override
  ObservableList<Search?> get movieList {
    _$movieListAtom.reportRead();
    return super.movieList;
  }

  @override
  set movieList(ObservableList<Search?> value) {
    _$movieListAtom.reportWrite(value, super.movieList, () {
      super.movieList = value;
    });
  }

  late final _$loadingAtom =
      Atom(name: '_SearchStore.loading', context: context);

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  late final _$searchAsyncAction =
      AsyncAction('_SearchStore.search', context: context);

  @override
  Future search(String title) {
    return _$searchAsyncAction.run(() => super.search(title));
  }

  late final _$_SearchStoreActionController =
      ActionController(name: '_SearchStore', context: context);

  @override
  dynamic setLoading(bool value) {
    final _$actionInfo = _$_SearchStoreActionController.startAction(
        name: '_SearchStore.setLoading');
    try {
      return super.setLoading(value);
    } finally {
      _$_SearchStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
movieList: ${movieList},
loading: ${loading}
    ''';
  }
}
