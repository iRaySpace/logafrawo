local class = require 'libs.middleclass'

Debug = class('Debug')

function Debug:initialize(game)

	-- Debug mode defaults to false
	self.enabled = false

	-- Making a reference to the game
	self.game = game

	-- Counters
	self.objectsCounter = self.game:numOfWorldObjects()

end

function Debug:update(dt)


end

function Debug:draw()

	love.graphics.print('Objects: ' .. self.objectsCounter, 0, 0)
	love.graphics.print('FPS: ' .. tostring(love.timer.getFPS()), 0, 16)

end

function Debug:updateC()
	self.objectsCounter = self.game:numOfWorldObjects()
end