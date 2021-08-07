
-- local ground = love.graphics.newImage('assets/images/tiles/TileCraftGroundSet.png') -- 144x144px, grade 9x9, blocos de 16x16px
-- local ground_width = ground:getWidth()
-- local ground_height = ground:getHeight()
-- local ground_tile_width = ground_width /9
-- local ground_tile_height = ground_height /9

-- local tree = {}
-- tree.image = love.graphics.newImage('assets/images/tiles/trees18px.png') -- 18x108px, grade 1x3, blocos de 18x36px
-- tree.tile_x = 1
-- tree.tile_y = 3

-- local items = love.graphics.newImage('assets/images/tiles/items.png') -- 48x32px, grade 3x2, blocos de 16x16px
-- local items_width = items:getWidth()
-- local items_height = items:getHeight()
-- local items_tile_width = items_width /3
-- local items_tile_height = items_height /2


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

local tiles = {}
tiles.ground = {}
tiles.ground.image = love.graphics.newImage('assets/images/tiles/TileCraftGroundSet.png') -- 144x144px, grade 9x9, blocos de 16x16px
tiles.ground.quads = get_quads(tiles.ground.image, 9, 9)


tiles.tree = {}
tiles.tree.image = love.graphics.newImage('assets/images/tiles/trees18px.png') -- 18x108px, grade 1x3, blocos de 18x36px
tiles.tree.quads = get_quads(tiles.tree.image, 1, 3)




return tiles