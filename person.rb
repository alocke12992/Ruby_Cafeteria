class Person

  attr_accessor :order, :plate, :wallet

  def initialize(order, plate, wallet)
    @order = order
    @plate = plate
    @wallet = wallet
  end


 def sum_order
   sum = 0
   @order.each {|item| sum+=item[:price]}
    puts "Your total is $#{'%.2f' %sum}."
    puts "Your order is the following: "
    puts @plate.join("\n")
    puts "You have $#{check_wallet} left in your wallet"
   end

  def check_wallet
    sum = 0
    @order.each {|item| sum+=item[:price]}
    balance = @wallet - sum
  end
end
