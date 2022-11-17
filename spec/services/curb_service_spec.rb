# frozen_string_literal: true

require 'rails_helper'

describe CurbService do
  let(:response) do
    {
      'statusCode' => 200,
      'body' => 'rock'
    }
  end

  describe '#call' do
    before do
      stub_request(:get, CurbService::CURB_URL).to_return(body: response.to_json)
    end

    it 'returns weapon type' do
      expect(described_class.call).to eq response['body']
    end
  end
end
