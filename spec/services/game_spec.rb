RSpec.describe Game do
  describe '#correct?' do
    context 'when there is a way to find the exit' do
      subject do
        blocks = [
          { 'U' => 'R' },
          { 'L' => 'D' },
          { 'R' => 'D' },
          { 'U' => 'L' }
        ]

        described_class.new(blocks, width: 2, height: 2, entrance: ['U', 0, 0], exit: ['D', 1, 0])
      end

      it 'returns true' do
        expect(subject.correct?).to eq(true)
      end
    end

    context 'when there is a way to find the exit' do
      subject do
        blocks = [
          { 'R' => 'L' },
          { 'D' => 'L' },
          { 'U' => 'D', 'R' => 'L' },
          { 'U' => 'L' }
        ]

        described_class.new(blocks, width: 2, height: 2, entrance: ['L', 0, 0], exit: ['L', 1, 0])
      end

      it 'returns true' do
        expect(subject.correct?).to eq(true)
      end
    end

    context 'hitting the left wall' do
      subject do
        blocks = [
          { 'U' => 'L', 'R' => 'D' },
          { 'U' => 'D' },
          { 'D' => 'L' },
          { 'U' => 'D', 'R' => 'L' }
        ]

        described_class.new(blocks, width: 2, height: 2, entrance: ['U', 0, 0], exit: ['D', 1, 0])
      end

      it 'returns false' do
        expect(subject.correct?).to eq(false)
      end
    end

    context 'hitting the right wall' do
      subject do
        blocks = [
          { 'U' => 'R' },
          { 'L' => 'R' },
          { 'D' => 'L' },
          { 'U' => 'D' }
        ]

        described_class.new(blocks, width: 2, height: 2, entrance: ['U', 0, 0], exit: ['D', 1, 0])
      end

      it 'returns false' do
        expect(subject.correct?).to eq(false)
      end
    end

    context 'sorting blocks wrongly' do
      subject do
        blocks = [
          { 'U' => 'R' },
          { 'U' => 'D' },
          { 'L' => 'R' },
          { 'U' => 'D' }
        ]

        described_class.new(blocks, width: 2, height: 2, entrance: ['U', 0, 0], exit: ['D', 1, 0])
      end

      it 'returns false' do
        expect(subject.correct?).to eq(false)
      end
    end
  end
end
