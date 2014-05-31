local class = require 'libs.middleclass'

World = class('World')

function World:initialize(name)

	-- Set the default
	self.name = name or 'default'

	self.callback = function() end

	-- Objects handler
	self.objCounter = 0
	self.objects = {}
	self.addObject = function(self, object)
		self.objCounter = self.objCounter + 1
		table.insert(self.objects, object) 
		self.callback()
	end
	self.removeObject = function(self, object)
		self.objCounter = self.objCounter - 1
		table.remove(self.objects, object.id)
		object:destroy() 
		self.callback()
	end

	-- Update and Draw method
	self.update = function(self, dt) for i, v in ipairs(self.objects) do v:update(dt) end end
	self.draw = function(self) for i, v in ipairs(self.objects) do v:draw() end end	

	-- Override the following methods if you want to add functionality
	self.worldStarted = function(self) print('World started!') end
	self.worldChanged = function(self)

		for k, v in pairs(self) do v = nil end

		self = nil

		print('World changed!') 

	end

	-- Calling the worldStarted method
	self.worldStarted()

end