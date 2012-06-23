# -*- coding: utf-8 -*-
class Box

  BOX_COLOR = Color.new(153, 76, 0)

  attr_reader :x, :y

  def initialize(point)
    @x, @y = *point
    @texture = Texture.new(CELL, CELL)
    @texture.fill(BOX_COLOR)
  end

  def render
    $screen.render(@texture, @x*CELL, @y*CELL)
  end

  # 移動したら true を返す
  def move(boxes, walls, nx, ny)
    can_push = true
    boxes.each do |box|
      can_push = false if [box.x, box.y] == [@x + nx, @y + ny]
    end
    walls.each do |wall|
      can_push = false if [wall.x, wall.y] == [@x + nx, @y + ny]
    end

    if can_push
      @x += nx
      @y += ny
    end

    can_push
  end

end
