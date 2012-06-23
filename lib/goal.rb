# -*- coding: utf-8 -*-

class Goal

  GOAL_COLOR = Color.new(200, 0, 200)
  PUT_COLOR  = Color.new(20, 0, 200)
  COMPLETE_COLOR = Color.new(255, 255, 0)

  attr_reader :x, :y, :put_box

  def initialize(point)
    @x, @y = *point
    @texture = Texture.new(CELL, CELL)
    @texture.fill(GOAL_COLOR)
    @put_box = false
  end

  def render
    $screen.render(@texture, @x*CELL, @y*CELL)
  end

  def put
    @put_box = true
    @texture.fill(PUT_COLOR)
  end

  def take
    @put_box = false
    @texture.fill(GOAL_COLOR)
  end

  def complete
    @texture.fill(COMPLETE_COLOR)
  end

end
