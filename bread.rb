class Bread
    @name
    @type
    @taste
    @ingredients
    @cooking_method
    
    def initialize(somethings)

    end

    def prepare(ingredients)

    end

    def cook()

        
    end
end


#In another file
#I want to make bread for games night
my_bread = Bread.new
my_bread.prepare()
my_bread.cook()

#In yet another file
my_dinner = Meal.new