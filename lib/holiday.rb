require 'pry'

def second_supply_for_fourth_of_july(holiday_hash)
  # given that holiday_hash looks like this:
  # {
  #   :winter => {
  #     :christmas => ["Lights", "Wreath"],
  #     :new_years => ["Party Hats"]
  #   },
  #   :summer => {
  #     :fourth_of_july => ["Fireworks", "BBQ"]
  #   },
  #   :fall => {
  #     :thanksgiving => ["Turkey"]
  #   },
  #   :spring => {
  #     :memorial_day => ["BBQ"]
  #   }
  # }
  # return the second element in the 4th of July array
 
   holiday_hash.each do |season, holidays| #checking into the first level of holiday_hash
     holidays.each do |holiday, decoration| #enumerating over the holidays and checking for :fourth of july
       if holiday == :fourth_of_july
         return decoration[1]
       end
     end
   end
   
end

def add_supply_to_winter_holidays(holiday_hash, supply)
  # holiday_hash is identical to the one above
  # add the second argument, which is a supply, to BOTH the
  # Christmas AND the New Year's arrays
 holiday_hash.each do |season, holidays|
     if season == :winter
       holidays[:christmas].push(supply)
       holidays[:new_years].push(supply) 
     end 
   end
end


def add_supply_to_memorial_day(holiday_hash, supply)
  # again, holiday_hash is the same as the ones above
  # add the second argument to the memorial day array
  holiday_hash.each do |season, holidays|
      if season == :spring
        holidays[:memorial_day].push(supply)
      end
  end
end

def add_new_holiday_with_supplies(holiday_hash, season, holiday_new, supplies)
  # code here
  # remember to return the updated hash

  #holiday_new is being passed in with array containing the supplies
  holiday_hash[season][holiday_new] = supplies 
  holiday_hash
end

def all_winter_holiday_supplies(holiday_hash)
  # return an array of all of the supplies that are used in the winter season
  winter_supplies = []
  holiday_hash[:winter].collect do |supplies|
    supplies.each do |decoration|
      if holiday_hash[:winter][decoration]!= nil
        winter_supplies += (holiday_hash[:winter][decoration])
      end
    end
  end
  winter_supplies
end

def all_supplies_in_holidays(holiday_hash)
  # iterate through holiday_hash and print items such that your readout resembles:
  # Winter:
  #   Christmas: Lights, Wreath
  #   New Years: Party Hats
  # Summer:
  #   Fourth Of July: Fireworks, BBQ
  # etc.
  holiday_hash.each do |season, holidays| 
    #Enumerating over each season in holiday_hash, converting to string, capitalizing and adding a colon
    puts season.to_s.capitalize! << ":"
    holidays.each do |holiday, supplies|
      supplies = supplies.join(", ")
      #converting symbol :holiday to string, creating an array of the words in the holiday,
      #splitting the words at _, enumerating over the words and capitalizing each word, converting it
      #back to a string with a space instead of a _, and adding a colon and a space
      holiday = holiday.to_s.split("_").collect {|w| w.capitalize!}.join(" ")<<": "
      puts "  " + holiday + supplies
    end
  end
end

def all_holidays_with_bbq(holiday_hash)
  # return an array of holiday names (as symbols) where supply lists
  # include the string "BBQ"
  supplies_bbq = [] #Creating an empty array to input the holiday names
  holiday_hash.each do |season, holidays|
    holidays.each do |holiday_supplies, supply|
      if supply.include?("BBQ") #Checking over the arrays containing holiday supplies for bbq
        supplies_bbq << holiday_supplies
      end
    end
  end
    supplies_bbq
end

