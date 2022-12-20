# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Friends', type: :request do
  describe 'GET /input' do
    it 'returns http success' do
      get '/friend/input'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /view' do
    it 'returns http success' do
      get '/friend/view'
      expect(response).to have_http_status(:success)
    end
    context 'should give correct result when' do
      it 'param = 1000' do
        get '/friend/view', params: { :v1 => '1000', 'commit' => 'Вычислить' }
        res = controller.instance_variable_get(:@result)
        expect(res[0][0]).to eq(220)
        expect(res[0][1]).to eq(284)
      end
      it 'param = 10000' do
        get '/friend/view', params: { :v1 => '10000', 'commit' => 'Вычислить' }
        res = controller.instance_variable_get(:@result)
        expect(res[0][0]).to eq(220)
        expect(res[0][1]).to eq(284)
        expect(res[1][0]).to eq(1184)
        expect(res[1][1]).to eq(1210)
        expect(res[2][0]).to eq(2620)
        expect(res[2][1]).to eq(2924)
        expect(res[3][0]).to eq(5020)
        expect(res[3][1]).to eq(5564)
        expect(res[4][0]).to eq(6232)
        expect(res[4][1]).to eq(6368)
      end
    end
  end
end
