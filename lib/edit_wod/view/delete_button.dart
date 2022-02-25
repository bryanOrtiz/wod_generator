part of 'edit_wod_page.dart';

class _DeleteButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BlocBuilder<EditWodBloc, EditWodState>(
      builder: (context, state) {
        return TextButton(
          style: ButtonStyle(
              foregroundColor:
                  MaterialStateProperty.all<Color>(theme.colorScheme.error)),
          onPressed: () {
            if (!state.deleteStatus.isSubmissionInProgress) {
              context.read<EditWodBloc>().add(const EditWodDelete());
            }
          },
          child: (state.deleteStatus.isSubmissionInProgress)
              ? SizedBox.square(
                  child: CircularProgressIndicator(
                      color: Theme.of(context).colorScheme.error),
                  dimension: 24,
                )
              : const Text('Delete'),
        );
      },
    );
  }
}
