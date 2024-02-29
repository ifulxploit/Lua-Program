-- Fungsi untuk menghitung total pengeluaran
local function calculateTotalExpenses(expenses)
    local total = 0
    for _, expense in ipairs(expenses) do
        total = total + expense
    end
    return total
end

-- Fungsi untuk menghitung persentase kenaikan atau penurunan nilai
local function calculatePercentageChange(initialValue, finalValue)
    local change = finalValue - initialValue
    local percentageChange = (change / initialValue) * 100
    return percentageChange
end

-- Fungsi untuk menghitung pembayaran pinjaman
local function calculateLoanPayment(loanAmount, annualInterestRate, loanTerm)
    local monthlyInterestRate = annualInterestRate / 12
    local numberOfPayments = loanTerm * 12
    local monthlyPayment = (loanAmount * monthlyInterestRate) / (1 - (1 + monthlyInterestRate) ^ -numberOfPayments)
    return monthlyPayment
end

-- Fungsi untuk menampilkan menu
local function displayMenu()
    print("==== Kalkulator Keuangan ====")
    print("1. Hitung Total Pengeluaran")
    print("2. Hitung Persentase Kenaikan atau Penurunan Nilai")
    print("3. Hitung Pembayaran Pinjaman")
    print("4. Keluar")
end

-- Fungsi untuk menjalankan kalkulator
local function runCalculator()
    while true do
        displayMenu()
        print("Masukkan pilihan:")
        local choice = tonumber(io.read())
        if choice == 1 then
            print("Masukkan daftar pengeluaran (pisahkan dengan koma):")
            local expenses = {}
            local input = io.read()
            for expense in string.gmatch(input, "([^,%s]+)") do
                table.insert(expenses, tonumber(expense))
            end
            local totalExpenses = calculateTotalExpenses(expenses)
            print("Total pengeluaran: $" .. totalExpenses)
        elseif choice == 2 then
            print("Masukkan nilai awal:")
            local initialValue = tonumber(io.read())
            print("Masukkan nilai akhir:")
            local finalValue = tonumber(io.read())
            local percentageChange = calculatePercentageChange(initialValue, finalValue)
            print("Persentase kenaikan atau penurunan nilai: " .. percentageChange .. "%")
        elseif choice == 3 then
            print("Masukkan jumlah pinjaman:")
            local loanAmount = tonumber(io.read())
            print("Masukkan tingkat bunga tahunan (persentase):")
            local annualInterestRate = tonumber(io.read()) / 100
            print("Masukkan jangka waktu pinjaman (tahun):")
            local loanTerm = tonumber(io.read())
            local monthlyPayment = calculateLoanPayment(loanAmount, annualInterestRate, loanTerm)
            print("Pembayaran bulanan: $" .. monthlyPayment)
        elseif choice == 4 then
            print("Terima kasih!")
            break
        else
            print("Pilihan tidak valid. Silakan coba lagi.")
        end
    end
end

-- Jalankan kalkulator
runCalculator()
