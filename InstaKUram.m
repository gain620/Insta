function varargout = InstaKUram(varargin)
% INSTAKURAM M-file for InstaKUram.fig
%      INSTAKURAM, by itself, creates a new INSTAKURAM or raises the existing
%      singleton*.
%
%      H = INSTAKURAM returns the handle to a new INSTAKURAM or the handle to
%      the existing singleton*.
%
%      INSTAKURAM('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in INSTAKURAM.M with the given input arguments.
%
%      INSTAKURAM('Property','Value',...) creates a new INSTAKURAM or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before InstaKUram_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to InstaKUram_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help InstaKUram

% Last Modified by GUIDE v2.5 04-Dec-2014 21:11:04

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @InstaKUram_OpeningFcn, ...
                   'gui_OutputFcn',  @InstaKUram_OutputFcn, ...
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



% --- Executes just before InstaKUram is made visible.
function InstaKUram_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to InstaKUram (see VARARGIN)

% Choose default command line output for InstaKUram
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes InstaKUram wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = InstaKUram_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in load image.
function pushbutton1_Callback(hObject, eventdata, handles)
% 이미지 로드
global img img2;
[loadPath, user_canceled] = imgetfile();
if user_canceled
    msgbox(sprintf('No Image Selected!'),'Error','Error');
    return
end



img = imread(loadPath);
img2 = img;
axes(handles.axes1);
imshow(img);


% --- Executes on button press in save image.
function pushbutton2_Callback(hObject, eventdata, handles)
% 패널에 보이는 이미지를 저장
global img;
[savePath, user_canceled] = imsave();
if user_canceled
    msgbox(sprintf('No Save Path Selected!'),'Error','Error');
    return
end




% --- Executes on button press in gray filter.
function pushbutton3_Callback(hObject, eventdata, handles)
%Gray Filter
global img;
img_gray = rgb2gray(img);
axes(handles.axes1);
imshow(img_gray);


% --- Executes on button press in binary filter.
function pushbutton4_Callback(hObject, eventdata, handles)
% Binary Filter
global img;
img_gray = rgb2gray(img);
img_binary = img_gray > 128;
axes(handles.axes1);
imshow(img_binary);


% --- Executes on button press in quantization filter.
function pushbutton5_Callback(hObject, eventdata, handles)
% Quantization Filter
global img;
level = 4;
img_quantization = fix(img/(256/level));
img_quantization = 255 * img_quantization / (level - 1);
img_quantization = uint8(img_quantization);
axes(handles.axes1);
imshow(img_quantization);


% --- Executes on button press in negative filter.
function pushbutton6_Callback(hObject, eventdata, handles)
% Negative Filter
global img;
img_rev = 255 - img;
axes(handles.axes1);
imshow(img_rev);


% --- Executes on button press in blur filter.
function pushbutton7_Callback(hObject, eventdata, handles)
% Blur Filter
global img;
img_blur = imresize(imresize(img, 1/16),16);
axes(handles.axes1);
imshow(img_blur);


% --- Executes on button press in flip filter.
function pushbutton8_Callback(hObject, eventdata, handles)




% --- Executes on button press in reset image.
function pushbutton9_Callback(hObject, eventdata, handles)
% 이미지 원본으로 리셋
global img2;
axes(handles.axes1);
imshow(img2);


% --- Executes on slider movement.
function slider1_Callback(hObject, eventdata, handles)
% Slide to change brightness
global img;
val = 0.5 * get(hObject, 'Value') - 0.5;
img_bright = img + val;
axes(handles.axes1);
imshow(img_bright);


% --- Executes during object creation, after setting all properties.
function slider1_CreateFcn(hObject, eventdata, handles)
% Brightness Change

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on key press with focus on slider1 and none of its controls.
function slider1_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  structure with the following fields (see UICONTROL)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton10.
function pushbutton10_Callback(hObject, eventdata, handles)
global img;

img_hor = flipdim(img ,2);           %# horizontal flip

%I3 = flipdim(I ,1);           %# vertical flip
%I4 = flipdim(I3,2);    %# horizontal+vertical flip
axes(handles.axes1);
imshow(img_hor);


% --- Executes on slider movement.
function slider2_Callback(hObject, eventdata, handles)
global img;
img(:,:,1) = img(:,:,1) + get(hObject, 'Value');
axes(handles.axes1);
imshow(img);


% --- Executes during object creation, after setting all properties.
function slider2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on button press in mosaic filter.
function pushbutton11_Callback(hObject, eventdata, handles)
global img;
global mosaicCount;

if mosaicCount == 8
        mosaicCount = 1;
end
    

img_mosaic = ku_mosaic(img,mosaicCount);
mosaicCount = mosaicCount + 1;
axes(handles.axes1);
imshow(img_mosaic);



% --- Executes on button press in caffebene filter.
function pushbutton12_Callback(hObject, eventdata, handles)
global img;
img_bene = caffebene(img);
axes(handles.axes1);
imshow(img_bene);


