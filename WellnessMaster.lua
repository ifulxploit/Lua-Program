-- Library untuk manajemen data kesehatan
local healthData = {
    weight = 0,         -- Berat badan
    bloodPressure = {   -- Tekanan darah
        systolic = 0,   -- Tekanan darah sistolik
        diastolic = 0   -- Tekanan darah diastolik
    },
    heartRate = 0,      -- Detak jantung per menit
    sleepQuality = 0    -- Kualitas tidur (skala 1-10)
}

-- Fungsi untuk merekam data kesehatan
local function recordHealthData(weight, bloodPressureSystolic, bloodPressureDiastolic, heartRate, sleepQuality)
    healthData.weight = weight
    healthData.bloodPressure.systolic = bloodPressureSystolic
    healthData.bloodPressure.diastolic = bloodPressureDiastolic
    healthData.heartRate = heartRate
    healthData.sleepQuality = sleepQuality
end

-- Fungsi untuk mengevaluasi kesehatan
local function evaluateHealth()
    -- Logika evaluasi kesehatan
    -- ...
end

-- Fungsi untuk memberikan rekomendasi kesehatan
local function provideHealthRecommendations()
    -- Logika memberikan rekomendasi kesehatan
    -- ...
end

-- Fungsi untuk menampilkan data kesehatan
local function displayHealthData()
    -- Menampilkan data kesehatan ke pengguna
    print("Data Kesehatan:")
    print("Berat Badan:", healthData.weight)
    print("Tekanan Darah Sistolik:", healthData.bloodPressure.systolic)
    print("Tekanan Darah Diastolik:", healthData.bloodPressure.diastolic)
    print("Detak Jantung:", healthData.heartRate)
    print("Kualitas Tidur:", healthData.sleepQuality)
end

-- Fungsi untuk mengeksekusi program
local function executeProgram()
    recordHealthData(70, 120, 80, 80, 8) -- Contoh data kesehatan
    evaluateHealth()                    -- Mengevaluasi kesehatan
    provideHealthRecommendations()      -- Memberikan rekomendasi kesehatan
    displayHealthData()                 -- Menampilkan data kesehatan
end

-- Eksekusi program
executeProgram()
