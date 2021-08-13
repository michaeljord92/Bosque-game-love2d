local function get_quads(image, quads_x, quads_y)
    local quad_width = image:getWidth()/quads_x
    local quad_heigth = image:getHeight()/quads_y
    local quads = {}
    
    for row = 0,quads_y-1 do
        table.insert(quads, {})
        for column = 0,quads_x-1 do
            quad = love.graphics.newQuad(
                column * quad_width, row * quad_heigth, 
                quad_width, quad_heigth, 
                image:getWidth(), image:getHeight())
            table.insert(quads[row+1], quad)
        end
    end
    return quads
end

local sprite = {}
sprite.scoreboard = love.graphics.newImage('assets/images/sprites/grey_button15.png')

sprite.player = {}
sprite.player.image = love.graphics.newImage('assets/images/sprites/warrior_m.png') -- 96x144px, grade 3x4, blocos de 32x36px
sprite.player.quads = get_quads(sprite.player.image, 3, 4)

return sprite