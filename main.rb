require_relative 'person'

class Cafeteria

  def initialize
      order = []
      plate = []
      wallet = 10
      @person = Person.new(order, plate, wallet)
      @main_dish = [
        {dish: 'Taco', price: 1.00},
        {dish: 'Pizza', price: 1.75},
        {dish: 'Hamburger', price: 3.00},
        {dish: 'Chicken Sandwich', price: 5.00},
        {dish: 'Steak', price: 8.00}
      ]
      @side_dish = [
        {side: 'Fries', price: 1.00},
        {side: 'Chips', price: 1.00},
        {side: 'Salad', price: 3.00},
        {side: 'Fruit', price: 4.00},
        {side: 'Yogurt', price: 1.50}
      ]
  end

  def main_menu
    puts '*' * 40
    puts "Welcome to the Cafe"
    puts '*' * 40
    puts "What main dish would you like?"

    @main_dish.each_with_index do |item, i|
      puts "#{i + 1}) #{item[:dish]} - $#{'%.2f' %item[:price]}"
    end
    user_input = gets.to_i

    @person.order << @main_dish[user_input - 1]
    @person.plate << @main_dish[user_input - 1][:dish]
    side_dish
  end

  def side_dish
    puts "You get two sides. Please choose 2:"
    @side_dish.each_with_index do |item, i|
      puts "#{i + 1}) #{item[:side]} - $#{'%.2f' %item[:price]}"
    end
    while @person.order.length < 3
      user_input = gets.to_i
      @person.order << @side_dish[user_input - 1]
      @person.plate << @side_dish[user_input - 1][:side]
    end
    @person.sum_order
    options
  end

  def options
      puts "What would you like to do?"
      puts "1) Order something else"
      puts "2) Check out"
  end

  def go
    case go
    when 1
      main_menu
    when 2
      check_out
    end
end

@start = Cafeteria.new
@start.main_menu
