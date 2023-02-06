print("Welcome to our app!")
print("Hello there!")

#Question 01
print("What's your name?")
user_name <- readLines("stdin",n=1)
print(paste("Hi!", user_name))

#question 02
attemps <- 0
while (attemps < 2 ) {
print("What do you want to order today?")
print("(1) Pizza, (2) Sushi (Sold out)")
action <- readLines("stdin",n=1)
  
attemps <- attemps + 1
    if (action == 1) {
      print("You order pizza.")
      break
    }   else {
        if (attemps == 2) {
        print ("Please Run the chatbot again")
          } else {
            print ("This order is out of stock. Please try again")
          }
        }
  }
#Question 03
print ("Please Select crust and size")
size <- c("(1)Extreme cheese L","(2)Extreme cheese M","(3)Plain L","(4)Plain M")
price <- c(250 , 200 , 150, 100)
data.frame (size , price)
print("Which size you prefer?")
orders <- readLines("stdin",n=1)
  
#Question 04
print("Select your delivery type")         
print("(1) Delivery, (2) Take Out / Dine-in")
delivery <- readLines("stdin",n=1)
  if (delivery ==1) {
    print("You select 'Delivery' We will delivery to your home in 20 mins.")
  }
 if (delivery ==2) {
    print("You select 'Take Out / Dine-in' You can pick up at the store in 10 mins.")
 }
   
#Question 05 
print("Let's checkout your order? (Yes/No)")
check_order <- readLines ("stdin",n=1)
if (check_order == "Yes"){
  paid <- 
  sum(orders == "1")*250 +
  sum(orders == "2")*200 +
  sum(orders == "3")*150 +
  sum(orders == "4")*100
  print(paste("Totally: ", paid, "baht"))
} else {
  print ("Your order is cancelled.")
  break
}

#Question 05 
if (delivery ==1) {
  print(paste("Your order will arrive at your address soon, please prepare cash :", paid, "baht"))
  }
 if (delivery ==2) {
    print("You can pay your order at the store with cash or credit card. See you soon.")
 }
