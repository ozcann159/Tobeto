import 'package:expenseapp/models/expense.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({Key? key}) : super(key: key);

  @override
  _NewExpenseState createState() => _NewExpenseState();
}

class _NewExpenseState extends State<NewExpense> {
  //Controller
  var _expenseName = '';
  final _nameController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime? _selectedDate;
  Category selectedCategory = Category.education;

  void _openDataPicker() async {
    //DatePicker açmak
    //DatePicker' dan gelen değeri Text olarak yazdırmak
    //built-in function

    //sync => bir işlem bitmeden diğerinin başlamadığı yapılar
    //async => alt satıra geçmek için işlemin bitmesini beklemezler //await
    DateTime now = DateTime.now();
    DateTime oneYearAgo = DateTime(now.year - 1, now.month, now.day);

    //1 yıl öncesi ve bugün arasında kısıtlama
    //then => async bir işlemi geri dönüş sağladığı anda çalışacak bloğunu tanımlar.
    //   showDatePicker(
    //       context: context,
    //       initialDate: now,
    //       firstDate: oneYearAgo,
    //       lastDate: now)
    //       .then((value) {
    //         print(value);
    //       });
    // }

    // if(_selectedDate == null)
    // time = now
    //else
    // time = _selectedDate

//await => ilgili async işlemini bekle
    DateTime? selectedDate = await showDatePicker(
        context: context,
        initialDate: _selectedDate == null
            ? now
            : _selectedDate!, // eğer seçili tarih varsa onu kullan, yoksa günün tarihini kullan
        firstDate: oneYearAgo,
        lastDate: now);

    setState(() {
      _selectedDate = selectedDate;
    });
  }

  void _addNewExpense() {
    final amount = double.tryParse(_amountController.text);
    //parse, tryParse => parse değer nullsa hata fırlatır, tryParse değeri null olarak alır.
    if (amount == null ||
        amount < 0 ||
        _nameController.text.isNotEmpty ||
        _selectedDate == null) {
      showDialog(
          context: context,
          builder: (ctx) {
            return AlertDialog(
              title: const Text("Validation Error"),
              content: const Text("Please fill all blank areas"),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.pop(ctx);
                    },
                    child: const Text("Okay"))
              ],
            );
          });
    }
    else{
      //valid bir değer girildiği duurm
      //listeye ekleme yapılması gereken nokta..
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          TextField(
            controller: _nameController,
            maxLength: 50,
            decoration: const InputDecoration(label: Text("Expense Name")),
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _nameController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                      label: Text("Amount"), prefixText: "₺"),
                ),
              ),
              const SizedBox(width: 40),
              Expanded(
                child: Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          _openDataPicker();
                        },
                        icon: const Icon(Icons.calendar_month)),
                    //Ternary operator
                    Text(_selectedDate == null
                        ? "Tarih Seçiniz"
                        : DateFormat.yMd().format(_selectedDate!)),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 40),
          Row(
            children: [
              DropdownButton(
                  value: selectedCategory,
                  items: Category.values.map((category) {
                    return DropdownMenuItem(
                        value: category, child: Text(category.name.toString()));
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      if (value != null) selectedCategory = value;
                    });
                  })
            ],
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("Vazgeç")),
              const SizedBox(width: 30),
              ElevatedButton(
                  onPressed: () {
                    _addNewExpense();
                  },
                  child: const Text("Kaydet")),
            ],
          )
        ],
      ),
      //seçilen tarihi formatlayarak yazdırma
    );
  }
}
