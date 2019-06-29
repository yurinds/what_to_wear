class ManyClothes
  attr_reader :clothes

  def initialize(clothes)
    @clothes = clothes
  end

  def clothes_for_temperature(temperature)
    types_hash = {}
    @clothes.each do |wear|
      if types_hash[wear.type] && temperature_ok?(wear, temperature)
        types_hash[wear.type] << wear
      elsif temperature_ok?(wear, temperature)
        types_hash[wear.type] = [wear]
      end
    end

    types_hash
  end

  def temperature_ok?(wear, temperature)
    wear.temperature_range.include?(temperature)
  end

  def all_clothes_types
    types = []
    @clothes.each do |wear|
      types << wear.type unless types.include?(wear.type)
    end

    types
  end
end
