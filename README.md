# EEG Brain State Analyzer – MATLAB GUI

## Overview
The **EEG Brain State Analyzer** is a MATLAB-based graphical user interface (GUI) designed to simulate and analyze electroencephalogram (EEG) signals. The system generates synthetic EEG signals composed of different brain wave components and performs signal processing techniques to determine the dominant brain state.

This project was developed as part of a **Signals and Systems mini project** to demonstrate fundamental concepts such as signal generation, Fourier Transform, digital filtering, and power spectrum analysis.

---

## Background
EEG signals represent electrical activity in the brain and are typically divided into frequency bands associated with different mental states.

| Brain Wave | Frequency Range | Brain State |
|-------------|----------------|-------------|
| Delta | 0.5 – 4 Hz | Deep sleep or unconscious state |
| Theta | 4 – 8 Hz | Drowsy or meditative state |
| Alpha | 8 – 13 Hz | Relaxed and calm state |
| Beta | 13 – 30 Hz | Active thinking or focused mental state |

The MATLAB GUI allows users to adjust the intensity of these brain waves and analyze which brain state becomes dominant.

---

## Features
- Interactive MATLAB GUI interface  
- Adjustable amplitude scaling for EEG bands  
- Simulated EEG signal generation  
- Time-domain signal visualization  
- Frequency spectrum visualization using FFT  
- Band-pass filtering for EEG band extraction  
- Automatic brain state classification based on band power  

---

## GUI Components

### 1. EEG Signal Plot (Time Domain)
Displays the generated EEG waveform across a 5-second time interval.

### 2. Frequency Spectrum Plot
Displays the frequency content of the signal using Fast Fourier Transform (FFT).

### 3. EEG Band Scaling Inputs
Users can adjust the scaling factors for:

- Delta waves (0.5–4 Hz)
- Theta waves (4–8 Hz)
- Alpha waves (8–13 Hz)
- Beta waves (13–30 Hz)

### 4. Control Buttons

**Generate EEG Signal**  
Creates a simulated EEG signal using the user-defined scaling values.

**Run Analysis**  
Performs spectral analysis and determines the dominant brain state.

### 5. Result Display
Displays the detected brain state along with its interpretation.

---

## Working Principle

### 1. Signal Generation
The EEG signal is simulated by combining sinusoidal waves representing different brain wave frequencies.

EEG Signal = Delta + Theta + Alpha + Beta + Noise

Typical frequencies used:
- Delta: 2 Hz  
- Theta: 6 Hz  
- Alpha: 10 Hz  
- Beta: 20 Hz  

Random noise is added to imitate realistic EEG data.

---

### 2. Time Domain Visualization
The generated signal is plotted against time to visualize how the EEG waveform behaves over a short duration.

---

### 3. Frequency Analysis
The program performs a **Fast Fourier Transform (FFT)** to convert the signal from the time domain into the frequency domain. This reveals which frequency components are dominant.

---

### 4. Band Filtering
Each EEG band is extracted using a **Butterworth band-pass filter**.

| Band | Filter Range |
|------|--------------|
| Delta | 0.5 – 4 Hz |
| Theta | 4 – 8 Hz |
| Alpha | 8 – 13 Hz |
| Beta | 13 – 30 Hz |

---

### 5. Band Power Calculation
The power of each filtered signal is computed using MATLAB’s `bandpower()` function.

The band with the **highest signal power** determines the dominant brain activity.

---

### 6. Brain State Classification
Based on the dominant frequency band, the program identifies the user's simulated brain state.

Example output:

```
Dominant Brain State: Alpha → Relaxed, calm state
```

---

## Requirements
- MATLAB R2020 or later  
- Signal Processing Toolbox  

---

## How to Run the Project

1. Save the MATLAB file as:

```
EEGSIGNAL.m
```

2. Open MATLAB.

3. Run the program:

```
EEGSIGNAL
```

4. Click **Generate EEG Signal** to create the signal.

5. Click **Run Analysis** to perform EEG classification.

---

## Applications
- Educational demonstrations of EEG signal processing  
- Biomedical signal analysis learning  
- Brain wave visualization tools  
- Introductory neuroscience signal studies  

---

## Future Improvements
- Integration with real EEG datasets  
- Support for Gamma waves (>30 Hz)  
- Machine learning based brain state classification  
- Real-time EEG sensor integration  
- Data recording and export features  

---

## Author
**D. Srinivas Rao**  
Signals and Systems Mini Project
