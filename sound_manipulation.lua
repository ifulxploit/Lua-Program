local sdl = require("SDL")

-- Fungsi untuk memutar suara
local function playSound(soundFile)
    sdl.init(sdl.INIT_AUDIO)
    sdl.mixer.openAudio(44100, sdl.mixer.DEFAULT_FORMAT, 2, 1024)
    local chunk = sdl.mixer.loadWAV(soundFile)
    sdl.mixer.allocateChannels(1)
    sdl.mixer.playChannel(-1, chunk, 0)
    sdl.delay(chunk:getLength() * 1000)
    sdl.mixer.closeAudio()
end

-- Fungsi untuk mengubah volume suara
local function changeVolume(soundFile, volume)
    sdl.init(sdl.INIT_AUDIO)
    sdl.mixer.openAudio(44100, sdl.mixer.DEFAULT_FORMAT, 2, 1024)
    local chunk = sdl.mixer.loadWAV(soundFile)
    sdl.mixer.allocateChannels(1)
    sdl.mixer.volume(0, volume)
    sdl.mixer.playChannel(-1, chunk, 0)
    sdl.delay(chunk:getLength() * 1000)
    sdl.mixer.closeAudio()
end

-- Fungsi untuk menunda pemutaran suara
local function delaySound(soundFile, delayTime)
    sdl.init(sdl.INIT_AUDIO)
    sdl.mixer.openAudio(44100, sdl.mixer.DEFAULT_FORMAT, 2, 1024)
    local chunk = sdl.mixer.loadWAV(soundFile)
    sdl.mixer.allocateChannels(1)
    sdl.delay(delayTime)
    sdl.mixer.playChannel(-1, chunk, 0)
    sdl.delay(chunk:getLength() * 1000)
    sdl.mixer.closeAudio()
end

-- Contoh penggunaan fungsi-fungsi di atas
playSound("sample.wav")
changeVolume("sample.wav", 50) -- Volume 50%
delaySound("sample.wav", 1000) -- Menunda pemutaran selama 1 detik
