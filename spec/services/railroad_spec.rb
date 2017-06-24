RSpec.describe Railroad do
  describe '#available_starting_points' do
    context '2 x 2' do
      subject { described_class.new(2, 2) }

      it 'return available starting points' do
        expect(subject.available_starting_points).to match_array([
          ['U', 0, 0], ['U', 0, 1],
          ['D', 1, 0], ['D', 1, 1],
          ['L', 0, 0], ['L', 1, 0],
          ['R', 0, 1], ['R', 1, 1]
        ])
      end
    end

    context '2 x 3' do
      subject { described_class.new(2, 3) }

      it 'return available starting points' do
        expect(subject.available_starting_points).to match_array([
          ['U', 0, 0], ['U', 0, 1],
          ['D', 2, 0], ['D', 2, 1],
          ['L', 0, 0], ['L', 1, 0], ['L', 2, 0],
          ['R', 0, 1], ['R', 1, 1], ['R', 2, 1]
        ])
      end
    end
  end
end
