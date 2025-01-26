part of 'edit_directory_cubit.dart';

mixin _EditDirectoryCubitMixin on Cubit<EditDirectoryState> {
  bool isDuplicate(
      List<DirectoryModel?> directoryList, DirectoryModel newDirectory) {
    final isDuplicate = directoryList.any(
          (directory) => directory?.name == newDirectory.name,
    );
    return isDuplicate;
  }
}
