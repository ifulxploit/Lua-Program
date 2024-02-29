-- Modul untuk mengambil data cuaca dari layanan web
local http = require("socket.http")
local json = require("json")

-- Fungsi untuk mengambil data cuaca dari layanan web
local function getWeatherData(city)
    local url = "http://api.openweathermap.org/data/2.5/weather?q=" .. city .. "&appid=YOUR_API_KEY"
    local response, status = http.request(url)
    if status == 200 then
        return json.decode(response)
    else
        return nil
    end
end

-- Fungsi untuk menampilkan informasi cuaca
local function showWeatherInfo(weatherData)
    if weatherData then
        print("Perkiraan Cuaca untuk", weatherData.name)
        print("Suhu:", weatherData.main.temp, "K")
        print("Kelembaban Udara:", weatherData.main.humidity, "%")
        print("Perkiraan Cuaca:", weatherData.weather[1].description)
    else
        print("Gagal mendapatkan data cuaca.")
    end
end

-- Fungsi untuk menjalankan program aplikasi cuaca lokal
local function runWeatherApp()
    print("Selamat datang di Aplikasi Cuaca Lokal")
    print("Masukkan nama kota Anda:")
    local city = io.read()

    -- Mendapatkan data cuaca untuk kota yang dimasukkan pengguna
    local weatherData = getWeatherData(city)
    -- Menampilkan informasi cuaca
    showWeatherInfo(weatherData)
end

-- Jalankan program aplikasi cuaca lokal
runWeatherApp()
