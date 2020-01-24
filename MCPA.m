%MCPA - Philippe Masson

e_pos = [];
e_pos(1:3) = 0;
e_vel = [];
e_vel(1:3) = 0;
e_accel = 0;
force_accel = 1;
timestep = 0.1;
currTime = 0;
e_driftVel = [];
e_driftVel(1:3) = 0;
sumVel = [];
sumVel(1:3) = 0;
tiledlayout(3,1);
set(gcf, 'Position', get(0, 'Screensize'));

e_oldVel = [];
e_oldVel(1:3) = 0;

while(1)
    currTime = currTime+timestep;
    e_accel = force_accel;
    e_oldVel = e_vel;
    if(rand <= 0.05) %scatter e1
        e_vel(1) = (-e_vel(1)*0) + e_accel * timestep;
    else
        e_vel(1) = e_vel(1) + e_accel * timestep;
    end
    
    if(rand <= 0.05) %scatter e2 with 50% transfer
        e_vel(2) = (-e_vel(2)*0.5) + e_accel * timestep;
    else
        e_vel(2) = e_vel(2) + e_accel * timestep;
    end
    
    if(rand <= 0.25) %scatter e3 0% transfer
        e_vel(3) = (-e_vel(3)*1) + e_accel * timestep;
    else
        e_vel(3) = e_vel(3) + e_accel * timestep;
    end
    
    e_pos = e_pos + e_vel * timestep;
    
    sumVel = sumVel + e_vel;
    e_oldDrift = e_driftVel;
    e_driftVel = sumVel ./ (currTime/timestep);
    
    nexttile(1);
    hold on;
    scatter(e_pos(1),1, 'b');
    scatter(e_pos(2),2, 'g');
    scatter(e_pos(3),3, 'r');
    title(['Position of Electron, time:' num2str(currTime)]);
    
    nexttile(2);
    hold on;
    plot([currTime - timestep, currTime], [e_oldVel(1), e_vel(1)], 'b');
    plot([currTime - timestep, currTime], [e_oldVel(2), e_vel(2)], 'g');
    plot([currTime - timestep, currTime], [e_oldVel(3), e_vel(3)], 'r');
    title('Velocity of Electron');
    
    nexttile(3);
    hold on;
    plot([currTime - timestep, currTime], [e_oldDrift(1), e_driftVel(1)], 'b');
    plot([currTime - timestep, currTime], [e_oldDrift(2), e_driftVel(2)], 'g');
    plot([currTime - timestep, currTime], [e_oldDrift(3), e_driftVel(3)], 'r');
    title('Velocity of Electron');

    
    pause(0.001);
end