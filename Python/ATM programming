#building class for ATM machine with python

class ATM:
    def __init__(self, name, balance):
        self.name = name
        self.balance = balance

    def check_balance(self):
        message = f"Account: {self.name}, Balance: {self.balance}"
        print(message)
    
    def deposit(self, money):
        self.balance += money
        print(f"New Balance: {self.balance}")
        print("Deposit succesfully")

    def change_name(self, new_acc_name):
        self.name = new_acc_name
        print(f"New Name: {self.name}")
        print("Your account name has changed")

    def withdraw(self, money):
        self.balance -= money
        print(f"New Balance: {self.balance}")
        print("withdraw succesfully")
        
#Test Class
scb = ATM("Irene", 500)

print(scb.name, scb.balance)

#check balance
scb.check_balance()

#Deposit
scb.deposit(1000)

#Change name
scb.change_name("supinun")

#withdraw
scb.withdraw(100)
