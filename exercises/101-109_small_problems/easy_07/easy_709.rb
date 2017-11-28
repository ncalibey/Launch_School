# easy_709.rb - Multiply All Pairs
def multiply_all_pairs(arr1, arr2)
  arr1.product(arr2).map { |arr| arr.reduce(:*) }.sort
end

p multiply_all_pairs([2, 4], [4, 3, 1, 2]) == [2, 4, 4, 6, 8, 8, 12, 16]

=begin
utp:
- takes 2 arrays w/ integers, returns new array with every possible comibination
  products
- assume neither array is empty
data:
- i/o: array w/ integers
tc:
- p ([2, 4], [4, 3, 1, 2]) == [2, 4, 4, 6, 8, 8, 12, 16]
alg:
- get all possible combinations: #product
- get multiplied values, iterate with map (flatten if needed)

=end
