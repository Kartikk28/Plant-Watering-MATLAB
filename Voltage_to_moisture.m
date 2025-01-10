function my_funct = Voltage_to_moisture(readings_,moist_value,threshold_value)
% for the live plotting considering all the values less than the
% moist_value to be the sensor voltage readings
if readings_<moist_value 
    readings_=moist_value;
% for the live plotting considering all the values greater than the
% threshold value to be equal to the sensor voltage
elseif readings_>threshold_value 
end
%for the conversion of sensor voltage to the moisture reading, 
my_funct=1-(readings_-moist_value)/(threshold_value-moist_value);
end