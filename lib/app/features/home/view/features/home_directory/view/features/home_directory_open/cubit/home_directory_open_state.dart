import 'package:DocuSort/app/product/model/file/all_file/all_file_base_model.dart';
import 'package:DocuSort/app/product/model/page_layout/home_directory_open_layout_model/home_directory_open_page_layout_model.dart';
import 'package:DocuSort/app/product/model/page_layout/home_directory_page_layout/home_directory_page_layout_model.dart';
import 'package:equatable/equatable.dart';

class HomeDirectoryOpenState with EquatableMixin {
  HomeDirectoryOpenState({
    this.status = HomeDirectoryOpenStatus.start,
    this.snackBarStatus = HomeDirectoryOpenSnackBarStatus.initial,
    this.allFileModel,
    this.pageLayoutModel,
  });

  final HomeDirectoryOpenStatus status;
  final HomeDirectoryOpenSnackBarStatus snackBarStatus;
  final AllFileExtendBaseModel? allFileModel;
  final HomeDirectoryOpenPageLayoutModel? pageLayoutModel;

  @override
  List<Object?> get props => [
        status,
        snackBarStatus,
        allFileModel,
        pageLayoutModel,
      ];

  HomeDirectoryOpenState copyWith({
    HomeDirectoryOpenStatus? status,
    HomeDirectoryOpenSnackBarStatus? snackBarStatus,
    AllFileExtendBaseModel? allFileModel,
    HomeDirectoryOpenPageLayoutModel? pageLayoutModel,
  }) =>
      HomeDirectoryOpenState(
        status: status ?? this.status,
        snackBarStatus: snackBarStatus ?? this.snackBarStatus,
        allFileModel: allFileModel ?? this.allFileModel,
        pageLayoutModel: pageLayoutModel ?? this.pageLayoutModel,
      );
}

enum HomeDirectoryOpenStatus {
  start,
  initial,
  loading,
  error,
}

enum HomeDirectoryOpenSnackBarStatus {
  initial,
  deletedSuccess,
}
