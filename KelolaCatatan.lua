-- Inisialisasi daftar catatan
local notes = {}

-- Fungsi untuk menampilkan menu
local function displayMenu()
    print("==== Pembuat Catatan ====")
    print("1. Tampilkan Catatan")
    print("2. Tambah Catatan Baru")
    print("3. Edit Catatan")
    print("4. Hapus Catatan")
    print("5. Keluar")
end

-- Fungsi untuk menampilkan catatan
local function displayNotes()
    print("==== Daftar Catatan ====")
    for i, note in ipairs(notes) do
        print(i .. ". " .. note)
    end
end

-- Fungsi untuk menambah catatan baru
local function addNote()
    print("Masukkan isi catatan baru:")
    local content = io.read()
    table.insert(notes, content)
    print("Catatan baru berhasil ditambahkan.")
end

-- Fungsi untuk mengedit catatan
local function editNote()
    displayNotes()
    print("Pilih nomor catatan yang ingin diedit:")
    local index = tonumber(io.read())
    if notes[index] then
        print("Masukkan isi catatan baru:")
        local newContent = io.read()
        notes[index] = newContent
        print("Catatan berhasil diubah.")
    else
        print("Catatan tidak ditemukan.")
    end
end

-- Fungsi untuk menghapus catatan
local function deleteNote()
    displayNotes()
    print("Pilih nomor catatan yang ingin dihapus:")
    local index = tonumber(io.read())
    if notes[index] then
        table.remove(notes, index)
        print("Catatan berhasil dihapus.")
    else
        print("Catatan tidak ditemukan.")
    end
end

-- Fungsi untuk menjalankan aplikasi
local function run()
    while true do
        displayMenu()
        print("Masukkan pilihan:")
        local choice = tonumber(io.read())
        if choice == 1 then
            displayNotes()
        elseif choice == 2 then
            addNote()
        elseif choice == 3 then
            editNote()
        elseif choice == 4 then
            deleteNote()
        elseif choice == 5 then
            print("Terima kasih!")
            break
        else
            print("Pilihan tidak valid. Silakan coba lagi.")
        end
    end
end

-- Jalankan aplikasi
run()
