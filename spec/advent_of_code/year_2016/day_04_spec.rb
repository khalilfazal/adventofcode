require_all 'lib/advent_of_code/year_2016/day_04/*'

require 'advent_of_code'
require 'helpers/match_string'
require 'monkey_patches/string'

# noinspection RubyResolve
describe AdventOfCode::Year2016::Day4 do
  let(:problem) { @problem ||= described_class.problem }
  let(:inputs) { @input ||= problem.input.lines }

  let(:examples) do
    %w(
      aaaaa-bbb-z-y-x-123[abxyz]
      a-b-c-d-e-f-g-h-987[abcde]
      not-a-real-room-404[oarel]
      totally-real-room-200[decoy]
    )
  end

  context 'examples and stars' do
    define :be_a_real_room do
      match do |input|
        room = Room.new input

        # noinspection RubyResolve
        expect(room.calc_checksum).to be_identical_to_string room.checksum
      end
    end

    it 'passes example 1' do
      expect(examples[0]).to be_a_real_room
    end

    it 'passes example 2' do
      expect(examples[1]).to be_a_real_room
    end

    it 'passes example 3' do
      expect(examples[2]).to be_a_real_room
    end

    it 'passes example 4' do
      expect(examples[3]).not_to be_a_real_room
    end

    it 'passes example 5' do
      expect(Room.sum_of_real_sector_ids examples).to be 1_514
    end

    it 'anchieves star 1' do
      skip_this_when_dced do
        expect(Room.sum_of_real_sector_ids inputs).to eql problem.answer 1
      end
    end

    it 'passes example 6' do
      # noinspection RubyResolve
      expect(Room.decrypt 'qzmt-zixmtkozy-ivhz-343').to be_identical_to_string 'very encrypted name'
    end

    it 'anchieves star 2' do
      skip_this_when_dced do
        expect(Room.find_sector_id_of inputs, 'northpole object storage').to eql problem.answer 2
      end
    end
  end
end