function varargout = GUI_Proj_Stereo(varargin)
% GUI_PROJ_STEREO MATLAB code for GUI_Proj_Stereo.fig
%      GUI_PROJ_STEREO, by itself, creates a new GUI_PROJ_STEREO or raises the existing
%      singleton*.
%
%      H = GUI_PROJ_STEREO returns the handle to a new GUI_PROJ_STEREO or the handle to
%      the existing singleton*.
%
%      GUI_PROJ_STEREO('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUI_PROJ_STEREO.M with the given input arguments.
%
%      GUI_PROJ_STEREO('Property','Value',...) creates a new GUI_PROJ_STEREO or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before GUI_Proj_Stereo_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to GUI_Proj_Stereo_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help GUI_Proj_Stereo

% Last Modified by GUIDE v2.5 15-Aug-2019 12:57:08

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @GUI_Proj_Stereo_OpeningFcn, ...
                   'gui_OutputFcn',  @GUI_Proj_Stereo_OutputFcn, ...
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


% --- Executes just before GUI_Proj_Stereo is made visible.
function GUI_Proj_Stereo_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to GUI_Proj_Stereo (see VARARGIN)

%% Graficando el circulo unitario
axes(handles.Plano)% Direccionando el eje a graficar
x = -1:0.001:1; % Creando vector de puntos en x
y = sqrt(1-x.^2); % Creando el valor en y (solo positivos)
xp = [x fliplr(x)]; % Creando un vector completo para gráficar
yp = [y -y]; % Creando vector d eamplitudes p, parte positiva y negativa.
plot(xp,yp)
grid on
xlim([-5 5])
ylim([-5 5])

%% Graficando la Esfera de Riemann
axes(handles.Esfera)
[Xe,Ye,Ze] = sphere(1000);
z = surf(Xe,Ye,Ze);
xlim([-1.5 1.5])
ylim([-1.5 1.5])
zlim([-1.2 1.2])
grid on
alpha(z,0.2)

% Choose default command line output for GUI_Proj_Stereo
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes GUI_Proj_Stereo wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = GUI_Proj_Stereo_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in Start.
function Start_Callback(hObject, eventdata, handles)
% hObject    handle to Start (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[X,Y] = ginput();
C = complex(X,Y);
% [X1,Y1,Z1] = comp2esf(C);





% --- Executes on button press in Erase.
function Erase_Callback(hObject, eventdata, handles)
% hObject    handle to Erase (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


