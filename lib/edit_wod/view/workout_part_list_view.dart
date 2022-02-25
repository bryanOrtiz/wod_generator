part of 'edit_wod_page.dart';

class _WorkoutPartListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BlocBuilder<EditWodBloc, EditWodState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: List.generate(
            state.wod.parts.length + 1,
            (index) {
              switch (index) {
                case 0:
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    child: Text(
                      'Parts',
                      style: theme.textTheme.caption,
                    ),
                  );
                default:
                  final part = state.wod.parts[index - 1];
                  return _WorkoutPartListItem(
                    isEditable: state.isEditable,
                    part: part,
                  );
              }
            },
          ),
        );
      },
    );
  }
}

class _WorkoutPartListItem extends StatelessWidget {
  const _WorkoutPartListItem(
      {Key? key, required this.isEditable, required this.part})
      : super(key: key);

  final bool isEditable;
  final WorkoutPart part;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return OutlinedButton(
      onPressed: isEditable ? () => print('will do editing') : null,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  part.exercise!.name,
                  style: theme.textTheme.subtitle2,
                ),
                Text(
                  part.description(),
                  style: theme.textTheme.bodyText2,
                ),
              ],
            ),
            const Spacer(),
            const Icon(Icons.arrow_forward_ios),
          ],
        ),
      ),
    );
  }
}
