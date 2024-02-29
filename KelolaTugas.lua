-- Inisialisasi daftar tugas
local tasks = {}

-- Fungsi untuk menampilkan menu
local function displayMenu()
    print("==== Pengelola Tugas ====")
    print("1. Tampilkan Daftar Tugas")
    print("2. Tambah Tugas Baru")
    print("3. Edit Tugas")
    print("4. Hapus Tugas")
    print("5. Tandai Selesai")
    print("6. Keluar")
end

-- Fungsi untuk menampilkan daftar tugas
local function displayTasks()
    print("==== Daftar Tugas ====")
    for i, task in ipairs(tasks) do
        print(i .. ". " .. task.name .. " - " .. (task.done and "Selesai" or "Belum Selesai"))
    end
end

-- Fungsi untuk menambah tugas baru
local function addTask()
    print("Masukkan nama tugas baru:")
    local name = io.read()
    table.insert(tasks, {name = name, done = false})
    print("Tugas '" .. name .. "' berhasil ditambahkan.")
end

-- Fungsi untuk mengedit tugas
local function editTask()
    displayTasks()
    print("Pilih nomor tugas yang ingin diedit:")
    local index = tonumber(io.read())
    if tasks[index] then
        print("Masukkan nama tugas baru:")
        local newName = io.read()
        tasks[index].name = newName
        print("Tugas berhasil diubah.")
    else
        print("Tugas tidak ditemukan.")
    end
end

-- Fungsi untuk menghapus tugas
local function deleteTask()
    displayTasks()
    print("Pilih nomor tugas yang ingin dihapus:")
    local index = tonumber(io.read())
    if tasks[index] then
        table.remove(tasks, index)
        print("Tugas berhasil dihapus.")
    else
        print("Tugas tidak ditemukan.")
    end
end

-- Fungsi untuk menandai tugas sebagai selesai
local function markAsDone()
    displayTasks()
    print("Pilih nomor tugas yang ingin ditandai sebagai selesai:")
    local index = tonumber(io.read())
    if tasks[index] then
        tasks[index].done = true
        print("Tugas berhasil ditandai sebagai selesai.")
    else
        print("Tugas tidak ditemukan.")
    end
end

-- Fungsi untuk menjalankan aplikasi
local function run()
    while true do
        displayMenu()
        print("Masukkan pilihan:")
        local choice = tonumber(io.read())
        if choice == 1 then
            displayTasks()
        elseif choice == 2 then
            addTask()
        elseif choice == 3 then
            editTask()
        elseif choice == 4 then
            deleteTask()
        elseif choice == 5 then
            markAsDone()
        elseif choice == 6 then
            print("Terima kasih!")
            break
        else
            print("Pilihan tidak valid. Silakan coba lagi.")
        end
    end
end

-- Jalankan aplikasi
run()
