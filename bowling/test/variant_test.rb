require_relative '../../test_helper'
require_relative '../lib/bowling'
require 'byebug'

class ParserDouble < Minitest::Mock
 def parse(rolls:, frame_configs:)
    [3, 4, 1]
  end
end

class VariantTest < Minitest::Test
  # new
  # * creates parser of class that responds to parse (e.g. StandardRollParser or LowballRollParser)
  #
  # incoming messages
  # * QUERY framify returning framelist
  # * QUERY parser returning array of config attrs
  #
  # outgoing messages
  # * QUERY calls parser.parse -- Do we test sending correct parameters


  def framify

  end

  def test_parse
    variant = Variant.new( config:
        {
            :parser => "ParserDouble",
            :scoring_rules => [
                {num_triggering_rolls: 1, triggering_value: 10, num_rolls_to_score: 3},
                {num_triggering_rolls: 2, triggering_value: 10, num_rolls_to_score: 3},
                {num_triggering_rolls: 3, triggering_value:  0, num_rolls_to_score: 3} ]
        } )
    rolls = [0]*10
byebug
    variant.parser.expect(:parse, rolls, variant.config.scoring_rules)
    assert_equal [3, 4, 1], variant.parse(rolls: rolls)
    variant.parser.verify
  end

end
