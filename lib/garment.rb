class Garment
  attr_reader :name, :type, :temperature_range, :garment_invalid

  INDEX_NAME = 0
  INDEX_TYPE = 1
  INDEX_TEMPERATURE = 2

  def initialize(wear_array)
    @garment_invalid = false
    @name = wear_array[INDEX_NAME]
    @type = wear_array[INDEX_TYPE]
    @temperature_range = return_correct_range(wear_array[INDEX_TEMPERATURE])
  end

  def temperature_range_invalid?
    @garment_invalid
  end

  def to_s
    text = "#{name} (#{type}) #{temperature_range}"
  end

  private

  def return_correct_range(temperature_string)
    temperature_array = temperature_string.gsub(/[()]/, '').split(/, /).map(&:to_i)
    first_range = temperature_array[0]
    second_range = temperature_array[1]

    @garment_invalid = true if first_range > second_range

    (first_range..second_range)
  end
end
