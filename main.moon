import entity from require "entity"

juno.onLoad = ->
  G.canvas = juno.Buffer.fromBlank 128, 128
  G.entities = {}
  juno.debug.setVisible true
  table.insert(entity(name: "player", screen: G.canvas, x: 64, y: 0, w: 16, h: 16, world: G.world, static: false))
  table.insert(entity(name: "ground", screen: G.canvas, x: 0, y: 64, w: 32, h: 16, world: G.world, static: true))

juno.onUpdate = (dt) ->
  for e in *G.entities
    e\update dt

juno.onDraw = () ->
  e[1].canvas\setColor .23, .3, .4
  e[2].canvas\setColor .4, .3, .23
  for e in *G.entities
    e\draw!
  juno.graphics.copyPixels G.canvas,0,0,nil,G.scale
  G.canvas\clear! 

juno.onKeyDown = (k) ->
  if k == "escape" then os.exit!