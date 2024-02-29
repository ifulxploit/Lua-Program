-- Fungsi untuk membuat papan permainan dengan ukuran tertentu dan inisialisasi sel dengan status acak
local function create_game_board(width, height)
    local board = {}
    for i = 1, height do
        board[i] = {}
        for j = 1, width do
            board[i][j] = math.random(0, 1) -- Status sel: 0 untuk mati, 1 untuk hidup
        end
    end
    return board
end

-- Fungsi untuk menampilkan papan permainan ke konsol
local function print_game_board(board)
    for i = 1, #board do
        local row = ""
        for j = 1, #board[i] do
            if board[i][j] == 1 then
                row = row .. "* " -- Tampilkan '*' untuk sel hidup
            else
                row = row .. ". " -- Tampilkan '.' untuk sel mati
            end
        end
        print(row)
    end
end

-- Fungsi untuk menghitung jumlah tetangga hidup untuk sel tertentu
local function count_live_neighbors(board, x, y)
    local count = 0
    local directions = { {-1, -1}, {-1, 0}, {-1, 1}, {0, -1}, {0, 1}, {1, -1}, {1, 0}, {1, 1} }
    for _, dir in ipairs(directions) do
        local dx, dy = dir[1], dir[2]
        local nx, ny = x + dx, y + dy
        if nx >= 1 and nx <= #board and ny >= 1 and ny <= #board[1] then
            if board[nx][ny] == 1 then
                count = count + 1
            end
        end
    end
    return count
end

-- Fungsi untuk mengupdate status sel berdasarkan aturan Game of Life
local function update_game_board(board)
    local new_board = {}
    for i = 1, #board do
        new_board[i] = {}
        for j = 1, #board[i] do
            local live_neighbors = count_live_neighbors(board, i, j)
            if board[i][j] == 1 then
                if live_neighbors < 2 or live_neighbors > 3 then
                    new_board[i][j] = 0 -- Sel mati karena underpopulation atau overpopulation
                else
                    new_board[i][j] = 1 -- Sel tetap hidup
                end
            else
                if live_neighbors == 3 then
                    new_board[i][j] = 1 -- Sel hidup karena reproduksi
                else
                    new_board[i][j] = 0 -- Sel tetap mati
                end
            end
        end
    end
    return new_board
end

-- Fungsi utama untuk menjalankan simulasi Game of Life
local function run_game_of_life(width, height, generations)
    local board = create_game_board(width, height)
    print("Generasi Awal:")
    print_game_board(board)
    for gen = 1, generations do
        os.execute("sleep 0.5") -- Jeda antara setiap generasi
        os.execute("clear") -- Bersihkan konsol
        print("Generasi " .. gen .. ":")
        board = update_game_board(board)
        print_game_board(board)
    end
end

-- Contoh penggunaan
local width = 10 -- Lebar papan permainan
local height = 10 -- Tinggi papan permainan
local generations = 20 -- Jumlah generasi yang akan disimulasikan
math.randomseed(os.time()) -- Inisialisasi seed acak berdasarkan waktu sistem
run_game_of_life(width, height, generations)
