class Car {
  String brand;
  String model;
  int year;

  // Constructor
  Car({required this.brand, required this.model, required this.year});

  // Phương thức toString để trả về thông tin xe
  @override
  String toString() {
    return 'Car(brand: $brand, model: $model, year: $year)';
  }

  // Phương thức doSomething để làm việc gì đó
  void doSomething() {
    print('The $brand $model is doing something amazing!');
  }
}
