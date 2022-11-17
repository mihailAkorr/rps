# frozen_string_literal: true

# call curb to get his throw
class CurbService
  # mock url always returns 'Rock', so its not very interesting
  # but production url fails with 500 sometimes
  CURB_URL = 'https://5eddt4q9dk.execute-api.us-east-1.amazonaws.com/rps-stage/throw'

  def self.call
    response = Faraday.get CURB_URL
    data = JSON.parse(response.body)

    curb_bet = data['body']
    curb_bet ||= random_bet
  rescue StandardError
  end

  private
  # gets random weapon from BattleService array
  def self.random_bet
    BattleService::VALID_NAMES.sample
  end
end
