-- Import modul yang diperlukan
local utils = require "pl.utils"
local stringx = require "pl.stringx"

-- Fungsi untuk menghasilkan angka acak antara 1 dan 100
local function generate_random_number()
    return math.random(1, 100)
end

-- Fungsi untuk meminta pengguna menebak angka
local function guess_number(secret_number)
    print("Tebak angka antara 1 dan 100:")
    local guess = tonumber(io.read())
    if guess == secret_number then
        print("Selamat! Anda menebak dengan benar.")
        return true
    elseif guess < secret_number then
        print("Angka terlalu kecil. Coba lagi.")
    else
        print("Angka terlalu besar. Coba lagi.")
    end
    return false
end

-- Fungsi utama untuk menjalankan permainan
local function main()
    print("Selamat datang di Permainan Tebak Angka!")
    local secret_number = generate_random_number()
    local attempts = 0
    while true do
        attempts = attempts + 1
        if guess_number(secret_number) then
            break
        end
    end
    print("Total percobaan:", attempts)
    print("Terima kasih telah bermain.")
end

-- Menjalankan fungsi utama
main()
