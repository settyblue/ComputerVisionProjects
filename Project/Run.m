cam = webcam(1);
import java.awt.Robot;
import java.awt.event.*;
robot = Robot();
ScreenDimensions = get(0, 'screensize');
R = ScreenDimensions(3);
running_count = 300;
% preview(cam)
%image(img);
%imagesc(img);
%vidWriter = VideoWriter('frames.avi');
%open(vidWriter);
%writeVideo(vidWriter, img);
try
    count = 0;
    while count < running_count
        img = snapshot(cam);
        [r, c] = get_pointer(img);
        set(gca,'YDir','normal');
        set(gca,'XDir','reverse');
        imshow(img)
        hold on;
        plot(r,c,'rO');
        robot.mouseMove(R-r,c);
        count = count+1
    end
catch
    clear cam
end
clear cam

