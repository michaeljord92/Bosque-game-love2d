local Display = require('display')


local world = {}
world.state = "start"
world.point = 0

world.collides = function (entity1, entity2)
    if math.abs(math.modf(entity1.x) - math.modf(entity2.x)) < 1
    and math.abs( math.modf(entity1.y) - math.modf(entity2.y)) < 1 then
        return true
    end
    return false
end

world.mouseEntityAngle = function (entity)
    return math.atan2(love.mouse.getY()-entity.y, love.mouse.getX()-entity.x )
end

world.drawGround = function ()
    love.graphics.reset()
    love.graphics.setColor(0.3, 0.3, 0.1, 0.45)
    love.graphics.rectangle('fill', 0, 0, Display.width, Display.height)
    love.graphics.reset()
end

return world