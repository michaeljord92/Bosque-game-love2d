local Tilemap = require('tilemap')
local Player = require('entities/player')
local Ninja = require('entities/ninja')
local World = require('world')



local entities = {}
entities.tilemap = Tilemap

entities.player = {
    entitie = Player(),
    init = function (self)
        self.entitie.x = 2
        self.entitie.y = 1
        self.entitie.rotation = math.pi * 0
        self.entitie.status = "play"
    end,
    update = function (self,dt)
        self.entitie:update(dt)        
    end,
    draw = function (self)
        self.entitie:draw()        
    end
}

entities.ninja_A = {
    direction = false,
    x1 = 7,
    x2 = 12,
    timerLimit = 1,
    timer = 1,

    entitie = Ninja(9,4),
    init = function (self)
        self.entitie.x = 9
        self.entitie.y = 4
    end,
    update = function (self,dt)
        if World.collides(self.entitie, entities.player.entitie) then
            World.state = "failed"
        end
        self.timer = self.timer - dt
        if self.timer <= 0 then
            if self.direction then
                self.entitie:right(dt)
                if self.entitie.x >= self.x2 then
                    self.direction = not self.direction
                end
            else
                self.entitie:left(dt)
                if self.entitie.x <= self.x1+1 then
                    self.direction = not self.direction
                end
            end
            self.timer = self.timerLimit
        end
        if self.entitie.x <= self.x1+1 or self.entitie.x >= self.x2 then
            self.direction = not self.direction
        end

        self.entitie:update(dt)   
    end,
    draw = function (self)
        self.entitie:draw()        
    end
}

-- entities.ninja_B = {
--     direction = false,
--     x1 = 6,
--     x2 = 12,
--     timerLimit = 1,
--     timer = 1,

--     entitie = Ninja(9,14),

--     update = function (self,dt)
--         self.timer = self.timer - dt
--         if self.timer <= 0 then
--             if self.direction then
--                 self.entitie:right(dt)
--                 if self.entitie.x >= self.x2 then
--                     self.direction = not self.direction
--                 end
--             else
--                 self.entitie:left(dt)
--                 if self.entitie.x <= self.x1+1 then
--                     self.direction = not self.direction
--                 end
--             end
--             self.timer = self.timerLimit
--         end
--         if self.entitie.x <= self.x1+1 or self.entitie.x >= self.x2 then
--             self.direction = not self.direction
--         end

--         self.entitie:update(dt)   
--     end,
--     draw = function (self)
--         self.entitie:draw()        
--     end
-- }

entities.ninja_C = {
    direction = false,
    x1 = 19,
    x2 = 22,
    timerLimit = 1,
    timer = 1,

    entitie = Ninja(20,8),
    init = function (self)
        self.entitie.x = 20
        self.entitie.y = 8
    end,
    update = function (self,dt)
        if World.collides(self.entitie, entities.player.entitie) then
            World.state = "failed"
        end

        self.timer = self.timer - dt
        if self.timer <= 0 then
            if self.direction then
                self.entitie:right(dt)
                if self.entitie.x >= self.x2 then
                    self.direction = not self.direction
                end
            else
                self.entitie:left(dt)
                if self.entitie.x <= self.x1+1 then
                    self.direction = not self.direction
                end
            end
            self.timer = self.timerLimit
        end
        if self.entitie.x <= self.x1+1 or self.entitie.x >= self.x2 then
            self.direction = not self.direction
        end

        self.entitie:update(dt)   
    end,
    draw = function (self)
        self.entitie:draw()        
    end
}

return entities