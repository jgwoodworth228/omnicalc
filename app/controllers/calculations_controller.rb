class CalculationsController < ApplicationController
    def word_count_form
        render 'word_count_form'
    end

    def word_count
        @text = params[:user_text]
        @special_word = params[:user_word]

        # ========================================================
        # Your code goes below.
        # The text the user input is in the string @text.
        # The special word the user input is in the string @special_word.
        # ========================================================

        @word_count = @text.split.count

        @character_count_with_spaces = @text.length

        @character_count_without_spaces = @text.gsub(" ","").length

        @occurrences = @text.downcase.split.count(@special_word.downcase)

        render 'word_count'
    end

    def loan_payment_form
        render 'loan_payment_form'
    end

    def loan_payment
        @apr = params[:annual_percentage_rate].to_f
        @years = params[:number_of_years].to_i
        @principal = params[:principal_value].to_f

        # =====================================================
        # Your code goes below.
        # You can use this formula for reference:
        # http://www.financeformulas.net/Loan_Payment_Formula.html
        # =====================================================

        present_value = @principal
        rate_per_period = @apr / 100 / 12
        number_periods = @years * 12

        @monthly_payment = ((rate_per_period)*(present_value))/(1-((1+rate_per_period))**-number_periods)
    end

    def time_between_form
        render 'time_between_form'
    end

    def time_between
        @starting = Chronic.parse(params[:starting_time])
        @ending = Chronic.parse(params[:ending_time])

        # =====================================================
        # Your code goes below.
        # The start time is in the Time @starting.
        # The end time is in the Time @ending.
        # The number of years the user input is in the integer @years.
        # The principal value the user input is in the decimal @principal.
        # =====================================================

        @seconds = "Replace this string with your answer"
        @minutes = "Replace this string with your answer"
        @hours = "Replace this string with your answer"
        @days = "Replace this string with your answer"
        @weeks = "Replace this string with your answer"
        @months = "Replace this string with your answer"
        @years = "Replace this string with your answer"
        render 'time_between'
    end

    def descriptive_statistics_form
        render 'descriptive_statistics_form'
    end

    def descriptive_statistics
        @numbers = params[:list_of_numbers].gsub(',', '').split.map(&:to_f)


        # =====================================================
        # Your code goes below.
        # The numbers the user input are in the array @numbers.
        # =====================================================

        @sorted_numbers = @numbers.sort

        @count = @numbers.count

        @minimum = @numbers.min

        @maximum = @numbers.max

        @range = @maximum - @minimum

        @median = (@numbers.sort[(@numbers.sort.length - 1) / 2] + (@numbers.sort.length/2) / 2.0)

        # @sum = @numbers.sum  one option

        # another option for sum
            @sum=0
            @numbers.each do |num|
                @sum=@sum+num
            end

        @mean=@sum/@count


        #way to calculate mean
        #def mean(array)
        #     array.inject(0) { |sum, x| sum += x } / array.size.to_f
        #end
        #
        # def variance(array)
        #    m = mean(array)
        #     variance = array.inject(0) { |variance, x| variance += (x - m) ** 2 }
        #     return variance
        # end
        #
        # def standard_deviation(array)
        #     v = variance(array)
        #     return Math.sqrt(v/(array.size))
        #end



       # @variance = variance(@numbers)
       squared_differences=[]
        @numbers.each do |num|
            squared_differences << (num-@mean)**2
        end

        @variance=0
            squared_differences.each do |num|
                @variance=@variance+num
            end
        @variance=@variance/@count


       # @standard_deviation = standard_deviation(@numbers)
         @standard_deviation=Math.sqrt(@variance)

       # @mode = mode(@numbers)

        render  'descriptive_statistics'
    end
end
