import 'package:DocuSort/app/features/home/view/features/home_directory/model/all_directory_model.dart';
import 'package:DocuSort/app/product/model/page_layout/home_directory_page_layout/home_directory_page_layout_model.dart';
import 'package:equatable/equatable.dart';

class HomeDirectoryState with EquatableMixin {
  HomeDirectoryState({
    this.status = HomeDirectoryStatus.start,
    this.allDirectory,
    this.snackBarStatus = HomeDirectorySnackBarStatus.initial,
    this.pageLayoutModel,
  });

  final HomeDirectoryStatus status;
  final AllDirectoryModel? allDirectory;
  final HomeDirectorySnackBarStatus snackBarStatus;
  final HomeDirectoryPageLayoutModel? pageLayoutModel;

  @override
  List<Object?> get props => [
        status,
        allDirectory,
        snackBarStatus,
        pageLayoutModel,
      ];

  HomeDirectoryState copyWith({
    HomeDirectoryStatus? status,
    AllDirectoryModel? allDirectory,
    HomeDirectorySnackBarStatus? snackBarStatus,
    HomeDirectoryPageLayoutModel? pageLayoutModel,
  }) =>
      HomeDirectoryState(
        status: status ?? this.status,
        allDirectory: allDirectory ?? this.allDirectory,
        snackBarStatus: snackBarStatus ?? this.snackBarStatus,
        pageLayoutModel: pageLayoutModel ?? this.pageLayoutModel,
      );
}

enum HomeDirectoryStatus {
  start,
  initial,
  error,
  loading,
}

enum HomeDirectorySnackBarStatus {
  initial,
  deletedSuccess,
}
