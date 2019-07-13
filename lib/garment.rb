class Garment
  attr_reader :name, :type, :temperature_range, :valid_fail

  INDEX_NAME = 0
  INDEX_TYPE = 1
  INDEX_TEMPERATURE = 2

  def initialize(wear_array)
    @name = wear_array[INDEX_NAME]
    @type = wear_array[INDEX_TYPE]
    @temperature_range = return_correct_range(wear_array[INDEX_TEMPERATURE])
  end

  def return_correct_range(temperature_string)
    temperature_string = temperature_string.gsub(/\(|\)/, '')
    temperature_array = temperature_string.split(/, /)
    temperature_array = temperature_array.map(&:to_i)
    first_range = temperature_array[0]
    second_range = temperature_array[1]

    @valid_fail = true if first_range > second_range

    (first_range..second_range)
  end

  def temperature_range_invalid?
    @valid_fail
  end

  def to_s
    text = "#{name} (#{type}) #{temperature_range}"
  end
end
