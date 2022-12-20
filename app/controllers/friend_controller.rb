# frozen_string_literal: true

class FriendController < ApplicationController
  def input; end

  def view
    v1 = params[:v1].to_i
    zap = Friendly.find_by(param: v1)
    if !zap.nil?
      @result = join_string(ActiveSupport::JSON.decode(zap.result)['res'])
    else
      rs = ''
      @result = comp_friendly(v1)
      @result.each { |pair| rs += "#{pair.join(' ')} " }
      Friendly.create(param: v1, result: ActiveSupport::JSON.encode(
        res: rs
      ))
    end
  end

  def join_string(string)
    pair = []
    res = []
    string.split(' ').each_with_index do |elem, index|
      pair.push(elem.to_i)
      if index.even?
      else
        res.push(pair)
        pair = []
      end
    end
    res
  end

  def comp_friendly(right)
    res = []
    (1..right).each do |number|
      sumdel = 0
      revsumdel = 0
      (1..number / 2).each do |del|
        sumdel += del if (number % del).zero?
      end
      (1..sumdel / 2).each do |revdel|
        revsumdel += revdel if (sumdel % revdel).zero?
      end
      if number == revsumdel && number != sumdel && (res[res.length - 1] != [sumdel, revsumdel])
        res.push([revsumdel, sumdel])
      end
    end
    res
  end
end
