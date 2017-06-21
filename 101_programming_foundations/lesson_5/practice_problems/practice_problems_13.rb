# practice_problem_13.rb
arr = [[1, 6, 7], [1, 4, 9], [1, 8, 3]]

arr2 = arr.sort do |a, b|
  a[2] <=> b[2]
end

p arr2

arr = [[1, 6, 7], [1, 4, 9], [1, 8, 3]]

arr2 = arr.sort_by do |sub_arr|
  sub_arr.select do |num|
    num.odd?
  end
end

p arr2
