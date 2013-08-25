#!/usr/bin/env ruby

#The foreach method on the CSV class will read each line from the CSV file into an array.

#You'll have to save transactions that result in overdrafts so that they can be printed at the end.
 
 #What data type is useful for storing an arbitrary amount of values?

require 'csv'
require "pry"

transactions_array = []
CSV.foreach("transactions.csv") do |row|
  puts row.inspect
  puts row.class
  transactions_array << row
end

# CSV.foreach("transactions.csv", headers: true) do |row|
#   puts row["description"]
# end
#puts transactions_array.inspect

balance = 0
total_overdraft_fee = 0
all_overdrafts = []
total_income = 0
total_expenses = 0


transactions_array.each do |bills|
  balance += bills[1].to_f 
    if balance < 0 
      balance = balance - 20
      total_overdraft_fee += 20
    end
    
    if bills[1].to_f > 0 
      total_income +=  bills[1].to_f
    end  
    
    if bills[1].to_f < 0 
      total_expenses += bills[1].to_f
    end
    
    if balance < 0 
      all_overdrafts << [bills, balance.round(2)]
    end

  end

puts "ending balance #{balance}"
puts "total income #{total_income}"
puts "total expenses #{total_expenses.abs}"
puts "total overdraft charges #{total_overdraft_fee}"
puts " Overdrafts (balance, expense, descriptions, date)"

all_overdrafts.each do |drafts|
 # puts "expenses, #{drafts[0][1]}"
 # puts "descriptions, #{drafts[0][2]}"
 # puts "dates, #{drafts[0][0]}"
 # puts "balance #{drafts[1]}"
  puts "#{drafts[1]}, #{drafts[0][1]}, #{drafts[0][2]}, #{drafts[0][0]}"

end   



