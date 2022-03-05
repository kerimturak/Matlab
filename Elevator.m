function varargout = Elevator(varargin)
% ELEVATOR MATLAB code for Elevator.fig
%      ELEVATOR, by itself, creates a new ELEVATOR or raises the existing
%      singleton*.
%
%      H = ELEVATOR returns the handle to a new ELEVATOR or the handle to
%      the existing singleton*.
%
%      ELEVATOR('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in ELEVATOR.M with the given input arguments.
%
%      ELEVATOR('Property','Value',...) creates a new ELEVATOR or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Elevator_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Elevator_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Elevator

% Last Modified by GUIDE v2.5 02-Nov-2021 15:25:54

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Elevator_OpeningFcn, ...
                   'gui_OutputFcn',  @Elevator_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before Elevator is made visible.
function Elevator_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Elevator (see VARARGIN)

% Choose default command line output for Elevator
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Elevator wait for user response (see UIRESUME)
% uiwait(handles.figure1);
axes(handles.axes1);
title('Time vs High from Ground');
xlabel('\it \bf Time');
ylabel('\it \bf Distance');
xlim([0,300]);
ylim([0,30]);
global x a
x=0;

% --- Outputs from this function are returned to the command line.
function varargout = Elevator_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
    global a;
    sendData = 1;
    fprintf(a,'%i',sendData); %this will send 5 to the arduino


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
    global a;
    sendData = 2;
    fprintf(a,'%i',sendData); %this will send 5 to the arduino


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
    global a;
    sendData = 3;
    fprintf(a,'%i',sendData); %this will send 5 to the arduino


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
    global a;
    sendData = 4;
    fprintf(a,'%i',sendData); %this will send 5 to the arduino


% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1


% --- Executes during object creation, after setting all properties.
function popupmenu1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
delete(instrfindall);
contents = get(handles.popupmenu1,'String'); 
popupmenu1value = contents{get(handles.popupmenu1,'Value')};
global a;
try
    a = serial(popupmenu1value,'BaudRate',9600);  % insert your serial
    fopen(a);
    set(handles.edit1, 'BackgroundColor','green');
    set(handles.edit1,'String','Connected');
catch
    set(handles.edit1, 'BackgroundColor', 'red');
    set(handles.edit1,'String','Error');
end

global a x
for i = 1:300 
    val=str2double(fscanf(a));
    x = [x val];
    plot(handles.axes1,x,"Color","green");
    title('Time vs High from Ground');
    xlabel('\it \bf Time');
    ylabel('\it \bf Distance');
    xlim([0,300]);
    ylim([0,30]);
    drawnow
    set(handles.edit1,'String',num2str(val));
    pause(1);
end
save('data.mat');
guidata(hObject, handles);
