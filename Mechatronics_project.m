 a=arduino('COM3','Nano3');
% When the button not pressed in the beginning.
    timer_running = false;
    % Inititally for reading the user input if the button has been pressed
    %or not.
    button_press = readDigitalPin(a, 'D6');
   %% start time to be 0 before button pressed.
   start_time = 0;
    % taking the sensorvoltage value in air(threshold_value) and in water(moist value).
    threshold_value=3.4712;
    moist_value=2.7423;
% Arrays to store data for the live plotting
    time_tracker = [];
    voltage_tracker = [];
% Creating a figure with x and y labels.
figure; 
aa= axes;
xlabel('Time(s)'); 
ylabel('Moisture reading');
title('Time vs Moisture Reading');
grid on;
% live plotting graph
line = animatedline(aa, 'Color', 'b', 'MarkerSize', 4,'Marker','*');
 % Asking the user to press the button
if ~readDigitalPin(a, 'D6')
        disp('Press the button to start');
end
% Considering button has been pressed, and starting time considering all
% the conditions are true
    while true
       
        button_press = readDigitalPin(a, 'D6');
        % Button pressed, timer Started
        if button_press == 1 && ~timer_running 
            timer_running = true;
            start_time = tic;
            writeDigitalPin(a, 'D2', 1)
            disp('The pump is on');

      % If Button pressed again, stopping the system
      
        elseif button_press == 1 && timer_running
            writeDigitalPin(a, 'D2', 0)
            timer_running = false;
            disp('The system has been shut off');
            break; 
        end
        
        % when the timer is running read the voltage of the moisture sensor
if timer_running
            
            if readVoltage(a,'A1')>threshold_value
 fprintf('Voltage:%.3f.The plant is dry so the pump is on.\n',readVoltage(a,'A1'));
         %TURN ON THE PUMP
         writeDigitalPin(a,'D2',1);%%Pump on
           %When the moisture level is greater than moist value but less than the
%threshold so the soil is still considered dry, start the pump.
 elseif readVoltage(a,'A1')>moist_value && readVoltage(a,'A1')<threshold_value
            writeDigitalPin(a,'D2',1);%%Pump on
            fprintf('Voltage: %.3f./n.The plant is still dry,Pump is on now.\n',readVoltage(a,'A1'));

            %if the moisture level is less than that of moist value(wet
            %value) the soil is considered wet so no need to start pump)
 elseif readVoltage(a,'A1')<moist_value
             writeDigitalPin(a,'D2',0);%%Pump off
             
         fprintf('There is no need to put more water, Stop the pump\n');
            end  
% Using the sensor voltage values to plot a live graph 
            readings_ = readVoltage(a, 'A1');
      % a function which converts sensor voltage values to moisture level
      % readings
         my_funct = Voltage_to_moisture(readings_, moist_value,threshold_value);
     % storing the live voltage values 
     voltage_tracker(end+1)=my_funct; 
     % the end time for the readings when the button is pressed again
     elapsed_time=toc(start_time);
     time_tracker(end+1)=elapsed_time;
     clearpoints(line);
     addpoints(line,time_tracker,voltage_tracker);
   
     % limit for x to be the till the time the system has not been shut off and y limit on a scale of 0-1.
    xlim([0, elapsed_time + 1]); 
     ylim([0, 1]); 
     drawnow;
end     
end
        
  