class Shooter
  def initialize(board:, target:)
    @board     = board
    @target    = target
    @message   = ""
  end

  def fire!
    result ={}
    if valid_shot?
      result[:space_status] = space.attack!
      if space.contents
        (result[:is_sunk] = true) if space.contents.is_sunk?
      end
    else
      raise InvalidAttack.new("Invalid coordinates.")
    end
    result
  end

  def self.fire!(board:, target:)
    new(board: board, target: target).fire!
  end

  private
    attr_reader :board, :target

    def space
      @space ||= board.locate_space(target)
    end

    def valid_shot?
      board.space_names.include?(target)
    end
end

class InvalidAttack < StandardError
  def initialize(msg = "Invalid attack.")
    super(msg)
  end
end
