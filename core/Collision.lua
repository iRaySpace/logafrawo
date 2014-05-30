local class = require 'libs.middleclass'

Collision = class('Collision')

function Collision:initialize()

	-- Rectangle collision or bounding box collision!
	self.rectCollision = function(o, p)
		if o.x < p.x + p.width and o.x + o.width > p.x and o.y < p.y + p.height and o.y + o.height > p.y then return true end
	end


end