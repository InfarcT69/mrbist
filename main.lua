function love.load()
  lg = love.graphics
  lg.setDefaultFilter('nearest','nearest')
  camera = require("librerias/camera")
  cam = camera()
  arrowss = {lg.newImage('assets/arrows/oarrows/agi.png'),lg.newImage('assets/arrows/oarrows/sgi.png'),lg.newImage('assets/arrows/oarrows/dgi.png'),lg.newImage('assets/arrows/oarrows/wgi.png')}
  arrowq = {lg.newQuad(0,0,21,23,arrowss[1]:getDimensions()),lg.newQuad(0,0,23,21,arrowss[2]:getDimensions()),lg.newQuad(0,0,21,23,arrowss[3]:getDimensions()),lg.newQuad(0,0,23,21,arrowss[4]:getDimensions()),lg.newQuad(21,0,21,23,arrowss[1]:getDimensions()),lg.newQuad(23,0,23,21,arrowss[2]:getDimensions()),lg.newQuad(21,0,21,23,arrowss[3]:getDimensions()),lg.newQuad(23,0,23,21,arrowss[4]:getDimensions())}
  globaly = 50
  timer = 0
 
  
  love.filesystem.write('pos.txt', ' ') 
  --love.filesystem.append('pos.txt','another zzzz')
end
function love.update(dt)
  timer = timer + dt
  arrowq = {lg.newQuad(0,0,21,23,arrowss[1]:getDimensions()),lg.newQuad(0,0,23,21,arrowss[2]:getDimensions()),lg.newQuad(0,0,21,23,arrowss[3]:getDimensions()),lg.newQuad(0,0,23,21,arrowss[4]:getDimensions()),lg.newQuad(21,0,21,23,arrowss[1]:getDimensions()),lg.newQuad(23,0,23,21,arrowss[2]:getDimensions()),lg.newQuad(21,0,21,23,arrowss[3]:getDimensions()),lg.newQuad(23,0,23,21,arrowss[4]:getDimensions())}
  if love.keyboard.isDown("w") then
     arrowq[4] = arrowq[8]
     love.filesystem.append('pos.txt','newW{\r\npos:'..globaly..'\r\ntime:'..timer..'\r\n}\r\n')
  end
  if love.keyboard.isDown("a") then
     arrowq[1] = arrowq[5]
     love.filesystem.append('pos.txt','newA{\r\npos:'..globaly..'\r\ntime:'..timer..'\r\n}\r\n')
  end
  if love.keyboard.isDown("s") then
     arrowq[2] = arrowq[6]
     love.filesystem.append('pos.txt','newS{\r\npos:'..globaly..'\r\ntime:'..timer..'\r\n}\r\n')
  end
  if love.keyboard.isDown("d") then
     arrowq[3] = arrowq[7]
     love.filesystem.append('pos.txt','newD{\r\npos:'..globaly..'\r\ntime:'..timer..'\r\n}\r\n')
  end

  globaly = globaly + globaly * dt
  cam:lookAt(450,globaly)
end

function love.draw()
  cam:attach()
  for i, arrow in ipairs(arrowss) do
     lg.draw(arrow,arrowq[i],450 + (i * 75),globaly,0,3,3)
  end
  
  cam:detach()
  lg.print(globaly,100,100)
end