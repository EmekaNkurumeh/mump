export G = {
  title:"mump"
  width: 256
  height: 256
  scale: 4
  font: juno.Font.fromEmbedded 16
  gravity: 1.5
  friction: 7
  lume: require "lume"
  coil: require "coil"
  flux: require "flux"
  tick: require "tick"
  bump: require "bump"
}
{
  title: G.title
  width: G.width * G.scale
  height: G.height * G.scale
}