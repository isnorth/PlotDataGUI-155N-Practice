function [] = plotDataGUI()
    %This function was created for Lab 7
    %It depends upon another function given for the lab, called
    %"plotData.m" which must be saved in the same folder for this function
    %to run. 
    %Data for the figures turned in with this code was taken from Lab 5,
    %and is located in the funLinePlot.m file located in the same folder,
    %on this computer in the "MATLAB" folder, as of 7/30/2020

    %The following lines set up all the buttons and prompt text in the
    %figure
    
    %turns off figure number and gives the figure a title
    gui.fig = figure('numbertitle','off','name','plotDataGUI');
    
    %provides prompt text for figure title and entry box
    gui.titleText = uicontrol('style','text','position',[20 380 50 20],'string','Plot Title:','horizontalalignment','right');
    gui.titleEdit = uicontrol('style','edit','position',[80 380 450 20]);
    
    %provides prompt text for x data and entry box
    gui.xDataText = uicontrol('style','text','position',[20 350 50 20],'string','X values:','horizontalalignment','right');
    gui.xDataEdit = uicontrol('style','edit','position',[80 350 450 20]);
    
    %provides prompt text for y data and entry box
    gui.yDataText = uicontrol('style','text','position',[20 320 50 20],'string','Y values:','horizontalalignment','right');
    gui.yDataEdit = uicontrol('style','edit','position',[80 320 450 20]);
    
    %provides prompt text for x axis label and entry box
    gui.xLabelText = uicontrol('style','text','position',[20 290 50 20],'string','X Label:','horizontalalignment','right');
    gui.xLabelEdit = uicontrol('style','edit','position',[80 290 450 20]);
    
    %provides prompt text for y axis label and entry box
    gui.yLabelText = uicontrol('style','text','position',[20 260 50 20],'string','Y Label:','horizontalalignment','right');
    gui.yLabelEdit = uicontrol('style','edit','position',[80 260 450 20]);
    
    %provides prompt text for x axis limits and entry box
    gui.xLimText = uicontrol('style','text','position',[20 230 50 20],'string','X Lim:','horizontalalignment','right');
    gui.xLimEdit = uicontrol('style','edit','position',[80 230 220 20]);
    
    %provides prompt text for y axis limits and entry box
    gui.yLimText = uicontrol('style','text','position',[250 230 50 20],'string','Y Lim:','horizontalalignment','right');
    gui.yLimEdit = uicontrol('style','edit','position',[310 230 220 20]);
    
    %provides prompt text for data marker and drop down menu with options
    %note that the {} must be used
    gui.typeText = uicontrol('style','text','position',[200 200 50 20],'string','Type:','horizontalalignment','right');
    gui.typeMenu = uicontrol('style','popupmenu','position',[260 200 60 20],'string',{'o','x','*'},'horizontalalignment','center');
    
    %create button to push after all data is entered and link to Callback
    gui.button = uicontrol('style','pushbutton','position',[235 20 100 40],'string','Plot');
    gui.button.String = 'Plot';
    gui.button.Callback = {@plotDataCallback,gui};
end

function [] = plotDataCallback(source,event,gui)
    %turn all text boxes and prompts off to wipe the figure clear
    %text blocks below correspond to those above for readability
    
    gui.titleText.Visible = 'off';
    gui.titleEdit.Visible = 'off';
    
    gui.xDataText.Visible = 'off';
    gui.xDataEdit.Visible = 'off';
    
    gui.yDataText.Visible = 'off';
    gui.yDataEdit.Visible = 'off';
    
    gui.xLabelText.Visible = 'off';
    gui.xLabelEdit.Visible = 'off';
    
    gui.yLabelText.Visible = 'off';
    gui.yLabelEdit.Visible = 'off';
    
    gui.xLimText.Visible = 'off';
    gui.xLimEdit.Visible = 'off';
    
    gui.yLimText.Visible = 'off';
    gui.yLimEdit.Visible = 'off';
    
    gui.typeText.Visible = 'off';
    gui.typeMenu.Visible = 'off';
    
    gui.button.Visible = 'off';
    
    %create a figure in gui structure with entered name
    gui.fig.Name = gui.titleEdit.String;
    
    %transform entered characters to numbers
    x = str2num(gui.xDataEdit.String);
    y = str2num(gui.yDataEdit.String);
    
    type = 'o'; %sets default type
    
    %Connects the chosen option of the popupmenu to 
    %the marker type of the resulting figure
    switch gui.typeMenu.Value
        case 1
            type = 'o';
        case 2
            type = 'x';
        case 3 
            type = '*';
    end
    
    %Creates plot in the gui structure
    %Calls the plotData function and inputs the 
    %user values from the above prompts
    gui.plot = plotData(str2num(gui.xDataEdit.String), ...
        str2num(gui.yDataEdit.String), ...
        type, ...
        gui.titleEdit.String, ...
        gui.xLabelEdit.String, gui.yLabelEdit.String, ...
        str2num(gui.xLimEdit.String), str2num(gui.yLimEdit.String));
end