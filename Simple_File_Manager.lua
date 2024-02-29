local pl_file = require "pl.file"
local pl_path = require "pl.path"

local function createFile(filename)
    if not pl_path.exists(filename) then
        pl_file.write(filename, "")
        print("File created:", filename)
    else
        print("File already exists:", filename)
    end
end

local function readFile(filename)
    if pl_path.exists(filename) then
        local content = pl_file.read(filename)
        print("File content:")
        print(content)
    else
        print("File does not exist:", filename)
    end
end

local function writeFile(filename, content)
    if pl_path.exists(filename) then
        pl_file.write(filename, content)
        print("File updated:", filename)
    else
        print("File does not exist:", filename)
    end
end

-- Contoh penggunaan
local filename = "example.txt"
createFile(filename)
writeFile(filename, "Hello, Lua!")
readFile(filename)
