function varargout = stepperControl(varargin)
% STEPPERCONTROL MATLAB code for stepperControl.fig
%      STEPPERCONTROL, by itself, creates a new STEPPERCONTROL or raises the existing
%      singleton*.
%
%      H = STEPPERCONTROL returns the handle to a new STEPPERCONTROL or the handle to
%      the existing singleton*.
%
%      STEPPERCONTROL('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in STEPPERCONTROL.M with the given input arguments.
%
%      STEPPERCONTROL('Property','Value',...) creates a new STEPPERCONTROL or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before stepperControl_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to stepperControl_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help stepperControl

% Last Modified by GUIDE v2.5 15-Jan-2019 15:14:05

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @stepperControl_OpeningFcn, ...
                   'gui_OutputFcn',  @stepperControl_OutputFcn, ...
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


% --- Executes just before stepperControl is made visible.
function stepperControl_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to stepperControl (see VARARGIN)

% Choose default command line output for stepperControl
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes stepperControl wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = stepperControl_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function edit_speed_Callback(hObject, eventdata, handles)
% hObject    handle to edit_speed (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_speed as text
%        str2double(get(hObject,'String')) returns contents of edit_speed as a double


% --- Executes during object creation, after setting all properties.
function edit_speed_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_speed (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_pos_Callback(hObject, eventdata, handles)
% hObject    handle to edit_pos (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_pos as text
%        str2double(get(hObject,'String')) returns contents of edit_pos as a double


% --- Executes during object creation, after setting all properties.
function edit_pos_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_pos (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_state_Callback(hObject, eventdata, handles)
% hObject    handle to edit_state (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_state as text
%        str2double(get(hObject,'String')) returns contents of edit_state as a double


% --- Executes during object creation, after setting all properties.
function edit_state_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_state (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in btn_reset.
function btn_reset_Callback(hObject, eventdata, handles)
% hObject    handle to btn_reset (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.edit_state, 'string', 'RESET')
set(handles.slider_pos, 'value', 0)
slider_pos_Callback(handles.slider_pos, eventdata, handles)

% --- Executes on button press in btn_stop.
function btn_stop_Callback(hObject, eventdata, handles)
% hObject    handle to btn_stop (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.edit_state, 'string', 'STOP')

% --- Executes on slider movement.
function slider_pos_Callback(hObject, eventdata, handles)
% hObject    handle to slider_pos (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
nowpos = get(hObject, 'Value');
set(handles.text_preset, 'string', ['当前设置：' ,num2str(nowpos), '%'])
% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider_pos_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider_pos (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on button press in rbt_coarse.
function rbt_coarse_Callback(hObject, eventdata, handles)
% hObject    handle to rbt_coarse (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.rbt_coarse, 'value', 1)
set(handles.rbt_fine, 'value', 0)
% set(hObject, 'SliderStep', [0.01, 0.1])
% Hint: get(hObject,'Value') returns toggle state of rbt_coarse


% --- Executes on button press in rbt_fine.
function rbt_fine_Callback(hObject, eventdata, handles)
% hObject    handle to rbt_fine (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.rbt_coarse, 'value', 0)
set(handles.rbt_fine, 'value', 1)
% set(hObject, 'SliderStep', [0.01, 0.1])
% Hint: get(hObject,'Value') returns toggle state of rbt_fine


% --- Executes on button press in cb_usecode.
function cb_usecode_Callback(hObject, eventdata, handles)
% hObject    handle to cb_usecode (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if get(hObject, 'value')
    set(handles.edit_code, 'enable', 'on')
    set(handles.tgb_start, 'enable', 'on')
else
    set(handles.edit_code, 'enable', 'off')
    set(handles.tgb_start, 'enable', 'off')
end
% Hint: get(hObject,'Value') returns toggle state of cb_usecode



function edit_code_Callback(hObject, eventdata, handles)
% hObject    handle to edit_code (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_code as text
%        str2double(get(hObject,'String')) returns contents of edit_code as a double


% --- Executes during object creation, after setting all properties.
function edit_code_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_code (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in tgb_start.
function tgb_start_Callback(hObject, eventdata, handles)
% hObject    handle to tgb_start (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of tgb_start


% --------------------------------------------------------------------
function About_Callback(hObject, eventdata, handles)
% hObject    handle to About (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Author_Callback(hObject, eventdata, handles)
% hObject    handle to Author (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
txt = {'步进电机控制台 Based On Matlab', ...
    '版本号：V1.0.0 - Special For OLab', ...
    'Powered By 寅一   CopyRight(C)2019'};
msgbox(txt, '关于')

% --------------------------------------------------------------------
function Help_Callback(hObject, eventdata, handles)
% hObject    handle to Help (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% --------------------------------------------------------------------
function openSerial()
    clear obj
    global obj
    list = seriallist;
    msgbox(list, '可用端口')
    portname = inputdlg('串口名称：', '连接电机');
    if isempty(portname)
        return
    end
    
    try
        obj = serial(portname, 'Baudrate', 9600, 'Databits', 8);
        fopen(obj);
        obj.ReadAsynMode = 'continuous';
    catch err
        msgbox('串口打开失败', 'Error:')
    end

% --------------------------------------------------------------------
function Begin_Callback(hObject, eventdata, handles)
% hObject    handle to Begin (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Serial_Callback(hObject, eventdata, handles)
% hObject    handle to Serial (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
openSerial()

% --------------------------------------------------------------------
function Exit_Callback(hObject, eventdata, handles)
% hObject    handle to Exit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if exist('obj', 'var') == 1
    fclose(obj);
end
close()
