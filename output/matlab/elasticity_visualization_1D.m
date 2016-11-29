clear all;
close all;

simulation_info=load('../simulation_info.dat');
last_frame=simulation_info(1);
N=simulation_info(2);
figure(1)
filename = 'testnew51.gif';
for f=0:last_frame
    x=load(strcat('particle_x_',sprintf('%i',f),'.dat'));
    scatter(x,zeros(size(x)),'x');
    xlim([-0.5,1.5]);
    drawnow;
    frame = getframe(1);
      im = frame2im(frame);
      [imind,cm] = rgb2ind(im,256);
      if f == 0;
          imwrite(imind,cm,filename,'gif', 'Loopcount',inf);
      else
          imwrite(imind,cm,filename,'gif','WriteMode','append');
      end
end

