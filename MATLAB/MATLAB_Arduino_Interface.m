clc;
clear;
close all;

% serial
s = serialport("COM11", 9600);
configureTerminator(s,"LF");
flush(s);

% drawing
figure;
h = animatedline('LineWidth',2);
grid on;
xlabel('Sample');
ylabel('Distance (m)');
title('Ultrasonic Distance (0.01 m resolution)');

k = 0;

% storage data
xData = [];
yData = [];
constData = [];   % contant distance 0.2m

C = 0.20;         

% readings
while ishandle(h)
    if s.NumBytesAvailable > 0
        data = readline(s);
        y = str2double(data);

        if ~isnan(y)
            k = k + 1;

            
            xData(k,1)     = k;
            yData(k,1)     = y;
            constData(k,1) = C;

            % plot
            addpoints(h, k, y);
            drawnow limitrate;
        end
    end
end