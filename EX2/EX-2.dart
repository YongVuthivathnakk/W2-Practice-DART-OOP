

class BankAccount {
  final String accountOwner;
  final int id;
  double _balance = 0;

  BankAccount(this.id, this.accountOwner, this._balance);

  double get balance => _balance;

  double withdraw(double amount) {
    if (amount > _balance) {
      throw Exception("Insufficient balance for withdrawal!");
    } else if (amount < 0) {
      throw Exception("Amount must be a positive degit");
    } else {
      _balance -= amount;
      return balance;
    }
  }

  double credit(double amount) {
    _balance += amount;
    return balance;
  }
}

class Bank {
  final String name;
  List<BankAccount> accounts = [];

  Bank({required this.name});

  BankAccount createAccount(int accountId, String accountOwner) {
    for (var account in accounts) {
      if (accountId == account.id) {
        throw Exception("Account ID $accountId already exists!");
      }
    }
    BankAccount newAccount = BankAccount(accountId, accountOwner, 0);
    accounts.add(newAccount);
    return newAccount;
  }
}

void main() {
  Bank myBank = Bank(name: "CADT Bank");
  BankAccount ronanAccount = myBank.createAccount(100, 'Ronan');

  print(ronanAccount.balance); // Balance: $0
  ronanAccount.credit(100);
  print(ronanAccount.balance); // Balance: $100
  ronanAccount.withdraw(50);
  print(ronanAccount.balance); // Balance: $50

  try {
    ronanAccount.withdraw(75); // This will throw an exception
  } catch (e) {
    print(e); // Output: Insufficient balance for withdrawal!
  }

  try {
    myBank.createAccount(100, 'Honlgy'); // This will throw an exception
  } catch (e) {
    print(e); // Output: Account with ID 100 already exists!
  }
}
