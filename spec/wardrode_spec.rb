require 'wardrode'
require 'garment'

describe 'Wardrode' do
  before(:all) do
    @clothes =
      [
        ['Весенняя куртка', 'Верхняя одежда', '(0, +15)'],
        ['Кепка', 'Головной убор', '(+20, +40)'],
        ['Кроссовки', 'Обувь', '(0, +15)']
      ]
    @clothes.map! { |item| Garment.new(item) }
    @wardrode = Wardrode.new(@clothes)
  end

  it 'assigns instance variables' do
    expect(@wardrode.clothes.empty?).to eq false
    expect(@wardrode.clothes).to eq @clothes
    expect(@wardrode.clothes[0].class).to eq Garment
  end

  describe '#all_clothes_types' do
    it 'displays all types of clothes in the wardrobe' do
      expect(@wardrode.all_clothes_types).to eq ['Верхняя одежда', 'Головной убор', 'Обувь']
    end
  end

  describe '#clothes_for_temperature' do
    it 'displays clothes for a temperature of 20 degrees Celsius' do
      # right_answer = { 'Головной убор' => 'Кепка' }
      proper_clothes = @wardrode.clothes_for_temperature(20)
      proper_wardrode = proper_clothes['Головной убор'][0]
      expect(proper_wardrode.name).to eq 'Кепка'
    end
    it 'displays clothes for a temperature of 10 degrees Celsius' do
      # right_answer = { 'Верхняя одежда' => 'Весенняя куртка', 'Обувь' => 'Кроссовки' }
      proper_clothes = @wardrode.clothes_for_temperature(10)
      proper_wardrode_type_1 = proper_clothes['Верхняя одежда'][0]
      proper_wardrode_type_2 = proper_clothes['Обувь'][0]
      proper_clothes_arr = [proper_wardrode_type_1.name, proper_wardrode_type_2.name]
      expect(proper_clothes_arr.join(', ')).to eq 'Весенняя куртка, Кроссовки'
    end
  end
end
