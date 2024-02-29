-- Daftar putar musik
local playlist = {"Lagu 1", "Lagu 2", "Lagu 3", "Lagu 4", "Lagu 5"}

-- Status pemutaran musik
local isPlaying = false
local currentTrackIndex = 1

-- Fungsi untuk memutar lagu
local function playMusic()
    print("Memutar lagu:", playlist[currentTrackIndex])
    isPlaying = true
end

-- Fungsi untuk menjeda lagu
local function pauseMusic()
    print("Lagu dijeda")
    isPlaying = false
end

-- Fungsi untuk melanjutkan pemutaran lagu
local function resumeMusic()
    print("Melanjutkan pemutaran lagu:", playlist[currentTrackIndex])
    isPlaying = true
end

-- Fungsi untuk melompati lagu berikutnya
local function nextTrack()
    currentTrackIndex = currentTrackIndex + 1
    if currentTrackIndex > #playlist then
        currentTrackIndex = 1
    end
    print("Pindah ke lagu berikutnya:", playlist[currentTrackIndex])
end

-- Fungsi untuk melompati lagu sebelumnya
local function previousTrack()
    currentTrackIndex = currentTrackIndex - 1
    if currentTrackIndex < 1 then
        currentTrackIndex = #playlist
    end
    print("Pindah ke lagu sebelumnya:", playlist[currentTrackIndex])
end

-- Fungsi untuk menampilkan menu
local function displayMenu()
    print("==== Pemutar Musik ====")
    print("1. Putar")
    print("2. Jeda")
    print("3. Lanjutkan")
    print("4. Lagu Berikutnya")
    print("5. Lagu Sebelumnya")
    print("6. Keluar")
end

-- Fungsi untuk menjalankan pemutar musik
local function runMusicPlayer()
    while true do
        displayMenu()
        print("Masukkan pilihan:")
        local choice = tonumber(io.read())
        if choice == 1 then
            playMusic()
        elseif choice == 2 then
            pauseMusic()
        elseif choice == 3 then
            resumeMusic()
        elseif choice == 4 then
            nextTrack()
        elseif choice == 5 then
            previousTrack()
        elseif choice == 6 then
            print("Terima kasih!")
            break
        else
            print("Pilihan tidak valid. Silakan coba lagi.")
        end
    end
end

-- Jalankan pemutar musik
runMusicPlayer()
