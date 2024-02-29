-- Tabel untuk menyimpan data pemain
local players = {}

-- Fungsi untuk menambahkan pemain baru atau mengupdate skor pemain yang sudah ada
local function add_player(name, score)
    if players[name] then
        -- Jika pemain sudah ada, update skornya
        players[name].score = players[name].score + score
    else
        -- Jika pemain belum ada, tambahkan ke dalam tabel
        players[name] = { score = score }
    end
end

-- Fungsi untuk menampilkan skor pemain
local function display_scores()
    print("Daftar Skor Pemain:")
    for name, data in pairs(players) do
        print(name .. ": " .. data.score)
    end
end

-- Fungsi untuk menampilkan skor tertinggi
local function display_highest_score()
    local highest_score = 0
    local highest_player = ""

    for name, data in pairs(players) do
        if data.score > highest_score then
            highest_score = data.score
            highest_player = name
        end
    end

    print("Skor Tertinggi: " .. highest_player .. " (" .. highest_score .. ")")
end

-- Fungsi untuk menampilkan statistik pemain
local function display_player_statistics(name)
    local player = players[name]

    if not player then
        print("Pemain tidak ditemukan.")
    else
        print("Statistik Pemain " .. name .. ":")
        print("Skor: " .. player.score)
        -- Tambahkan statistik lain yang diinginkan di sini
    end
end

-- Contoh penggunaan
add_player("Player 1", 100)
add_player("Player 2", 150)
add_player("Player 1", 50)

display_scores()
display_highest_score()
display_player_statistics("Player 1")
