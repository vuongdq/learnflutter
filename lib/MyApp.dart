import 'package:flutter/material.dart';
import 'package:learnflutter/transaction.dart';

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final GlobalKey<ScaffoldMessengerState> _scaffoldMessengerKey =
  GlobalKey<ScaffoldMessengerState>();
  final _contentController = TextEditingController();
  final _amountController = TextEditingController();

  List<Transaction> _transactions = [];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Buy Something",
      scaffoldMessengerKey: _scaffoldMessengerKey,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Buy Something"),
        ),
        body: SafeArea(
          minimum: const EdgeInsets.only(left: 20, right: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              TextField(
                decoration: InputDecoration(labelText: 'Content'),
                controller: _contentController,
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Amount (money)'),
                keyboardType: TextInputType.number, // Chỉ cho nhập số
                controller: _amountController,
              ),
              SizedBox(height: 10),
              TextButton(
                onPressed: () {
                  setState(() {
                    // Tạo đối tượng mới và thêm vào danh sách
                    _transactions.add(
                      Transaction(
                        content: _contentController.text.isEmpty
                            ? "No content" // Giá trị mặc định nếu trống
                            : _contentController.text,
                        amount: double.tryParse(_amountController.text) ?? 0.0,
                      ),
                    );
                    // Xóa nội dung của các ô nhập sau khi thêm
                    _contentController.clear();
                    _amountController.clear();
                  });

                  // Hiển thị SnackBar
                  _scaffoldMessengerKey.currentState?.showSnackBar(
                    SnackBar(
                      content: Text(
                        "Transaction added successfully!",
                      ),
                      duration: Duration(seconds: 2),
                    ),
                  );
                },
                child: Text(
                  "Insert Transaction",
                  style: TextStyle(fontSize: 18),
                ),
                style: TextButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.blue,
                ),
              ),
              SizedBox(height: 20), // Tạo khoảng cách trước danh sách
              Expanded(
                // Hiển thị danh sách giao dịch
                child: ListView.builder(
                  itemCount: _transactions.length,
                  itemBuilder: (context, index) {
                    final transaction = _transactions[index];
                    return ListTile(
                      leading: Icon(Icons.monetization_on),
                      title: Text(transaction.content ?? "No content"), // Sửa lỗi nullable
                      subtitle: Text(
                        'Amount: ${(transaction.amount ?? 0.0).toStringAsFixed(2)}', // Sửa lỗi nullable
                      ),
                      onTap: () {
                        print('You clicked on: ${transaction.content}');
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
