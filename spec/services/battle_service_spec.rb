# frozen_string_literal: true

require 'rails_helper'

describe BattleService do
  let(:user) { 'rock' }
  let(:enemy) { 'paper' }
  let(:some_number) { rand(0..10) }
  let(:some_string) { ('a'..'z').to_a.sample(8).join }

  subject { BattleService }

  describe '#initialize' do
    context 'when input format is wrong' do
      it 'sets arguments to unknown' do
        battle_service = subject.new(some_number, nil)

        expect(battle_service.instance_variable_get(:@user)).to eq BattleService::UNKNOWN
        expect(battle_service.instance_variable_get(:@enemy)).to eq BattleService::UNKNOWN
      end
    end

    context 'when input format is right' do
      it 'use valid weapon type' do
        service = subject.new(user, enemy)

        expect(BattleService::VALID_NAMES).to include(service.instance_variable_get(:@user))
        expect(BattleService::VALID_NAMES).to include(service.instance_variable_get(:@enemy))
      end
    end
  end

  describe '#result' do
    let(:user_win) { subject.new('scissors', 'paper') }
    let(:user_lose) { subject.new('scissors', 'rock') }
    let(:user_tie) { subject.new('paper', 'paper') }
    let(:unknown) { subject.new('what', 2) }

    it 'win when user is in win condition' do
      expect(user_win.result).to eq I18n.t 'rps_battle.win'
    end

    it 'lose when user is in lose condition' do
      expect(user_lose.result).to eq I18n.t 'rps_battle.lose'
    end

    it 'tie when bets are the same' do
      expect(user_tie.result).to eq I18n.t 'rps_battle.tie'
    end

    it 'returns unknown on unknown weapon type' do
      expect(unknown.result).to eq I18n.t 'rps_battle.unknown'
    end
  end
end
