x = 0:.5:100;
y = x;
[X,Y] = meshgrid(x,y);
F = [];
F(1:length(x),1:length(y)) = 0;
t = 0;
t_frame = 1/30;
A = 0.1;
L = 3;
w = 2*pi/L;
S = 1;
Fi = pi/2;
wt = S*2*pi/L;
x0 = 40;
y0 = 40;
H0 = 0;
arr = []
while 1
    tic
    for i = 1:length(x)
        for j = 1:length(y)
            d = dist(x(i),y(j),x0,y0);
            if (d/S>t)
                F(i,j) = H0;
            else
                F(i,j) = H0 + A*cos(w*d+t*wt+Fi);
            end
        end
    end
    timeElapsed = toc;
    times = timeElapsed / t_frame;
    del_t = (times + 1)*t_frame - timeElapsed;
    pause(del_t);
    t = t + (times+1)*t_frame;
    surfl(F);
    zlim([-1 1]);
    view(30,60);
    colormap hsv;
    shading interp;
end
    
function f = dist(x,y,x0,y0)
    f = sqrt((x-x0)^2+(y-y0)^2);
end