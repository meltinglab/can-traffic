close all;
clear all;
clc;
model = 'can8auto';
load_system(model)
sim(model)

syncData = sync.Data(1:2:end);
syncTime = sync.Time(1:2:end);
masterData = master.Data(1:2:end);
masterTime = master.Time(1:2:end);
pdoData = pdo.Data(1:2:end);
pdoTime = pdo.Time(1:2:end);
sdoData = sdo.Data(1:2:end);
sdoTime = sdo.Time(1:2:end);

[SOFpdo, EOFpdo] = SOFEOF(pdoData(2:length(pdoData)), pdoTime(2:length(pdoTime)));
[SOFsync, EOFsync] = SOFEOF(syncData(2:length(syncData)), syncTime(2:length(syncTime)));
[SOFmaster, EOFmaster] = SOFEOF(masterData(2:length(masterData)), masterTime(2:length(masterTime)));
[SOFsdo, EOFsdo] = SOFEOF(sdoData(2:length(sdoData)), sdoTime(2:length(sdoTime)));


LATmaster = latency(SOFmaster, EOFmaster);
LATsync = latency(SOFsync, EOFsync);
LATpdo = latency(SOFpdo, EOFpdo);
LATsdo = latency(SOFsdo, EOFsdo);


figure
[f,xi] = ksdensity(LATmaster);
plot(xi,f, 'b');
% hold on
% [f,xi] = ksdensity(LATpdo);
% plot(xi,f, 'g');
% hold on
% [f,xi] = ksdensity(LATsync);
% plot(xi,f, 'r');
% hold on
% [f,xi] = ksdensity(LATsdo);
% plot(xi,f, 'c');
% legend




% figure(1)
% plot(pdo.Time, pdo.Data)
% hold on
% plot(SOFpdo, 0, 'om')
% hold on
% plot(EOFpdo, 0, '*r')
% axis([0 1000 -1 2])

% figure(2)
% plot(sdo.Time, sdo.Data)
% hold on
% plot(SOFsdo, 0, 'om')
% hold on
% plot(EOFsdo, 0, '*r')
% axis([0 1000 -1 2])

% figure(3)
% plot(master.Time, master.Data)
% hold on
% plot(SOFmaster, 0, 'om')
% hold on
% plot(EOFmaster, 0, '*r')
% axis([0 1000 -1 2])

% figure(4)
% plot(sync.Time, sync.Data)
% hold on
% plot(SOFsync, 0, 'om')
% hold on
% plot(EOFsync, 0, '*r')
% axis([0 1000 -1 2])





