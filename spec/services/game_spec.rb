RSpec.describe Game do
  describe '#play' do
    context 'finding the exit' do
      subject do
        block = [
          { 'U' => 'R' },
          { 'L' => 'D' },
          { 'R' => 'D' },
          { 'U' => 'L' }
        ]

        described_class.new(block, width: 2, height: 2, entrance: ['U', 0, 0], exit: ['D', 1, 0])
      end

      it 'returns true' do
        expect(subject.play).to eq(true)
      end
    end

    context 'finding the exit in level 4' do
      subject do
        block = [
          { 'R' => 'L' },
          { 'D' => 'L' },
          { 'U' => 'D', 'R' => 'L' },
          { 'U' => 'L' }
        ]

        described_class.new(block, width: 2, height: 2, entrance: ['L', 0, 0], exit: ['L', 1, 0], level: 4)
      end

      it 'returns true' do
        expect(subject.play).to eq(true)
      end
    end

    context 'hitting the left wall' do
      subject do
        block = [
          { 'U' => 'L', 'R' => 'D' },
          { 'U' => 'D' },
          { 'D' => 'L' },
          { 'U' => 'D', 'R' => 'L' }
        ]

        described_class.new(block, width: 2, height: 2, entrance: ['U', 0, 0], exit: ['D', 1, 0])
      end

      it 'returns false' do
        expect(subject.play).to eq(false)
      end
    end

    context 'hitting the right wall' do
      subject do
        block = [
          { 'U' => 'R' },
          { 'L' => 'R' },
          { 'D' => 'L' },
          { 'U' => 'D' }
        ]

        described_class.new(block, width: 2, height: 2, entrance: ['U', 0, 0], exit: ['D', 1, 0])
      end

      it 'returns false' do
        expect(subject.play).to eq(false)
      end
    end

    context 'sorting blocks wrongly' do
      subject do
        block = [
          { 'U' => 'R' },
          { 'U' => 'D' },
          { 'L' => 'R' },
          { 'U' => 'D' }
        ]

        described_class.new(block, width: 2, height: 2, entrance: ['U', 0, 0], exit: ['D', 1, 0])
      end

      it 'returns false' do
        expect(subject.play).to eq(false)
      end
    end
  end
end
