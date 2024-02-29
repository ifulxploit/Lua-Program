-- Fungsi untuk mengonversi suhu dari Celsius ke Fahrenheit
local function celsiusToFahrenheit(celsius)
    return (celsius * 9 / 5) + 32
end

-- Fungsi untuk mengonversi suhu dari Fahrenheit ke Celsius
local function fahrenheitToCelsius(fahrenheit)
    return (fahrenheit - 32) * 5 / 9
end

-- Fungsi untuk menampilkan menu konversi
local function displayMenu()
    print("==== Konversi Suhu ====")
    print("1. Celsius ke Fahrenheit")
    print("2. Fahrenheit ke Celsius")
    print("3. Keluar")
end

-- Fungsi untuk menjalankan program konversi
local function runConverter()
    while true do
        displayMenu()
        print("Masukkan pilihan:")
        local choice = tonumber(io.read())
        if choice == 1 then
            print("Masukkan suhu dalam Celsius:")
            local celsius = tonumber(io.read())
            local fahrenheit = celsiusToFahrenheit(celsius)
            print(string.format("%.2f Celsius = %.2f Fahrenheit", celsius, fahrenheit))
        elseif choice == 2 then
            print("Masukkan suhu dalam Fahrenheit:")
            local fahrenheit = tonumber(io.read())
            local celsius = fahrenheitToCelsius(fahrenheit)
            print(string.format("%.2f Fahrenheit = %.2f Celsius", fahrenheit, celsius))
        elseif choice == 3 then
            print("Terima kasih!")
            break
        else
            print("Pilihan tidak valid. Silakan coba lagi.")
        end
    end
end

-- Jalankan program konversi
runConverter()
