class Bowling
  attr_reader :rolls
  def initialize(rolls)
    @rolls = rolls
  end

  def score
    running_score = 0
    current_frame = 0
    max_frames    = 10
    remaining_rolls = rolls

    while current_frame < max_frames
      current_frame += 1

      # strike
      _num_triggering_rolls = 1
      _triggering_value = 10
      _num_rolls_to_score = 3
      if (remaining_rolls.take(_num_triggering_rolls).sum) >= _triggering_value
        if remaining_rolls.size >= _num_rolls_to_score
          running_score += remaining_rolls.take(_num_rolls_to_score).sum
          remaining_rolls = remaining_rolls.drop(_num_triggering_rolls)
        end
        next
      end

      # spare
      _num_triggering_rolls = 2
      _triggering_value = 10
      _num_rolls_to_score = 3
      if (remaining_rolls.take(_num_triggering_rolls).sum) >= _triggering_value
        if remaining_rolls.size >= _num_rolls_to_score
          running_score += remaining_rolls.take(_num_rolls_to_score).sum
          remaining_rolls = remaining_rolls.drop(_num_triggering_rolls)
        end
        next
      end

      # open frame
      _num_triggering_rolls = 2
      _triggering_value = 0
      _num_rolls_to_score = 2
      if (remaining_rolls.take(_num_triggering_rolls).sum) >= _triggering_value
        if remaining_rolls.size >= _num_rolls_to_score
          running_score += remaining_rolls.take(_num_rolls_to_score).sum
          remaining_rolls = remaining_rolls.drop(_num_triggering_rolls)
        end
        next
      end

      # if (remaining_rolls.take(2).sum) >= 0
      #   if remaining_rolls.size >= 2
      #   running_score += remaining_rolls.take(2).sum
      #   remaining_rolls = remaining_rolls.drop(2)
      #   end
      #   next
      # end
    end

    running_score
  end
end