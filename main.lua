-- Programa: Aula 5.5 - tilemaps, tilesets e animação
-- Autor: Michael Jordan S Chagas
-- Curso: Ciência da Computação - UFMT-CUA
-- Disclina: Design e Programação de Games (Opt)
-- Docente: Maxwell Silva Carmo
-- Data: 2021-08-06
-- Update: 2021-08-06
-- 
-- Este programa simula uma animação de jogo.
-------------------------------------------------------
local Display = require('display')
local Tilemap = require('tilemap')


function love.load()
    math.randomseed(os.time())

    -- Display:fullscreen()
    love.window.setMode(Display.width, Display.height, {
        fullscreen = Display.isFullScreen,
        resizable = true
    })

end

function love.update(dt)

    fps = love.timer.getFPS()
end

function love.draw()
    Tilemap:draw()
    -- love.graphics.print('FPS: ' .. fps, 10, 12)
end