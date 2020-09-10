# A method named `binary_to_decimal` that receives as input an array of size 8.
# The array is randomly filled with 0’s and 1’s.
# The most significant bit is at index 0.
# The least significant bit is at index 7.
# Calculate  and return the decimal value for this binary number using
# the algorithm you devised in class.
def binary_to_decimal(binary_array)
  if binary_array.length == 1
    return binary_array[0]
  else
    return binary_array[0] * 2**(binary_array.length - 1) + binary_to_decimal(binary_array.slice(1...binary_array.length))
  end
end

# The method 'decimal_to_binary' takes any decimal integer and converts 
# it to an array filled with 1s and 0s representing the binary integer 
# equal to decimal 

def decimal_to_binary(decimal)
  if decimal == 0 || decimal == 1
    return [decimal]
  else
    return decimal_to_binary(decimal/2) + [decimal % 2]
  end
end
