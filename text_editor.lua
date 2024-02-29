-- Fungsi untuk membaca isi file
local function read_file(filename)
    local file = io.open(filename, "r")
    if file then
        local content = file:read("*all")
        file:close()
        return content
    end
    return nil
end

-- Fungsi untuk menulis ke file
local function write_to_file(filename, content)
    local file = io.open(filename, "w")
    if file then
        file:write(content)
        file:close()
        return true
    end
    return false
end

-- Fungsi untuk menampilkan pesan pada layar
local function print_message(message)
    print(message)
end

-- Fungsi utama untuk menjalankan editor teks
local function run_text_editor(filename)
    local content = read_file(filename) or ""
    print_message("Selamat datang di Editor Teks Sederhana!")
    print_message("Gunakan perintah ':q' untuk keluar, ':w' untuk menyimpan, dan ':wq' untuk menyimpan dan keluar.")
    print_message("Mulai mengedit '" .. filename .. "'")
    print_message("--------------------------------------------------")

    while true do
        io.write(content)
        local input = io.read()

        -- Periksa perintah khusus
        if input == ":q" then
            break
        elseif input == ":w" then
            if write_to_file(filename, content) then
                print_message("Berhasil menyimpan ke '" .. filename .. "'")
            else
                print_message("Gagal menyimpan ke '" .. filename .. "'")
            end
        elseif input == ":wq" then
            if write_to_file(filename, content) then
                print_message("Berhasil menyimpan ke '" .. filename .. "'")
            else
                print_message("Gagal menyimpan ke '" .. filename .. "'")
            end
            break
        else
            -- Tambahkan input pengguna ke konten
            content = content .. input .. "\n"
        end
    end

    print_message("Terima kasih telah menggunakan Editor Teks Sederhana!")
end

-- Contoh penggunaan
local filename = "example.txt"
run_text_editor(filename)
