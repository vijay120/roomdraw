# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

case_array1 = Array['d',
'd',
'd',
'd',
's',
's',
's',
's',
'z',
'z',
'z',
'z',
'z',
'z',
'z',
'z',
'z',
's',
's',
's',
's',
'd',
'd',
'd',
'd',
'z',
'z',
'z',
'z',
'z',
'z',
'z',
'z',
'z',
'z',
'z',
'z',
'z',
'z',
'd',
'd',
'd',
'd',
's',
's',
's',
's',
's',
's',
's',
's',
'd',
'd',
'd',
'd']

atwood_array1 = Array['d',
'd',
's',
's',
's',
's',
't',
't',
's',
's',
's',
's',
'd',
'd',
'd',
'd',
's',
's',
's',
's',
't',
't',
's',
's',
's',
's',
'd',
'd']

atwood_array = Array.new(atwood_array1)
case_array = Array.new(case_array1)

i=0
atwood_array.each do |size|
  code1 = 100+i
  code2 = 200+i
  code3 = 300+i
  Room.create(name: "Atwood", code: code1, floor: 1, size: size, group_count:0)
  Room.create(name: "Atwood", code: code2, floor: 2, size: size, group_count:0)
  Room.create(name: "Atwood", code: code3, floor: 3, size: size, group_count:0)
  i+=1
end

j=1
case_array.each do |size|
  code1 = 100+j
  code2 = 200+j
  if size == 'z'
  else
    Room.create(name: "Case", code: code1, floor: 1, size: size, group_count:0)
    Room.create(name: "Case", code: code1, floor: 1, size: size, group_count:0)
  end
  j+=1
end


