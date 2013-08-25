names = [
  "Dan",
  "Liz",
  "John",
  "Jane",
  "Courtney",
  "Sam",
  "Frank"
]

count = 0
names.each do |name|
  puts "Hello #{name}"
  count += 1
  puts "iterating \##{count}"
end