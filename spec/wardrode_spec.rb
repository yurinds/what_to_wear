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
      right_answer = { 'Головной убор' => 'Кепка' }
      expect(@wardrode.clothes_for_temperature(20)).to eq right_answer
    end
    it 'displays clothes for a temperature of 10 degrees Celsius' do
      right_answer = { 'Верхняя одежда' => 'Весенняя куртка', 'Обувь' => 'Кроссовки' }
      expect(@wardrode.clothes_for_temperature(10)).to eq right_answer
    end
  end
end
