require 'pry'

class CashRegister

    attr_accessor :total, :discount, :title, :price, :quantity, :items, :last_transaction
    @@all = []

    def initialize(discount=0, total=0)
        @total = total
        @discount = discount
        @items = []
        @last_transaction = []
        
        @@all << self
    end

    def add_item(title, price, quantity=1)
        self.total += price * quantity
            quantity.times do
                @items.push(title)
                @items
            end
            @last_transaction = price * quantity
        @items
    end

    def apply_discount
        self.total = @total - (self.total * @discount / 100)
        if @discount > 0
            return "After the discount, the total comes to $#{self.total}."
        elsif @discount == 0
            return "There is no discount to apply."
        end
    end

    def void_last_transaction
        self.total -= last_transaction
    end

    def self.all
        @@all
    end

end