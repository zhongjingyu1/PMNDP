function param_all = select_parameter(dataName)
dataset_names = {
    'mirflickr',           % 1
    'music_emotion',       % 2
    'music_style',         % 3
    'PML_recreation_7',    % 4
    'PML_recreation_9',    % 5
    'PML_recreation_11',   % 6
    'PML_recreation_13',   % 7
    'PML_art_7',           % 8
    'PML_art_9',           % 9
    'PML_art_11',          % 10
    'PML_art_13',          % 11
    'PML_education_7',     % 12
    'PML_education_9',     % 13
    'PML_education_11',    % 14
    'PML_education_13',    % 15
    'PML_science_7',       % 16
    'PML_science_9',       % 17
    'PML_science_11',      % 18
    'PML_science_13',      % 19
    'PML_health_7',        % 20
    'PML_health_9',        % 21
    'PML_health_11',       % 22
    'PML_health_13',       % 23
    'PML_emotions_4',      % 24
    'PML_emotions_5',      % 25
    'PML_emotions_6',      % 26
    'PML_Scene_3',         % 27
    'PML_Scene_4',         % 28
    'PML_Scene_5',         % 29
    'PML_flags_4',         % 30
    'PML_flags_5',         % 31
    'PML_flags_6',         % 32
    'PML_genbase_3',       % 33
    'PML_genbase_4',       % 34
    'PML_genbase_5',       % 35
    'PML_slashdot_3',      % 36
    'PML_slashdot_4',      % 37
    'PML_slashdot_5',      % 38
    'PML_enron_5',         % 39
    'PML_enron_7',         % 40
    'PML_enron_9',         % 41
    'YeastBP',             % 42
    'YeastCC',             % 43
    'YeastMF',             % 44
    };
[~, name, ~] = fileparts(dataName);

% Find the index of the dataset
ttt = find(strcmpi(dataset_names, name), 1);

if isempty(ttt)
    error('Dataset "%s" not found in parameter list', name);
end

params1 = [0.65,  0.1, 0.8;  % 1.mirflickr
    1,    0.1, 0.2;    % 2.music_emotion
    0.1,  0.15,  0.6;  % 3.music_style
    1,    1,  0.15;    % 4.PML_recreation_7
    1,    0.9,  0.15;  % 5.PML_recreation_9
    1,    1,  0.15;    % 6.PML_recreation_11
    0.9,    1,  0.15;  % 7.PML_recreation_13
    1,    0.1,  0.3    % 8.PML_art_7
    1,    0.25,  0.15  % 9.PML_art_9
    1,    0.35,  0.15  % 10.PML_art_11
    1,    0.4,  0.1    % 11.PML_art_13
    1,    0.1,  0.15   % 12.PML_education_7
    1,    0.1,  0.15   % 13.PML_education_9
    1,    0.1,  0.1    % 14.PML_education_11
    1,    0.2,  0.1    % 15.PML_education_13
    1,    0.1,  0.4    % 16.PML_science_7
    1,    0.1,  0.4    % 17.PML_science_9
    1,    0.1,  0.4    % 18.PML_science_11
    1,    0.1,  0.4    % 19.PML_science_13
    1,    0.1,  0.1    % 20.PML_health_7
    1,    0.1,  0.1    % 21.PML_health_9
    1,    0.1,  0.1    % 22.PML_health_11
    1,    0.1,  0.1    % 23.PML_health_13
    1,    0.1,  0.7    % 24.PML_emotions_4
    0.25,  0.55, 0.3   % 25.PML_emotions_5
    0.1,  0.55, 0.3    % 26.PML_emotions_6
    1,   0.3,   0.7    % 27.PML_Scene_3
    1,   0.25,  0.7    % 28.PML_Scene_4
    0.9,  0.25, 0.7    % 29.PML_Scene_5
    0.9,  0.25, 0.15   % 30.PML_flags_4
    0.9,  0.7, 0.15    % 31.PML_flags_5
    0.9,  0.9, 0.15    % 32.PML_flags_6
    0.5,  0.1, 0.15    % 33.PML_genbase_3
    0.5,  0.1, 0.15    % 34.PML_genbase_4
    0.5,  0.1, 0.15    % 35.PML_genbase_5
    1,    1,    0.5    % 36.PML_slashdot_3
    1, 1, 0.5          % 37.PML_slashdot_4
    1, 1, 0.5          % 38.PML_slashdot_5
    0.5, 0.1, 0.5      % 39.PML_enron_5
    1, 0.1, 0.1        % 40.PML_enron_7
    0.8, 0.1, 0.1      % 41.PML_enron_9
    0.8, 0.2, 0.1      % 42.YeastBP
    0.8, 0.2, 0.1      % 43.YeastCC
    0.8, 0.2, 0.1      % 44.YeastMF
    ];
params = [2^10, 2^6,  2^10, 1000, 0.7, 0.1;   % 1.mirflickr
    2^8,  2^2,   2^10, 1000, 0.3, 0.5;   % 2.music_emotion
    2^8,  2^2,   2^10, 0.1, 0.3, 0.5;    % 3.music_style
    2^-2, 2^-6,  2^-8, 1,  0.2,  0.4;    % 4.PML_recreation_7
    2^-2, 2^-6,  2^-6, 10,  0.1,  0.5;   % 5.PML_recreation_9
    2^-6, 2^-10, 2^-2, 0.1,  0.1, 0.6;   % 6.PML_recreation_11
    2^-10, 2^-4, 2^-2, 0.1, 0.1,  0.6;   % 7.PML_recreation_13
    2^0, 2^-6, 2^-2, 0.1, 0.1,  0.5;     % 8.PML_art_7
    2^0, 2^-4, 2^-2, 0.1, 0.1,  0.5;     % 9.PML_art_9
    2^0, 2^-8, 2^-2, 10, 0.1,  0.5;      % 10.PML_art_11
    2^0, 2^-8, 2^0, 10, 0.1,  0.6;       % 11.PML_art_13
    2^2, 2^-6, 2^-10, 10, 0.1,  0.4;     % 12.PML_education_7
    2^0, 2^-2, 2^-4, 10, 0.1,  0.4;      % 13.PML_education_9
    2^0, 2^-2, 2^-4, 10, 0.1,  0.4;      % 14.PML_education_11
    2^0, 2^-10, 2^-4, 10, 0.1,  0.4;     % 15.PML_education_13
    2^0, 2^-6, 2^-2, 1000, 0.1,  0.6;    % 16.PML_science_7
    2^0, 2^-6, 2^-2, 1000, 0.1,  0.5;    % 17.PML_science_9
    2^0, 2^-2, 2^-2, 10, 0.1,  0.5;      % 18.PML_science_11
    2^0, 2^-2, 2^-2, 0.1, 0.1,  0.5;     % 19.PML_science_13
    2^0, 2^-2, 2^-2, 1, 0.1,  0.4;       % 20.PML_health_7
    2^0, 2^0, 2^-2, 100, 0.1,  0.4;      % 21.PML_health_9
    2^0, 2^0, 2^-4, 100, 0.2,  0.4;      % 22.PML_health_11
    2^-10, 2^0, 2^-4, 1000, 0.2,  0.4;   % 23.PML_health_13
    2^-10, 2^-8, 2^10, 10, 0.2,  0.4;    % 24.PML_emotions_4
    2^2, 2^4, 2^10, 10, 0.2,  0.5;       % 25.PML_emotions_5
    2^2, 2^4, 2^10, 10, 0.2,  0.5;       % 26.PML_emotions_6
    2^10, 2^0, 2^10, 100, 0.1,  0.6;     % 27.PML_Scene_3
    2^10, 2^-10, 2^10, 100, 0.1,  0.5;   % 28.PML_Scene_4
    2^10, 2^-10, 2^10, 10, 0.8,  0.5;    % 29.PML_Scene_5
    2^10, 2^-10, 2^10, 100, 0.8,  0.5;   % 30.PML_flags_4
    2^10, 2^-10, 2^10, 10, 0.8,  0.5;    % 31.PML_flags_5
    2^10, 2^-10, 2^10, 100, 0.8,  0.5;   % 32.PML_flags_6
    2^4, 2^-10, 2^-2, 10, 0.1,  0.4;     % 33.PML_genbase_3
    2^0, 2^-10, 2^-4, 10, 0.1,  0.4;     % 34.PML_genbase_4
    2^-2, 2^-10, 2^-4, 10, 0.1,  0.5;    % 35.PML_genbase_5
    2^2, 2^-10, 2^2, 1, 0.1,  0.9;       % 36.PML_slashdot_3
    2^2, 2^-10, 2^2, 1, 0.1,  0.9;       % 37.PML_slashdot_4
    2^2, 2^-10, 2^2, 1, 0.1,  0.9;       % 38.PML_slashdot_5
    2^10, 2^10, 2^-10, 100, 0.4,  0.4;   % 39.PML_enron_5
    2^10, 2^6, 2^-10, 1000, 0.1,  0.4;   % 40.PML_enron_7
    2^10, 2^6, 2^-10, 100, 0.1,  0.4;    % 41.PML_enron_9
    2^2, 2^6, 2^-10, 1000, 0.1,  0.4;    % 42.YeastBP
    2^2, 2^6, 2^-10, 1000, 0.1,  0.4;    % 43.YeastCC
    2^2, 2^6, 2^-10, 1000, 0.1,  0.4;    % 44.YeastMF
    ];
param_all = [params1(ttt, :), params(ttt, :)];
end