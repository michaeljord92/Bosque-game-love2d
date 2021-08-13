local Sprite = require('sprite')
local Tilemap = require('tilemap')


---
---Criar um novo [player].
---
---@param x number # Posicao no eixo x.
---@param y number # Posicao no eixo y.
---@param sprite love.Image # Imagem do [player].
---@return table table # O [player] novo.
return function (x, y, sprite)
    local entity = {}
    entity.x = x or 2
    entity.y = y or 1
    entity.sprite = sprite or Sprite.player
    entity.quad = {3,2}
    entity.speed = 1 * 5
    entity.rotation = math.pi * 0.5
    entity.radius = 19
    entity.status = "play"
    entity.timerLimit = 0.2
    entity.timer = 0.2

    entity.up = function (self,dt)
        local map = Tilemap.trail.map
        local x = math.modf(self.x + 0.4)
        local y = math.modf(self.y - 0.1)

        -- if map[y-1] ~= nil then
        --     if map[y-1][x] ~= nil and map[y-1][x] ~= 0 then
        --         self.y = self.y - self.speed
        --     end
        -- end
        if map[y-1] ~= nil then
            if map[y-1][x] ~= nil and map[y-1][x] ~= 0 then
                self.y = self.y - self.speed * dt
            elseif  self.y + 1 > 2  then  
                if map[y+1][x] ~= nil and map[y+1][x] ~= 0 then
                    self.y = self.y - self.speed * dt
                    
                    if self.y + 1 <= y then
                        self.y = y 
                    end
                end
            end
        elseif  self.y + 1 > 2  then
            if map[y+1][x] ~= nil and map[y+1][x] ~= 0 then
                self.y = self.y - self.speed * dt
                
                if self.y + 1 < y + 1 then
                    self.y = y
                end
            end
        elseif self.y > 1 then  
            if map[y][x] ~= nil and map[y][x] ~= 0 then
                if self.y - self.speed * dt >= 1 then
                    self.y = self.y - self.speed * dt
                end
                if self.y < 1 then
                    self.y = 1
                end
            elseif  self.y + 1 >= y  then   
                if map[y+1][x] ~= nil and map[y+1][x] ~= 0 then
                    self.y = self.y - self.speed * dt
                    
                    if self.y + 1 <= y then
                        self.y = y
                    end
                end
            end
        end

        
        
        self.rotation = math.pi * 1.5
    end
    entity.down = function (self,dt)
        local map = Tilemap.trail.map
        local x = math.modf(self.x + 0.4)
        local y = math.modf(self.y)
        local map_hy = 0

        -- if map[y+1] ~= nil then
        --     if map[y + 1][x] ~= 0 and map[y + 1][x] ~= nil then
        --         self.y = self.y + self.speed
        --     end
        -- end
        for _,_ in pairs(map) do
            map_hy = map_hy + 1
        end
        if map[y+1] ~= nil and self.y + self.speed * dt < map_hy then
            if map[y + 1][x] ~= 0 and map[y + 1][x] ~= nil then
                self.y = self.y + self.speed * dt
                if map[math.modf(self.y)+1][x] == nil or map[math.modf(self.y)+1][x] == 0 or self.x < 1 then
                    self.y = self.y - self.speed * dt
                end
            end
        end
        
        self.rotation = math.pi * 0.5
    end
    entity.left = function (self,dt)
        local map = Tilemap.trail.map
        local x = math.modf(self.x)
        local y = math.modf(self.y+1)

        -- if map[y] ~= nil then
        --     if map[y][x-1] ~= 0 and map[y][x-1] ~= nil then
        --         self.x = self.x - self.speed
        --     end
        -- end

        if map[y] ~= nil then
            if map[y][x-1] ~= 0 and map[y][x-1] ~= nil then
                self.x = self.x - self.speed * dt
            elseif self.x > x then
                self.x = self.x - self.speed * dt
            end

            if map[y][math.modf(self.x)] == nil or map[y][math.modf(self.x)] == 0 or self.x < 1 then
                self.x = x
            end
        end

        
        
        
        self.rotation = math.pi * 1
    end
    entity.right = function (self,dt)
        local map = Tilemap.trail.map
        local x = math.modf(self.x+0.5)
        local y = math.modf(self.y+1)

        -- if map[y] ~= nil then
        --     if map[y][x+1] ~= 0 and map[y][x+1] ~= nil then
        --         self.x = self.x + self.speed
        --     end
        -- end

        if map[y] ~= nil then
            if map[y][x+1] ~= 0 and map[y][x+1] ~= nil then
                self.x = self.x + self.speed * dt
            elseif self.x + 0.5 <= x+1 then
                self.x = self.x + self.speed * dt
                if self.x + 0.5 > x+1 then
                    self.x = x+0.5
                end
            end
            if map[y][math.modf(self.x)] == nil or map[y][math.modf(self.x)] == 0 then
                self.x = self.x - self.speed * dt
            end
        end

        self.rotation = math.pi * 0
    end

    entity.update = function (self, dt)

        if love.keyboard.isDown('w') then
            self.timer = self.timer - dt
            self:up(dt)
        end
        if love.keyboard.isDown('s') then
            self.timer = self.timer - dt
            self:down(dt)
        end
        if love.keyboard.isDown('a') then
            self.timer = self.timer - dt
            self:left(dt)
        end
        if love.keyboard.isDown('d') then
            self.timer = self.timer - dt
            self:right(dt)
        end
        if self.timer <= 0 then
            self.quad[2] = math.fmod(self.quad[2],3)+1
            self.timer = self.timerLimit
        end

        local x = math.modf(self.x+0.5)
        local y = math.modf(self.y+1)
        if x == 26 and y == 1 then
            -- win
            self.status = "win"
        end

        if self.rotation == math.pi * 1.5 then
            self.quad[1] = 1
        elseif self.rotation == math.pi * 0.5 then
            self.quad[1] = 3
        elseif self.rotation == math.pi * 1 then
            self.quad[1] = 4
        elseif self.rotation == math.pi * 0 then
            self.quad[1] = 2
        end
        
        -- self.rotation = World.mouseEntityAngle(self)
    end

    entity.draw = function (self) 
        love.graphics.reset()
        love.graphics.setDefaultFilter('nearest', 'nearest')
        -- love.graphics.draw(
        --     self.sprite, 
        --     self.x, self.y, -- posição
        --     self.rotation,  -- rotação
        --     nil, nil, -- escala
        --     self.sprite:getWidth()/2, -- centro no eixo x
        --     self.sprite:getHeight()/2 -- centro no eixo y
        -- )
        love.graphics.draw(
            self.sprite.image   -- imagem
            ,self.sprite.quads[self.quad[1]][self.quad[2]] -- recorte da imagem
            ,32 * self.x -32, 32 * self.y -32 -- posição
            ,0 -- rotação
            -- ,0.8 ,0.8    -- escala
        )    
        -- love.graphics.circle('line', 32 * self.x -16, 32 * self.y -16, self.radius)
        love.graphics.reset()
    end

    return entity
end