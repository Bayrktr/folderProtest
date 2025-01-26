part of 'home_directory_open_view.dart';

mixin _HomeDirectoryOpenMixin on StatelessWidget {
  bool nullCheck(DirectoryModel? directoryModel) {
    if (directoryModel == null ||
        directoryModel.fileTypeEnum == null ||
        directoryModel.fileListKey == null) {
      return true;
    } else {
      return false;
    }
  }
}
