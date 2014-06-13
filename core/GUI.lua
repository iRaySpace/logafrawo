local class = require 'libs.middleclass'

GUI = class('GUI')

function GUI:initialize()

    -- Stores the list of components to be used.
    self.components = {} 
    
    -- Functions in removing and adding a specific component.
    self.componentAdd = function(self, comp) table.insert(self.components, comp) end
    self.componentDelete = function(self, compID) table.remove(self.components, compID) end
    
end

function GUI:update(dt)
    
    for i, v in ipairs(self.components) do v:update(dt) end    
    
end

function GUI:draw()
   
   for i, v in ipairs(self.components) do v:draw() end
    
end