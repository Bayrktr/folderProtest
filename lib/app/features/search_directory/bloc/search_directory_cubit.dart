import 'package:DocuSort/app/features/directory_add/model/directory_model.dart';
import 'package:DocuSort/app/features/home/view/features/home_directory/model/all_directory_model.dart';
import 'package:DocuSort/app/features/search_directory/bloc/search_directory_state.dart';
import 'package:DocuSort/app/product/cache/hive/operation/all_directory_operation.dart';
import 'package:DocuSort/app/product/manager/getIt/getIt_manager.dart';
import 'package:DocuSort/app/product/package/uuid/id_generator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchDirectoryCubit extends Cubit<SearchDirectoryState> {
  SearchDirectoryCubit() : super(SearchDirectoryState());

  final TextEditingController _searchDirectoryController =
      TextEditingController();

  TextEditingController get searchDirectoryController =>
      _searchDirectoryController;

  final AllDirectoryOperation _allDirectoryOperation =
      GetItManager.getIt<AllDirectoryOperation>();

  Future<void> initDatabase() async {
    await _allDirectoryOperation.start(
      AllDirectoryModel.allDirectoryKey,
    );

    final AllDirectoryModel? allDirectoryModel = _allDirectoryOperation.getItem(
      AllDirectoryModel.allDirectoryKey,
    );
    if (allDirectoryModel == null) {
      allDirectoryModel == null ? await createFirstAllDirectoryModel() : null;
      initDatabase();
    } else {
      allDirectoryModelUpdateState(allDirectoryModel);
      emit(
        state.copyWith(
          status: SearchDirectoryStatus.initial,
        ),
      );
    }
  }

  Future<void> createFirstAllDirectoryModel() async {
    final AllDirectoryModel allDirectoryModel = AllDirectoryModel(
      allDirectory: [],
      id: IdGenerator.randomIntId,
    );
    await _allDirectoryOperation.addOrUpdateItem(allDirectoryModel);
  }

  void allDirectoryModelUpdateState(
    AllDirectoryModel allDirectoryModel,
  ) {
    emit(
      state.copyWith(
        allDirectoryModel: allDirectoryModel,
        searchResultList: allDirectoryModel.allDirectory,
      ),
    );
  }

  void updateSearchDirectoryController(String? value) {
    if (value == null) return;
    _searchDirectoryController.text = value;

    final List<DirectoryModel?> directoryListResult =
        _directoryListResult(value);

    emit(
      state.copyWith(
        searchResultList: directoryListResult,
      ),
    );
  }

  List<DirectoryModel?> _directoryListResult(
    String value,
  ) {
    final results = state.allDirectoryModel!.allDirectory.where(
      (model) {
        final String? name = model?.name;
        if (name == null) {
          return false;
        } else {
          return name.toLowerCase().contains(
                _searchDirectoryController.text.toLowerCase(),
              );
        }
      },
    ).toList();
    return results;
  }
}
