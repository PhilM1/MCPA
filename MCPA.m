%MCPA - Philippe Masson

e_pos = 0;
e_vel = 0;
e_accel = 0;
force_accel = 1;
timestep = 0.1;
currTime = 0;

tiledlayout(2,1);

while(1)
    currTime = currTime+timestep;
    e_accel = force_accel;
    e_oldVel = e_vel;
    e_vel = e_vel + e_accel * timestep;
    e_pos = e_pos + e_vel * timestep;
    
    nexttile(1);
    hold on;
    scatter(currTime,e_pos, 'b');
    title(['Position of Electron, time:' num2str(currTime)]);
    
    nexttile(2);
    hold on;
    plot([currTime - timestep, currTime], [e_oldVel, e_vel], 'b');
    title('Velocity of Electron');

    pause(0.0001);
end