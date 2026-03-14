function EEGSIGNAL
    % EEG Signal Classification GUI with Adjustable Scaling Factors
    % Author: Srinivas
    % Course: Signals and Systems Project

    % --- Create Figure ---
    fig = uifigure('Name','EEG Signal Classification','Position',[100 100 750 550]);

    % --- Axes for plots ---
    ax1 = uiaxes(fig,'Position',[50 290 300 200]);
title(ax1, 'EEG Signal (Time Domain)');

ax2 = uiaxes(fig,'Position',[400 290 300 200]);
title(ax2, 'Frequency Spectrum');

    % --- Result label ---
    resultLabel = uilabel(fig,'Position',[50 250 700 30],...
        'Text','Dominant Brain State: ','FontSize',14,'FontWeight','bold');

    % --- Scaling factor inputs ---
    uilabel(fig,'Position',[60 200 150 22],'Text','Delta (0.5–4 Hz) scale:');
    deltaField = uieditfield(fig,'numeric','Position',[210 200 70 22],'Value',50);

    uilabel(fig,'Position',[310 200 150 22],'Text','Theta (4–8 Hz) scale:');
    thetaField = uieditfield(fig,'numeric','Position',[460 200 70 22],'Value',30);

    uilabel(fig,'Position',[60 160 150 22],'Text','Alpha (8–13 Hz) scale:');
    alphaField = uieditfield(fig,'numeric','Position',[210 160 70 22],'Value',20);

    uilabel(fig,'Position',[310 160 150 22],'Text','Beta (13–30 Hz) scale:');
    betaField = uieditfield(fig,'numeric','Position',[460 160 70 22],'Value',10);

    % --- Buttons ---
    btnGenerate = uibutton(fig,'push','Text','Generate EEG Signal',...
        'Position',[180 100 150 40],'ButtonPushedFcn',@generateSignal);

    btnAnalyze = uibutton(fig,'push','Text','Run Analysis',...
        'Position',[400 100 150 40],'ButtonPushedFcn',@runAnalysis);

    % --- Shared variables ---
    eeg_signal = [];
    fs = 250;             % Sampling frequency
    t = 0:1/fs:5;         % 5 seconds of data

    % --- Generate EEG Signal Callback ---
    function generateSignal(~, ~)
        % Get user-defined scaling factors
        s_delta = deltaField.Value;
        s_theta = thetaField.Value;
        s_alpha = alphaField.Value;
        s_beta  = betaField.Value;

        % Simulate EEG with user scaling
        delta_wave = s_delta*sin(2*pi*2*t);
        theta_wave = s_theta*sin(2*pi*6*t);
        alpha_wave = s_alpha*sin(2*pi*10*t);
        beta_wave  = s_beta*sin(2*pi*20*t);

        eeg_signal = delta_wave + theta_wave + alpha_wave + beta_wave + randn(size(t))*5;

        % Plot time-domain signal
        plot(ax1,t,eeg_signal,'b');
        xlabel(ax1,'Time (s)');
        ylabel(ax1,'Amplitude');
        title(ax1,'EEG Signal (Time Domain)');
        resultLabel.Text = 'Signal generated. Click "Run Analysis" to process.';
    end

    % --- Run Analysis Callback ---
    function runAnalysis(~, ~)
        if isempty(eeg_signal)
            uialert(fig,'Please generate a signal first!','Error');
            return;
        end

        % Fourier Transform
        n = length(eeg_signal);
        f = (0:n-1)*(fs/n);
        EEG_FFT = abs(fft(eeg_signal))/n;

        % Plot frequency spectrum
        plot(ax2,f(1:n/2),EEG_FFT(1:n/2),'r');
        xlabel(ax2,'Frequency (Hz)');
        ylabel(ax2,'Amplitude');
        title(ax2,'EEG Frequency Spectrum');

        % EEG Bands
        bands = [0.5 4; 4 8; 8 13; 13 30];
        band_names = {'Delta','Theta','Alpha','Beta'};
        band_power = zeros(1,4);

        % Band-pass filtering and power computation
        for i = 1:4
            [b,a] = butter(4, bands(i,:)/(fs/2), 'bandpass');
            filtered = filtfilt(b,a,eeg_signal);
            band_power(i) = bandpower(filtered, fs, bands(i,:));
        end

        % Dominant Band
        [~,idx] = max(band_power);
        brainState = band_names{idx};

        % Interpretation
        switch brainState
            case 'Delta'
                meaning = 'Deep sleep or unconscious state';
            case 'Theta'
                meaning = 'Drowsy or meditative state';
            case 'Alpha'
                meaning = 'Relaxed, calm state';
            case 'Beta'
                meaning = 'Active or focused mental state';
        end

        % Display result
        resultLabel.Text = sprintf('Dominant Brain State: %s → %s', brainState, meaning);
    end
end