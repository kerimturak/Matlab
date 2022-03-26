function varargout = SnapShot(varargin)
% SNAPSHOT MATLAB code for SnapShot.fig
%      SNAPSHOT, by itself, creates a new SNAPSHOT or raises the existing
%      singleton*.
%
%      H = SNAPSHOT returns the handle to a new SNAPSHOT or the handle to
%      the existing singleton*.
%
%      SNAPSHOT('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SNAPSHOT.M with the given input arguments.
%
%      SNAPSHOT('Property','Value',...) creates a new SNAPSHOT or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before SnapShot_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to SnapShot_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help SnapShot

% Last Modified by GUIDE v2.5 02-Jan-2022 20:24:44

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @SnapShot_OpeningFcn, ...
                   'gui_OutputFcn',  @SnapShot_OutputFcn, ...
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


% --- Executes just before SnapShot is made visible.
function SnapShot_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to SnapShot (see VARARGIN)

% Choose default command line output for SnapShot
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes SnapShot wait for user response (see UIRESUME)
% uiwait(handles.figure1);
set(gca,'xtick',[],'ytick',[]);
global a x state video
state=true;
axes(handles.axes1);
x=webcam(2);
while true
    video=snapshot(x);
    imshow(video);
    if ~state
        close SnapShot;
        break;
    end
end
delete(x);


% --- Outputs from this function are returned to the command line.
function varargout = SnapShot_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
% varargout{1} = handles.output;


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global im state video x;
im=video;
choice=questdlg('Do you want save this photo ?','Save','Yes','No Thanks','No Thanks');
switch choice
    case 'Yes'
    [filename pathname index]=uiputfile({'*.jpg';'*.jpeg';'*.png'},'Save as');
    if filename~=0
        imwrite(im,filename);
    end
    case 'No Thanks'
end
state=false;
