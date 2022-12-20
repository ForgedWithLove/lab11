# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Friendly, type: :model do
  context 'Trying to fill Friendly with' do
    it 'param = 1000' do
      zap = Friendly.find_by(param: 1000)
      if !zap.nil?
        exist = true
        zap&.destroy
      else
        exist = false
      end
      Friendly.create(param: 1000, result: ActiveSupport::JSON.encode(
        res: '220 284'
      ))
      zap = Friendly.find_by(param: 1000)
      expect(zap).not_to eq(nil)
      expect(ActiveSupport::JSON.decode(zap.result)['res']).to eq('220 284')
      zap&.destroy unless exist
    end
  end
end
