# frozen_string_literal: true

# Service provides result of rps fight between two players
# also keeps naming of weapons used and can return image url
class BattleService
  UNKNOWN = 'whoisthat'
  VALID_NAMES = %w[rock paper scissors].freeze # names are in specific order, it would be useful on result calculation
  CONTIDIONS = VALID_NAMES.reverse # reversed weapon naming provides perfect line up for condition rules of rps

  def initialize(user, enemy)
    @user = name_for user
    @enemy = name_for enemy
  end

  def result
    return I18n.t 'rps_battle.unknown' if unknown_among_us?
    return I18n.t 'rps_battle.tie' if tie?

    calculate_results
  end

  def user_image
    "#{@user.titleize}.svg"
  end

  def enemy_image
    "#{@enemy.titleize}.svg"
  end

  private

  # downcase and set to_s incoming params
  # so it would make more dynamical input in service
  def name_for(bet_name)
    bet_name = bet_name.to_s.downcase
    bet_name.in?(VALID_NAMES) ? bet_name : UNKNOWN
  end

  # calculates result of rps
  # returns only win or loose
  def calculate_results
    # takes reversed index from condidion array
    index = CONTIDIONS.index(@enemy)
    # by 'index - 1', we ll know what type of weapon is win for a user
    win_condition = CONTIDIONS[index - 1]

    # check if its a matching weapon for user win, if not, user lose
    I18n.t(@user == win_condition ? 'rps_battle.win' : 'rps_battle.lose')
  end

  # unknown weapon type!
  def unknown_among_us?
    [@user, @enemy].include? UNKNOWN
  end

  def tie?
    @user == @enemy
  end
end
