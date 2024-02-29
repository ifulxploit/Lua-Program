-- Import pl.class and pl.meta libraries
local class = require "pl.class"
local meta = require "pl.class".meta

-- Define a base class
BaseClass = class()

-- Define methods for the base class
function BaseClass:_init()
    print("BaseClass constructor called")
end

function BaseClass:baseMethod()
    print("BaseClass method called")
end

-- Define a derived class inheriting from the base class
DerivedClass = class(BaseClass)

-- Define methods for the derived class
function DerivedClass:_init()
    print("DerivedClass constructor called")
end

function DerivedClass:derivedMethod()
    print("DerivedClass method called")
end

-- Create instances of the classes and call their methods
local baseObj = BaseClass()
baseObj:baseMethod()

local derivedObj = DerivedClass()
derivedObj:baseMethod()
derivedObj:derivedMethod()
