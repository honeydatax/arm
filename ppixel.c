#include <linux/fb.h>
#include <sys/ioctl.h>
#include <stdio.h>
#include <termios.h>
#include <string.h>
#include <limits.h>
#include <time.h>
#include <sys/time.h>
#include <stdlib.h>
#include <fcntl.h>
#include <sys/mman.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <math.h>





    struct fb_var_screeninfo vinfo;
    struct fb_fix_screeninfo finfo;
int fbfd;
        struct fb_var_screeninfo vinfo;
    struct fb_fix_screeninfo finfo;
    long int screensize = 0;
    char *fbp = 0;
    long int location = 0;
int left=0,middle=0,right=0,mouseX=0,mouseY=0;
int MOUSEfile=0;
struct termios oldt;
    
    
    void ppixel(int x, int y,char r,char g,char b);
    void startX();
    
    
void startX(){

fbfd = open("/dev/fb0", O_RDWR);
ioctl(fbfd, FBIOGET_FSCREENINFO, &finfo);
ioctl(fbfd, FBIOGET_VSCREENINFO, &vinfo);
screensize = vinfo.xres * vinfo.yres * vinfo.bits_per_pixel / 8;
fbp = (char *)mmap(0, screensize, PROT_READ | PROT_WRITE, MAP_SHARED, fbfd, 0);

struct termios newt;
tcgetattr(fileno(stdin),&oldt);
memcpy(&newt,&oldt,sizeof(struct termios));
newt.c_lflag &= ~(ECHO|ICANON);
newt.c_cc[VTIME]=0;
newt.c_cc[VMIN]=0;
tcsetattr(fileno(stdin),TCSANOW,&newt);



MOUSEfile=open("/dev/input/mice",O_RDONLY|O_NONBLOCK);
mouseX=vinfo.xres/2;
mouseY=vinfo.yres/2;
}

void endX(){

close (MOUSEfile);
    close(fbfd);

}
    

void ppixel(int x, int y,char r,char g,char b){
if (x>0 && y>0 && x<vinfo.xres && y<vinfo.yres){
           int location = (x+vinfo.xoffset) * (vinfo.bits_per_pixel/8) +
                       (y+vinfo.yoffset) * finfo.line_length;

            if (vinfo.bits_per_pixel == 32) {
                *(fbp + location) = b;        
                *(fbp + location + 1) = g;  
                *(fbp + location + 2) = r; 
                *(fbp + location + 3) = 0;      

            } else  { 
                unsigned short int t = r<<11 | g << 5 | b;
                *((unsigned short int*)(fbp + location)) = t;
}
}
}


void ppixel16(int x, int y,int color){
if (x>0 && y>0 && x<vinfo.xres && y<vinfo.yres){
           int location = (x+vinfo.xoffset) * (vinfo.bits_per_pixel/8) +
                       (y+vinfo.yoffset) * finfo.line_length;


                *((unsigned short int*)(fbp + location)) = color;

}
}

