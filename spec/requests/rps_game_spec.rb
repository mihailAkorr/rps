# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'RpsGames', type: :request do
  before { allow(CurbService).to receive(:call).and_return('rock') }

  describe '#results' do
    context 'renders result' do
      it 'with param' do
        get '/rps_game/results', params: { bet: 'rock' }

        expect(response.status).to eq 200
        expect(response.body).not_to be_empty
      end

      it 'without param' do
        get '/rps_game/results'

        expect(response.status).to eq 200
        expect(response.body).not_to be_empty
      end
    end
  end
end
