part of 'edit_wod_page.dart';

class _UpdateButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EditWodBloc, EditWodState>(
      builder: (context, state) {
        final ButtonStyle style = TextButton.styleFrom(
            primary: Theme.of(context).colorScheme.onPrimary);
        return TextButton(
          style: style,
          onPressed: () {
            final bloc = context.read<EditWodBloc>();
            if (state.isEditable &&
                !state.updateStatus.isSubmissionInProgress) {
              bloc.add(const EditWodOnUpdate());
            }
            bloc.add(!state.isEditable
                ? const EditWodEditToggled()
                : const EditWodUpdateToggled());
          },
          child: (state.updateStatus.isSubmissionInProgress)
              ? SizedBox.square(
                  child: CircularProgressIndicator(
                      color: Theme.of(context).colorScheme.onPrimary),
                  dimension: 24,
                )
              : Text(!state.isEditable ? 'Edit' : 'Update'),
        );
      },
    );
  }
}
