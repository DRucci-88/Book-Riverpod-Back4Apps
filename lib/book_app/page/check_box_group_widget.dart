import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:parse_learning/book_app/controller/registration_controller.dart';
import 'package:parse_learning/book_app/model/registration_model.dart';

class CheckBoxGroupWidget extends ConsumerStatefulWidget {
  const CheckBoxGroupWidget({
    super.key,
    required this.registrationType,
    required this.multipleSelection,
    required this.items,
    required this.onChanged,
  });

  final RegistrationType registrationType;
  final bool multipleSelection;
  final List<RegistrationModel> items;
  final Function(List<RegistrationModel>) onChanged;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _CheckBoxGroupWidgetState();
}

class _CheckBoxGroupWidgetState extends ConsumerState<CheckBoxGroupWidget> {
  List<RegistrationModel> selectedItems = [];
  List<RegistrationModel> get items => widget.items;

  bool isLoading = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      padding: const EdgeInsets.only(top: 8.0),
      itemCount: items.length,
      itemBuilder: (context, index) {
        return checkBoxTile(items[index]);
      },
    );
  }

  Widget checkBoxTile(RegistrationModel data) {
    return CheckboxListTile(
      title: Text(data.name),
      value: selectedItems.contains(data),
      onChanged: (value) {
        if (value != null && value) {
          setState(() {
            if (!widget.multipleSelection) {
              selectedItems.clear();
            }
            selectedItems.add(data);
            widget.onChanged(selectedItems);
          });
        } else {
          setState(() {
            selectedItems.remove(data);
            widget.onChanged(selectedItems);
          });
        }
      },
    );
  }
}
