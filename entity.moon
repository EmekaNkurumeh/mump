class entity
  new: (dm) =>
    @name, @screen, @world, @static = dm.name, dm.screen, dm.world, dm.static
    @x, @y, @w, @h = dm.x * G.scale, dm.y * G.scale, dm.w, dm.h
    if not @static
      @speed = 15
      @xvel = 0
      @yvel = 0
    @canvas = juno.Buffer.fromBlank @w, @h
    @world\add @, @x, @y, @w, @h
    return 
  update: (dt) =>
    G.coil.update dt
    G.tick.update dt
    G.flux.update dt
    if not @static
      @x += @xvel
      @y += @yvel + G.gravity
      @xvel = @xvel * (1 - math.min dt * G.friction, 1)
      @yvel = @yvel * (1 - math.min dt * G.friction, 1)
    if @xvel != 0 or @yvel != 0
      @world\move(@, @x, @y)
      -- @x,@y = @world\move(@,@x,@y)
    return
  draw: () =>
    @canvas\drawRect 0, 0, @w, @h
    @screen\copyPixels @canvas, @x, @y, nil
    return