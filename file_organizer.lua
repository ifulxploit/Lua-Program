-- Fungsi untuk mengambil semua file dalam direktori
local function get_files_in_directory(directory)
    local files = {}
    for file in io.popen('ls "' .. directory .. '"'):lines() do
        table.insert(files, file)
    end
    return files
end

-- Fungsi untuk mendapatkan ekstensi file
local function get_extension(file)
    return file:match("%.([^%.]+)$")
end

-- Fungsi untuk membuat folder jika belum ada
local function create_folder_if_not_exists(folder)
    local command = '[ -d "' .. folder .. '" ] || mkdir "' .. folder .. '"'
    os.execute(command)
end

-- Fungsi untuk memindahkan file ke folder berdasarkan ekstensinya
local function organize_files(directory)
    local files = get_files_in_directory(directory)

    for _, file in ipairs(files) do
        local extension = get_extension(file)
        if extension then
            local destination_folder = directory .. "/" .. extension
            create_folder_if_not_exists(destination_folder)
            local command = 'mv "' .. directory .. '/' .. file .. '" "' .. destination_folder .. '"'
            os.execute(command)
            print("File '" .. file .. "' dipindahkan ke folder '" .. extension .. "'")
        end
    end
end

-- Contoh penggunaan
local directory_to_organize = "/path/to/directory"
organize_files(directory_to_organize)
