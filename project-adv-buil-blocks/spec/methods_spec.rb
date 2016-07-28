require 'methods.rb'

describe Enumerable do
  context 'Creates custom enumerable methods' do
    describe '#my_each' do
      it 'evaluates the block for every element in the array' do
        a = 0
        [1,2,3].my_each { |el| a += el }
        expect(a).to eq(6)
      end

    end

    describe '#my_each_with_index' do
      it 'concatenates array elements with respective index into one string' do
        a = ''
        ['S','a','s','h','e'].my_each_with_index { |el, i| a += "#{el}#{i}" }
        expect(a).to eq('S0a1s2h3e4')
      end
    end

    describe '#my_select' do
      it 'selects uppercase elements of an array of characters' do
        expect(['S','a','s','h','e'].my_select { |el| el.match(/[A-Z]/) }).to eq(['S'])
      end
    end

    describe '#my_all?' do
      it 'returns true if all elements are letters' do
        expect(['S','a','s','h','e'].my_all? { |el| el.match(/[A-Za-z]/) }).to eq(true)
      end

      it 'returns false if all elements are not letters' do
        expect(['S','a','s','h','e','@'].my_all? { |el| el.match(/[A-Za-z]/) }).to eq(false)
      end
    end

    describe '#my_any?' do
      it 'returns true if there is Integer element' do
        expect(['S','a','s','h','e', 1].my_any? { |el| el.is_a?(Integer) }).to eq(true)
      end

      it 'returns false if there is no Integer element' do
        expect(['S','a','s','h','e'].my_any? { |el| el.is_a?(Integer) }).to eq(false)
      end
    end

    describe '#my_none?' do
      it 'returns true if none of the elements are Integer' do
        expect(['S','a','s','h','e'].my_none? { |el| el.is_a?(Integer) }).to eq(true)
      end

      it 'returns false if some of the elements are Integer' do
        expect(['S','a','s','h','e', 1].my_none? { |el| el.is_a?(Integer) }).to eq(false)
      end
    end

    describe '#my_count' do
      it 'counts how many elements are letters' do
        expect(['S','a','s','h','e','@'].my_count { |el| el.match(/[A-Za-z]/) }).to eq(5)
      end
    end

  end
end
