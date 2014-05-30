local class = require 'libs.middleclass'

Game = class('Game')

function Game:initialize(world)

	require 'core.Debug'
	require 'core.World'
	require 'core.Object'
	require 'core.Collision'

	-- Set the titles
	love.window.setTitle('default')
	self.setTitle = function(title) 
		love.window.setTitle('default')
	end
	-- Sets a reference to the window's width and height
	self.width = love.window.getWidth()
	self.height = love.window.getHeight()

	-- World configurations
	self.world = world or World:new()
	self.getWorld = function(self) return self.world end
	self.setWorld = function(self, world)
		self.world.worldChanged()
		self.world = world:new()
	end

	self.numOfWorldObjects = function(self) return self.world.objCounter end

	-- Update and Draw method
	self.update = function(self, dt) self.world:update(dt) end
	self.draw = function(self) self.world:draw() end

	-- Collision Handler
	self.collisionHandler = Collision:new()

	-- Debug
	self.debug = Debug:new()

end

-- Collision Detection
-- Calls the Collision Handler method
function Game:isCollide(o, p)

	local collide = self.collisionHandler.rectCollision(o, p)
	return collide

end