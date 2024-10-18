part of 'edit_directory_view.dart';

mixin _EditDirectoryMixin on StatelessWidget {
  Widget getAllPdfListViewBuilder(
      {required EditDirectoryState state, required BuildContext context}) {
    return switch (state.allPdfStatus) {
      EditDirectoryAllPdfStatus.start => const CircularProgressIndicator(),
      EditDirectoryAllPdfStatus.initial => Container(
          decoration: BoxDecoration(
              border: Border.all(
                width: 1,
              ),
              borderRadius: BorderRadius.circular(8)),
          height: context.sized.dynamicHeight(0.2),
          child: ListView.builder(
            itemBuilder: (context, index) {
              final item = state.allPdfModel?.allPdf?[index];
              if (item == null) {
                return const SizedBox();
              }
              return ListTile(
                leading: Text(item.name.forNull.getGeneralNullMessage),
                trailing: IconButton(
                    onPressed: () {
                      IShowDialog(
                        context: context,
                        widget: EditDirectoryShowModelSheet(
                          onDelete: () {
                            context
                                .read<EditDirectoryCubit>()
                                .deletePdfFromHive(item);
                          },
                          onEdit: () {},
                          pdfModel: item,
                        ),
                      ).showBottomSheet();
                    },
                    icon: const Icon(
                      Icons.more_vert,
                    )),
              );
            },
            itemCount: state.allPdfModel?.allPdf?.length ?? 0,
          ),
        ),
      EditDirectoryAllPdfStatus.loading => const CircularProgressIndicator(),
      EditDirectoryAllPdfStatus.error => const LocaleText(
          text: LocaleKeys.errors_nullErrorMessage,
        ),
    };
  }

  Widget getAddPdfButton({
    required BuildContext context,
    required DirectoryModel directoryModel,
  }) {
    return ElevatedButton.icon(
      style: ButtonStyle(
        minimumSize: MaterialStateProperty.all<Size>(
          Size(
            context.sized.dynamicWidth(0.3),
            context.sized.heightMediumValue,
          ),
        ),
      ),
      onPressed: () {
        context.router.push(
          AddPdfRoute(
            directoryModel: directoryModel,
          ),
        );
      },
      label: const LocaleText(
        text: LocaleKeys.directoryOpen_addPdfd,
      ),
    );
  }

  Widget getSaveButton({
    required BuildContext context,
    required VoidCallback onPressed,
    required EditDirectoryStatus status,
  }) {
    return ElevatedButton.icon(
      icon: const Icon(Icons.save),
      style: ButtonStyle(
        minimumSize: MaterialStateProperty.all<Size>(
          Size(
            context.sized.dynamicWidth(0.3),
            context.sized.heightMediumValue,
          ),
        ),
      ),
      onPressed: () {
        onPressed();
      },
      label: _getSaveButtonComponent(
        status,
      ),
    );
  }

  Widget _getSaveButtonComponent(EditDirectoryStatus status) {
    switch (status) {
      case EditDirectoryStatus.start:
        return const CircularProgressIndicator();
      case EditDirectoryStatus.initial:
        return const LocaleText(
          text: LocaleKeys.general_save,
        );
      case EditDirectoryStatus.loading:
        return const CircularProgressIndicator();
      case EditDirectoryStatus.error:
        return const LocaleText(
          text: LocaleKeys.errors_nullErrorMessage,
        );
    }
  }
}
