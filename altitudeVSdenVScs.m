%% This script is used to calculate air density and sound speed at diffenet altitude
%% Written by Hao ZHANG
clc
clear
r0 =6356766;   % radius of The earth
Geo_H = 0:1:85000;  % geometrical altitude
Grav_H = r0 * Geo_H./(r0 + Geo_H) ;  % gravity altitude
T =zeros(length(Geo_H),1);
den =zeros(length(Geo_H),1);
for index =1:length(Geo_H)
    if Geo_H(index)<=11019
        T(index)= 288.15-0.0065*Grav_H(index);
        den(index)= 1.2250*((1-0.225577*Grav_H(index)/10000)^4.25588);
     elseif  (Geo_H(index)>11019)&& (Geo_H(index)<=20063)
         T(index) =216.65;
         den(index) = 0.363917*exp(-1.576885*(Grav_H(index)-11000)/10000);
     elseif  (Geo_H(index)>20063)&& (Geo_H(index)<=32162)
         T(index)=216.65+0.001*(Grav_H(index)-20000);
         den(index)=8.803471/100*((1+(4.615740*10^(-6))*(Grav_H(index)-20000))^(-35.16322));
     elseif  (Geo_H(index)>32162)&& (Geo_H(index)<=47350)
         T(index)=228.65+0.0028*(Grav_H(index)-32000);
         den(index)=1.322497/100*((1+(1.224579*10^(-5))*(Grav_H(index)-32000))^(-13.20115));        
     elseif  (Geo_H(index)>47350)&& (Geo_H(index)<=51413)
         T(index)=270.65;
         den(index)=1.427527/1000*exp(-1.262266*(Grav_H(index)-47000)/10000);       
    elseif  (Geo_H(index)>51413)&& (Geo_H(index)<=71802)
         T(index)=270.65-0.0028*(Grav_H(index)-51000);
         den(index)=8.616011/10000*((1-(1.034546*10^(-5))*(Grav_H(index)-51000))^(11.20115));  
    elseif  (Geo_H(index)>71802)&& (Geo_H(index)<=86000)
         T(index)=214.65-0.002*(Grav_H(index)-71000);
         den(index)=6.421057/100000*((1-(9.317494*10^(-6))*(Grav_H(index)-71000))^(16.08161));  
     elseif  (Geo_H(index)>86000)&& (Geo_H(index)<=91000)
         T(index)=186.87;
   end
end
cs = 20.0468*sqrt(T);
data = [Geo_H' den cs];   % 1st col is geometrical altitude(m),2nd col is air density(kg/m^3),3rd col is sound speed(m/s)
save data.mat data
    
    
    
        