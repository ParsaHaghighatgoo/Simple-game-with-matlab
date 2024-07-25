clc
clear
displaytime = 3;
disp('welcome')
pause(displaytime);
clc;
i = input("enter numbers of litte pictures? ");
if isprime(i)
    y = i;
    x = 1;
else 
    y = floor(sqrt(i));
    x = i / y;
     if x ~= round(x)
        y = floor(sqrt(i/2));
        x = i / y;
         while x ~= round(x)
            displaytime = 5;
            disp('sorry this number does not support.plz enter another number!')
            pause(displaytime);
            clc;
            i = input("enter numbers of litte pictures? ");
            if isprime(i)
               y = i;
               x = 1;
            else 
               y = floor(sqrt(i));
               x = i / y;
                if x ~= round(x)
                   y = floor(sqrt(i/2));
                   x = i / y;
                end
            end
         end
     end
end


pic = zeros(x,y);
if rem(i,2)==0
    numofrep = i/2;
    randnumofrep = randi([10,1000],1,numofrep);
    endi = 0;
else
    numofrep= floor(i/2);
    randnumofrep = randi([10,1000],1,numofrep);
    endi=randi([10,1000]);
end

for i = 1 : numofrep
    positionx = randi([1,x]);
    positiony = randi([1,y]);
    if pic(positionx,positiony) == 0
     pic(positionx,positiony) = randnumofrep(1,i);
    else
        while pic(positionx,positiony) ~= 0
            positionx = randi([1,x]);
            positiony = randi([1,y]);
        end
        pic(positionx,positiony) = randnumofrep(1,i);
    end
end

for j = 1 : numofrep
    positionx = randi([1,x]);
    positiony = randi([1,y]);
    if pic(positionx,positiony) == 0
     pic(positionx,positiony) = randnumofrep(1,j);
    else
        while pic(positionx,positiony) ~= 0
            positionx = randi([1,x]);
            positiony = randi([1,y]);
        end
        pic(positionx,positiony) = randnumofrep(1,j);
    end
end
displaytime = input('plz enter the display time you need to see the numbers in seconds: ');
disp(pic)
pause(displaytime);
clc;
disp('now its your turn!!')
i = x*y;
vecpic = zeros(1,i);
p = 1;
for q = 1:x
  for k = 1:y
      vecpic(1,p) = pic(q,k);
      p = p+1;
  end
end
point = 0;
displaytime = input('tell me how long u need to answer for each? ');
TT = displaytime;
for pend = 1 : i/2
    tic
    userInput = input('Enter two values separated by a space: ', 's');
    elapsedtime = toc;
    if elapsedtime > displaytime
       clc;
       disp('you`ve already lost 0.25 because of yor running out of your time!!')
       disp('do you need help? it might be negative(-0.75) for your score')
       sign = input('if you need that,give (1) and if not,give (0) :');
        if sign == 1
           displaytime = 5;
           disp(pic)
           pause(displaytime);
           clc;
           point = point - 0.75;
        else
            clc;
            point = point - 0.25;
        end
    end
    values = strsplit(userInput);
    value1 = str2double(values{1});
    value2 = str2double(values{2});
    
    if vecpic(value1) == vecpic(value2)
        point = point +  1;
    end
    displaytime = TT;
end
clc;
score = (point*100/(i/2));
disp("your score is : " + score + 'percent')

