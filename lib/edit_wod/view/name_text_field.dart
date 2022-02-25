part of 'edit_wod_page.dart';

class _NameTextField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EditWodBloc, EditWodState>(
      builder: (context, state) {
        return TextFormField(
          enabled: state.isEditable,
          initialValue: state.name.value,
          onChanged: (value) =>
              context.read<EditWodBloc>().add(EditWodNameChanged(value)),
          decoration: InputDecoration(
            labelText: 'Name',
            errorText: (state.name.error != null)
                ? 'You must enter a name to continue'
                : null,
          ),
        );
      },
    );
  }
}
