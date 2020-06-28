% Econometric Modeling: Leontief Input-Output Model Using Linear Algebra
% by Vishak Srikanth
% This program calculates the optimal demand for an open sector economy consiting of many sectors
% A production vector lists each sectors output while the final demand or bill of final demand lists
% values of the goods and services demanded from the production sectors by the open sector (which represents external
% demand) Sectors consume the ouput of each other as they try to fulfil the overall external demand. This intrinsic
% demand or intermediate demand creates an exchange table or consumption matrix or input-output table
% this table has values of goods and services produced by each sector and how much of that is used by another sector.
% If x is the desired production vector, x must satisfy x=Cx+d where C= consumption matrix and d = open sector demand
% Solving for x we can find that x=(I - C)^-1* d, where I is the identity matrix


% Need to load various packages for reading csv files and using dataframes and tables
pkg load io
pkg load dataframe
pkg load econometrics

clear
clc

% Users needs to upload 2 csv files:
% 1. csv file of economic input-output data by industry sectors
% 2. a header file for sector name to sector number mappings
% Note: We assume the National Bureau Of Economic Affairs (BEA) format where the IO file headers are just sector numbers
% and a separate lookup file is provided with sector name -> sector number mapping
[file,path,indx] = uigetfile('*.csv',...
               'Select an Input-Output file')
if isequal(file,0)
   disp('User selected Cancel')
else
   disp(["User selected Input/Output by sector file (BEA's USE file for example): ", fullfile(path, file),...
         ' and filter index: ', num2str(indx)])
end

% Read the csv data file
io_data = csvread(fullfile(path,file), 1,1);
% Read the data into a cell array
io_data_cell_array = csv2cell(fullfile(path,file));
io_df = dataframe(fullfile(path,file));
[nrows, cols] = size(io_data)
%head(io_df)




demand = io_data(1:end-1, end);
size(demand)
total_output_by_sector =  io_data(end, 1:end-1);
size(total_output_by_sector)
aggr_demand = io_data(1:end-1, end);
size(aggr_demand)
sum_aggr_demand = sum(aggr_demand)
sum_sector_outputs = sum(total_output_by_sector)

exchange_table = io_data(1:end-1, 1:end-1) ./ io_data(end, 1:end-1)
ones = eye(size(exchange_table));




output_vector = (ones - exchange_table)\demand


% Users need to upload a sector number -> sector mapping csv file
[file,path,indx] = uigetfile('*.csv',...
               'Select a Sector file')
if isequal(file,0)
   disp('User selected Cancel')
else
   disp(['User selected Sector Mapping file', fullfile(path, file),...
         ' and filter index: ', num2str(indx)])
end

sector_mapping = csv2cell(fullfile(path,file));
sector_names = sector_mapping(2:end-1, 2);
size(sector_names)
x = dataframe (output_vector', "rownames", sector_names)
%x(:, 1:10)












