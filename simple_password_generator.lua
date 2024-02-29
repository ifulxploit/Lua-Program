-- Fungsi untuk menghasilkan kata sandi acak dengan panjang tertentu
local function generatePassword(length)
    local charset = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
    local password = ""
    math.randomseed(os.time()) -- Mengatur benih acak berdasarkan waktu sistem
    for i = 1, length do
        local randomIndex = math.random(1, #charset)
        password = password .. string.sub(charset, randomIndex, randomIndex)
    end
    return password
end

-- Fungsi untuk meminta pengguna memasukkan panjang kata sandi yang diinginkan
local function getPasswordLength()
    io.write("Masukkan panjang kata sandi yang diinginkan: ")
    return tonumber(io.read())
end

-- Fungsi utama untuk menjalankan program pembuat kata sandi sederhana
local function runSimplePasswordGenerator()
    local passwordLength = getPasswordLength()
    if passwordLength then
        local password = generatePassword(passwordLength)
        print("Kata Sandi Acak Anda:", password)
    else
        print("Panjang kata sandi yang dimasukkan tidak valid.")
    end
end

-- Jalankan program pembuat kata sandi sederhana
runSimplePasswordGenerator()
