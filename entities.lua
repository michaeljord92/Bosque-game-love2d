local Tilemap = require('tilemap')
local Player = require('entities/player')


local entities = {}
entities.tilemap = Tilemap

entities.player = {
    entitie = Player(),
    update = function (self,dt)
        self.entitie:update(dt)        
    end,
    draw = function (self)
        self.entitie:draw()        
    end
}

return entities