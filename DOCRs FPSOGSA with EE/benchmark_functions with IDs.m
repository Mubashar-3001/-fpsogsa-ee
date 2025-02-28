%FPSOGSA with EE source code v3.0, (for small system, generic )Generated by Engr. mubashar javed, 2024. 
%Adopted from: S. Mirjalili, S.Z. Mohd Hashim, “A New Hybrid PSOGSA 
%Algorithm for Function Optimization.
% This function calculates the value of objective function.
function fit=benchmark_functions(L,Benchmark_Function_ID,dim)
%You can insert your own objective function with a new Benchmark_Function_ID.

if Benchmark_Function_ID==1
fit=sum(L.^2);
end

if Benchmark_Function_ID==2 
fit=sum(abs(L))+prod(abs(L));
end

if Benchmark_Function_ID==3
    fit=0;
    for i=1:dim
    fit=fit+sum(L(1:i))^2;
    end
end

if Benchmark_Function_ID==4
    fit=max(abs(L));
end

if Benchmark_Function_ID==5
    fit=sum(100*(L(2:dim)-(L(1:dim-1).^2)).^2+(L(1:dim-1)-1).^2);
end

if Benchmark_Function_ID==6
    fit=sum(abs((L+.5)).^2);
end

if Benchmark_Function_ID==7
    fit=sum([1:dim].*(L.^4))+rand;
end

if Benchmark_Function_ID==8
    fit=sum(-L.*sin(sqrt(abs(L))));
end

if Benchmark_Function_ID==9
    fit=sum(L.^2-10*cos(2*pi.*L))+10*dim;
end

if Benchmark_Function_ID==10
    fit=-20*exp(-.2*sqrt(sum(L.^2)/dim))-exp(sum(cos(2*pi.*L))/dim)+20+exp(1);
end

if Benchmark_Function_ID==11
    fit=sum(L.^2)/4000-prod(cos(L./sqrt([1:dim])))+1;
end

if Benchmark_Function_ID==12
    fit=(pi/dim)*(10*((sin(pi*(1+(L(1)+1)/4)))^2)+sum((((L(1:dim-1)+1)./4).^2).*...
        (1+10.*((sin(pi.*(1+(L(2:dim)+1)./4)))).^2))+((L(dim)+1)/4)^2)+sum(Ufun(L,10,100,4));
end
if Benchmark_Function_ID==13
    fit=.1*((sin(3*pi*L(1)))^2+sum((L(1:dim-1)-1).^2.*(1+(sin(3.*pi.*L(2:dim))).^2))+...
        ((L(dim)-1)^2)*(1+(sin(2*pi*L(dim)))^2))+sum(Ufun(L,5,100,4));
end

if Benchmark_Function_ID==14
aS=[-32 -16 0 16 32 -32 -16 0 16 32 -32 -16 0 16 32 -32 -16 0 16 32 -32 -16 0 16 32;,...
-32 -32 -32 -32 -32 -16 -16 -16 -16 -16 0 0 0 0 0 16 16 16 16 16 32 32 32 32 32];
    for j=1:25
        bS(j)=sum((L'-aS(:,j)).^6);
    end
    fit=(1/500+sum(1./([1:25]+bS))).^(-1);
end

if Benchmark_Function_ID==15
    aK=[.1957 .1947 .1735 .16 .0844 .0627 .0456 .0342 .0323 .0235 .0246];
    bK=[.25 .5 1 2 4 6 8 10 12 14 16];bK=1./bK;
    fit=sum((aK-((L(1).*(bK.^2+L(2).*bK))./(bK.^2+L(3).*bK+L(4)))).^2);
end

if Benchmark_Function_ID==16
    fit=4*(L(1)^2)-2.1*(L(1)^4)+(L(1)^6)/3+L(1)*L(2)-4*(L(2)^2)+4*(L(2)^4);
end

if Benchmark_Function_ID==17
    fit=(L(2)-(L(1)^2)*5.1/(4*(pi^2))+5/pi*L(1)-6)^2+10*(1-1/(8*pi))*cos(L(1))+10;
end

if Benchmark_Function_ID==18
    fit=(1+(L(1)+L(2)+1)^2*(19-14*L(1)+3*(L(1)^2)-14*L(2)+6*L(1)*L(2)+3*L(2)^2))*...
        (30+(2*L(1)-3*L(2))^2*(18-32*L(1)+12*(L(1)^2)+48*L(2)-36*L(1)*L(2)+27*(L(2)^2)));
end

if Benchmark_Function_ID==19
    aH=[3 10 30;.1 10 35;3 10 30;.1 10 35];cH=[1 1.2 3 3.2];
    pH=[.3689 .117 .2673;.4699 .4387 .747;.1091 .8732 .5547;.03815 .5743 .8828];
    fit=0;
    for i=1:4
    fit=fit-cH(i)*exp(-(sum(aH(i,:).*((L-pH(i,:)).^2))));
    end
end

%% Calculation For IEEE 3 Bus System  
if Benchmark_Function_ID==23
  TMS1=L(1,1);
TMS2=L(1,2);
TMS3=L(1,3);
TMS4=L(1,4);
TMS5=L(1,5);
TMS6=L(1,6);
%%%%%%%%%%%%%%%%%%%%%%
PTS1=L(1,7);
PTS2=L(1,8);
PTS3=L(1,9);
PTS4=L(1,10);
PTS5=L(1,11);
PTS6=L(1,12);
%%%%%%%%%%%%%%%%%
%% The Values Given For TMS (Time Multiplier setting) in (Simplex Method)
% a=0.1;
% b=0.1364;
% c=0.1;
% d=0.1;
% e=0.1298;
% f=0.1;
% %% The Values Given For PTS (Pickup Tap setting) in (Simplex Method)
% g=5;
% h=1.5;
% k=5;
% l=4;
% o=2;
% p=2.5;
% x=[a,b,c,d,e,f];
% y=[g,h,k,l,o,p];
n=1;
m=6;
TMS=[TMS1,TMS2,TMS3,TMS4,TMS5,TMS6]; % The TMS Values
PTS=[PTS1,PTS2,PTS3,PTS4,PTS5,PTS6]; % The PTS Values
FaultCurrent_P=[1978.90,1525.70,1683.90,1815.40,1499.66,1766.30]; % Fault  Current Values
FaultCurrent_B=[617.22,145.34,384,545,175,466.17]; % Fault Current for Backup Relay Values
CTRatio=[300,200,200,300,200,400]; % CTRatio Value
CTRatio_Value=zeros(n,m); % Change CTRatio Matrix Transform 
for i=1:n
    for j=1:m
        CTRatio_Value(i,j)=CTRatio(n,m);
    end
end

PickupTapSetting=((CTRatio/5)).*PTS; 
% fprintf('The value of PickupTapSetting No.1=%f \n', PickupTapSetting(1,1)); 
% fprintf('The value of PickupTapSetting No.2=%f \n', PickupTapSetting(1,2));
% fprintf('The value of PickupTapSetting No.3=%f \n', PickupTapSetting(1,3));
% fprintf('The value of PickupTapSetting No.4=%f \n', PickupTapSetting(1,4));
% fprintf('The value of PickupTapSetting No.5=%f \n', PickupTapSetting(1,5));
% fprintf('The value of PickupTapSetting No.6=%f \n', PickupTapSetting(1,6));
PlugSettingMultiplier_P=((FaultCurrent_P)).*((PickupTapSetting).^(-1));
PlugSettingMultiplier_B=((FaultCurrent_B)).*((PickupTapSetting).^(-1));
% fprintf('The value of PlugSettingMultiplier No.1=%f \n', PlugSettingMultiplier(1,1)); 
% fprintf('The value of PlugSettingMultiplier No.2=%f \n', PlugSettingMultiplier(1,2));
% fprintf('The value of PlugSettingMultiplier No.3=%f \n', PlugSettingMultiplier(1,3));
% fprintf('The value of PlugSettingMultiplier No.4=%f \n', PlugSettingMultiplier(1,4));
% fprintf('The value of PlugSettingMultiplier No.5=%f \n', PlugSettingMultiplier(1,5));
% fprintf('The value of PlugSettingMultiplier No.6=%f \n', PlugSettingMultiplier(1,6));
PSM_Value_P=(((PlugSettingMultiplier_P).^0.02)-1);
PSM_Value_B=(((PlugSettingMultiplier_B).^0.02)-1);
TMS_Value=(0.14*TMS);
Top=((TMS_Value).*((PSM_Value_P).^(-1)));
Tob=((TMS_Value).*((PSM_Value_B).^(-1)));
% fprintf('The value of Operating Time No.1=%f \n', Top(1,1)); 
% fprintf('The value of Operating Time No.2=%f \n', Top(1,2));
% fprintf('The value of Operating Time No.3=%f \n', Top(1,3));
% fprintf('The value of Operating Time No.4=%f \n', Top(1,4));
% fprintf('The value of Operating Time No.5=%f \n', Top(1,5));
% fprintf('The value of Operating Time No.6=%f \n', Top(1,6));
CTI_RelayNo_1= Tob(1,5)- Top(1,1);
CTI_RelayNo_2= Tob(1,4)- Top(1,2);
CTI_RelayNo_3= Tob(1,1)- Top(1,3);
CTI_RelayNo_4= Tob(1,6)- Top(1,4);
CTI_RelayNo_5= Tob(1,3)- Top(1,5);
CTI_RelayNo_6= Tob(1,2)- Top(1,6);
Top_Primary=Top(1,1)+Top(1,2)+Top(1,3)+Top(1,4)+Top(1,5)+Top(1,6);
fprintf('The value of Total Operating Time of Primary Relays=%f \n', Top_Primary);
fprintf('The value of Coordination Time Of Interval Between Primary Relay No.1 and Backup Relay No.5=%f \n', CTI_RelayNo_1);
fprintf('The value of Coordination Time Of Interval Between Primary Relay No.2 and Backup Relay No.4=%f \n', CTI_RelayNo_2);
fprintf('The value of Coordination Time Of Interval Between Primary Relay No.3 and Backup Relay No.1=%f \n', CTI_RelayNo_3);
fprintf('The value of Coordination Time Of Interval Between Primary Relay No.4 and Backup Relay No.6=%f \n', CTI_RelayNo_4);
fprintf('The value of Coordination Time Of Interval Between Primary Relay No.5 and Backup Relay No.3=%f \n', CTI_RelayNo_5);
fprintf('The value of Coordination Time Of Interval Between Primary Relay No.6 and Backup Relay No.2=%f \n', CTI_RelayNo_6);
fit=Top_Primary;
end
function y=Ufun(x,a,k,m)
y=k.*((x-a).^m).*(x>a)+k.*((-x-a).^m).*(x<(-a));
return
