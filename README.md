#  Econometric Modeling: Leontief Input-Output Model Using Linear Algebra
 


This program calculates the optimal demand for an open sector economy consiting of many sectors.

A production vector lists each sectors output while the final demand or bill of final demand lists values of the goods and services demanded from the production sectors by the open sector (which represents external demand) 

Sectors consume the ouput of each other as they try to fulfil the overall external demand. 

This intrinsic demand or intermediate demand creates an exchange table or consumption matrix or input-output table

This table has values of goods and services produced by each sector and how much of that is used by another sector.

If **x** is the desired production vector, **x** must satisfy:

**x=Cx+d**
where 

C= consumption matrix 

d = open sector demand

Solving for x we can find that

**x=(I - C)<sup>-1</sup>d**, 

where I is the identity matrix

## How the program works

Users needs to upload 2 comma separated value (csv) files:
1. csv file of economic input-output (IO) data by industry sectors
  

2. a header file for sector name to sector number mappings
 This file has the following format

## Note: 
We assume that data is given in the **National Bureau Of Economic Affairs (BEA)** format where:

1. the IO file headers are just sector numbers 

This file has the following format:
   > 
   Sector,1,2,3,4,5,6,7,8,9,10
   >
   1,13288.613000,10081.624000,0.000000,0.000000,0.000000,281.536000,0.000000,7.519000,18.588000,11.244000


2. a separate lookup file is provided with **sector name -> sector number** mapping

This file has this format:
  > 
  Sector Number,Industry or Commodity Description
  > 
  1,Crop production
  > 
  2,Animal production and aquaculture
  > 
  3,Forestry
  > 
  4,Logging
  > 
  5,"Fishing, hunting and trapping"
  > 
  6,Support activities for agriculture and forestry
  > 
  7,Oil and gas extraction
  > 
  8,Coal mining
  > 
  9,Metal ore mining
  > 
  10,Nonmetallic mineral mining and quarrying
  
