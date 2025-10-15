enum Skill { FLUTTER, DART, OTHER }


class Address{
  final String street;
  final String city;
  final String zipCode;

  const Address({required this.street, required this.city, required this.zipCode}); 
}


class Employee {
  final String _name;
  final double _baseSalary;
  final List<Skill> _skills;
  final Address _address;
  int _yearsOfExperience;

  Employee(this._name, this._baseSalary, this._skills, this._address, this._yearsOfExperience);

  String get name => _name;
  double get baseSalary => _baseSalary;
  List<Skill> get skills => _skills;
  Address get address => _address;
  int get yearsOfExperience => _yearsOfExperience;

  double computeSalary() {
    double total = baseSalary;
    total += yearsOfExperience * 2000;
    for(var skill in skills) {
      if(skill == Skill.FLUTTER) {
        total += 5000;
      } else if (skill == Skill.DART) {
        total += 3000;
      } else {
        total += 1000;
      }
    };

    return total;
  }


  void printDetails() {
    print('Employee: $name, Base Salary: \$${baseSalary}, Current Salary: \$${computeSalary()}, Skills: ${skills}, Address: ${address}, Years of Experience: ${yearsOfExperience}');
  }
}

void main() {
  var emp1 = Employee('Sokea', 40000, [Skill.FLUTTER, Skill.DART], Address(city: "Phnom Penh", street: "123", zipCode: "12345"), 10);
  emp1.printDetails();

  var emp2 = Employee('Ronan', 45000, [Skill.FLUTTER, Skill.DART], Address(city: "Paris", street: "1234", zipCode: "23445"), 20);
  emp2.printDetails();


}