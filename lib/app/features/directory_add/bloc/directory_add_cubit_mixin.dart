import 'package:bloc/bloc.dart';
import 'package:pdf_app/app/features/directory_add/bloc/directory_add_state.dart';
import 'package:pdf_app/app/features/directory_add/model/directory_model.dart';

mixin DirectoryAddCubitMixin on Cubit<DirectoryAddState> {
  bool isDuplicate(
      List<DirectoryModel> directoryList, DirectoryModel newDirectory) {
    final isDuplicate = directoryList.any(
      (directory) => directory.name == newDirectory.name,
    );
    return isDuplicate;
  }
}
