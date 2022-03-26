function varargout = Cartoonization(varargin)
% CARTOONIZATION MATLAB code for Cartoonization.fig
%      CARTOONIZATION, by itself, creates a new CARTOONIZATION or raises the existing
%      singleton*.
%
%      H = CARTOONIZATION returns the handle to a new CARTOONIZATION or the handle to
%      the existing singleton*.
%
%      CARTOONIZATION('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in CARTOONIZATION.M with the given input arguments.
%
%      CARTOONIZATION('Property','Value',...) creates a new CARTOONIZATION or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Cartoonization_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Cartoonization_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Cartoonization

% Last Modified by GUIDE v2.5 04-Jan-2022 13:01:29

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Cartoonization_OpeningFcn, ...
                   'gui_OutputFcn',  @Cartoonization_OutputFcn, ...
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


% --- Executes just before Cartoonization is made visible.
function Cartoonization_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Cartoonization (see VARARGIN)

% Choose default command line output for Cartoonization
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Cartoonization wait for user response (see UIRESUME)
% uiwait(handles.figure1);
axes(handles.axes1);
set(gca,'xtick',[],'ytick',[]);
title('Original Image');

axes(handles.axes2);
set(gca,'xtick',[],'ytick',[]);
title('Cartoonized Image');

global sliderval sigma dos edgetype dither
dither = "nodither";
sliderval=20;sigma=5;dos =2;
set(handles.slider1,'Value',sliderval);
set(handles.text5,'String','20');

set(handles.slider2,'Value',sigma)
set(handles.text6,'String','5');

set(handles.slider3,'Value',dos);
set(handles.text7,'String','2');    

edgetype='Prewitt';
set(handles.radiobutton1,'Value',1);
set(handles.radiobutton2,'Value',0);
set(handles.radiobutton3,'Value',0);
set(handles.radiobutton4,'Value',0);

set(handles.radiobutton5,'Value',0);
% --- Outputs from this function are returned to the command line.
function varargout = Cartoonization_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global im
[filename, pathname, filterindex] = uigetfile(...
    {'*.jpg','JPEG image(*.jpg)';...
    '*.png','PNG image(*.png)';...
    '*.*','All files(*.*)'});

filepath = strcat(pathname,filename);

im = imread(filepath);
axes(handles.axes1);
imshow(im);
set(gca,'xtick',[],'ytick',[]);
title('Original Image');

set(handles.text4,'string',filepath);

% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global im 
SnapShot
axes(handles.axes1);
imshow(im);
title('\bf\it Original Image');

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



function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global im sliderval sigma dos final edgetype  f save dither
set(handles.text8,'String','Wainting...');
set(handles.text8,'BackgroundColor','red')
pause(1.0);
if isempty(im)
    errordlg('Please choose an image !','File Error');
else
    %% sobel
    h1 = [1 2 1;0 0 0; -1 -2 -1]; % Horizontal sobel mask
    h2 = h1'; % Vertical sobel mask
    p1 = imfilter( im, h1,'replicate'); % Apply horiz. sobel filter on image
    p2 = imfilter( im, h2,'replicate' ); % Apply vert. sobel filter on image
    I = abs(p1) + abs(p2); % Add abs. Sobel edges
    %% Black Edged
    Black_edged = im-I;
    %% color quantization
    A = sliderval;
    [X,map] = rgb2ind(Black_edged,A,dither);
    im_quan = ind2rgb(X, map);
    %% structure element constructing
    row=str2double(get(handles.edit2,'String'));
    col=str2double(get(handles.edit2,'String'));
    buyukdeger=max(row,col);
    if mod(buyukdeger,2)==1
        se=zeros(buyukdeger);
    else
        se=zeros(buyukdeger+1);
    end
    se(1:row,1:col)=1;
    %% smoothing quantized image
    h=ones(5,5)/25;
    imgblur=imfilter(im_quan,h);
    %% Dilating edges
    edgeImage = edge(rgb2gray(imgblur), edgetype);
    edgeImage = im2double(edgeImage);
    edgeImage=imdilate(edgeImage,se);
    %% Applying Bilateral Filter (smoothing and preserving edges)
    imLAB = rgb2lab(im_quan);
    patch = imcrop(imLAB,[34,71,60,55]);
    patchSq = patch.^2;
    edist = sqrt(sum(patchSq,3));
    patchVar = std2(edist).^2;
    DoS2 = dos*patchVar;
    smoothedLAB2 = imbilatfilt(imLAB,DoS2,sigma);
    smoothedRBG2 = lab2rgb(smoothedLAB2,"Out","uint8");
    smoothedRBG2=im2double(smoothedRBG2);
end
%% Adding thickened edges to filtered image
axes(handles.axes2);
f =smoothedRBG2.*imcomplement(edgeImage);
imshow(f); % Add sobel edges to image

final = f;  
f = save;
set(handles.text8,'string','Succesful');
set(handles.text8,'BackgroundColor','green')
set(gca,'xtick',[],'ytick',[]);
title('\it Cartoonized Image');

% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
cla(handles.axes1);
cla(handles.axes2);

% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global save
[filename, pathname, filterindex] = uiputfile(...
    {'*.jpg','JPEG image(*.jpg)';...
    '*.png','Portable Network Graphic(*.png)';...
    '*.*','All files(*.*)'},'Save as');
imwrite(save,filename);

% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close;

% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global final f save 
if isempty(final)
    errordlg('There is no carttonized image !','File Error');
else
figure(2)
imshow(f)
[J,rect] = imcrop(final);
J(J==0) = 0.5;
rect = round(rect);
h = ones(20,20)/400;
crop = imfilter(J,h,'replicate');

final(rect(2): rect(2)+rect(4)-1,rect(1):rect(1)+rect(3)-1,:) = crop;
f = final;
save = final;
end
%% Adding thickened edges to filtered image
axes(handles.axes2);
imshow(final); % Add sobel edges to image
% set(handles.text14,'string','Succesful');
set(gca,'xtick',[],'ytick',[]);
title('\it Cartoonized Image');


% --- Executes on slider movement.
function slider3_Callback(hObject, eventdata, handles)
% hObject    handle to slider3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
global sigma
sigma=round(get(handles.slider3,'Value')+1);
set(handles.text7,'String',num2str(sigma));

% --- Executes during object creation, after setting all properties.
function slider3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider2_Callback(hObject, eventdata, handles)
% hObject    handle to slider2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
global dos
dos=round(get(handles.slider2,'Value')+1);
set(handles.text6,'String',num2str(dos));

% --- Executes during object creation, after setting all properties.
function slider2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider1_Callback(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
global sliderval
sliderval=round(get(handles.slider1,'Value')+1);
set(handles.text5,'String',num2str(sliderval));

% --- Executes during object creation, after setting all properties.
function slider1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on button press in radiobutton1.
function radiobutton1_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton1
global edgetype
set(handles.radiobutton1,'Value',1);
set(handles.radiobutton2,'Value',0);
set(handles.radiobutton3,'Value',0);
set(handles.radiobutton4,'Value',0);
edgetype='Prewitt';

% --- Executes on button press in radiobutton2.
function radiobutton2_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton2
global edgetype
set(handles.radiobutton1,'Value',0);
set(handles.radiobutton2,'Value',1);
set(handles.radiobutton3,'Value',0);
set(handles.radiobutton4,'Value',0);
edgetype='Sobel';

% --- Executes on button press in radiobutton3.
function radiobutton3_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton3
global edgetype
set(handles.radiobutton1,'Value',0);
set(handles.radiobutton2,'Value',0);
set(handles.radiobutton3,'Value',1);
set(handles.radiobutton4,'Value',0);
edgetype='approxcanny';


% --- Executes on button press in radiobutton4.
function radiobutton4_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton4
global edgetype
set(handles.radiobutton1,'Value',0);
set(handles.radiobutton2,'Value',0);
set(handles.radiobutton3,'Value',0);
set(handles.radiobutton4,'Value',1);
edgetype='Roberts';


% --- Executes on button press in radiobutton5.
function radiobutton5_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton5
global dither
A = get(handles.radiobutton5,'Value');
A
if(A)
    dither = 'dither';
else
    dither = 'nodither';
end
dither
