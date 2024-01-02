part of 'edit_wod_page.dart';

class _UpdateButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EditWodBloc, EditWodState>(
      builder: (context, state) {
        final ButtonStyle style = TextButton.styleFrom(
            foregroundColor: Theme.of(context).colorScheme.onPrimary);
        return TextButton(
          style: style,
          onPressed: () {
            final bloc = context.read<EditWodBloc>();
            if (state.isEditable && !state.updateStatus.isInProgress) {
              bloc.add(const EditWodOnUpdate());
            }
            bloc.add(!state.isEditable
                ? const EditWodEditToggled()
                : const EditWodUpdateToggled());
          },
          child: (state.updateStatus.isInProgress)
              ? SizedBox.square(
                  dimension: 24,
                  child: CircularProgressIndicator(
                      color: Theme.of(context).colorScheme.onPrimary),
                )
              : Text(!state.isEditable ? 'Edit' : 'Update'),
        );
      },
    );
  }
}
