# -*- coding: utf-8 -*-
class Player

  PLAYER_COLOR = Color.new(255, 255, 255)

  attr_reader :x, :y

  def initialize(point)
    @x, @y = *point
    @texture = Texture.new(CELL, CELL)
    @texture.fill(PLAYER_COLOR)
  end

  def move(boxes, walls)
    nx, ny = 0, 0
    nx += 1 if $keys.include?(:right)
    nx -= 1 if $keys.include?(:left)
    ny -= 1 if $keys.include?(:up)
    ny += 1 if $keys.include?(:down)

    # 箱の移動が行われるかチェック
    push = false
    pushed_box = nil
    boxes.each do |box|
      if [box.x, box.y] == [@x + nx, @y + ny]
        push = true
        pushed_box = box
      end
    end

    # 自分が移動できるかチェック
    unless push
      can_move = true
      walls.each do |wall|
        can_move = false if [wall.x, wall.y] == [@x + nx, @y + ny]
      end
    end

    if pushed_box and pushed_box.move(boxes, walls, nx, ny) or can_move
      # 箱を移動した場合，もしくは移動先が壁ではない場合
      @x += nx
      @y += ny
    end

  end

  def render
    $screen.render(@texture, @x*CELL, @y*CELL)
  end

end
