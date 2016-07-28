require 'ceasar-cipher.rb'

describe 'caps_check(i)' do
  it 'returns 1 if in A..Z range' do
    expect(caps_check('B')).to eql(1)
  end

  it 'returns 2 if in a..z range' do
    expect(caps_check('b')).to eql(2)
  end

  it 'returns 3 if not in range' do
    expect(caps_check('3')).to eql(3)
  end

  it 'returns 3 if given @' do
    expect(caps_check('@')).to eql(3)
  end
end

sdescribe "ceasar_cipher(sentence, shift)" do
  it 'returns Ucujg for given Sashe, 2' do
    expect(ceasar_cipher('Sashe', 2)).to eq("Ucujg")
  end
end
