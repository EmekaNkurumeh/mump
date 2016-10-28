class entity
  new: (@name,@screen,dm,@world,@static) =>
    @x = dm.x * G.scale
    @y = dm.y * G.scale
    @w = dm.w
    @h = dm.h
    if not @static
      @speed = 15
      @xvel = 0
      @yvel = 0
    @canvas = juno.Buffer.fromBlank @w,@h
    @world\add @,@x,@y,@w,@h
    return 
  update: (dt) =>
    G.coil.update dt
    G.tick.update dt
    G.flux.update dt
    if not @static
      @x += @xvel
      @y += @yvel + G.gravity
      @xvel = @xvel*(1 - math.min dt*G.friction,1)
      @yvel = @yvel*(1 - math.min dt*G.friction,1)
    if @xvel != 0 or @yvel != 0
      @world\move(@,@x,@y)
      -- @x,@y = @world\move(@,@x,@y)
    return
  draw: () =>
    @canvas\drawRect 0,0,@w,@h
    @screen\copyPixels @canvas,@x,@y,nil
    return