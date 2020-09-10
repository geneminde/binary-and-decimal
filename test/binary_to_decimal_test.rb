require 'minitest/autorun'
require 'minitest/reporters'
require_relative '../lib/binary_to_decimal'

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

describe "binary to decimal" do
  it "From 10011001 to 153" do
    binary_array = [1, 0, 0, 1, 1, 0, 0, 1]
    expected_decimal = 153

    expect(binary_to_decimal(binary_array)).must_equal expected_decimal
  end

  it "From 00001101 to 13" do
    binary_array = [0, 0, 0, 0, 1, 1, 0, 1]
    expected_decimal = 13

    expect(binary_to_decimal(binary_array)).must_equal expected_decimal
  end

  it "From 10000000 to 128" do
    binary_array = [1, 0, 0, 0, 0, 0, 0, 0]
    expected_decimal = 128

    expect(binary_to_decimal(binary_array)).must_equal expected_decimal
  end

  it "From random binary to decimal" do
    binary_array = Array.new(8) { rand(0..1) }
    expected_decimal = binary_array.join.to_s.to_i(2)

    expect(binary_to_decimal(binary_array)).must_equal expected_decimal
  end
end

describe "decimal to binary" do
  it "From 64 to 1000000" do
    decimal = 64
    expected_binary_array = [1, 0, 0, 0, 0, 0, 0]

    expect(decimal_to_binary(decimal)).must_equal expected_binary_array
  end

  it "From 7 to 111" do
    decimal = 7
    expected_binary_array = [1, 1, 1]

    expect(decimal_to_binary(decimal)).must_equal expected_binary_array
  end

  it "From 1420 to 10110001100" do
    decimal = 1420
    expected_binary_array = [1, 0, 1, 1, 0, 0, 0, 1, 1, 0, 0]

    expect(decimal_to_binary(decimal)).must_equal expected_binary_array
  end

  it "From random decimal to binary array" do
    decimal = rand(10_000)
    expected_binary_array = decimal.to_s(2).chars.map { |i| i.to_i }

    expect(decimal_to_binary(decimal)).must_equal expected_binary_array
  end
end
