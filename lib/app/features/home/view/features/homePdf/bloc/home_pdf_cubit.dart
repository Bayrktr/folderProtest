import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pdf_app/app/features/directory_add/model/directory_model.dart';
import 'package:pdf_app/app/features/home/view/features/homePdf/bloc/home_pdf_state.dart';
import 'package:pdf_app/app/features/home/view/features/homePdf/model/all_directory_model.dart';
import 'package:pdf_app/app/product/cache/hive/operation/all_directory_operation.dart';
import 'package:pdf_app/app/product/manager/getIt/getIt_manager.dart';
import 'package:pdf_app/app/product/package/uuid/id_generator.dart';

class HomePdfCubit extends Cubit<HomePdfState> {
  HomePdfCubit() : super(HomePdfState());

  final AllDirectoryOperation _allDirectoryOperation =
      GetItManager.getIt<AllDirectoryOperation>();

  Future<void> initDatabase() async {
    // await _allDirectoryOperation.start(AllDirectoryModel.allDirectoryKey);

    await _allDirectoryOperation.start(AllDirectoryModel.allDirectoryKey);

    final allDirectory =
        _allDirectoryOperation.getItem(AllDirectoryModel.allDirectoryKey);

    if (allDirectory == null) {
      await createFirstAllDirectory();
      initDatabase();
    } else {
      updateAllDirectoryState(allDirectory);
    }
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
    AllDirectoryModel? allDirectory, {
    bool isUpdate = true,
  }) async {
    if (allDirectory == null) {
      emit(
        state.copyWith(
          status: HomePdfStatus.error,
        ),
      );
    } else {
      emit(
        state.copyWith(
          status: HomePdfStatus.initial,
          allDirectory: isUpdate ? allDirectory : null,
        ),
      );
    }
  }

  Future<void> deleteDirectoryFromAllDirectory(
      DirectoryModel? directoryModel) async {
    emit(
      state.copyWith(
        status: HomePdfStatus.loading,
      ),
    );

    if (state.allDirectory?.allDirectory == null) {
      emit(
        state.copyWith(
          status: HomePdfStatus.error,
        ),
      );
      return;
    }

    final copyAllDirectory =
        List<DirectoryModel>.from(state.allDirectory!.allDirectory!);

    copyAllDirectory.removeWhere(
      (dir) => dir.id == directoryModel?.id,
    );

    final AllDirectoryModel newAllDirectoryModel = state.allDirectory!.copyWith(
      allDirectory: copyAllDirectory,
    );

    await _allDirectoryOperation.addOrUpdateItem(newAllDirectoryModel);

    emit(
      state.copyWith(
        status: HomePdfStatus.initial,
        allDirectory: newAllDirectoryModel,
      ),
    );
  }
}
