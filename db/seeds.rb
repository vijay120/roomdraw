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

linde_array1 = Array['s',
's',
'd',
'z',
'd',
'z',
'd',
'z',
'z',
'd',
'd',
'd',
'd',
'z',
'z',
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
'z',
'z',
's',
's',
's',
's',
'z',
'z',
'd',
'd',
'z',
'd',
'z',
'd',
'd',
'z',
'z',
'd',
's',
's']

north_array1 = Array['d',
'd',
'd',
'd',
'd',
'd',
'd',
'd',
'd',
'd',
'd',
'd',
'd',
'd',
'd',
'd',
'z',
'z',
's',
's',
'd',
's',
's',
's',
'd',
's',
's',
's']

east_array1 = Array.new(['d',
'd',
'd',
'd',
'd',
'd',
'd',
'd',
'd',
'd',
'd',
'd',
'd',
'd',
'd',
'd',
'z',
'z',
'z',
's',
'd',
's',
's',
's',
'd',
's',
's',
's'])

west_array1 = ['d',
'd',
'd',
'd',
'd',
'd',
'd',
'd',
'd',
'd',
'd',
'd',
'd',
'd',
'd',
'd',
'z',
'z',
'z',
's',
's',
'd',
's',
's',
's',
'd',
's',
's']



atwood_array = Array.new(atwood_array1)
case_array = Array.new(case_array1)
linde_array = Array.new(linde_array1)
north_array = Array.new(north_array1)
east_array = Array.new(east_array1)
west_array = Array.new(west_array1)


for w in 1..12
  code = 300+w
   if w > 8
     Room.create(name: "South", code: code, floor: 1, size: 's', group_count:0, locked: false)
   else
     Room.create(name: "South", code: code, floor: 1, size: 's', group_count:0, alpha:"A", locked: false)
     Room.create(name: "South", code: code, floor: 1, size: 's', group_count:0, alpha:"B", locked: false)
     Room.create(name: "South", code: code, floor: 1, size: 's', group_count:0, alpha:"C", locked: false)
     Room.create(name: "South", code: code, floor: 1, size: 's', group_count:0, alpha:"D", locked: false)
   end
end

for z in 351..366
  if z == 359 or z == 361 or z == 363 or z==365
    Room.create(name: "South", code: z, floor: 2, size: 'd', group_count:0, locked: false)
  elsif z == 360 or z == 362 or z == 364 or z == 366
    Room.create(name: "South", code: z, floor: 2, size: 's', group_count:0, locked: false)
  else
    Room.create(name: "South", code: z, floor: 2, size: 's', group_count:0, alpha:"A", locked: false)
    Room.create(name: "South", code: z, floor: 2, size: 's', group_count:0, alpha:"B", locked: false)
    Room.create(name: "South", code: z, floor: 2, size: 's', group_count:0, alpha:"C", locked: false)
    Room.create(name: "South", code: z, floor: 2, size: 's', group_count:0, alpha:"D", locked: false)
  end
end
    


p=1
west_array.each do |size|
  code1 = 400+p
  code2 = 450+p
  if size == 'z'
  else
    Room.create(name: "West", code: code1, floor: 1, size: size, group_count:0, locked: false)
    Room.create(name: "West", code: code2, floor: 2, size: size, group_count:0, locked: false)
  end
  p+=1
end

m = 1
east_array.each do |size|
  code1 = 100+m
  code2 = 150+m
  if size == 'z'
  else
    Room.create(name: "East", code: code1, floor: 1, size: size, group_count:0, locked: false)
    Room.create(name: "East", code: code2, floor: 2, size: size, group_count:0, locked: false)
  end
  m+=1
end

o = 1
north_array.each do |size|
  code1 = 200+o
  code2 = 250+o
  if size == 'z'
  else
    Room.create(name: "North", code: code1, floor: 1, size: size, group_count:0, locked: false)
    Room.create(name: "North", code: code2, floor: 2, size: size, group_count:0, locked: false)
  end
  o+=1
end

i=0
atwood_array.each do |size|
  code1 = 100+i
  code2 = 200+i
  code3 = 300+i
  Room.create(name: "Atwood", code: code1, floor: 1, size: size, group_count:0, locked: false)
  Room.create(name: "Atwood", code: code2, floor: 2, size: size, group_count:0, locked: false)
  Room.create(name: "Atwood", code: code3, floor: 3, size: size, group_count:0, locked: false)
  i+=1
end

j=1
case_array.each do |size|
  code1 = 100+j
  code2 = 200+j
  if size == 'z'
  else
    Room.create(name: "Case", code: code1, floor: 1, size: size, group_count:0, locked: false)
    Room.create(name: "Case", code: code2, floor: 2, size: size, group_count:0, locked: false)
  end
  j+=1
end

Room.create(name: "Case", code: 12, floor: 1, size: 'q', group_count:0, locked: false)
Room.create(name: "Case", code: 14, floor: 1, size: 'q', group_count:0, locked: false)
Room.create(name: "Case", code: 22, floor: 2, size: 'q', group_count:0, locked: false)
Room.create(name: "Case", code: 23, floor: 2, size: 'q', group_count:0, locked: false)
Room.create(name: "Case", code: 24, floor: 2, size: 'q', group_count:0, locked: false)

k=1
linde_array.each do |size|
  code1 = 100+j
  code2 = 200+j
  if size == 'z'
  else
    Room.create(name: "Linde", code: code1, floor: 1, size: size, group_count:0, locked: false)
    Room.create(name: "Linde", code: code2, floor: 2, size: size, group_count:0, locked: false)
  end
  k+=1
end

for l in 1..8
  code1 = 100+l
  code2 = 200+l
  Room.create(name: "Sontag", code:code1, floor:1, size:'s', group_count:0, alpha:'A', locked: false)
  Room.create(name: "Sontag", code:code1, floor:1, size:'s', group_count:0, alpha:'B', locked: false)
  Room.create(name: "Sontag", code:code1, floor:1, size:'s', group_count:0, alpha:'C', locked: false)
  Room.create(name: "Sontag", code:code1, floor:1, size:'d', group_count:0, alpha:'D', locked: false)
  
  Room.create(name: "Sontag", code:code2, floor:2, size:'s', group_count:0, alpha:'A', locked: false)
  Room.create(name: "Sontag", code:code2, floor:2, size:'s', group_count:0, alpha:'B', locked: false)
  Room.create(name: "Sontag", code:code2, floor:2, size:'s', group_count:0, alpha:'C', locked: false)
  Room.create(name: "Sontag", code:code2, floor:2, size:'d', group_count:0, alpha:'D', locked: false)
end







