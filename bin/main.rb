# -*- coding: utf-8 -*-

require 'starruby'
include StarRuby

$LOAD_PATH.unshift File.dirname(__FILE__) + '/../lib'
require 'extensions/starruby'
require 'gamescene'


# ステージ構成
# '#' が壁，'P' がプレイヤー，
# 'x' が箱，'.' が箱の置き場所，
# 'o' は置き場所に箱が既に置いている．
WALL = '#'
PLAYER = 'P'
BOX = 'x'
GOAL = '.'
PUT = 'o'
stage =
  [
   "  ##### ",
   "###   # ",
   "#.Px  # ",
   "### x.# ",
   "#.##x # ",
   "# # . ##",
   "#x oxx.#",
   "#   .  #",
   "########"
  ]

# セルの1辺の大きさ
CELL = 16

StarTools::Scene.run(GameScene.new(stage),
                     fps: 60, window_scale: 2,
                     window_size: [stage[0].size * CELL, stage.size * CELL])

