-- TODO documentation
function recursiveEnumerate(folder, fileList)
  local items = love.filesystem.getDirectoryItems(folder)
  for _, item in ipairs(items) do
    local file = file .. '/' .. item
    if love.filesystem.isFile(file) then
      table.insert(fileList, file)
    elseif love.filesystem.isDirectory(file) then
      recursiveEnumerate(file, fileList)
    end
  end
end

-- TODO documentation
function requireFiles(files)
  for _, file in ipairs(files) do
    local file = file:sub(1, -5)
    require(file)
  end
end

-- TODO documentation
function UUID()
  local fn = function(x)
    local r = math.random(16) - 1
    r = (x == "x") and (r + 1) or (r % 4) + 9
    return ("0123456789abcdef"):sub(r, r)
  end
  return (("xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx"):gsub("[xy]", fn))
end