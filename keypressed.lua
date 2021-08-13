local States = require('states')
local World = require('world')
local Entities = require('entities')


local key_map = {
    -- Dar player no jogo ou atira
    space = function ()

        -- Dar player no jogo
        if World.state == "pause" then
            World.state = "play"
        
        -- Reinicia o jogo
        elseif World.state == "failed" or World.state == "win" then
            World.state = "start"
        
        -- Inicia o jogo
        elseif  World.state == "start" then      
            for key, _ in pairs(Entities) do
                if Entities[key].init then
                    Entities[key]:init()
                end
            end 
            World.state = "play"
        end

    end,
    
    -- Pausa ou sai do jogo
    escape = function ()
        -- Pausa o jogo 
        if World.state == "play" then
            World.state = "pause"
        
        -- Sai do jogo
        else
            States.sair()
        end
    end,

    -- Move o player
    -- w = function ()
    --     if World.state == "play" then
    --         Entities.player.entitie:up()
    --     end
    -- end,
    -- s = function ()
    --     if World.state == "play" then
    --         Entities.player.entitie:down()
    --     end
    -- end,
    -- a = function ()
    --     if World.state == "play" then
    --         Entities.player.entitie:left()
    --     end
    -- end,
    -- d = function ()
    --     if World.state == "play" then
    --         Entities.player.entitie:right()
    --     end
    -- end,
}

return key_map