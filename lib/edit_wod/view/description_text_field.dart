part of 'edit_wod_page.dart';

class _DescriptionTextField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EditWodBloc, EditWodState>(
      builder: (context, state) {
        return TextFormField(
          enabled: state.isEditable,
          initialValue: state.wod.description,
          minLines: 1,
          maxLines: 5,
          keyboardType: TextInputType.multiline,
          textInputAction: TextInputAction.done,
          decoration: InputDecoration(
            labelText: 'Description',
            hintText:
                'Leave a brief description about the workout and what goals should be attained.',
            errorText: (state.description.error != null)
                ? 'You must enter a description to continue'
                : null,
          ),
          onChanged: (description) => context.read<EditWodBloc>().add(
                EditWodDescriptionChanged(description),
              ),
        );
      },
    );
  }
}
