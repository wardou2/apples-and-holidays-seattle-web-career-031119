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

  holiday_hash[:summer][:fourth_of_july][1]
end

def add_supply_to_winter_holidays(holiday_hash, supply)
  # holiday_hash is identical to the one above
  # add the second argument, which is a supply, to BOTH the
  # Christmas AND the New Year's arrays

  holiday_hash[:winter].each do |holiday, items|
    items << supply
  end
  holiday_hash

end


def add_supply_to_memorial_day(holiday_hash, supply)
  # again, holiday_hash is the same as the ones above
  # add the second argument to the memorial day array
  holiday_hash[:spring][:memorial_day] << supply

end

def add_new_holiday_with_supplies(holiday_hash, season, holiday_name, supply_array)
  # code here
  # remember to return the updated hash

  holiday_hash[season][holiday_name] = supply_array
  holiday_hash

end

def all_winter_holiday_supplies(holiday_hash)
  # return an array of all of the supplies that are used in the winter season

  supplies_a = holiday_hash[:winter].collect do |holiday_name, supplies|
    supplies
  end
  supplies_a.flatten
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

    season_string = season.to_s.capitalize  #convert symbol to string and capitalize
    puts "#{season_string}:"

    holidays.each do |holiday, items|

      holiday_a = holiday.to_s.split('_')   #chop holidays into array with each word to capitalize
      holiday_a.each do |string|
        string.capitalize!
      end
      holiday_s = holiday_a.join(' ')

      item_s = ''
      items.each_with_index do |item, i|    #use index to track when to use comma
        if i == 0
          item_s << item
        else
          item_s << ", #{item}"
        end
      end

      puts "  #{holiday_s}: #{item_s}"

    end
  end
end

def all_holidays_with_bbq(holiday_hash)
  # return an array of holiday names (as symbols) where supply lists
  # include the string "BBQ"
  return_a = []
  holiday_hash.each do |season, holidays|
    holidays.each do |holiday, items|
      if items.include?("BBQ")
        return_a << holiday
      end
    end
  end
  return_a
end
