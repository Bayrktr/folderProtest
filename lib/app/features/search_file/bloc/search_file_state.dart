import 'package:DocuSort/app/product/model/file/all_file/all_file_base_model.dart';
import 'package:DocuSort/app/product/model/file/file/base/file_base_model.dart';
import 'package:equatable/equatable.dart';

class SearchFileState with EquatableMixin {
  SearchFileState({
    this.status = SearchFileStatus.start,
    this.allFileExtendBaseModel,
    this.searchResultList,
  });

  final SearchFileStatus status;
  final AllFileExtendBaseModel? allFileExtendBaseModel;
  final List<FileExtendBaseModel?>? searchResultList;

  @override
  List<Object?> get props => [
        status,
        allFileExtendBaseModel,
        searchResultList,
      ];

  SearchFileState copyWith({
    SearchFileStatus? status,
    AllFileExtendBaseModel? allFileExtendBaseModel,
    List<FileExtendBaseModel?>? searchResultList,
  }) =>
      SearchFileState(
        status: status ?? this.status,
        allFileExtendBaseModel:
            allFileExtendBaseModel ?? this.allFileExtendBaseModel,
        searchResultList: searchResultList ?? this.searchResultList,
      );
}

enum SearchFileStatus {
  start,
  initial,
  loading,
  error,
  finish,
}
