import 'package:DocuSort/app/features/directory_add/model/directory_model.dart';
import 'package:DocuSort/app/features/home/view/features/home_directory/bloc/home_directory_state.dart';
import 'package:DocuSort/app/features/home/view/features/home_directory/model/all_directory_model.dart';
import 'package:DocuSort/app/product/cache/hive/operation/all_directory_operation.dart';
import 'package:DocuSort/app/product/cache/hive/operation/home_directory_page_layout_operation.dart';
import 'package:DocuSort/app/product/enum/page_layout_enum.dart';
import 'package:DocuSort/app/product/manager/getIt/getIt_manager.dart';
import 'package:DocuSort/app/product/model/page_layout/home_directory_page_layout/home_directory_page_layout_model.dart';
import 'package:DocuSort/app/product/package/uuid/id_generator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeDirectoryCubit extends Cubit<HomeDirectoryState> {
  HomeDirectoryCubit() : super(HomeDirectoryState());

  final AllDirectoryOperation _allDirectoryOperation =
      GetItManager.getIt<AllDirectoryOperation>();

  final HomeDirectoryPageLayoutOperation _homeDirectoryPageLayoutOperation =
      GetItManager.getIt<HomeDirectoryPageLayoutOperation>();

  void resetSnackBarStatus() {
    emit(
      state.copyWith(
        snackBarStatus: HomeDirectorySnackBarStatus.initial,
      ),
    );
  }

  Future<void> initDatabase() async {
    // await _allDirectoryOperation.start(AllDirectoryModel.allDirectoryKey);

    await _allDirectoryOperation.start(AllDirectoryModel.allDirectoryKey);
    await _homeDirectoryPageLayoutOperation.start(
      HomeDirectoryPageLayoutModel.homeDirectoryLayoutKey,
    );

    final allDirectory =
        _allDirectoryOperation.getItem(AllDirectoryModel.allDirectoryKey);

    final homeDirectoryLayout = _homeDirectoryPageLayoutOperation.getItem(
      HomeDirectoryPageLayoutModel.homeDirectoryLayoutKey,
    );

    if (allDirectory == null || homeDirectoryLayout == null) {
      allDirectory == null ? await createFirstAllDirectory() : null;
      homeDirectoryLayout == null ? await createFirstHomePageLayout() : null;
      initDatabase();
    } else {
      updateAllDirectoryState(allDirectory);
      updateHomeLayoutState(homeDirectoryLayout);
    }
  }

  Future<void> createFirstHomePageLayout() async {
    await _homeDirectoryPageLayoutOperation.addOrUpdateItem(
      HomeDirectoryPageLayoutModel(
        id: IdGenerator.randomIntId,
        pageLayoutEnum: PageLayoutEnum.list,
      ),
    );
  }

  Future<void> createFirstAllDirectory() async {
    await _allDirectoryOperation.addOrUpdateItem(
      AllDirectoryModel(
        id: IdGenerator.randomIntId,
        allDirectory: [],
      ),
    );
  }

  void updateAllDirectoryState(
    AllDirectoryModel allDirectory, {
    bool isUpdate = true,
  }) {
    emit(
      state.copyWith(
        status: HomeDirectoryStatus.initial,
        allDirectory: isUpdate ? allDirectory : null,
      ),
    );
  }

  void updateHomeLayout(PageLayoutEnum? layoutEnum) {
    if (layoutEnum == null) return;
    final newPageLayoutModel = state.pageLayoutModel!.copyWith(
      pageLayoutEnum: layoutEnum,
    );

    _homeDirectoryPageLayoutOperation.addOrUpdateItem(newPageLayoutModel);
    emit(
      state.copyWith(
        pageLayoutModel: newPageLayoutModel,
      ),
    );
  }

  void updateHomeLayoutState(HomeDirectoryPageLayoutModel layoutModel) {
    emit(
      state.copyWith(
        status: HomeDirectoryStatus.initial,
        pageLayoutModel: layoutModel,
      ),
    );
  }

  Future<void> deleteDirectoryFromAllDirectory(
      DirectoryModel? directoryModel) async {
    emit(
      state.copyWith(
        status: HomeDirectoryStatus.loading,
      ),
    );

    if (state.allDirectory?.allDirectory == null) {
      emit(
        state.copyWith(
          status: HomeDirectoryStatus.error,
        ),
      );
      return;
    }

    final copyAllDirectory =
        List<DirectoryModel>.from(state.allDirectory!.allDirectory);

    copyAllDirectory.removeWhere(
      (dir) => dir.id == directoryModel?.id,
    );

    final AllDirectoryModel newAllDirectoryModel = state.allDirectory!.copyWith(
      allDirectory: copyAllDirectory,
    );

    await _allDirectoryOperation.addOrUpdateItem(newAllDirectoryModel);

    emit(
      state.copyWith(
        status: HomeDirectoryStatus.initial,
        allDirectory: newAllDirectoryModel,
        snackBarStatus: HomeDirectorySnackBarStatus.deletedSuccess,
      ),
    );
    resetSnackBarStatus();
  }
}
