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
  holiday_hash[:winter].map do |holiday,stuff|
    stuff << supply
  end

end


def add_supply_to_memorial_day(holiday_hash, supply)
  # again, holiday_hash is the same as the ones above
  # add the second argument to the memorial day array
  holiday_hash[:spring].map do |holiday,stuff|
    stuff << supply
  end

end

def add_new_holiday_with_supplies(holiday_hash, season, holiday_name, supply_array)
  # code here
  # remember to return the updated hash
  holiday_hash[season][holiday_name] = supply_array


end

def all_winter_holiday_supplies(holiday_hash)
  # return an array of all of the supplies that are used in the winter season
  all_supplies = []
  holiday_hash[:winter].each do |holiday, supply|
    all_supplies << supply
  end
  all_supplies.flatten

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
    puts season.to_s.capitalize + ":"

    holiday_hash[season].each do |holiday, supplies|
      holidayName = holiday.to_s.capitalize!

      if holidayName.include?("_")
        nameFixer = holidayName.split("_")
        nameFixer.map {|name| name.capitalize!}
        holidayName = nameFixer.join(" ")
      end

      linePrint = "  " + holidayName + ": "

      supplies.each do |supply|

        if supply.include?(" ")
          nameFixer = supply.split(" ")
          nameFixer.map {|name| name.capitalize!}
          supply = nameFixer.join(" ")
        end

        if supply == supplies.last
          linePrint << supply
        else
        linePrint << supply + ", "
        end
      end
      puts linePrint
    end
  end
end

def all_holidays_with_bbq(holiday_hash)
  # return an array of holiday names (as symbols) where supply lists
  # include the string "BBQ"
  retArray = []
  holiday_hash.each do |season, holidays|
    holiday_hash[season].each do |holiday, supplies|
      if supplies.include?("BBQ")
        retArray << holiday
      end
    end
  end
  retArray
end

#datHash = {
#     :winter => {
#       :christmas => ["Lights", "Wreath"],
#       :new_years => ["Party Hats"]
#     },
#     :summer => {
#       :fourth_of_july => ["Fireworks", "BBQ"]
#     },
#     :fall => {
#       :thanksgiving => ["Turkey"]
#     },
#     :spring => {
#       :memorial_day => ["BBQ"]
#     }
#   }
#   all_supplies_in_holidays(datHash)
