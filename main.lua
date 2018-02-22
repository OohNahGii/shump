Object = require 'libraries/classic/classic'

function love.load()
  -- Require all objects
  local objectFiles = {}
  recursiveEnumerate('objects', objectFiles)
  requireFiles(objectFiles)

  -- Setup all availble rooms

  -- Setup initial room
  currentRoom = nil
end

function love.update(dt)
  if currentRoom then
    currentRoom:update(dt)
  end
end

function love.draw()
  if currentRoom then
    currentRoom:draw()
  end
end

function gotoRoom(roomType, ...)
  currentRoom = _G[roomType](...)
end
