-- Daftar respons yang telah ditentukan sebelumnya
local responses = {
    ["hai"] = "Halo! Ada yang bisa saya bantu?",
    ["apa kabar?"] = "Saya hanya bot, jadi saya tidak punya perasaan. Bagaimana dengan Anda?",
    ["selamat pagi"] = "Selamat pagi! Ada yang bisa saya bantu?",
    ["selamat siang"] = "Selamat siang! Ada yang bisa saya bantu?",
    ["selamat malam"] = "Selamat malam! Ada yang bisa saya bantu?",
    ["terima kasih"] = "Sama-sama. Ada lagi yang bisa saya bantu?",
    ["bye"] = "Sampai jumpa lagi! Semoga harimu menyenangkan."
}

-- Fungsi untuk menemukan respons yang sesuai berdasarkan input pengguna
local function findResponse(input)
    input = string.lower(input) -- Mengubah input menjadi huruf kecil
    for key, value in pairs(responses) do
        if string.find(input, key) then
            return value
        end
    end
    return "Maaf, saya tidak mengerti pertanyaan Anda."
end

-- Fungsi utama untuk menjalankan program chatbot sederhana
local function runSimpleChatbot()
    print("Halo! Saya adalah chatbot sederhana. Silakan ajukan pertanyaan atau ucapkan sesuatu kepada saya.")
    while true do
        io.write("Anda: ")
        local userInput = io.read()
        if userInput then
            local response = findResponse(userInput)
            print("Bot: " .. response)
        else
            print("Bot: Maaf, saya tidak bisa mendengar apa yang Anda katakan.")
        end
    end
end

-- Jalankan program chatbot sederhana
runSimpleChatbot()
