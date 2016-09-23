function simple_gui2

%sampling frequency
global fs
fs = 44100;


%chData = {wave type,octave,detuning,phase,invert}
            % wave type - choose between 'Sawtooth', 'Triangle', 'Square',
            %           'Sine' wave
            % octave - choose octave level for a signal (basically it is a
            %          multiplier of a base frequency specified in
            %          function keyPress(src, e)
            % detuning - '0' = off, '1' = on
            % phase - signal phase between -90 and 90 degrees
            % invert - '1' - signal is not inverted, '-1' - signal is
            %           inverted

chData = {'None','0',0,0,1;...
          'None','0',0,0,1;...
          'None','0',0,0,1;...
          'None','0',0,0,1}

%  Create and then hide the UI as it is being constructed.
f = figure('Name','Synthesizer','Visible','on','Position',[360,300,700,285],'KeyPressFcn', @keyPress);

for k=1:4; 
    detuneCheckbox(k) = uicontrol('Style','checkbox', ...
                                  'Value',0,'Position',[10+150*k 55 130 20],        ...
                                  'Callback',{@checkBoxCallback,k});
    invertCheckbox(k) = uicontrol('Style','checkbox', ...
                                  'Value',0,'Position',[10+150*k 35 130 20],        ...
                                  'Callback',{@invertCallback,k});                             
                    
    chpopup(k)   = uicontrol('Style','popupmenu',...
                             'String',{'None','Sawtooth','Triangle','Square','Sine'},...
                             'Position',[150*k - 100,50,100,25],'Callback',{@chpopup_Callback,k});
    choctave(k)  = uicontrol('Style','popupmenu',...
                             'String',{'-2','-1','0','1','2','3'},...
                             'Position',[150*k - 100,30,100,25],'Callback',{@choctave_Callback,k});
                      
    chphase(k) = uicontrol('Style', 'slider',...
                           'Min',-180,'Max',180,'Value',0,...
                           'Position', [150*k-100 80 100 25],...
                           'Callback', {@chphase_Callback,k});                  
end     

       
%real time keyboard
    function keyPress(src, e)
        switch e.Key
            case 'q'
               sound( mixer(chData,440.00),44100) %A
            case 'w'
               sound( mixer(chData,493.88),44100) %H
            case 'e'
               sound( mixer(chData,523.25),44100) %C
            case 'r'
               sound( mixer(chData,587.33),44100) %D
            case 't'
               sound( mixer(chData,659.25),44100) %E
            case 'y'
               sound( mixer(chData,698.45),44100) %F
            case 'u'
               sound( mixer(chData,783.98),44100) %G              
            case 'i'
               sound( mixer(chData,880.00),44100) %A   
            case 'o'
               sound( mixer(chData,987.77),44100) %H                
            case 'p'
               sound( mixer(chData,1046.5),44100) %C                 
        end
    end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%function callback for checkBox detuning
 function checkBoxCallback(hObject,eventData,checkBoxId)
    value = get(hObject,'Value');
    if value
        switch checkBoxId
            case 1
                chData{1,3} = 1
            case 2
                chData{2,3} = 1
            case 3
                chData{3,3} = 1
            otherwise
                chData{4,3} = 1
        end
    else
        switch checkBoxId
            case 1
                chData{1,3} = 0
            case 2
                chData{2,3} = 0
            case 3
                chData{3,3} = 0                
            otherwise
                chData{4,3} = 0
        end      
    end
 end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%function callback for channel signal inverting
 function invertCallback(hObject,eventData,checkBoxId)
    value = get(hObject,'Value');
    if value
        switch checkBoxId
            case 1
                chData{1,5} = -1
            case 2
                chData{2,5} = -1
            case 3
                chData{3,5} = -1
            otherwise
                chData{4,5} = -1
        end
    else
        switch checkBoxId
            case 1
                chData{1,5} = 1
            case 2
                chData{2,5} = 1
            case 3
                chData{3,5} = 1                
            otherwise
                chData{4,5} = 1
        end      
    end
 end

   function chpopup_Callback(source,~,id) 
      % Determine the selected data set.
      str = source.String;
      val = source.Value;
      % Set current data to the selected data set.
      chData{id,1}=str{val}
   end

   function choctave_Callback(source,~,id) 
      % Determine the selected data set.
      str = source.String;
      val = source.Value;
      % Set current data to the selected data set.
      chData{id,2}=str{val}
   end

   function chphase_Callback(source,~,id) 
      % Determine the selected data set.
      str = source.String;
      val = source.Value;
      % Set current data to the selected data set.
      chData{id,4} = val
     
   end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%5
end