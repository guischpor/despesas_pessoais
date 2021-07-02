import 'package:despesas_pessoais/components/adaptative_button.dart';
import 'package:despesas_pessoais/components/adaptative_date_picker.dart';
import 'package:despesas_pessoais/components/adaptative_textfield.dart';
import 'package:flutter/material.dart';

class TransactionForm extends StatefulWidget {
  final void Function(String, double, DateTime) onSubmit;

  TransactionForm(this.onSubmit) {
    print('Contructor TransactionForm');
  }

  @override
  _TransactionFormState createState() {
    print('createState TransactionForm');
    return _TransactionFormState();
  }
}

class _TransactionFormState extends State<TransactionForm> {
  final _titleController = TextEditingController();
  final _valueController = TextEditingController();
  DateTime _selectedDate = DateTime.now();

  _TransactionFormState() {
    print('Contructor _TransactionFormState');
  }

  @override
  void initState() {
    super.initState();
    print('initState() _TransactionFormState');
  }

  @override
  void didUpdateWidget(Widget oldWidget) {
    super.didUpdateWidget(oldWidget);
    print('didUpdateWidget() _TransactionFormState');
  }

  @override
  void dispose() {
    super.dispose();
    print('dispose() _TransactionFormState');
  }

  _submitForm() {
    final title = _titleController.text;
    final value = double.tryParse(_valueController.text) ?? 0.0;

    if (title.isEmpty || value <= 0 || _selectedDate == null) {
      return;
    }

    widget.onSubmit(title, value, _selectedDate);
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(bottom: mediaQuery.viewInsets.bottom),
        child: Card(
          elevation: 5,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 20.0),
            child: Column(
              children: [
                AdaptativeTextField(
                  labelText: 'Título',
                  controller: _titleController,
                  keyBoardType: TextInputType.text,
                  onSubmitted: (_) => _submitForm(),
                ),
                AdaptativeTextField(
                  labelText: 'Valor (R\$)',
                  controller: _valueController,
                  keyBoardType: TextInputType.numberWithOptions(decimal: true),
                  onSubmitted: (_) => _submitForm(),
                ),
                //Nono componente
                AdaptativeDatePicker(
                  selectedDate: _selectedDate,
                  onDateChanged: (newDate) {
                    setState(() {
                      _selectedDate = newDate;
                    });
                  },
                ),
                Column(
                  //mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: double.infinity,
                      child: AdaptativeButton(
                        label: 'Nova Transação',
                        onPressed: _submitForm,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
