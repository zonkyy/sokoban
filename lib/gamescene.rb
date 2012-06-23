# -*- coding: utf-8 -*-

require 'scene'
require 'box'
require 'player'
require 'wall'
require 'goal'

class GameScene < StarTools::Scene::Base

  def init(arg)
    stage = arg[0]

    @player = Player.new(get_points(stage, PLAYER)[0])

    @boxes = []
    get_points(stage, BOX, PUT).each do |p|
      @boxes << Box.new(p)
    end

    @walls = []
    get_points(stage, WALL).each do |p|
      @walls << Wall.new(p)
    end

    @goals = []
    get_points(stage, GOAL, PUT).each do |p|
      @goals << Goal.new(p)
    end

    @complete = false
  end

  def get_points(ary, *chars)
    points = []
    ary.each_with_index do |s, r|
      s.enum_for(:each_byte).each_with_index do |ch, c|
        chars.each do |checked_char|
          points << [c, r] if ary[r][c] == checked_char
        end
      end
    end
    points
  end

  def update
    @player.move(@boxes, @walls) unless @complete

    # BOX と GOAL の被りチェック
    boxes_place = @boxes.map {|b| [b.x, b.y]}
    goals_place = @goals.map {|g| [g.x, g.y]}
    box_puts = boxes_place & goals_place
    @goals.each do |g|
      if box_puts.include?([g.x, g.y])
        g.put
      else
        g.take
      end
    end

    @complete = @goals.all? {|g| g.put_box}

    if @complete
      @goals.each do |g|
        g.complete
      end
    end
  end

  def render
    @boxes.each do |box|
      box.render
    end
    @walls.each do |wall|
      wall.render
    end
    @goals.each do |goal|
      goal.render
    end
    @player.render
  end

end
