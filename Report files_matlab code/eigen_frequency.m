function eigen_frequency=eigen_frequency(report_file);
%%Importing data
xy_data=importdata(report_file,' ',3);
xy_data=xy_data.data;


%%Performing Fast Furier Transform
furier=fft(xy_data(:,2));
module=abs(furier);
frequency=(0:length(furier)-1)*50/(length(furier)-1);


%%Plotting spectrum
plot(frequency(1:25),module(1:25,1));


%%Calculating eigen frequency
[max_module,index_max_module]=max(module);
eigen_frequency=frequency(index_max_module);