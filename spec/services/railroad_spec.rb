RSpec.describe Railroad do
  subject { described_class.new(2, 2) }

  describe '#available_entrance_and_exit_positions' do
    context '2 x 2' do
      it 'returns available entrance and exit positions' do
        expect(subject.available_entrance_and_exit_positions).to match_array([
          ['U', 0, 0], ['U', 0, 1],
          ['D', 1, 0], ['D', 1, 1],
          ['L', 0, 0], ['L', 1, 0],
          ['R', 0, 1], ['R', 1, 1]
        ])
      end
    end

    context '2 x 3' do
      subject { described_class.new(2, 3) }

      it 'returns available entrance and exit positions' do
        expect(subject.available_entrance_and_exit_positions).to match_array([
          ['U', 0, 0], ['U', 0, 1],
          ['D', 2, 0], ['D', 2, 1],
          ['L', 0, 0], ['L', 1, 0], ['L', 2, 0],
          ['R', 0, 1], ['R', 1, 1], ['R', 2, 1]
        ])
      end
    end
  end

  describe '#blocks_permutation' do
    it 'returns an array with all possible blocks permutation' do
      expect(subject.blocks_permutation.count).to eq(6_561)
    end
  end

  describe '#games_permutation' do
    it 'returns an array with all possible games permutation' do
      expect(subject.games_permutation.count).to eq(367_416)
    end
  end
end
