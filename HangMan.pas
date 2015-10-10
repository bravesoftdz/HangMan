Program HangMan;
uses crt;
type
    arraystring=array[1..100] of string;
    arrayinteger=array[1..100] of integer;
var
   Data:arraystring;
   LoginID:arraystring;
   LoginPassword:arraystring;
   Name:arraystring;
   Sex:arraystring;
   IDPoints:arrayinteger;
   Points:arraystring;
   FontColor:arraystring;
   dictionary:arraystring;
   save:integer;
   choice:string;
   count:integer;
   IDNo:integer;
   countdictionary:integer;
   correct:boolean;
   Again:string;
   Letter:char;
   Level:integer;
   hold:string;
   hold2:string;
   num:integer;
   Gamefile:text;
   Profile:text;
   x:integer;
   y:integer;
   limitx:integer;
   limity:integer;
   num2:integer;
   middle:integer;
   top:integer;
   bottom:integer;
   qword:string;
   aword:string;
   playerpoints:integer;
   marypoints:integer;
   randompoint:integer;

procedure ChangeChar(var Change:char);{The procedure to change the letter into capital letter}
begin
     if (Change>='a') and (Change<='z') then
        Change:=Chr(Ord(Change)-32);
end;

procedure ChangeString(var Change:string); {The procedure to change the string into all capital letter}
begin
     for num:=1 to length(Change) do
         ChangeChar(Change[num]);
end;

procedure Checking(input:string;input2:string;var correct:boolean;typecheck:string);
{The procedure to check the input correct or not}
begin
     ChangeString(typecheck);
     correct:=false;
     clrscr;
     if typecheck='PW' then {To check the password}
        begin
             if LoginPassword[IDNo]=input then
                correct:=true
             else
                 begin
                      writeln('!!!!!!!!!!!WARNING!!!!!!!!!!!');
                      writeln('!!                         !!');
                      writeln('!! Invalid ID or password. !!');
                      writeln('!! Please try again.       !!');
                      writeln('!!                         !!');
                      writeln('!!!!!!!!!!!!!!!!!!!!!!!!!!!!!');
                      writeln;
                      writeln('Press <ENTER> to continue.');
                      readln;
                 end;
        end;
     if typecheck='DOUBLE' then {To check is the input1 same as input2}
        begin
             if input=input2 then
                correct:=true
             else
                 begin
                      writeln('!!!!!!!!!!!!WARNING!!!!!!!!!!!');
                      writeln('!!                          !!');
                      writeln('!! The inputs do not match. !!');
                      writeln('!! Please try again.        !!');
                      writeln('!!                          !!');
                      writeln('!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!');
                      writeln;
                      writeln('Press <ENTER> to continue.');
                      readln;
                 end;
        end;
     ChangeString(input);
     ChangeString(input2);
     if typecheck='CREATID' then {To check the ID had been used or not}
        begin
             correct:=true;
             for count:=1 to count do
                 if LoginID[count]=input then
                    begin
                         correct:=false;
                         writeln('!!!!!!!!WARNING!!!!!!!!');
                         writeln('!!                   !!');
                         writeln('!! Inavail ID.       !!');
                         writeln('!! Please try again. !!');
                         writeln('!!                   !!');
                         writeln('!!!!!!!!!!!!!!!!!!!!!!!');
                         writeln;
                         writeln('Press <ENTER> to continue');
                         readln;
                    end;
        end;
     if typecheck='ID' then {To check the ID}
        begin
             for count:=1 to count do
                 if LoginID[count]=input then
                    begin
                         correct:=true;
                         IDNo:=count;
                    end;
        end;
     if typecheck='SEX' then {To check the sex}
        begin
             if (input='M') or (input='F') then
                correct:=true
             else
                 begin
                      writeln('!!!!!!!!WARNING!!!!!!!!');
                      writeln('!!                   !!');
                      writeln('!! Invalid input.    !!');
                      writeln('!! Please try again. !!');
                      writeln('!!                   !!');
                      writeln('!!!!!!!!!!!!!!!!!!!!!!!');
                      writeln;
                      writeln('Press <ENTER> to go back.');
                      readln;
                 end;
        end;
     if typecheck='CHOICE' then {To check the choice in the limit or not}
        begin
             Letter:='A';
             if length(input)=1 then
                Letter:=input[1]
             else
                 Letter:='~';
             if ('0'<Letter)and(Letter<=input2) then
                correct:=true
             else
                 begin
                      writeln('!!!!!!!!WARNING!!!!!!!!');
                      writeln('!!                   !!');
                      writeln('!! Invalid input.    !!');
                      writeln('!! Please try again. !!');
                      writeln('!!                   !!');
                      writeln('!!!!!!!!!!!!!!!!!!!!!!!');
                      writeln;
                      writeln('Press <ENTER> to go back.');
                      readln;
                 end;
        end;
     if typecheck='YN' then {To check the Yes/No Question's answer}
        begin
             if input='Y' then
                correct:=true
             else if input<>'N' then
                     begin
                          writeln('!!!!!!!!WARNING!!!!!!!!');
                          writeln('!!                   !!');
                          writeln('!! Invalid input.    !!');
                          writeln('!! Please try again. !!');
                          writeln('!!                   !!');
                          writeln('!!!!!!!!!!!!!!!!!!!!!!!');
                          writeln;
                          writeln('Press <ENTER> to go back.');
                          readln;
                     end;
        end;
     clrscr;
end;

procedure SaveRecord; {The procedure to Save the change}
begin
     assign(Profile,'C:\EnglishGame\LoginID.txt');
     rewrite(Profile);
     for count:=1 to count do
           begin
                Str(IDPoints[count],Points[count]);
                data[count]:=LoginID[count]+' '+LoginPassword[count]+' '+Name[count]+' '+Sex[count]+' '+Points[count]+' '+FontColor[count];
                writeln(Profile, data[count]);
           end;
     close(Profile);
     writeln('Your data had been saved.');
     writeln;
     writeln('Press <ENTER> to go back.');
     readln;
     save:=1;
end;

procedure ExitProgram; {The procedure before exit some pages when some data was changed}
begin
     clrscr;
     if save=0 then
     begin
          repeat
                writeln('Your data had not been saved.');
                write('Do you want to save it now? (Y/N) ');
                readln(Again);
                ChangeString(Again);
                Checking(Again,'',correct,'YN');
                if correct then
                   SaveRecord;
                if Again='N' then
                   begin
                        writeln('!!!!!!!!!WARNING!!!!!!!!!');
                        writeln('!!                     !!');
                        writeln('!! Your data may lose. !!');
                        writeln('!!                     !!');
                        writeln('!!!!!!!!!!!!!!!!!!!!!!!!!');
                        writeln;
                        writeln('Are you sure not to save the data? (Y/N)');
                        readln(Again);
                        ChangeString(Again);
                        Checking(Again,'',correct,'YN');
                        clrscr;
                   end;
          until Again='Y';
     end;
     clrscr;
end;

procedure Readdictionary; {The procedure to input the dictionary for the game to use}
begin
     assign(Gamefile,'C:\EnglishGame\dictionary.txt');
     reset(Gamefile);
     countdictionary:=0;
     while eof(Gamefile)=false do
     begin
          countdictionary:=countdictionary+1;
          readln(Gamefile,dictionary[countdictionary]);
     end;
     close(Gamefile);
end;

procedure ChangeColor(color:string); {The procedure to change the font color}
begin
     if color='Blue' then
        begin
             Textcolor(9);
             FontColor[IDNo]:='Blue';
        end;
     if color='Green' then
        begin
             Textcolor(10);
             FontColor[IDNo]:='Green';
        end;
     if color='PureBlue' then
        begin
             Textcolor(11);
             FontColor[IDNo]:='PureBlue';
        end;
     if color='Red' then
        begin
             Textcolor(12);
             FontColor[IDNo]:='Red';
        end;
     if color='Pink' then
        begin
             Textcolor(13);
             FontColor[IDNo]:='Pink';
        end;
     if color='Yellow' then
        begin
             Textcolor(14);
             FontColor[IDNo]:='Yellow';
        end;
     if color='White' then
        begin
             Textcolor(15);
             FontColor[IDNo]:='White';
        end;
end;

procedure Welcome; {The procedure for the first page welcome the user}
begin
     randomize;
     num:=1;
     limitx:=70;
     limity:=8;
     repeat
     for x := num to limitx do
         begin
              TextBackground(0);
              Gotoxy(x,num);
              delay(1);
              if ((num=2)or(num=3)or(num=4))and((x=2)or(x=12)) then
                 write('W')
              else if (num=4)and(x=7) then
                   write('W')
              else if ((num=2)or(num=4))and((x=15)or(x=17)or(x=19)or(x=21)) then
                   write('E')
              else if (num=3)and(x=14) then
                   writeln('E')
              else if ((num=2)or(num=3)or(num=4))and(x=24) then
                   write('L')
              else if (num=2)and((x=34)or(x=36)or(x=38)or(x=40)) then
                   write('C')
              else if ((num=3)or(num=4))and(x=33) then
                   write('C')
              else if (num=2)and((x=45)or(x=47)) then
                   write('O')
              else if ((num=3)or(num=4))and((x=43)or(x=49)) then
                   write('O')
              else if (num=2)and((x=53)or(x=59)) then
                   write('M')
              else if (num=3)and((x=52)or(x=55)or(x=57)or(x=60)) then
                   write('M')
              else if (num=4)and((x=52)or(x=56)or(x=60)) then
                   write('M')
              else if ((num=2)or(num=4))and((x=63)or(x=65)or(x=67)or(x=69)) then
                   write('E')
              else if (num=3)and(x=62) then
                   write('E')
              else
                  write(' ');
         end;
     for y := (num+1) to limity do
         begin
              Gotoxy(limitx,y);
              delay(1);
              if ((y=2)or(y=4)or(y=6))and(limitx=69) then
                 write('E')
              else
                  write(' ');
         end;
     for x := (limitx-1) downto num do
         begin
              Gotoxy(x,limity);
              delay(1);
              if (limity=5)and((x=7)or(x=11)) then
                 write('W')
              else if (limity=6)and((x=5)or(x=9)) then
                   write('W')
              else if (limity=5)and(x=14) then
                   writeln('E')
              else if (limity=6)and((x=15)or(x=17)or(x=19)or(x=21)) then
                   write('E')
              else if (limity=5)and(x=24) then
                   write('L')
              else if (limity=6)and((x=24)or(x=26)or(x=28)or(x=30)) then
                   write('L')
              else if (limity=5)and(x=33) then
                   write('C')
              else if (limity=6)and((x=34)or(x=36)or(x=38)or(x=40)) then
                   write('C')
              else if (limity=5)and((x=43)or(x=49)) then
                   write('O')
              else if (limity=6)and((x=45)or(x=47)) then
                   write('O')
              else if ((limity=5)or(limity=6))and((x=52)or(x=60)) then
                   write('M')
              else if (limity=5)and(x=62) then
                   write('E')
              else if (limity=6)and((x=63)or(x=65)or(x=67)) then
                   write('E')
              else
                  write(' ');
         end;
     for y := (limity-1) downto (num+1) do
         begin
              Gotoxy(num,y);
              delay(1);
              if (num=2)and((y=3)or(y=4)) then
                 write('W')
              else if (num=3)and(y=5) then
                   write('W')
              else
                  write(' ');
         end;
     num:=num+1;
     limitx:=limitx-1;
     limity:=limity-1;
     until (num=5);
     Gotoxy(1,9);
     writeln('Press <ENTER> to continue.');
     readln;
end;

procedure Arrange; {The procedure to separate the data into ID, Password, Name, Sex and Points}
begin
     for count:=1 to count do
         begin
              num:=0;
              num2:=1;
              hold2:=data[count]+' ';
              repeat
                    hold:='';
                    num:=num+1;
                    while hold2[num2]<>' ' do
                          begin
                               hold:=hold+hold2[num2];
                               num2:=num2+1;
                          end;
                    num2:=num2+1;
                    if num=1 then
                       LoginID[count]:=hold;
                    if num=2 then
                       LoginPassword[count]:=hold;
                    if num=3 then
                       Name[count]:=hold;
                    if num=4 then
                       Sex[count]:=hold;
                    if num=5 then
                       Points[count]:=hold;
                    if num=6 then
                       FontColor[count]:=hold;
              until num=6;
         end;
end;

procedure ReadRecord(var count:integer; var data:arraystring); {The procedure to read the data of every ID}
begin
     num:=0;
     assign(Profile,'C:\EnglishGame\LoginID.txt');
     reset(Profile);
     count:=0;
     while eof(Profile)=false do
           begin
                count:=count+1;
                readln(Profile,data[count]);
                Arrange;
                Val(Points[count],IDPoints[count],num);
           end;
     close(Profile);
end;

procedure CreatAccount(var count:integer); {The procedure to create a new ID}
begin
     clrscr;
     repeat
           write('Enter your ID: ');
           readln(LoginID[count+1]);
           ChangeString(LoginID[count+1]);
           Checking(LoginID[count+1],'',correct,'CREATID');
     until correct;
     repeat
           write('Enter your Password: ');
           readln(LoginPassword[count+1]);
           write('Please enter again: ');
           readln(hold);
           Checking(LoginPassword[count+1],hold,correct,'DOUBLE');
     until correct;
     count:=count+1;
     Points[count]:='0';
     FontColor[count]:='Green';
     write('Enter your name: ');
     readln(Name[count]);
     ChangeString(Name[count]);
     clrscr;
     repeat
           write('Enter your sex: (M/F) ');
           readln(Sex[count]);
           ChangeString(Sex[count]);
           Checking(Sex[count],'',correct,'SEX');
     until correct;
     clrscr;
     writeln('Here are your information:');
     writeln('Login ID: ',LoginID[count]);
     writeln('Login Password: ',LoginPassword[count]);
     writeln('Name: ',Name[count]);
     writeln('Sex: ',Sex[count]);
     writeln('Points: 0');
     writeln('Font Color: Green (Orginal Set)');
     writeln;
     writeln('Press <ENTER> to continue.');
     readln;
     clrscr;
     save:=0;
end;

procedure Login(var count:integer); {The procedure of a page for user to Login}
begin
     repeat
           repeat
                 write('Do you have account?(Y/N) ');
                 readln(Again);
                 ChangeString(Again);
                 Checking(Again,'',correct,'YN');
                 if Again='N' then
                    CreatAccount(count);
           until correct;
           write('LoginID: ');
           readln(hold);
           write('Password: ');
           readln(hold2);
           ChangeString(hold);
           Checking(hold,'',correct,'ID');
           Checking(hold2,'',correct,'PW');
     until correct;
     ChangeColor(FontColor[IDNo]);
     writeln('Welcome Back, ',Name[IDNo]);
     writeln;
     writeln('Press <ENTER> to continue.');
     readln;
end;

procedure Rule; {The page telling the user about the rule of the game}
begin
     writeln('Rule:');
     writeln('===============================================');
     writeln('First, there will give a word with blank, for example:');
     writeln('A_ple');
     writeln;
     writeln('Then, you have to enter the correct letter, for example:');
     writeln('P');
     writeln;
     writeln('If the answer is correct, you wil gain points!');
     writeln('(The points you gain is according to your level)');
     writeln;
     writeln('If the answer is incorrect, you will lose point');
     writeln('(You will only lose 1 point, whatever what level you are playing)');
     writeln;
     writeln('Enjoy!');
     readln;
     clrscr;
end;

procedure Question(var question:string); {The procedure to make the question}
begin
     num:=0;
     randomize;
     num:=random(countdictionary)+1;
     question:=dictionary[num];
     num:=Level;
     While num<>0 do
         begin
              num2:=random(length(question))+1;
              if (question[num2]<>'_') then
                 begin
                      question[num2]:='_';
                      num:=num-1;
                 end;
         end;
     ChangeString(question);
     writeln('Enter the missing letter in order: ', question);
end;

Procedure Answer(question:string;var answer:string); {The procedure for the user to answer the question}
begin
     for Level:=1 to Level do
         begin
              write('Enter the missing letter in blank ',Level,': ');
              readln(Letter);
              ChangeChar(Letter);
              num:=0;
              repeat
                    num:=num+1;
                    if question[num]='_' then
                       begin
                            question[num]:=Letter;
                            num:=0;
                       end;
              until num=0;
         end;
     answer:=question;
end;

Procedure checkanswer(answer:string;var pointget:integer);  {The procedure to check whethever the answer is correct or not}
begin
     correct:=false;
     top:=1;
     bottom:=countdictionary;
     ChangeString(answer);
     repeat
           middle:=(top+bottom)div 2;
           hold:=dictionary[middle];
           ChangeString(hold);
           if answer>hold then
              top:=middle+1
           else
               if answer<hold then
                  bottom:=middle-1
               else
                   correct:=true;
     until correct or (top>bottom);
     {This part is use to calculate and tell the user the change of his points}
     if correct then
        begin
             writeln('You enter the correct answer!!');
             writeln('You have gain ',Level,' points!!');
             IDPoints[IDNo]:=IDPoints[IDNo]+Level;
             writeln;
             writeln('You now have ',IDPoints[IDNo],' points!!');
             pointget:=pointget+Level;
        end
     else
         begin
              writeln('You enter the wrong answer -_-');
              writeln('You have not gain any points -_-');
              if IDPoints[IDNo]>0 then
                 IDPoints[IDNo]:=IDPoints[IDNo]-Level;
              writeln;
              writeln('You now have ',IDPoints[IDNo],' points!');
              if pointget<>0 then
                 pointget:=pointget-1;
         end;
     writeln('Press <ENTER> to continue.');
     readln;
     clrscr;
     save:=0;
end;

procedure PlayGame(var total:integer); {The procedure that include Question, Answer, and check Answer}
begin
     Question(qword);
     Answer(qword,aword);
     clrscr;
     checkanswer(aword,total);
end;

procedure Competition; {The procedure create a fighter to have competition with the user}
var
   time:integer;
begin
     playerpoints:=0;
     marypoints:=0;
     repeat
           writeln('1. Level 1');
           writeln('2. Level 2');
           write('Which level do you want? ');
           readln(choice);
           Checking(choice,'2',correct,'CHOICE');
     until correct;
     Letter:=choice[1];
     Level:=ord(Letter)-48;
     write('How many times you want to play? ');
     readln(time);
     clrscr;
     writeln('Lets play, your fighter is Mary!');
     writeln('=================================================');
     for time:=1 to time do
         begin
              writeln('Round ',time);
              writeln('It is your term:');
              Question(qword);
              Answer(qword,aword);
              clrscr;
              num2:=0;
              checkanswer(aword,num2);
              writeln('In this round, you gain ',num2,' points!');
              playerpoints:=playerpoints+num2;
              readln;
              clrscr;
              writeln('It is Mary''s term:');
              writeln;
              randomize;
              randompoint:=random(Level);
              writeln('In this round, Mary gain ',randompoint,' points!');
              marypoints:=marypoints+randompoint;
              readln;
              clrscr;
         end;
     writeln('In total, you get ',playerpoints,' point(s)');
     writeln('In total, Mary gets ',marypoints,' point(s)');
     If marypoints<=playerpoints then
        begin
             delay(500);
             writeln('Y   Y   O   U   U   W     W I N    N');
             delay(500);
             writeln('Y   Y O   O U   U   W     W I N N  N');
             delay(500);
             writeln('  Y   O   O U   U    W W W  I N  N N');
             delay(500);
             writeln('  Y     O    U U      W W   I N    N');
        end
     else
         begin
              delay(500);
              writeln('Y   Y   O   U   U   L       O   S S S E E E');
              delay(500);
              writeln('Y   Y O   O U   U   L     O   O S     E E E');
              delay(500);
              writeln('  Y   O   O U   U   L     O   O   S   E    ');
              delay(500);
              writeln('  Y     O    U U    L L L   O   S S S E E E');
         end;
     writeln('Press <ENTER> to go back.');
     readln;
     clrscr;
end;

procedure SelectPageGame; {The page for user to select how to play}
var
   total:integer;
begin
      Rule; {Introduce the rule of the game before play}
      Again:='N';
      Repeat
            if Again='N' then
            repeat
                  Writeln('Select the function:');
                  Writeln('1. Level 1');
                  Writeln('2. Level 2');
                  Writeln('3. Competition');
                  Writeln('4. Exit');
                  Write('Which function you want to use? ');
                  Readln(choice);
                  hold2:=choice;
                  clrscr;
                  Checking(choice,'4',correct,'CHOICE'); {To check is the choice enter correctly}
            until correct;
            if choice='1' then
               Level:=1;
            if choice='2' then
               Level:=2;
            Letter:=hold2[1];
            case Letter of
                 '1','2':PlayGame(total);
                 '3':Competition;
                 '4':ExitProgram;
            end;
            if choice<>'4' then
               repeat
                     write('Try again?(Y/N) ');
                     readln(Again);
                     ChangeString(Again);
                     Checking(Again,'',correct,'YN');
               until (Again='Y')or(Again='N');
            clrscr;
      until choice='4';
end;

procedure ReadProfile; {The procedure to show the information of the user}
begin
     writeln('ID No.: ',LoginID[IDNo]);
     writeln('Name: ',Name[IDNo]);
     writeln('Sex: ',Sex[IDNo]);
     writeln('Points: ',IDPoints[IDNo]);
     writeln('Font Color: ',Fontcolor[IDNo]);
     writeln;
     writeln('Press <ENTER> to go back.');
     readln;
     clrscr;
end;

procedure EditProfile; {The procedure to edit the profile}
var
   hold1:string;
   hold2:string;
begin
     repeat
           writeln('ID No.: ',LoginID[IDNo]);
           writeln('Password: ',LoginPassword[IDNo]);
           writeln('Name: ',Name[IDNo]);
           writeln('Sex: ',Sex[IDNo]);
           writeln('Points: ',IDPoints[IDNo]);
           writeln('Font Color: ',Fontcolor[IDNo]);
           writeln('================================================');
           writeln('Select the function');
           writeln('1. Edit the Password');
           writeln('2. Edit the Name');
           writeln('3. Edit the Sex');
           writeln('4. Exit');
           write('Which function you want to use? ');
           readln(choice);
           Checking(choice,'4',correct,'CHOICE');
           clrscr;
           while (choice<='3') and (correct)do
                begin
                 if choice='1' then
                    write('You now want to change the Password? (Y/N) ');
                 if choice='2' then
                    write('You now want to change the Name? (Y/N) ');
                 if choice='3' then
                    write('You now want to change the Sex? (Y/N) ');
                 readln(Again);
                 ChangeString(Again);
                 Checking(Again,'',correct,'YN');
                 if correct then
                    begin
                         if choice='1' then
                            begin
                                 repeat
                                       writeln('The orginal Password: ',LoginPassword[IDNo]);
                                       write('The new Password: ');
                                       readln(hold1);
                                       write('Please input again: ');
                                       readln(hold2);
                                       Checking(hold1,hold2,correct,'DOUBLE');
                                       if correct then
                                          LoginPassword[IDNo]:=hold1;
                                 until correct;
                            end;
                         if choice='2' then
                            begin
                                 repeat
                                       writeln('The orginal Name: ',Name[IDNo]);
                                       write('The new Name: ');
                                       readln(hold1);
                                       ChangeString(hold1);
                                       write('Please input again: ');
                                       readln(hold2);
                                       clrscr;
                                       ChangeString(hold2);
                                       Checking(hold1,hold2,correct,'DOUBLE');
                                       if correct then
                                          Name[IDNo]:=hold1;
                                 until correct;
                            end;
                         if choice='3' then
                            begin
                                 repeat
                                       writeln('The orginal Sex: ',Sex[IDNo]);
                                       write('The new Sex: (M/F) ');
                                       readln(hold1);
                                       ChangeString(hold1);
                                       write('Please input again: ');
                                       readln(hold2);
                                       ChangeString(hold2);
                                       Checking(hold1,'',correct,'SEX');
                                       if correct then
                                          Checking(hold1,hold2,correct,'DOUBLE');
                                       if correct then
                                          Sex[IDNo]:=hold1;
                                 until correct;
                            end;
                         writeln('The data have been changed.');
                         writeln;
                         writeln('Press <ENTER> to go back.');
                         readln;
                         clrscr;
                    End
                 else if Again<>'N' then
                      correct:=true;
                End;
           If Choice='4' Then
              ExitProgram;
     Until (Choice='4');
End;

Procedure Ranking; {The procedure shows the ranking of all the user}
Var
   time,time2:integer;
begin
     SaveRecord;
     clrscr;
     for time2:=1 to count do
         for time:=time2 to count do
             begin
                  if IDPoints[time2]<IDPoints[time] then
                     begin
                          hold:=LoginID[time2];
                          LoginID[time2]:=LoginID[time];
                          LoginID[time]:=hold;
                          hold:=Name[time2];
                          Name[time2]:=Name[time];
                          Name[time]:=hold;
                          hold:=Sex[time2];
                          Sex[time2]:=Sex[time];
                          Sex[time]:=hold;
                          hold:=Points[time2];
                          Points[time2]:=Points[time];
                          Points[time]:=hold;
                     end;
             end;
     for count:=1 to count do
         writeln(Name[count],' ',Sex[count],' ',Points[count]);
     writeln('Press <ENTER> to go back.');
     readln;
     ReadRecord(count,data);
end;

procedure Coupon; {The procedure for buying coupon}
begin
     if IDPoints[IDNo]>=50 then
        begin
             IDPoints[IDNo]:=IDPoints[IDNo]-50;
             SaveRecord;
             writeln('The things will send to your home soon.');
        end
     else
         begin
              clrscr;
              writeln('!!!!!!!!!!!!!!WARNING!!!!!!!!!!!!!!!');
              writeln('!!                                !!');
              writeln('!! You do not have enough points. !!');
              writeln('!! You cannot buy it.             !!');
              writeln('!! You need ',50-IDPoints[IDNo],' more points.       !!');
              writeln('!! Please try again.              !!');
              writeln('!!                                !!');
              writeln('!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!');
         end;
     writeln;
     writeln('Press <ENTER> to go back.');
     readln;
     clrscr;
end;

procedure Shop; {The procedure for user to select what to buy}
begin
     repeat
           writeln('Select the function');
           writeln('1. coupon of Wellcome($50), need 50 points');
           writeln('2. coupon of KKShop(20% off), need 50 points');
           writeln('3. Exit');
           write('Which function you want to use? ');
           readln(choice);
           Checking(choice,'3',correct,'CHOICE');
           case Letter of
                '1','2':Coupon;
                '3':ExitProgram;
           end;
     until choice='3';
end;

procedure SelectColor; {The procedure for user to change the font color}
begin
     repeat
           repeat
                 writeln('Select the funtion:');
                 TextColor(10);
                 writeln('1. Green (Orginal Set)');
                 TextColor(9);
                 writeln('2. Blue');
                 TextColor(11);
                 writeln('3. Pure Blue');
                 TextColor(12);
                 writeln('4. Red');
                 TextColor(13);
                 writeln('5. Pink');
                 TextColor(14);
                 writeln('6. Yellow');
                 TextColor(15);
                 writeln('7. White');
                 ChangeColor(FontColor[IDNo]);
                 writeln('8. Exit');
                 write('Which function you want to use? ');
                 readln(choice);
                 Checking(choice,'8',correct,'CHOICE');
                 if (choice='1') or (choice='2') then
                    save:=0;
                 case Letter of
                      '1':ChangeColor('Green');
                      '2':ChangeColor('Blue');
                      '3':ChangeColor('PureBlue');
                      '4':ChangeColor('Red');
                      '5':ChangeColor('Pink');
                      '6':ChangeColor('Yellow');
                      '7':ChangeColor('White');
                 end;
                 clrscr;
           until correct;
           Again:='N';
           if choice<>'8' then
             writeln('The color have been changed.');
     until choice='8';
     ExitProgram;
     choice:='';
end;

begin
     Textbackground(0);
     TextColor(10);
     Readdictionary;
     count:=0;
     num:=0;
     ReadRecord(count,data);
     Welcome;
     save:=1;
     clrscr;
     IDNo:=1;
     Login(count);
     clrscr;
     repeat
           writeln('Welcome, ',Name[IDNo]);
           writeln('You now have ',Points[IDNo],' points');
           writeln('=======================================');
           writeln('Select the function');
           writeln('1. Game (Fill in the blanks)');
           writeln('2. Profile');
           writeln('3. Edit Profile');
           writeln('4. Ranking (The data will automatically save)');
           writeln('5. Shop');
           writeln('6. Save');
           writeln('7. Change Font Color');
           writeln('8. Exit');
           write('Which function you want to use? ');
           readln(choice);
           clrscr;
           Checking(choice,'8',correct,'CHOICE');
           case Letter of
                '1':SelectPageGame;
                '2':ReadProfile;
                '3':EditProfile;
                '4':Ranking;
                '5':Shop;
                '6':SaveRecord;
                '7':SelectColor;
                '8':ExitProgram;
           end;
           clrscr;
     until (choice='8');
     writeln('Thank you for using the game!');
     writeln;
     writeln('Press <ENTER> to exit.');
     readln;
end.

