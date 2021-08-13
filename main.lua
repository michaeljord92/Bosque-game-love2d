-- Programa: Aula 5.9 - tilemaps, tilesets e animação
-- Autor: Michael Jordan S Chagas
-- Curso: Ciência da Computação - UFMT-CUA
-- Disclina: Design e Programação de Games (Opt)
-- Docente: Maxwell Silva Carmo
-- Data: 2021-08-06
-- Update: 2021-08-13
-- 
-- Este programa simula um jogo RPG  de caminhar 
-- por um bosque evitando contato com os inimigos.
-- Os comandos e controles do jogador são:
--      - mover para cima:      'w'
--      - mover para baixo:     's'
--      - mover para esquerda:  'a'
--      - mover para direita:   'd'
-------------------------------------------------------
local Display = require('display')
local States = require('states')
local Keypressed = require('keypressed')
local World = require('world')


function love.load()
    math.randomseed(os.time())

    -- Display:fullscreen()
    love.window.setMode(Display.width, Display.height, {
        fullscreen = Display.isFullScreen,
        resizable = true
    })

end

function love.update(dt)
    if States[World.state] then
        States[World.state].update(dt) 
    end

    fps = love.timer.getFPS()
end

function love.draw()
    if States[World.state] then
        States[World.state].draw() 
    end 
    -- love.graphics.print('FPS: ' .. fps, 10, 12)
end

function love.keypressed(key)
    if Keypressed[key] then
        Keypressed[key]()
    end
end