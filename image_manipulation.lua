local gd = require("gd")

-- Fungsi untuk membalikkan gambar secara horizontal
local function flipHorizontal(inputFile, outputFile)
    local image = gd.createFromPng(inputFile)
    local width, height = image:sizeXY()

    local flippedImage = gd.createTrueColor(width, height)

    for y = 0, height - 1 do
        for x = 0, width - 1 do
            local color = image:getPixel(width - x - 1, y)
            flippedImage:setPixel(x, y, color)
        end
    end

    flippedImage:png(outputFile)
    print("Gambar berhasil dibalikkan secara horizontal.")
end

-- Fungsi untuk memotong gambar
local function cropImage(inputFile, outputFile, x, y, width, height)
    local image = gd.createFromPng(inputFile)
    local croppedImage = image:crop(x, y, width, height)
    croppedImage:png(outputFile)
    print("Gambar berhasil dipotong.")
end

-- Fungsi untuk mengubah ukuran gambar
local function resizeImage(inputFile, outputFile, newWidth, newHeight)
    local image = gd.createFromPng(inputFile)
    local resizedImage = image:copyResampled(newWidth, newHeight, 0, 0, image:sizeXY())
    resizedImage:png(outputFile)
    print("Gambar berhasil diubah ukurannya.")
end

-- Contoh penggunaan fungsi-fungsi di atas
flipHorizontal("input.png", "flipped.png")
cropImage("input.png", "cropped.png", 50, 50, 200, 200)
resizeImage("input.png", "resized.png", 300, 300)
