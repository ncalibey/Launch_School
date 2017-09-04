# easy_801.rb - Sum of Sums
def sum_of_sums(arr)
  big_arr = []
  final_sum = 0
  arr.each do |i|
    big_arr << i
    final_sum += big_arr.reduce(:+)
  end
  final_sum
end

p sum_of_sums([3, 5, 2]) == (3) + (3 + 5) + (3 + 5 + 2) # -> (21)
p sum_of_sums([1, 5, 7, 3]) == (1) + (1 + 5) + (1 + 5 + 7) + (1 + 5 + 7 + 3) # -> (36)
p sum_of_sums([4]) == 4
p sum_of_sums([1, 2, 3, 4, 5]) == 35
