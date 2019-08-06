require 'garment'

describe 'Garment' do
  it 'assigns instance variables' do
    garment = Garment.new(['Весенняя куртка', 'Верхняя одежда', '(0, +15)'])

    expect(garment.name).to eq 'Весенняя куртка'
    expect(garment.type).to eq 'Верхняя одежда'
    expect(garment.temperature_range).to eq (0..15)
  end

  describe '#temperature_range_invalid?' do
    it 'shows valid garment' do
      garment = Garment.new(['Весенняя куртка', 'Верхняя одежда', '(0, +15)'])

      expect(garment.temperature_range_invalid?).to eq false
    end

    it 'shows invalid garment' do
      garment = Garment.new(['Весенняя куртка', 'Верхняя одежда', '(+15, -10)'])

      expect(garment.temperature_range_invalid?).to eq true
    end
  end

  describe '#to_s' do
    it 'shows the textual representation of the class instance' do
      garment = Garment.new(['Весенняя куртка', 'Верхняя одежда', '(0, +15)'])

      expect(garment.to_s).to eq 'Весенняя куртка (Верхняя одежда) 0..15'
    end
  end
end
