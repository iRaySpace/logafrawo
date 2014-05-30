local class = require 'libs.middleclass'

Object = class('Object')

Object.static.counter = 0

local function _counter()
	Object.counter = Object.counter + 1
end

-- Treated as ABSTRACT class
function Object:initialize(kind, x, y, width, height)

	-- Initialize things
	self.id = _counter()

	self.x = x or 0
	self.y = y or 0

	self.velocity = {}
	self.velocity.x = 0
	self.velocity.y = 0

	self.speed = 0
	self.rotation = 0

	self.width = width or 0
	self.height = height or 0

	self.frameWidth = self.width
	self.frameHeight = self.height

	self.type = kind or 'default'

	-- Update and draw methods
	self.update = function(self, dt) end
	self.draw = function(self) end

	self.destroy = function(self) for k, v in pairs(self) do v = nil end end

end