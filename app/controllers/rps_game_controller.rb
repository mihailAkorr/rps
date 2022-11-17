# frozen_string_literal: true

class RpsGameController < ApplicationController
  def index; end

  def results
    battle = BattleService.new(params['bet'], CurbService.call)

    @bet = battle.user_image
    @enemy = battle.enemy_image
    @result = battle.result
  end
end
