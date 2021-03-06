local Tiles = require('tiles')
local Display = require('display')


local gramas = {
    {4,6},{4,7},{5,6},{5,7},{8,5},{8,6},{8,7},{9,5},{9,6},{9,7},
    {4,6},{5,6},{5,7},
    {4,6},{5,6},{5,7},
    {4,6},{5,6},{5,7},
    {4,6},{5,6},{5,7},
    {4,6},{5,6},{5,7},
    {4,6},{5,6},{5,7},
    {4,6},{5,6},{5,7},
    {4,6},{5,6},{5,7},
    {4,6},{5,6},{5,7},
    {4,6},{5,6},{5,7},
    {4,6},{5,6},{5,7},
    {4,6},{5,6},{5,7},
    {4,6},{5,6},{5,7},
    {4,6},{5,6},{5,7},
    {4,6},{5,6},{5,7},
    {4,6},{5,6},{5,7},
    {4,6},{5,6},{5,7},
    {4,6},{5,6},{5,7},
    {4,6},{5,6},{5,7},
}
-- gera gramado aleatoriamente
local function gramado(x,y)
    local map = {}
    for i=1, x do
        table.insert(map, {})
        for j = 1, y do
            local tile = {}
            tile = gramas[math.random(67)]
            table.insert(map[i], tile)
        end
    end
    return map
end

local tilemap = {}
tilemap.tree = {}
tilemap.tree.map = {
    {{3,1},    0,    0,    0,},
    {    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,{2,1},    0,},
    {{1,1},    0,    0,{3,1},    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,{2,1},{1,1},    0,    0,    0,    0,    0,    0,{3,1},},
    {    0,    0,    0,    0,    0,{3,1}},
    {    0,    0,    0,    0,},
    {{3,1},    0,    0,    0,    0,    0,    0,    0,},
    {    0,    0,    0,    0,    0,    0,    0,    0,    0,{3,1}},
    {    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,{3,1},    0,    0,    0,    0,    0,{1,1},},
    {    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,},
    {    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,{2,1}},
    {    0,    0,{2,1},    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,{3,1}},
    {    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,{1,1}},
    {{1,1},    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,{3,1},    0,    0,    0,    0,    0,    0,    0,    0,},

}
tilemap.tree.draw = function (self)
    for index_y, row in ipairs(self.map) do
        for index_x, column in ipairs(row) do
            if row[index_x] ~= 0 then
                local quad = Tiles.tree.quads[row[index_x][1]][row[index_x][2]]
                love.graphics.draw(Tiles.tree.image,quad, 16 * index_x * 2 -16*2, 16 * index_y * 2 -16*2, 0, 2, 2)    
            end
        end
    end
end

tilemap.grass = {}
tilemap.grass.map = gramado(math.ceil(Display.height / 32),math.ceil(Display.width / 32))
tilemap.grass.draw = function (self)
    love.graphics.setDefaultFilter('nearest', 'nearest')
    for index_y, row in ipairs(self.map) do
        for index_x, column in ipairs(row) do
            if row[index_x] ~= 0 then
                local quad = Tiles.ground.quads[row[index_x][1]][row[index_x][2]]
                love.graphics.draw(Tiles.ground.image,quad, 16 * index_x * 2 - 16 * 2, 16 * index_y * 2 - 16 * 2, 0, 2,2)    
            end
        end
    end
end

tilemap.trail = {}
tilemap.trail.map = {
    {0,{7,2},    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,{7,2},},
    {0,{7,2},0,    0,    0,    0,    {1,7},{1,8},{1,8},{1,8},{1,8},{1,9},    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,{7,2},},
    {0,{7,5},{7,1},{7,1},{7,1},{7,1},{9,3},{2,8},{2,8},{2,8},{2,8},{2,9},    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,{7,2},},
    {0,{7,2},0,    0,    0,    0,    {2,7},{2,8},{2,8},{2,8},{2,8},{2,9},    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,{7,2},},
    {0,{7,2},0,    0,    0,    0,    {2,7},{2,8},{2,8},{2,8},{2,8},{2,9},    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,{7,2},},
    {0,{7,2},0,    0,    0,    0,    {2,7},{2,8},{2,8},{3,8},{4,9},{5,8},{1,8},{1,8},{1,8},{1,8},{1,8},{1,8},{1,8},{1,8},{1,8},{1,8},{1,8},{7,1},{7,1},{9,9},},
    {0,{7,2},0,    0,    0,    {1,7},{2,8},{2,8},{2,9},    0,{3,7},{3,8},{3,8},{3,8},{3,8},{3,8},{3,8},{3,8},{2,8},{2,8},{2,8},{2,8},{2,9},},
    {0,{7,2},0,    0,    0,    {2,7},{2,8},{2,8},{3,9},    0,    0,    0,    0,    0,    0,    0,    0,    0,{2,7},{2,8},{2,8},{2,8},{2,9},},
    {0,{9,8},{7,1},{7,1},{7,1},{8,3},{3,8},{3,9},    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,{2,7},{2,8},{2,8},{2,8},{2,9},},
    {0,    0,    0,    0,    0,{7,2},    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,{3,7},{8,3},{3,8},{3,8},{3,9},},
    {0,    0,    0,    0,    0,{7,2},    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,{7,2},},
    {0,    0,    0,    0,    0,{7,2},    0,    0,    0,    0,    0,    0,    0,{8,8},{7,1},{7,1},{7,1},{7,1},{7,1},{9,9},},
    {0,    0,    0,    0,    0,{2,7},{1,8},{1,8},{1,8},{1,8},{1,8},{1,8},{1,8},{9,9},},
    {0,    0,    0,    0,    0,{2,7},{2,8},{2,8},{2,8},{2,8},{2,8},{2,8},{2,9},},
    {0,    0,    0,    0,    0,{3,7},{3,8},{3,8},{3,8},{3,8},{3,8},{3,8},{3,9},},

}
tilemap.trail.draw = function (self)
    love.graphics.setDefaultFilter('nearest', 'nearest')
    for index_y, row in ipairs(self.map) do
        for index_x, column in ipairs(row) do
            if row[index_x] ~= 0 then
                local quad = Tiles.ground.quads[row[index_x][1]][row[index_x][2]]
                love.graphics.draw(Tiles.ground.image,quad, 16 * index_x * 2 - 16 * 2, 16 * index_y * 2 - 16 * 2, 0, 2,2)        
            end
        end
    end
end

tilemap.water = {}
tilemap.water.rotation = math.pi
tilemap.water.timerLimit = 1
tilemap.water.timer = 2
tilemap.water.map = {
    {    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,{2,4},{2,5},{2,5},{2,6},},
    {    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,{1,4},{1,5},{5,5},{2,5},{2,5},{2,6},},
    {    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,{1,4},{1,5},{5,5},{2,5},{2,5},{2,5},{2,5},{2,6},},
    {    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,{2,4},{2,5},{2,5},{4,4},{3,5},{3,5},{4,5},{5,4},{1,6},},
    {    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,{3,4},{3,5},{3,5},{3,6},    0,    0,{3,4},{3,5},{3,6},},
    {    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,},
    {    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,},
    {    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,{1,4},{1,5},{1,5},{1,5},{1,5},{1,5},{1,6},},
    {    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,{2,4},{2,5},{2,5},{2,5},{2,5},{2,5},{2,6},},
    {    0,{1,4},{1,5},{1,5},{1,6},    0,    0,{1,4},{1,5},{1,5},{5,5},{4,4},{3,5},{3,5},{3,5},{3,5},{3,6},},
    {{1,5},{5,5},{2,5},{2,5},{2,6},    0,    0,{2,4},{2,5},{2,5},{2,5},{2,6},},
    {{2,5},{4,4},{3,5},{3,5},{3,6},    0,    0,{3,4},{3,5},{3,5},{3,5},{3,6},},
    {{2,5},{5,4},{1,5},{1,5},{1,6},},
    {{3,5},{4,5},{2,5},{4,4},{3,6},},
    {    0,{3,4},{3,5},{3,6},},
}
tilemap.water.update = function (self, dt)
    -- print(self.timer)
    self.timer = self.timer - dt
    if self.timer <= 0 then
        self.rotation = self.rotation + math.pi

        self.timer = self.timerLimit
    end
end
tilemap.water.draw = function (self)
    love.graphics.setDefaultFilter('nearest', 'nearest')
    for index_y, row in ipairs(self.map) do
        for index_x, column in ipairs(row) do
            if row[index_x] ~= 0 then
                local quad = Tiles.ground.quads[row[index_x][1]][row[index_x][2]]
                if row[index_x][1] == 2 and row[index_x][2] == 5 then
                    love.graphics.draw(Tiles.ground.image,quad, 16 * index_x * 2 - 16 * 2 + 16, 16 * index_y * 2 - 16 * 2 + 16, self.rotation, 2,2,8,8)    
                else
                    love.graphics.draw(Tiles.ground.image,quad, 16 * index_x * 2 - 16 * 2, 16 * index_y * 2 - 16 * 2, 0, 2,2)    
                end
            end
        end
    end
end

tilemap.slurry = {}
tilemap.slurry.map = {
    {    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,{1,1},{1,3},},
    {    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,{1,1},{1,2},{5,2},{2,3},},
    {    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,{3,1},{4,2},{4,1},{3,3},},
    {    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,{2,1},{2,3},},
    {    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,{3,1},{3,3},},
    {    0,    0,{1,1},{1,2},{1,3},    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,},
    {    0,    0,{2,1},{2,2},{2,3},    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,},
    {    0,    0,{3,1},{3,2},{3,3},    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,},
    {    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,},
    {    0,    0,    0,    0,    0,    0,    0,    0,    0,},
    {    0,    0,    0,    0,    0,    0,    0,    0,    0,},
    {    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,},
    {    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,{1,1},{1,2},{1,2},{1,3},},
    {    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,{2,1},{2,2},{2,2},{5,1},{1,2},{1,2},{1,3},},
    {    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,{3,1},{3,2},{3,2},{3,2},{3,2},{3,2},{3,3},},
}
tilemap.slurry.draw = function (self)
    love.graphics.setDefaultFilter('nearest', 'nearest')
    for index_y, row in ipairs(self.map) do
        for index_x, column in ipairs(row) do
            if row[index_x] ~= 0 then
                local quad = Tiles.ground.quads[row[index_x][1]][row[index_x][2]]
                love.graphics.draw(Tiles.ground.image,quad, 16 * index_x * 2 - 16 * 2, 16 * index_y * 2 - 16 * 2, 0, 2,2)    
            end
        end
    end
end

tilemap.update = function (self,dt)
    self.water:update(dt)
end
tilemap.draw = function (self)
    self.grass:draw()
    self.water:draw()
    self.slurry:draw()

    self.trail:draw()
    self.tree:draw()
end

return tilemap