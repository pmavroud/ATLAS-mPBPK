function varargout = mainGui(varargin)
% MAINGUI MATLAB code for mainGui.fig
%      MAINGUI, by itself, creates a new MAINGUI or raises the existing
%      singleton*.
%
%      H = MAINGUI returns the handle to a new MAINGUI or the handle to
%      the existing singleton*.
%
%      MAINGUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MAINGUI.M with the given input arguments.
%
%      MAINGUI('Property','Value',...) creates a new MAINGUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before mainGui_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to mainGui_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help mainGui

% Last Modified by GUIDE v2.5 14-Jan-2019 17:31:59

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
    'gui_Singleton',  gui_Singleton, ...
    'gui_OpeningFcn', @mainGui_OpeningFcn, ...
    'gui_OutputFcn',  @mainGui_OutputFcn, ...
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


% --- Executes just before mainGui is made visible.
function mainGui_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to mainGui (see VARARGIN)

% Choose default command line output for mainGui
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes mainGui wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = mainGui_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on selection change in popupmenuY.
function popupmenuY_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenuY (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenuY contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenuY


% --- Executes during object creation, after setting all properties.
function popupmenuY_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenuY (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenuX.
function popupmenuX_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenuX (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenuX contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenuX


% --- Executes during object creation, after setting all properties.
function popupmenuX_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenuX (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbuttonLoadXLS.
function pushbuttonLoadXLS_Callback(hObject, eventdata, handles)
% hObject    handle to pushbuttonLoadXLS (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[handles.fileName,handles.filePath] = uigetfile('*.xlsx');
guidata(hObject,handles)
setPopupmenuString(handles.popupmenuX,eventdata,handles)
setPopupmenuString(handles.popupmenuY,eventdata,handles)
set(handles.popupmenuX,'callback','mainGui(''updateAxes'',gcbo,[],guidata(gcbo))')
set(handles.popupmenuY,'callback','mainGui(''updateAxes'',gcbo,[],guidata(gcbo))')


function setPopupmenuString(hObject,eventdata,handles)

% fileName=handles.fileName;
% filePath=handles.filePath;
s = strcat(handles.filePath,handles.fileName);
[numbers,colNames]=xlsread(s);
set(hObject,'string',colNames)

function [x,y]=readExcelColumns(fileName, xCol, yCol)

[a]=xlsread(fileName);

x=a(:,xCol);
y=a(:,yCol);


% --- Update axes function
function updateAxes(hObject,eventdata,handles)

xColNum=get(handles.popupmenuX,'value');
yColNum=get(handles.popupmenuY,'value');
s = strcat(handles.filePath,handles.fileName);

cla;
[datax,datay]=readExcelColumns(s, xColNum, yColNum);
plot(handles.axes1,datax,datay,'o')
[numbers,colNames]=xlsread(s);
xlabel(colNames(xColNum))
ylabel(colNames(yColNum))
grid on



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



function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double


% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit4_Callback(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit4 as text
%        str2double(get(hObject,'String')) returns contents of edit4 as a double


% --- Executes during object creation, after setting all properties.
function edit4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in radiobutton1.
function radiobutton1_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton1


% --- Executes on button press in radiobutton2.
function radiobutton2_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton2



function edit7_Callback(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit7 as text
%        str2double(get(hObject,'String')) returns contents of edit7 as a double


% --- Executes during object creation, after setting all properties.
function edit7_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit9_Callback(hObject, eventdata, handles)
% hObject    handle to edit9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit9 as text
%        str2double(get(hObject,'String')) returns contents of edit9 as a double


% --- Executes during object creation, after setting all properties.
function edit9_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit10_Callback(hObject, eventdata, handles)
% hObject    handle to edit10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit10 as text
%        str2double(get(hObject,'String')) returns contents of edit10 as a double


% --- Executes during object creation, after setting all properties.
function edit10_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in checkboxfd.
function checkboxfd_Callback(hObject, eventdata, handles)
% hObject    handle to checkboxfd (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkboxfd


% --- Executes on button press in checkboxKp.
function checkboxKp_Callback(hObject, eventdata, handles)
% hObject    handle to checkboxKp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkboxKp


% --- Executes on button press in checkboxCL.
function checkboxCL_Callback(hObject, eventdata, handles)
% hObject    handle to checkboxCL (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkboxCL


% --- Executes on button press in pushbuttonSimulate.
function pushbuttonSimulate_Callback(hObject, eventdata, handles)
% hObject    handle to pushbuttonSimulate (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


if handles.popupmenuModel.Value==1          % If small molecules
    
    
    % Dose
    s.dose=str2num(handles.editDose.String);
    % mPBPK parameters
    s.Qco=str2num(handles.edit1.String);         %Cardiac Output
    s.Qhep=str2num(handles.edit2.String);        %Hepatic flow
    s.BW=str2num(handles.edit3.String);          %Body weight
    s.Vp=str2num(handles.edit4.String);          %Plasma volume
    s.Vhep=str2num(handles.edit5.String);        %Hepatic volume
    s.V1=str2num(handles.edit6.String);          %V1
    s.fd1=str2num(handles.edit7.String);         %fd1
    s.fd2=str2num(handles.edit8.String);         %fd2
    s.Kp=str2num(handles.edit9.String);          %Kp
    s.CLintu=str2num(handles.edit10.String);     %CLintu
    s.CLnh=str2num(handles.edit11.String);       %CLnon-hep
    s.V2=s.BW-s.V1-s.Vp-s.Vhep;
    
    % Oral adminisration
    s.Fg=str2num(handles.edit12.String);         %Fg
    s.ka=str2num(handles.edit13.String);         %ka
    
    
    % Infusion
    s.inft=str2num(handles.editINFtime.String);         %Infusion time
    
    %Simulation
    s.tfinal=str2num(handles.edittfinal.String);
    
    % Run simulation
    if handles.radiobuttonPO.Value==1    % Oral administration (PO)
        [t,y]=ode23(@(t,y)minPBPKoral(t,y,s),[0 s.tfinal],[0,0,0,0,s.dose]);
        y(:,1)=y(:,1)./s.Vp;
        y(:,2)=y(:,2)./s.V1;
        y(:,3)=y(:,3)./s.V2;
        y(:,4)=y(:,4)./s.Vhep;
    end
    if handles.radiobuttonINF.Value==1  % Infusion
        [t,y]=ode23(@(t,y)minPBPKinf(t,y,s),[0 s.tfinal],[0,0,0,0]);
        y(:,1)=y(:,1)./s.Vp;
        y(:,2)=y(:,2)./s.V1;
        y(:,3)=y(:,3)./s.V2;
        y(:,4)=y(:,4)./s.Vhep;
    end
    if handles.radiobuttonIV.Value==1     % IV administration
        [t,y]=ode23(@(t,y)minPBPK(t,y,s),[0 s.tfinal],[s.dose,0,0,0]);
        y(:,1)=y(:,1)./s.Vp;
        y(:,2)=y(:,2)./s.V1;
        y(:,3)=y(:,3)./s.V2;
        y(:,4)=y(:,4)./s.Vhep;
    end
    if handles.radiobuttonEV.Value==1    % Extravascular administration (EV)
        [t,y]=ode23(@(t,y)minPBPKev(t,y,s),[0 s.tfinal],[0,0,0,0,s.dose]);
        y(:,1)=y(:,1)./s.Vp;
        y(:,2)=y(:,2)./s.V1;
        y(:,3)=y(:,3)./s.V2;
        y(:,4)=y(:,4)./s.Vp;
    end
    
    
    
else    % Else large molecule model
    
    
    % Dose
    s.dose=str2num(handles.editDose.String);
    % mPBPK parameters
    s.L=str2num(handles.edit1.String);           %Lymph flow
    s.Vp=str2num(handles.edit2.String);          %Plasma volume
    s.ISF=str2num(handles.edit3.String);         %Interstitial fluid
    s.Kp=str2num(handles.edit4.String);          %Partition coefficient
    s.VL=str2num(handles.edit5.String);          %Lymph volume
    s.sigmaL=str2num(handles.edit6.String);      %Lymph reflection coeff.
    s.sigma1=str2num(handles.edit7.String);      %Tight tissues refl. coeff.
    s.sigma2=str2num(handles.edit8.String);      %Leaky tissues refl. coeff.
    s.CLp=str2num(handles.edit9.String);         %CLp
    s.Kss=str2num(handles.edit10.String);        %kon
    s.ksyn=str2num(handles.edit11.String);       %ksyn
    s.kdeg=str2num(handles.edit14.String);       %kdeg
    s.kint=str2num(handles.edit15.String);       %kint
     
    s.L1=0.33*s.L;                               %L1
    s.L2=0.67*s.L;                               %L2
    s.Vtight=0.65*s.ISF*s.Kp;                    %Vtight
    s.Vleaky=0.35*s.ISF*s.Kp;                    %Vleaky
    s.Rb=s.ksyn/s.kdeg;                          %Bound receptor
    
    % Oral adminisration
    s.Fg=str2num(handles.edit12.String);         %Fg
    s.ka=str2num(handles.edit13.String);         %ka
    
    % Infusion
    s.inft=str2num(handles.editINFtime.String);         %Infusion time
    
    % Infusion
    s.tfinal=str2num(handles.edittfinal.String);         %Simulation time
    
    
    if handles.radiobuttonCentral.Value==1
        s.central=1;
        s.peripheral=0;
        s.nb=0;
    end
    if handles.radiobuttonPeripheral.Value==1
        s.central=0;
        s.peripheral=1;
        s.nb=0;
    end
    if handles.radiobuttonNB.Value==1
        s.central=0;
        s.peripheral=0;
        s.nb=1;
    end

    % Run simulation
    if handles.radiobuttonEV.Value==1    % Extravascluar administration
        [t,y]=ode23(@(t,y)minPBPKlargeEV(t,y,s),[0 s.tfinal],[0,0,s.ksyn/s.kdeg,0,s.ksyn/s.kdeg,0,s.dose]);
        y(:,1)=y(:,1)./s.Vp;
        y(:,2)=y(:,2)./s.Vtight;
        y(:,3)=y(:,3)./s.Vtight;
        y(:,4)=y(:,4)./s.Vleaky;
        y(:,5)=y(:,5)./s.Vleaky;
        y(:,6)=y(:,6)./s.VL;
    end
    if handles.radiobuttonINF.Value==1
        [t,y]=ode23(@(t,y)minPBPKlargeINF(t,y,s),[0 s.tfinal],[0,0,s.ksyn/s.kdeg,0,s.ksyn/s.kdeg,0]);
        y(:,1)=y(:,1)./s.Vp;
        y(:,2)=y(:,2)./s.Vtight;
        y(:,3)=y(:,3)./s.Vtight;
        y(:,4)=y(:,4)./s.Vleaky;
        y(:,5)=y(:,5)./s.Vleaky;
        y(:,6)=y(:,6)./s.VL;
    end
    if handles.radiobuttonIV.Value==1
        [t,y]=ode23(@(t,y)minPBPKlarge(t,y,s),[0 s.tfinal],[s.dose,0,s.ksyn/s.kdeg,0,0,0]);
        
        if handles.radiobuttonCentral.Value==1
            Cpt= y(:,1)./s.Vp;     % Total drug in plasma
            Rtt = y(:,3)+s.Rb;      % Total receptor in tight tissues
            y(:,1)=0.5*(Cpt-s.Kss-Rtt+sqrt((Cpt-s.Kss-Rtt).^2+4*Cpt*s.Kss));
        else
            y(:,1)=y(:,1)./s.Vp;
        end
        y(:,2)=y(:,2)./s.Vtight;
        y(:,3)=y(:,3)./s.Vtight;
        y(:,4)=y(:,4)./s.Vleaky;
        y(:,5)=y(:,5)./s.Vleaky;
        y(:,6)=y(:,6)./s.VL;
    end
end



% Figure related lines
TF=isfield(handles, 'filePath'); % Check whether there are data in figure
if TF==1
    xColNum=get(handles.popupmenuX,'value');
    yColNum=get(handles.popupmenuY,'value');
    s = strcat(handles.filePath,handles.fileName);
    [data.x,data.y]=readExcelColumns(s, xColNum, yColNum);
    [~,colNames]=xlsread(s);
    cla('reset')
    if handles.radiobuttonLL.Value==1
        cla
        semilogy(data.x,data.y,'o')
    else
        cla
        plot(data.x,data.y,'o')
    end
    hold on
    plot(t,y(:,1));
    xlabel(colNames(xColNum))
    ylabel(colNames(yColNum))
    xlim([0 data.x(end)])
    grid on
else
    if handles.radiobuttonLL.Value==1
        cla
        semilogy(t,y(:,1))
    else
        cla
        plot(t,y(:,1))
    end
    grid on
end




% --- mPBPK MODEL small molecules IV (IV)
function [dy]=minPBPK(t,y,s)

% Differential equations
dy(1)=s.fd1*(s.Qco-s.Qhep)*(y(2)/s.V1)/s.Kp...
    +s.fd2*(s.Qco-s.Qhep)*(y(3)/s.V2)/s.Kp...
    +s.Qhep*((y(4)/s.Vhep)/s.Kp-y(1)/s.Vp)...
    -y(1)/s.Vp*(s.fd1*(s.Qco-s.Qhep)+s.fd2*(s.Qco-s.Qhep)+s.CLnh);         % Amount in Plasma

dy(2)=s.fd1*(s.Qco-s.Qhep)*(y(1)/s.Vp-(y(2)/s.V1)/s.Kp);                   % Amount in Tissue 1

dy(3)=s.fd2*(s.Qco-s.Qhep)*(y(1)/s.Vp-(y(3)/s.V2)/s.Kp);                   % Amount in Tissue 2

dy(4)=s.Qhep*(y(1)/s.Vp-(y(4)/s.Vhep)/s.Kp)-(y(4)/s.Vhep)/s.Kp*s.CLintu;   % Amount in Liver Tissue


dy=dy';



% --- mPBPK MODEL small molecules oral
function [dy]=minPBPKoral(t,y,s)

% Differential equations
dy(1)=s.fd1*(s.Qco-s.Qhep)*(y(2)/s.V1)/s.Kp...
    +s.fd2*(s.Qco-s.Qhep)*(y(3)/s.V2)/s.Kp...
    +s.Qhep*((y(4)/s.Vhep)/s.Kp-y(1)/s.Vp)...
    -y(1)/s.Vp*(s.fd1*(s.Qco-s.Qhep)+s.fd2*(s.Qco-s.Qhep)+s.CLnh);         % Amount in Plasma

dy(2)=s.fd1*(s.Qco-s.Qhep)*(y(1)/s.Vp-(y(2)/s.V1)/s.Kp);                   % Amount in Tissue 1

dy(3)=s.fd2*(s.Qco-s.Qhep)*(y(1)/s.Vp-(y(3)/s.V2)/s.Kp);                   % Amount in Tissue 2

dy(4)=s.Qhep*(y(1)/s.Vp-(y(4)/s.Vhep)/s.Kp)-(y(4)/s.Vhep)/s.Kp*s.CLintu...
    +s.ka*s.Fg*y(5);                                                       % Amount in Liver Tissue


dy(5)=-s.ka*y(5);                                                          % Oral depot

dy=dy';




% --- mPBPK MODEL small molecules Infusion (INF)
function [dy]=minPBPKinf(t,y,s)

if t<=s.inft
    s.inf=s.dose/s.inft;
else
    s.inf=0;
end

% Differential equations
dy(1)=s.inf+s.fd1*(s.Qco-s.Qhep)*(y(2)/s.V1)/s.Kp...
    +s.fd2*(s.Qco-s.Qhep)*(y(3)/s.V2)/s.Kp...
    +s.Qhep*((y(4)/s.Vhep)/s.Kp-y(1)/s.Vp)...
    -y(1)/s.Vp*(s.fd1*(s.Qco-s.Qhep)+s.fd2*(s.Qco-s.Qhep)+s.CLnh);         % Amount in Plasma

dy(2)=s.fd1*(s.Qco-s.Qhep)*(y(1)/s.Vp-(y(2)/s.V1)/s.Kp);                   % Amount in Tissue 1

dy(3)=s.fd2*(s.Qco-s.Qhep)*(y(1)/s.Vp-(y(3)/s.V2)/s.Kp);                   % Amount in Tissue 2

dy(4)=s.Qhep*(y(1)/s.Vp-(y(4)/s.Vhep)/s.Kp)-(y(4)/s.Vhep)/s.Kp*s.CLintu;   % Amount in Liver Tissue


dy=dy';


% --- mPBPK MODEL small molecules extravascular
function [dy]=minPBPKev(t,y,s)

% Differential equations
dy(1)=s.fd1*(s.Qco-s.Qhep)*(y(2)/s.V1)/s.Kp...
    +s.fd2*(s.Qco-s.Qhep)*(y(3)/s.V2)/s.Kp...
    +s.Qhep*((y(4)/s.Vhep)/s.Kp-y(1)/s.Vp)...
    -y(1)/s.Vp*(s.fd1*(s.Qco-s.Qhep)+s.fd2*(s.Qco-s.Qhep)+s.CLnh)...
    +s.ka*s.Fg*y(5);                                                       % Amount in Plasma

dy(2)=s.fd1*(s.Qco-s.Qhep)*(y(1)/s.Vp-(y(2)/s.V1)/s.Kp);                   % Amount in Tissue 1

dy(3)=s.fd2*(s.Qco-s.Qhep)*(y(1)/s.Vp-(y(3)/s.V2)/s.Kp);                   % Amount in Tissue 2

dy(4)=s.Qhep*(y(1)/s.Vp-(y(4)/s.Vhep)/s.Kp)-(y(4)/s.Vhep)/s.Kp*s.CLintu;                                                       % Amount in Liver Tissue


dy(5)=-s.ka*y(5);                                                          % EV depot

dy=dy';



% --- mPBPK MODEL large molecules IV
function dy=minPBPKlarge(t,y,s)

    % Algebraic equations
    
    Cpt= y(1)/s.Vp;     % Total drug in plasma
    
    Ctt = y(2)/s.Vtight; % Total drug in tight tissues
    
    Ctl = y(4)/s.Vleaky; % Total drug in leaky tissues
    
    Rtt = y(3)+s.Rb;      % Total receptor in tight tissues
    Rtl = y(5)+s.Rb;      % Total receptor in leaky tissues
    
    Ccentral_free=0.5*(Cpt-s.Kss-Rtt+sqrt((Cpt-s.Kss-Rtt)^2+4*Cpt*s.Kss));
    
    Ctight_free=0.5*(Ctt-s.Kss-Rtt+sqrt((Ctt-s.Kss-Rtt)^2+4*Ctt*s.Kss));
    
    Cleaky_free=0.5*(Ctl-s.Kss-Rtl+sqrt((Ctl-s.Kss-Rtl)^2+4*Ctl*s.Kss));
    
    ARcentral=Rtt*Ccentral_free/(s.Kss+Ccentral_free);
    
    ARtight=Rtt*Ctight_free/(s.Kss+Ctight_free);
    
    ARleaky=Rtl*Cleaky_free/(s.Kss+Cleaky_free);
    
    % --- mPBPK MODEL large molecules IV
    % Differential equations
    dy(1)= y(6)*s.L/s.VL-s.peripheral*y(1)/s.Vp*(s.L1*(1-s.sigma1)+s.L2*(1-s.sigma2))...
        -s.central*Ccentral_free*(s.L1*(1-s.sigma1)+s.L2*(1-s.sigma2))...
        -s.central*s.CLp*Ccentral_free-s.peripheral*s.CLp*y(1)./s.Vp-s.central*ARcentral*s.kint*s.Vp...
        -s.nb*y(1)/s.Vp*(s.CLp+s.L1*(1-s.sigma1)+s.L2*(1-s.sigma2));                                             %Amount in plasma
    
    dy(2)=s.central*s.L1*(1-s.sigma1)*Ccentral_free+s.peripheral*s.L1*(1-s.sigma1)*y(1)/s.Vp...                  %Atight_total/Atight_central
        -s.central*s.L1*(1-s.sigmaL)*y(2)/s.Vtight-s.nb*s.L1*(1-s.sigmaL)*y(2)/s.Vtight...
        -s.peripheral*s.L1*(1-s.sigmaL)*Ctight_free-s.peripheral*ARtight*s.kdeg*s.Vtight...
        +s.nb*y(1)/s.Vp*s.L1*(1-s.sigma1);                                                                   
    
    
    dy(3)=s.ksyn-(y(3)+s.peripheral*(s.Rb-ARtight)+s.central*(s.Rb-ARcentral))*s.kdeg...                         %Rtight_total/Rtotal
        -s.peripheral*ARtight*s.kdeg-s.central*ARcentral*s.kint;
    
    dy(4)=s.central*s.L2*(1-s.sigma2)*Ccentral_free+s.peripheral*s.L2*(1-s.sigma2)*y(1)/s.Vp...                  %Aleaky_total/Aleaky_central
        -s.central*s.L2*(1-s.sigmaL)*y(4)/s.Vleaky-s.nb*s.L2*(1-s.sigmaL)*y(4)/s.Vleaky...
        -s.peripheral*s.L2*(1-s.sigmaL)*Cleaky_free-s.peripheral*ARleaky*s.kdeg*s.Vleaky...
        +s.nb*y(1)/s.Vp*s.L2*(1-s.sigma2);
    
    dy(5)=s.ksyn-(y(5)+s.peripheral*(s.Rb-ARleaky))*s.kdeg...                                                    %Rleaky_total
        -s.peripheral*ARleaky*s.kdeg;
    
    dy(6)=s.peripheral*s.L1*(1-s.sigmaL)*Ctight_free+s.central*s.L1*(1-s.sigmaL)*y(2)/s.Vtight...                %Amount in lymph
        +s.nb*s.L1*(1-s.sigmaL)*y(2)/s.Vtight+s.peripheral*s.L2*(1-s.sigmaL)*Cleaky_free...
        +s.central*s.L2*(1-s.sigmaL)*y(4)/s.Vleaky+s.nb*s.L2*(1-s.sigmaL)*y(4)/s.Vleaky-y(6)*s.L/s.VL;


dy=dy';



% --- mPBPK MODEL large molecules extravascular
function dy=minPBPKlargeEV(t,y,s)
% Algebraic equations
    
    Cpt= y(1)/s.Vp;     % Total drug in plasma
    
    Ctt = y(2)/s.Vtight; % Total drug in tight tissues
    
    Ctl = y(4)/s.Vleaky; % Total drug in leaky tissues
    
    Rtt = y(3)+s.Rb;      % Total receptor in tight tissues
    Rtl = y(5)+s.Rb;      % Total receptor in leaky tissues
    
    Ccentral_free=0.5*(Cpt-s.Kss-Rtt+sqrt((Cpt-s.Kss-Rtt)^2+4*Cpt*s.Kss));
    
    Ctight_free=0.5*(Ctt-s.Kss-Rtt+sqrt((Ctt-s.Kss-Rtt)^2+4*Ctt*s.Kss));
    
    Cleaky_free=0.5*(Ctl-s.Kss-Rtl+sqrt((Ctl-s.Kss-Rtl)^2+4*Ctl*s.Kss));
    
    ARcentral=Rtt*Ccentral_free/(s.Kss+Ccentral_free);
    
    ARtight=Rtt*Ctight_free/(s.Kss+Ctight_free);
    
    ARleaky=Rtl*Cleaky_free/(s.Kss+Cleaky_free);


% Differential equations
dy(1)= s.ka*s.Fg*y(7)+ y(6)*s.L/s.VL-s.peripheral*y(1)/s.Vp*(s.L1*(1-s.sigma1)+s.L2*(1-s.sigma2))...
        -s.central*Ccentral_free*(s.L1*(1-s.sigma1)+s.L2*(1-s.sigma2))...
        -s.central*s.CLp*Ccentral_free-s.peripheral*s.CLp*y(1)./s.Vp-s.central*ARcentral*s.kint*s.Vp...
        -s.nb*y(1)/s.Vp*(s.CLp+s.L1*(1-s.sigma1)+s.L2*(1-s.sigma2));                                               %Cp
    
    dy(2)=s.central*s.L1*(1-s.sigma1)*Ccentral_free+s.peripheral*s.L1*(1-s.sigma1)*y(1)/s.Vp...                  %Atight_total/Atight_central
        -s.central*s.L1*(1-s.sigmaL)*y(2)/s.Vtight-s.nb*s.L1*(1-s.sigmaL)*y(2)/s.Vtight...
        -s.peripheral*s.L1*(1-s.sigmaL)*Ctight_free-s.peripheral*ARtight*s.kdeg*s.Vtight...
        +s.nb*y(1)/s.Vp*s.L1*(1-s.sigma1);                                                                   
    
    
    dy(3)=s.ksyn-(y(3)+s.peripheral*(s.Rb-ARtight)+s.central*(s.Rb-ARcentral))*s.kdeg...                         %Rtight_total/Rtotal
        -s.peripheral*ARtight*s.kdeg-s.central*ARcentral*s.kint;
    
    dy(4)=s.central*s.L2*(1-s.sigma2)*Ccentral_free+s.peripheral*s.L2*(1-s.sigma2)*y(1)/s.Vp...                   %Aleaky_total/Aleaky_central
        -s.central*s.L2*(1-s.sigmaL)*y(4)/s.Vleaky-s.nb*s.L2*(1-s.sigmaL)*y(4)/s.Vleaky...
        -s.peripheral*s.L2*(1-s.sigmaL)*Cleaky_free-s.peripheral*ARleaky*s.kdeg*s.Vleaky...
        +s.nb*y(1)/s.Vp*s.L2*(1-s.sigma2);
    
    dy(5)=s.ksyn-(y(5)+s.peripheral*(s.Rb-ARleaky))*s.kdeg...                                                    %Rleaky_total
        -s.peripheral*ARleaky*s.kdeg;
    
    dy(6)=s.peripheral*s.L1*(1-s.sigmaL)*Ctight_free+s.central*s.L1*(1-s.sigmaL)*y(2)/s.Vtight...                %Clymph
        +s.nb*s.L1*(1-s.sigmaL)*y(2)/s.Vtight+s.peripheral*s.L2*(1-s.sigmaL)*Cleaky_free...
        +s.central*s.L2*(1-s.sigmaL)*y(4)/s.Vleaky+s.nb*s.L2*(1-s.sigmaL)*y(4)/s.Vleaky-y(6)*s.L/s.VL;

dy(7)=-s.ka*y(7);                                                                                     % Absorption compartment

dy=dy';



% --- mPBPK MODEL large molecules infusion
function dy=minPBPKlargeINF(t,y,s)

% Algebraic equations
    
    Cpt= y(1)/s.Vp;     % Total drug in plasma
    
    Ctt = y(2)/s.Vtight; % Total drug in tight tissues
    
    Ctl = y(4)/s.Vleaky; % Total drug in leaky tissues
    
    Rtt = y(3)+s.Rb;      % Total receptor in tight tissues
    Rtl = y(5)+s.Rb;      % Total receptor in leaky tissues
    
    Ccentral_free=0.5*(Cpt-s.Kss-Rtt+sqrt((Cpt-s.Kss-Rtt)^2+4*Cpt*s.Kss));
    
    Ctight_free=0.5*(Ctt-s.Kss-Rtt+sqrt((Ctt-s.Kss-Rtt)^2+4*Ctt*s.Kss));
    
    Cleaky_free=0.5*(Ctl-s.Kss-Rtl+sqrt((Ctl-s.Kss-Rtl)^2+4*Ctl*s.Kss));
    
    ARcentral=Rtt*Ccentral_free/(s.Kss+Ccentral_free);
    
    ARtight=Rtt*Ctight_free/(s.Kss+Ctight_free);
    
    ARleaky=Rtl*Cleaky_free/(s.Kss+Cleaky_free);

% Infusion 
if t<=s.inft
    s.inf=s.dose/s.inft;
else
    s.inf=0;
end

% Differential equations
dy(1)= s.inf+ y(6)*s.L/s.VL-s.peripheral*y(1)/s.Vp*(s.L1*(1-s.sigma1)+s.L2*(1-s.sigma2))...
        -s.central*Ccentral_free*(s.L1*(1-s.sigma1)+s.L2*(1-s.sigma2))...
        -s.central*s.CLp*Ccentral_free-s.peripheral*s.CLp*y(1)./s.Vp-s.central*ARcentral*s.kint*s.Vp...
        -s.nb*y(1)/s.Vp*(s.CLp+s.L1*(1-s.sigma1)+s.L2*(1-s.sigma2));                                               %Cp
    
    dy(2)=s.central*s.L1*(1-s.sigma1)*Ccentral_free+s.peripheral*s.L1*(1-s.sigma1)*y(1)/s.Vp...                  %Atight_total/Atight_central
        -s.central*s.L1*(1-s.sigmaL)*y(2)/s.Vtight-s.nb*s.L1*(1-s.sigmaL)*y(2)/s.Vtight...
        -s.peripheral*s.L1*(1-s.sigmaL)*Ctight_free-s.peripheral*ARtight*s.kdeg*s.Vtight...
        +s.nb*y(1)/s.Vp*s.L1*(1-s.sigma1);                                                                   
    
    
    dy(3)=s.ksyn-(y(3)+s.peripheral*(s.Rb-ARtight)+s.central*(s.Rb-ARcentral))*s.kdeg...                         %Rtight_total/Rtotal
        -s.peripheral*ARtight*s.kdeg-s.central*ARcentral*s.kint;
    
    dy(4)=s.central*s.L2*(1-s.sigma2)*Ccentral_free+s.peripheral*s.L2*(1-s.sigma2)*y(1)/s.Vp...                   %Aleaky_total/Aleaky_central
        -s.central*s.L2*(1-s.sigmaL)*y(4)/s.Vleaky-s.nb*s.L2*(1-s.sigmaL)*y(4)/s.Vleaky...
        -s.peripheral*s.L2*(1-s.sigmaL)*Cleaky_free-s.peripheral*ARleaky*s.kdeg*s.Vleaky...
        +s.nb*y(1)/s.Vp*s.L2*(1-s.sigma2);
    
    dy(5)=s.ksyn-(y(5)+s.peripheral*(s.Rb-ARleaky))*s.kdeg...                                                    %Rleaky_total
        -s.peripheral*ARleaky*s.kdeg;
    
    dy(6)=s.peripheral*s.L1*(1-s.sigmaL)*Ctight_free+s.central*s.L1*(1-s.sigmaL)*y(2)/s.Vtight...                %Clymph
        +s.nb*s.L1*(1-s.sigmaL)*y(2)/s.Vtight+s.peripheral*s.L2*(1-s.sigmaL)*Cleaky_free...
        +s.central*s.L2*(1-s.sigmaL)*y(4)/s.Vleaky+s.nb*s.L2*(1-s.sigmaL)*y(4)/s.Vleaky-y(6)*s.L/s.VL;


dy=dy';



% --- Executes on button press in pushbuttonEstimate.
function pushbuttonEstimate_Callback(hObject, eventdata, handles)
% hObject    handle to pushbuttonEstimate (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


if handles.popupmenuModel.Value==1          % If small molecules
    
    % Get what parameters need to be estimated
    % Check values of checkboxes
    cbv(1)=get(handles.checkbox1,'Value');
    cbv(2)=get(handles.checkbox2,'Value');
    cbv(3)=get(handles.checkbox3,'Value');
    cbv(4)=get(handles.checkbox4,'Value');
    cbv(5)=get(handles.checkbox5,'Value');
    cbv(6)=get(handles.checkbox6,'Value');
    cbv(7)=get(handles.checkbox7,'Value');
    cbv(8)=get(handles.checkbox8,'Value');
    cbv(9)=get(handles.checkbox9,'Value');
    cbv(10)=get(handles.checkbox10,'Value');
    cbv(11)=get(handles.checkbox11,'Value');
    % For oral administration
    cbv(12)=get(handles.checkbox12,'Value');
    cbv(13)=get(handles.checkbox13,'Value');
    
    
    % Get the data
    xColNum=get(handles.popupmenuX,'value');
    yColNum=get(handles.popupmenuY,'value');
    dat = strcat(handles.filePath,handles.fileName);
    [data.x,data.y]=readExcelColumns(dat, xColNum, yColNum);
    
    
    % Get the parameters
    % Dose
    s.dose=str2num(handles.editDose.String);
    
    % mPBPK parameters/Check if parameters need to be optimized
    x=1;
    s.Qco=str2num(handles.edit1.String);         %Cardiac Output
    if cbv(1)==1
        p(x)=s.Qco;
        x=x+1;
    else
        set(handles.editEp1, 'BackgroundColor', [0.9,0.9,0.9])
        set(handles.editEp1, 'String', '')
        set(handles.editCIp1, 'BackgroundColor', [0.9,0.9,0.9]);
        set(handles.editCIp1, 'String', '')
        set(handles.editlbub1, 'String', '')
    end
    s.Qhep=str2num(handles.edit2.String);        %Hepatic flow
    if cbv(2)==1
        p(x)=s.Qhep;
        x=x+1;
    else
        set(handles.editEp2, 'BackgroundColor', [0.9,0.9,0.9])
        set(handles.editEp2, 'String', '')
        set(handles.editCIp2, 'BackgroundColor', [0.9,0.9,0.9]);
        set(handles.editCIp2, 'String', '')
        set(handles.editlbub2, 'String', '')
    end
    s.BW=str2num(handles.edit3.String);          %Body weight
    if cbv(3)==1
        p(x)=s.BW;
        x=x+1;
    else
        set(handles.editEp3, 'BackgroundColor', [0.9,0.9,0.9])
        set(handles.editEp3, 'String', '')
        set(handles.editCIp3, 'BackgroundColor', [0.9,0.9,0.9]);
        set(handles.editCIp3, 'String', '')
        set(handles.editlbub3, 'String', '')
    end
    s.Vp=str2num(handles.edit4.String);          %Plasma volume
    if cbv(4)==1
        p(x)=s.Vp;
        x=x+1;
    else
        set(handles.editEp4, 'BackgroundColor', [0.9,0.9,0.9])
        set(handles.editEp4, 'String', '')
        set(handles.editCIp4, 'BackgroundColor', [0.9,0.9,0.9]);
        set(handles.editCIp4, 'String', '')
        set(handles.editlbub4, 'String', '')
    end
    s.Vhep=str2num(handles.edit5.String);        %Hepatic volume
    if cbv(5)==1
        p(x)=s.Vhep;
        x=x+1;
    else
        set(handles.editEp5, 'BackgroundColor', [0.9,0.9,0.9])
        set(handles.editEp5, 'String', '')
        set(handles.editCIp5, 'BackgroundColor', [0.9,0.9,0.9]);
        set(handles.editCIp5, 'String', '')
        set(handles.editlbub5, 'String', '')
    end
    s.V1=str2num(handles.edit6.String);          %V1
    if cbv(6)==1
        p(x)=s.V1;
        x=x+1;
    else
        set(handles.editEp6, 'BackgroundColor', [0.9,0.9,0.9])
        set(handles.editEp6, 'String', '')
        set(handles.editCIp6, 'BackgroundColor', [0.9,0.9,0.9]);
        set(handles.editCIp6, 'String', '')
        set(handles.editlbub6, 'String', '')
    end
    s.fd1=str2num(handles.edit7.String);         %fd1
    if cbv(7)==1
        p(x)=s.fd1;
        x=x+1;
    else
        set(handles.editEp7, 'BackgroundColor', [0.9,0.9,0.9])
        set(handles.editEp7, 'String', '')
        set(handles.editCIp7, 'BackgroundColor', [0.9,0.9,0.9]);
        set(handles.editCIp7, 'String', '')
        set(handles.editlbub7, 'String', '')
    end
    s.fd2=str2num(handles.edit8.String);         %fd2
    if cbv(8)==1
        p(x)=s.fd2;
        x=x+1;
    else
        set(handles.editEp8, 'BackgroundColor', [0.9,0.9,0.9])
        set(handles.editEp8, 'String', '')
        set(handles.editCIp8, 'BackgroundColor', [0.9,0.9,0.9]);
        set(handles.editCIp8, 'String', '')
        set(handles.editlbub8, 'String', '')
    end
    s.Kp=str2num(handles.edit9.String);          %Kp
    if cbv(9)==1
        p(x)=s.Kp;
        x=x+1;
    else
        set(handles.editEp9, 'BackgroundColor', [0.9,0.9,0.9])
        set(handles.editEp9, 'String', '')
        set(handles.editCIp9, 'BackgroundColor', [0.9,0.9,0.9]);
        set(handles.editCIp9, 'String', '')
        set(handles.editlbub9, 'String', '')
    end
    s.CLintu=str2num(handles.edit10.String);     %CLintu
    if cbv(10)==1
        p(x)=s.CLintu;
        x=x+1;
    else
        set(handles.editEp10, 'BackgroundColor', [0.9,0.9,0.9])
        set(handles.editEp10, 'String', '')
        set(handles.editCIp10, 'BackgroundColor', [0.9,0.9,0.9]);
        set(handles.editCIp10, 'String', '')
        set(handles.editlbub10, 'String', '')
    end
    s.CLnh=str2num(handles.edit11.String);       %CLnon-hep
    if cbv(11)==1
        p(x)=s.CLnh;
        x=x+1;
    else
        set(handles.editEp11, 'BackgroundColor', [0.9,0.9,0.9])
        set(handles.editEp11, 'String', '')
        set(handles.editCIp11, 'BackgroundColor', [0.9,0.9,0.9]);
        set(handles.editCIp11, 'String', '')
        set(handles.editlbub11, 'String', '')
    end
    s.V2=s.BW-s.V1-s.Vp-s.Vhep;
    
    % For oral/extravascular administration
    s.Fg=str2num(handles.edit12.String);       %Fg
    if cbv(12)==1
        p(x)=s.Fg;
        x=x+1;
    else
        set(handles.editEp12, 'BackgroundColor', [0.9,0.9,0.9])
        set(handles.editEp12, 'String', '')
        set(handles.editCIp12, 'BackgroundColor', [0.9,0.9,0.9]);
        set(handles.editCIp12, 'String', '')
        set(handles.editlbub12, 'String', '')
    end
    s.ka=str2num(handles.edit13.String);       %ka
    if cbv(13)==1
        p(x)=s.ka;
        x=x+1;
    else
        set(handles.editEp13, 'BackgroundColor', [0.9,0.9,0.9])
        set(handles.editEp13, 'String', '')
        set(handles.editCIp13, 'BackgroundColor', [0.9,0.9,0.9]);
        set(handles.editCIp13, 'String', '')
        set(handles.editlbub13, 'String', '')
    end
    
    
    % For infusion
    s.inft=str2num(handles.editINFtime.String);
    
    % For simulation
    s.tfinal=str2num(handles.edittfinal.String);
    
    
    % Set upper/lower bounds
    x=1;
    if isempty(get(handles.editlbub1,'String'))==0
        lbub(x,:)=strsplit(get(handles.editlbub1,'String'),',');
        lb(x)=str2num(lbub{x,1});
        ub(x)=str2num(lbub{x,2});
        x=x+1;
    end
    if isempty(get(handles.editlbub2,'String'))==0
        lbub(x,:)=strsplit(get(handles.editlbub2,'String'),',');
        lb(x)=str2num(lbub{x,1});
        ub(x)=str2num(lbub{x,2});
        x=x+1;
    end
    if isempty(get(handles.editlbub3,'String'))==0
        lbub(x,:)=strsplit(get(handles.editlbub3,'String'),',');
        lb(x)=str2num(lbub{x,1});
        ub(x)=str2num(lbub{x,2});
        x=x+1;
    end
    if isempty(get(handles.editlbub4,'String'))==0
        lbub(x,:)=strsplit(get(handles.editlbub4,'String'),',');
        lb(x)=str2num(lbub{x,1});
        ub(x)=str2num(lbub{x,2});
        x=x+1;
    end
    if isempty(get(handles.editlbub5,'String'))==0
        lbub(x,:)=strsplit(get(handles.editlbub5,'String'),',');
        lb(x)=str2num(lbub{x,1});
        ub(x)=str2num(lbub{x,2});
        x=x+1;
    end
    if isempty(get(handles.editlbub6,'String'))==0
        lbub(x,:)=strsplit(get(handles.editlbub6,'String'),',');
        lb(x)=str2num(lbub{x,1});
        ub(x)=str2num(lbub{x,2});
        x=x+1;
    end
    if isempty(get(handles.editlbub7,'String'))==0
        lbub(x,:)=strsplit(get(handles.editlbub7,'String'),',');
        lb(x)=str2num(lbub{x,1});
        ub(x)=str2num(lbub{x,2});
        x=x+1;
    end
    if isempty(get(handles.editlbub8,'String'))==0
        lbub(x,:)=strsplit(get(handles.editlbub8,'String'),',');
        lb(x)=str2num(lbub{x,1});
        ub(x)=str2num(lbub{x,2});
        x=x+1;
    end
    if isempty(get(handles.editlbub9,'String'))==0
        lbub(x,:)=strsplit(get(handles.editlbub9,'String'),',');
        lb(x)=str2num(lbub{x,1});
        ub(x)=str2num(lbub{x,2});
        x=x+1;
    end
    if isempty(get(handles.editlbub10,'String'))==0
        lbub(x,:)=strsplit(get(handles.editlbub10,'String'),',');
        lb(x)=str2num(lbub{x,1});
        ub(x)=str2num(lbub{x,2});
        x=x+1;
    end
    if isempty(get(handles.editlbub11,'String'))==0
        lbub(x,:)=strsplit(get(handles.editlbub11,'String'),',');
        lb(x)=str2num(lbub{x,1});
        ub(x)=str2num(lbub{x,2});
        x=x+1;
    end
    % For oral/extravascular
    if isempty(get(handles.editlbub12,'String'))==0
        lbub(x,:)=strsplit(get(handles.editlbub12,'String'),',');
        lb(x)=str2num(lbub{x,1});
        ub(x)=str2num(lbub{x,2});
        x=x+1;
    end
    if isempty(get(handles.editlbub13,'String'))==0
        lbub(x,:)=strsplit(get(handles.editlbub13,'String'),',');
        lb(x)=str2num(lbub{x,1});
        ub(x)=str2num(lbub{x,2});
        x=x+1;
    end
    
    options=optimset('TolFun',1e-8);
    % obj  = fmincon(@(p) objectiveminPBPK(data,p,s,handles,cbv),[p],[],[],[],[],lb,ub);
    [obj,resnorm,residual,exitflag,output,lambda,jacobian]  = lsqnonlin(@(p) objectiveminPBPK(data,p,s,handles,cbv),p,lb,ub,options);
    ci = nlparci(obj,residual,'jacobian',jacobian);
    x=1;
    if cbv(1)==1
        set(handles.editEp1, 'BackgroundColor', [1,1,1]);
        set(handles.editEp1, 'String', obj(x));
        str1=num2str(ci(x,1));
        str2=num2str(ci(x,2));
        set(handles.editCIp1, 'BackgroundColor', [1,1,1]);
        set(handles.editCIp1, 'String', strjoin({str1,str2},','));
        x=x+1;
    end
    if cbv(2)==1
        set(handles.editEp2, 'BackgroundColor', [1,1,1]);
        set(handles.editEp2, 'String', obj(x));
        str1=num2str(ci(x,1));
        str2=num2str(ci(x,2));
        set(handles.editCIp2, 'BackgroundColor', [1,1,1]);
        set(handles.editCIp2, 'String', strjoin({str1,str2},','));
        x=x+1;
    end
    if cbv(3)==1
        set(handles.editEp3, 'BackgroundColor', [1,1,1]);
        set(handles.editEp3, 'String', obj(x));
        str1=num2str(ci(x,1));
        str2=num2str(ci(x,2));
        set(handles.editCIp3, 'BackgroundColor', [1,1,1]);
        set(handles.editCIp3, 'String', strjoin({str1,str2},','));
        x=x+1;
    end
    if cbv(4)==1
        set(handles.editEp4, 'BackgroundColor', [1,1,1]);
        set(handles.editEp4, 'String', obj(x));
        str1=num2str(ci(x,1));
        str2=num2str(ci(x,2));
        set(handles.editCIp4, 'BackgroundColor', [1,1,1]);
        set(handles.editCIp4, 'String', strjoin({str1,str2},','));
        x=x+1;
    end
    if cbv(5)==1
        set(handles.editEp5, 'BackgroundColor', [1,1,1]);
        set(handles.editEp5, 'String', obj(x));
        str1=num2str(ci(x,1));
        str2=num2str(ci(x,2));
        set(handles.editCIp5, 'BackgroundColor', [1,1,1]);
        set(handles.editCIp5, 'String', strjoin({str1,str2},','));
        x=x+1;
    end
    if cbv(6)==1
        set(handles.editEp6, 'BackgroundColor', [1,1,1]);
        set(handles.editEp6, 'String', obj(x));
        str1=num2str(ci(x,1));
        str2=num2str(ci(x,2));
        set(handles.editCIp6, 'BackgroundColor', [1,1,1]);
        set(handles.editCIp6, 'String', strjoin({str1,str2},','));
        x=x+1;
    end
    if cbv(7)==1
        set(handles.editEp7, 'BackgroundColor', [1,1,1]);
        set(handles.editEp7, 'String', obj(x));
        str1=num2str(ci(x,1));
        str2=num2str(ci(x,2));
        set(handles.editCIp7, 'BackgroundColor', [1,1,1]);
        set(handles.editCIp7, 'String', strjoin({str1,str2},','));
        x=x+1;
    end
    if cbv(8)==1
        set(handles.editEp8, 'BackgroundColor', [1,1,1]);
        set(handles.editEp8, 'String', obj(x));
        str1=num2str(ci(x,1));
        str2=num2str(ci(x,2));
        set(handles.editCIp8, 'BackgroundColor', [1,1,1]);
        set(handles.editCIp8, 'String', strjoin({str1,str2},','));
        x=x+1;
    end
    if cbv(9)==1
        set(handles.editEp9, 'BackgroundColor', [1,1,1]);
        set(handles.editEp9, 'String', obj(x));
        str1=num2str(ci(x,1));
        str2=num2str(ci(x,2));
        set(handles.editCIp9, 'BackgroundColor', [1,1,1]);
        set(handles.editCIp9, 'String', strjoin({str1,str2},','));
        x=x+1;
    end
    if cbv(10)==1
        set(handles.editEp10, 'BackgroundColor', [1,1,1]);
        set(handles.editEp10, 'String', obj(x));
        str1=num2str(ci(x,1));
        str2=num2str(ci(x,2));
        set(handles.editCIp10, 'BackgroundColor', [1,1,1]);
        set(handles.editCIp10, 'String', strjoin({str1,str2},','));
        x=x+1;
    end
    if cbv(11)==1
        set(handles.editEp11, 'BackgroundColor', [1,1,1]);
        set(handles.editEp11, 'String', obj(x));
        str1=num2str(ci(x,1));
        str2=num2str(ci(x,2));
        set(handles.editCIp11, 'BackgroundColor', [1,1,1]);
        set(handles.editCIp11, 'String', strjoin({str1,str2},','));
        x=x+1;
    end
    
    % For oral/extravascular administration
    if cbv(12)==1
        set(handles.editEp12, 'BackgroundColor', [1,1,1]);
        set(handles.editEp12, 'String', obj(x));
        str1=num2str(ci(x,1));
        str2=num2str(ci(x,2));
        set(handles.editCIp12, 'BackgroundColor', [1,1,1]);
        set(handles.editCIp12, 'String', strjoin({str1,str2},','));
        x=x+1;
    end
    if cbv(13)==1
        set(handles.editEp13, 'BackgroundColor', [1,1,1]);
        set(handles.editEp13, 'String', obj(x));
        str1=num2str(ci(x,1));
        str2=num2str(ci(x,2));
        set(handles.editCIp13, 'BackgroundColor', [1,1,1]);
        set(handles.editCIp13, 'String', strjoin({str1,str2},','));
        x=x+1;
    end
    
    
    
    
    
else     % large molecules
    
    
    % Get what parameters need to be estimated
    % Check values of checkboxes
    cbv(1)=get(handles.checkbox1,'Value');
    cbv(2)=get(handles.checkbox2,'Value');
    cbv(3)=get(handles.checkbox3,'Value');
    cbv(4)=get(handles.checkbox4,'Value');
    cbv(5)=get(handles.checkbox5,'Value');
    cbv(6)=get(handles.checkbox6,'Value');
    cbv(7)=get(handles.checkbox7,'Value');
    cbv(8)=get(handles.checkbox8,'Value');
    cbv(9)=get(handles.checkbox9,'Value');
    cbv(10)=get(handles.checkbox10,'Value');
    cbv(11)=get(handles.checkbox11,'Value');
    % For oral/extravascular administration
    cbv(12)=get(handles.checkbox12,'Value');
    cbv(13)=get(handles.checkbox13,'Value');
    % Back to IV
    cbv(14)=get(handles.checkbox14,'Value');
    cbv(15)=get(handles.checkbox15,'Value');
    
    
    
    
    % Get the data
    xColNum=get(handles.popupmenuX,'value');
    yColNum=get(handles.popupmenuY,'value');
    dat = strcat(handles.filePath,handles.fileName);
    [data.x,data.y]=readExcelColumns(dat, xColNum, yColNum);
    
    
    
    % Get the parameters
    % Dose
    s.dose=str2num(handles.editDose.String);
    
    % For infusion
    s.inft=str2num(handles.editINFtime.String);
    
    % For simulation
    s.tfinal=str2num(handles.edittfinal.String);
    
    % mPBPK parameters/Check if parameters need to be optimized
    x=1;
    s.L=str2num(handles.edit1.String);         %L
    if cbv(1)==1
        p(x)=s.L;
        x=x+1;
    else
        set(handles.editEp1, 'BackgroundColor', [0.9,0.9,0.9])
        set(handles.editEp1, 'String', '')
        set(handles.editCIp1, 'BackgroundColor', [0.9,0.9,0.9]);
        set(handles.editCIp1, 'String', '')
        set(handles.editlbub1, 'String', '')
    end
    s.Vp=str2num(handles.edit2.String);        %Vp
    if cbv(2)==1
        p(x)=s.Vp;
        x=x+1;
    else
        set(handles.editEp2, 'BackgroundColor', [0.9,0.9,0.9])
        set(handles.editEp2, 'String', '')
        set(handles.editCIp2, 'BackgroundColor', [0.9,0.9,0.9]);
        set(handles.editCIp2, 'String', '')
        set(handles.editlbub2, 'String', '')
    end
    s.ISF=str2num(handles.edit3.String);          %ISF
    if cbv(3)==1
        p(x)=s.ISF;
        x=x+1;
    else
        set(handles.editEp3, 'BackgroundColor', [0.9,0.9,0.9])
        set(handles.editEp3, 'String', '')
        set(handles.editCIp3, 'BackgroundColor', [0.9,0.9,0.9]);
        set(handles.editCIp3, 'String', '')
        set(handles.editlbub3, 'String', '')
    end
    s.Kp=str2num(handles.edit4.String);          %Kp
    if cbv(4)==1
        p(x)=s.Kp;
        x=x+1;
    else
        set(handles.editEp4, 'BackgroundColor', [0.9,0.9,0.9])
        set(handles.editEp4, 'String', '')
        set(handles.editCIp4, 'BackgroundColor', [0.9,0.9,0.9]);
        set(handles.editCIp4, 'String', '')
        set(handles.editlbub4, 'String', '')
    end
    s.VL=str2num(handles.edit5.String);        %VL
    if cbv(5)==1
        p(x)=s.VL;
        x=x+1;
    else
        set(handles.editEp5, 'BackgroundColor', [0.9,0.9,0.9])
        set(handles.editEp5, 'String', '')
        set(handles.editCIp5, 'BackgroundColor', [0.9,0.9,0.9]);
        set(handles.editCIp5, 'String', '')
        set(handles.editlbub5, 'String', '')
    end
    s.sigmaL=str2num(handles.edit6.String);          %sigmaL
    if cbv(6)==1
        p(x)=s.sigmaL;
        x=x+1;
    else
        set(handles.editEp6, 'BackgroundColor', [0.9,0.9,0.9])
        set(handles.editEp6, 'String', '')
        set(handles.editCIp6, 'BackgroundColor', [0.9,0.9,0.9]);
        set(handles.editCIp6, 'String', '')
        set(handles.editlbub6, 'String', '')
    end
    s.sigma1=str2num(handles.edit7.String);         %sigma1
    if cbv(7)==1
        p(x)=s.sigma1;
        x=x+1;
    else
        set(handles.editEp7, 'BackgroundColor', [0.9,0.9,0.9])
        set(handles.editEp7, 'String', '')
        set(handles.editCIp7, 'BackgroundColor', [0.9,0.9,0.9]);
        set(handles.editCIp7, 'String', '')
        set(handles.editlbub7, 'String', '')
    end
    s.sigma2=str2num(handles.edit8.String);         %sigma2
    if cbv(8)==1
        p(x)=s.sigma2;
        x=x+1;
    else
        set(handles.editEp8, 'BackgroundColor', [0.9,0.9,0.9])
        set(handles.editEp8, 'String', '')
        set(handles.editCIp8, 'BackgroundColor', [0.9,0.9,0.9]);
        set(handles.editCIp8, 'String', '')
        set(handles.editlbub8, 'String', '')
    end
    s.CLp=str2num(handles.edit9.String);          %CLp
    if cbv(9)==1
        p(x)=s.CLp;
        x=x+1;
    else
        set(handles.editEp9, 'BackgroundColor', [0.9,0.9,0.9])
        set(handles.editEp9, 'String', '')
        set(handles.editCIp9, 'BackgroundColor', [0.9,0.9,0.9]);
        set(handles.editCIp9, 'String', '')
        set(handles.editlbub9, 'String', '')
    end
    s.kon=str2num(handles.edit10.String);     %kon
    if cbv(10)==1
        p(x)=s.Kss;
        x=x+1;
    else
        set(handles.editEp10, 'BackgroundColor', [0.9,0.9,0.9])
        set(handles.editEp10, 'String', '')
        set(handles.editCIp10, 'BackgroundColor', [0.9,0.9,0.9]);
        set(handles.editCIp10, 'String', '')
        set(handles.editlbub10, 'String', '')
    end
    s.ksyn=str2num(handles.edit11.String);       %koff
    if cbv(11)==1
        p(x)=s.ksyn;
        x=x+1;
    else
        set(handles.editEp11, 'BackgroundColor', [0.9,0.9,0.9])
        set(handles.editEp11, 'String', '')
        set(handles.editCIp11, 'BackgroundColor', [0.9,0.9,0.9]);
        set(handles.editCIp11, 'String', '')
        set(handles.editlbub11, 'String', '')
    end
    % For oral/extravascular administration
    s.Fg=str2num(handles.edit12.String);       %Fg
    if cbv(12)==1
        p(x)=s.Fg;
        x=x+1;
    else
        set(handles.editEp12, 'BackgroundColor', [0.9,0.9,0.9])
        set(handles.editEp12, 'String', '')
        set(handles.editCIp12, 'BackgroundColor', [0.9,0.9,0.9]);
        set(handles.editCIp12, 'String', '')
        set(handles.editlbub12, 'String', '')
    end
    s.ka=str2num(handles.edit13.String);       %ka
    if cbv(13)==1
        p(x)=s.ka;
        x=x+1;
    else
        set(handles.editEp13, 'BackgroundColor', [0.9,0.9,0.9])
        set(handles.editEp13, 'String', '')
        set(handles.editCIp13, 'BackgroundColor', [0.9,0.9,0.9]);
        set(handles.editCIp13, 'String', '')
        set(handles.editlbub13, 'String', '')
    end
    % Back to IV parameters
    s.kdeg=str2num(handles.edit14.String);          %ksyn
    if cbv(14)==1
        p(x)=s.kdeg;
        x=x+1;
    else
        set(handles.editEp14, 'BackgroundColor', [0.9,0.9,0.9])
        set(handles.editEp14, 'String', '')
        set(handles.editCIp14, 'BackgroundColor', [0.9,0.9,0.9]);
        set(handles.editCIp14, 'String', '')
        set(handles.editlbub14, 'String', '')
    end
    s.kint=str2num(handles.edit15.String);     %kdeg
    if cbv(15)==1
        p(x)=s.kint;
        x=x+1;
    else
        set(handles.editEp15, 'BackgroundColor', [0.9,0.9,0.9])
        set(handles.editEp15, 'String', '')
        set(handles.editCIp15, 'BackgroundColor', [0.9,0.9,0.9]);
        set(handles.editCIp15, 'String', '')
        set(handles.editlbub15, 'String', '')
    end
    
    s.L1=0.33*s.L;                               %L1
    s.L2=0.67*s.L;                               %L2
    s.Vtight=0.65*s.ISF*s.Kp;                    %Vtight
    s.Vleaky=0.35*s.ISF*s.Kp;                    %Vleaky
    s.Rb=s.ksyn/s.kdeg;                          %Receptor bound
    
    
    
    
    % Other options regarding which type of model of large molecules to use
    
    if handles.radiobuttonCentral.Value==1
        s.central=1;
        s.peripheral=0;
        s.nb=0;
    end
    if handles.radiobuttonPeripheral.Value==1
        s.central=0;
        s.peripheral=1;
        s.nb=0;
    end
    if handles.radiobuttonNB.Value==1
        s.central=0;
        s.peripheral=0;
        s.nb=1;
    end
    
    
    % Set upper/lower bounds
    x=1;
    if isempty(get(handles.editlbub1,'String'))==0
        lbub(x,:)=strsplit(get(handles.editlbub1,'String'),',');
        lb(x)=str2num(lbub{x,1});
        ub(x)=str2num(lbub{x,2});
        x=x+1;
    end
    if isempty(get(handles.editlbub2,'String'))==0
        lbub(x,:)=strsplit(get(handles.editlbub2,'String'),',');
        lb(x)=str2num(lbub{x,1});
        ub(x)=str2num(lbub{x,2});
        x=x+1;
    end
    if isempty(get(handles.editlbub3,'String'))==0
        lbub(x,:)=strsplit(get(handles.editlbub3,'String'),',');
        lb(x)=str2num(lbub{x,1});
        ub(x)=str2num(lbub{x,2});
        x=x+1;
    end
    if isempty(get(handles.editlbub4,'String'))==0
        lbub(x,:)=strsplit(get(handles.editlbub4,'String'),',');
        lb(x)=str2num(lbub{x,1});
        ub(x)=str2num(lbub{x,2});
        x=x+1;
    end
    if isempty(get(handles.editlbub5,'String'))==0
        lbub(x,:)=strsplit(get(handles.editlbub5,'String'),',');
        lb(x)=str2num(lbub{x,1});
        ub(x)=str2num(lbub{x,2});
        x=x+1;
    end
    if isempty(get(handles.editlbub6,'String'))==0
        lbub(x,:)=strsplit(get(handles.editlbub6,'String'),',');
        lb(x)=str2num(lbub{x,1});
        ub(x)=str2num(lbub{x,2});
        x=x+1;
    end
    if isempty(get(handles.editlbub7,'String'))==0
        lbub(x,:)=strsplit(get(handles.editlbub7,'String'),',');
        lb(x)=str2num(lbub{x,1});
        ub(x)=str2num(lbub{x,2});
        x=x+1;
    end
    if isempty(get(handles.editlbub8,'String'))==0
        lbub(x,:)=strsplit(get(handles.editlbub8,'String'),',');
        lb(x)=str2num(lbub{x,1});
        ub(x)=str2num(lbub{x,2});
        x=x+1;
    end
    if isempty(get(handles.editlbub9,'String'))==0
        lbub(x,:)=strsplit(get(handles.editlbub9,'String'),',');
        lb(x)=str2num(lbub{x,1});
        ub(x)=str2num(lbub{x,2});
        x=x+1;
    end
    if isempty(get(handles.editlbub10,'String'))==0
        lbub(x,:)=strsplit(get(handles.editlbub10,'String'),',');
        lb(x)=str2num(lbub{x,1});
        ub(x)=str2num(lbub{x,2});
        x=x+1;
    end
    if isempty(get(handles.editlbub11,'String'))==0
        lbub(x,:)=strsplit(get(handles.editlbub11,'String'),',');
        lb(x)=str2num(lbub{x,1});
        ub(x)=str2num(lbub{x,2});
        x=x+1;
    end
    % For oral
    if isempty(get(handles.editlbub12,'String'))==0
        lbub(x,:)=strsplit(get(handles.editlbub12,'String'),',');
        lb(x)=str2num(lbub{x,1});
        ub(x)=str2num(lbub{x,2});
        x=x+1;
    end
    if isempty(get(handles.editlbub13,'String'))==0
        lbub(x,:)=strsplit(get(handles.editlbub13,'String'),',');
        lb(x)=str2num(lbub{x,1});
        ub(x)=str2num(lbub{x,2});
        x=x+1;
    end
    % For IV again
    if isempty(get(handles.editlbub14,'String'))==0
        lbub(x,:)=strsplit(get(handles.editlbub14,'String'),',');
        lb(x)=str2num(lbub{x,1});
        ub(x)=str2num(lbub{x,2});
        x=x+1;
    end
    if isempty(get(handles.editlbub15,'String'))==0
        lbub(x,:)=strsplit(get(handles.editlbub15,'String'),',');
        lb(x)=str2num(lbub{x,1});
        ub(x)=str2num(lbub{x,2});
        x=x+1;
    end

    options=optimset('TolFun',1e-8);
    % obj  = fmincon(@(p) objectiveminPBPK(data,p,s,handles,cbv),[p],[],[],[],[],lb,ub);
    [obj,resnorm,residual,exitflag,output,lambda,jacobian]  = lsqnonlin(@(p) objectiveminPBPK(data,p,s,handles,cbv),p,lb,ub,options);
    ci = nlparci(obj,residual,'jacobian',jacobian);
    x=1;
    if cbv(1)==1
        set(handles.editEp1, 'BackgroundColor', [1,1,1]);
        set(handles.editEp1, 'String', obj(x));
        str1=num2str(ci(x,1));
        str2=num2str(ci(x,2));
        set(handles.editCIp1, 'BackgroundColor', [1,1,1]);
        set(handles.editCIp1, 'String', strjoin({str1,str2},','));
        x=x+1;
    end
    if cbv(2)==1
        set(handles.editEp2, 'BackgroundColor', [1,1,1]);
        set(handles.editEp2, 'String', obj(x));
        str1=num2str(ci(x,1));
        str2=num2str(ci(x,2));
        set(handles.editCIp2, 'BackgroundColor', [1,1,1]);
        set(handles.editCIp2, 'String', strjoin({str1,str2},','));
        x=x+1;
    end
    if cbv(3)==1
        set(handles.editEp3, 'BackgroundColor', [1,1,1]);
        set(handles.editEp3, 'String', obj(x));
        str1=num2str(ci(x,1));
        str2=num2str(ci(x,2));
        set(handles.editCIp3, 'BackgroundColor', [1,1,1]);
        set(handles.editCIp3, 'String', strjoin({str1,str2},','));
        x=x+1;
    end
    if cbv(4)==1
        set(handles.editEp4, 'BackgroundColor', [1,1,1]);
        set(handles.editEp4, 'String', obj(x));
        str1=num2str(ci(x,1));
        str2=num2str(ci(x,2));
        set(handles.editCIp4, 'BackgroundColor', [1,1,1]);
        set(handles.editCIp4, 'String', strjoin({str1,str2},','));
        x=x+1;
    end
    if cbv(5)==1
        set(handles.editEp5, 'BackgroundColor', [1,1,1]);
        set(handles.editEp5, 'String', obj(x));
        str1=num2str(ci(x,1));
        str2=num2str(ci(x,2));
        set(handles.editCIp5, 'BackgroundColor', [1,1,1]);
        set(handles.editCIp5, 'String', strjoin({str1,str2},','));
        x=x+1;
    end
    if cbv(6)==1
        set(handles.editEp6, 'BackgroundColor', [1,1,1]);
        set(handles.editEp6, 'String', obj(x));
        str1=num2str(ci(x,1));
        str2=num2str(ci(x,2));
        set(handles.editCIp6, 'BackgroundColor', [1,1,1]);
        set(handles.editCIp6, 'String', strjoin({str1,str2},','));
        x=x+1;
    end
    if cbv(7)==1
        set(handles.editEp7, 'BackgroundColor', [1,1,1]);
        set(handles.editEp7, 'String', obj(x));
        str1=num2str(ci(x,1));
        str2=num2str(ci(x,2));
        set(handles.editCIp7, 'BackgroundColor', [1,1,1]);
        set(handles.editCIp7, 'String', strjoin({str1,str2},','));
        x=x+1;
    end
    if cbv(8)==1
        set(handles.editEp8, 'BackgroundColor', [1,1,1]);
        set(handles.editEp8, 'String', obj(x));
        str1=num2str(ci(x,1));
        str2=num2str(ci(x,2));
        set(handles.editCIp8, 'BackgroundColor', [1,1,1]);
        set(handles.editCIp8, 'String', strjoin({str1,str2},','));
        x=x+1;
    end
    if cbv(9)==1
        set(handles.editEp9, 'BackgroundColor', [1,1,1]);
        set(handles.editEp9, 'String', obj(x));
        str1=num2str(ci(x,1));
        str2=num2str(ci(x,2));
        set(handles.editCIp9, 'BackgroundColor', [1,1,1]);
        set(handles.editCIp9, 'String', strjoin({str1,str2},','));
        x=x+1;
    end
    if cbv(10)==1
        set(handles.editEp10, 'BackgroundColor', [1,1,1]);
        set(handles.editEp10, 'String', obj(x));
        str1=num2str(ci(x,1));
        str2=num2str(ci(x,2));
        set(handles.editCIp10, 'BackgroundColor', [1,1,1]);
        set(handles.editCIp10, 'String', strjoin({str1,str2},','));
        x=x+1;
    end
    if cbv(11)==1
        set(handles.editEp11, 'BackgroundColor', [1,1,1]);
        set(handles.editEp11, 'String', obj(x));
        str1=num2str(ci(x,1));
        str2=num2str(ci(x,2));
        set(handles.editCIp11, 'BackgroundColor', [1,1,1]);
        set(handles.editCIp11, 'String', strjoin({str1,str2},','));
        x=x+1;
    end
    
    % For oral/extravascular administration
    if cbv(12)==1
        set(handles.editEp12, 'BackgroundColor', [1,1,1]);
        set(handles.editEp12, 'String', obj(x));
        str1=num2str(ci(x,1));
        str2=num2str(ci(x,2));
        set(handles.editCIp12, 'BackgroundColor', [1,1,1]);
        set(handles.editCIp12, 'String', strjoin({str1,str2},','));
        x=x+1;
    end
    if cbv(13)==1
        set(handles.editEp13, 'BackgroundColor', [1,1,1]);
        set(handles.editEp13, 'String', obj(x));
        str1=num2str(ci(x,1));
        str2=num2str(ci(x,2));
        set(handles.editCIp13, 'BackgroundColor', [1,1,1]);
        set(handles.editCIp13, 'String', strjoin({str1,str2},','));
        x=x+1;
    end
    % For IV again
    if cbv(14)==1
        set(handles.editEp14, 'BackgroundColor', [1,1,1]);
        set(handles.editEp14, 'String', obj(x));
        str1=num2str(ci(x,1));
        str2=num2str(ci(x,2));
        set(handles.editCIp14, 'BackgroundColor', [1,1,1]);
        set(handles.editCIp14, 'String', strjoin({str1,str2},','));
        x=x+1;
    end
    if cbv(15)==1
        set(handles.editEp15, 'BackgroundColor', [1,1,1]);
        set(handles.editEp15, 'String', obj(x));
        str1=num2str(ci(x,1));
        str2=num2str(ci(x,2));
        set(handles.editCIp15, 'BackgroundColor', [1,1,1]);
        set(handles.editCIp15, 'String', strjoin({str1,str2},','));
        x=x+1;
    end
    
    
end




% --- Error Calculation for the Estimation
function [err]=objectiveminPBPK(data,p,s,handles,cbv)

if handles.popupmenuModel.Value==1          % If small molecules
    
    % Set/Re-set parameters to be optmized
    x=1;
    if cbv(1)==1
        s.Qco=p(x);
        x=x+1;
    end
    if cbv(2)==1
        s.Qhep=p(x);
        x=x+1;
    end
    if cbv(3)==1
        s.BW=p(x);
        x=x+1;
    end
    if cbv(4)==1
        s.Vp=p(x);
        x=x+1;
    end
    if cbv(5)==1
        s.Vhep=p(x);
        x=x+1;
    end
    if cbv(6)==1
        s.V1=p(x);
        x=x+1;
    end
    if cbv(7)==1
        s.fd1=p(x);
        x=x+1;
    end
    if cbv(8)==1
        s.fd2=p(x);
        x=x+1;
    end
    if cbv(9)==1
        s.Kp=p(x);
        x=x+1;
    end
    if cbv(10)==1
        s.CLintu=p(x);
        x=x+1;
    end
    if cbv(11)==1
        s.CLnh=p(x);
        x=x+1;
    end
    s.V2=s.BW-s.V1-s.Vp-s.Vhep;
    
    % For oral/extravascular administration
    if cbv(12)==1
        s.Fg=p(x);
        x=x+1;
    end
    if cbv(13)==1
        s.ka=p(x);
        x=x+1;
    end
    % s
    if handles.radiobuttonPO.Value==1
        [t,y]=ode23(@(t,y)minPBPKoral(t,y,s),[0 s.tfinal],[0,0,0,0,s.dose]);
        y(:,1)=y(:,1)./s.Vp;
        y(:,2)=y(:,2)./s.V1;
        y(:,3)=y(:,3)./s.V2;
        y(:,4)=y(:,4)./s.Vhep;
    end
    if handles.radiobuttonINF.Value==1
        [t,y]=ode23(@(t,y)minPBPKinf(t,y,s),[0 s.tfinal],[0,0,0,0]);
        y(:,1)=y(:,1)./s.Vp;
        y(:,2)=y(:,2)./s.V1;
        y(:,3)=y(:,3)./s.V2;
        y(:,4)=y(:,4)./s.Vhep;
    end
    if handles.radiobuttonIV.Value==1
        [t,y]=ode23(@(t,y)minPBPK(t,y,s),[0 s.tfinal],[s.dose,0,0,0]);
        y(:,1)=y(:,1)./s.Vp;
        y(:,2)=y(:,2)./s.V1;
        y(:,3)=y(:,3)./s.V2;
        y(:,4)=y(:,4)./s.Vhep;
    end
    if handles.radiobuttonEV.Value==1
        [t,y]=ode23(@(t,y)minPBPKev(t,y,s),[0 s.tfinal],[0,0,0,0,s.dose]);
        y(:,1)=y(:,1)./s.Vp;
        y(:,2)=y(:,2)./s.V1;
        y(:,3)=y(:,3)./s.V2;
        y(:,4)=y(:,4)./s.Vhep;
    end

    iny=interp1(t,y(:,1),data.x);
    % err1=sum((log10(data.y)-log10(iny)).^2); % for fmincon
    if handles.radiobuttonPO.Value==1 % Oral
        err1=(((data.y)-(iny)).^2);
    else if handles.radiobuttonEV.Value==1 % Oral
            err1=(((data.y)-(iny)).^2);
        else
            err1=((log10(data.y)-log10(iny)).^2);
        end
    end
    
    
    xColNum=get(handles.popupmenuX,'value');
    yColNum=get(handles.popupmenuY,'value');
    leg = strcat(handles.filePath,handles.fileName);
    [~,colNames]=xlsread(leg);
    
    cla
    % % subplot(1,4,1)
    plot(data.x,data.y,'o')
    hold on
    plot(t,y(:,1))
    xlim([0 data.x(end)])
    drawnow
    xlabel(colNames(xColNum))
    ylabel(colNames(yColNum))
    grid on
    % err=err1^2;
    err=err1.^2;
    
    if s.fd1+s.fd2>1
        err=err.*10^8;
    end
    sumerr=sum(err)
    
    
else   % large molecules
    
    % Set/Re-set parameters to be optmized
    x=1;
    if cbv(1)==1
        s.L=p(x);
        x=x+1;
    end
    if cbv(2)==1
        s.Vp=p(x);
        x=x+1;
    end
    if cbv(3)==1
        s.ISF=p(x);
        x=x+1;
    end
    if cbv(4)==1
        s.Kp=p(x);
        x=x+1;
    end
    if cbv(5)==1
        s.VL=p(x);
        x=x+1;
    end
    if cbv(6)==1
        s.sigmaL=p(x);
        x=x+1;
    end
    if cbv(7)==1
        s.sigma1=p(x);
        x=x+1;
    end
    if cbv(8)==1
        s.sigma2=p(x);
        x=x+1;
    end
    if cbv(9)==1
        s.CLp=p(x);
        x=x+1;
    end
    if cbv(10)==1
        s.Kss=p(x);
        x=x+1;
    end
    if cbv(11)==1
        s.ksyn=p(x);
        x=x+1;
    end
    
    % For oral/extravascular administration
    if cbv(12)==1
        s.Fg=p(x);
        x=x+1;
    end
    if cbv(13)==1
        s.ka=p(x);
        x=x+1;
    end
    
    % For IV again
    if cbv(14)==1
        s.kdeg=p(x);
        x=x+1;
    end
    if cbv(15)==1
        s.kint=p(x);
        x=x+1;
    end
    
    
    
    if handles.radiobuttonEV.Value==1    % Extravascular administration
        [t,y]=ode23(@(t,y)minPBPKlargeEV(t,y,s),[0 s.tfinal],[0,0,s.ksyn/s.kdeg,0,s.ksyn/s.kdeg,0,s.dose]);
        y(:,1)=y(:,1)./s.Vp;
        y(:,2)=y(:,2)./s.Vtight;
        y(:,3)=y(:,3)./s.Vtight;
        y(:,4)=y(:,4)./s.Vleaky;
        y(:,5)=y(:,5)./s.Vleaky;
        y(:,6)=y(:,6)./s.VL;
    end
    if handles.radiobuttonINF.Value==1   % Infusion
        [t,y]=ode23(@(t,y)minPBPKlargeINF(t,y,s),[0 s.tfinal],[0,0,s.ksyn/s.kdeg,0,s.ksyn/s.kdeg,0]);
        y(:,1)=y(:,1)./s.Vp;
        y(:,2)=y(:,2)./s.Vtight;
        y(:,3)=y(:,3)./s.Vtight;
        y(:,4)=y(:,4)./s.Vleaky;
        y(:,5)=y(:,5)./s.Vleaky;
        y(:,6)=y(:,6)./s.VL;
    end
    if handles.radiobuttonIV.Value==1    % IV
        [t,y]=ode23(@(t,y)minPBPKlarge(t,y,s),[0 s.tfinal],[s.dose,0,s.ksyn/s.kdeg,0,s.ksyn/s.kdeg,0]);
        y(:,1)=y(:,1)./s.Vp;
        y(:,2)=y(:,2)./s.Vtight;
        y(:,3)=y(:,3)./s.Vtight;
        y(:,4)=y(:,4)./s.Vleaky;
        y(:,5)=y(:,5)./s.Vleaky;
        y(:,6)=y(:,6)./s.VL;
    end
    iny=interp1(t,y(:,1),data.x);
    % err1=sum((log10(data.y)-log10(iny)).^2); % for fmincon
    if handles.radiobuttonPO.Value==1 % Oral
        err1=(((data.y)-(iny)).^2);
    else if handles.radiobuttonEV.Value==1 % Oral
            err1=(((data.y)-(iny)).^2);
        else
            err1=((log10(data.y)-log10(iny)).^2);
        end
    end
    
    
    xColNum=get(handles.popupmenuX,'value');
    yColNum=get(handles.popupmenuY,'value');
    leg = strcat(handles.filePath,handles.fileName);
    [~,colNames]=xlsread(leg);
    
    cla
    % % subplot(1,4,1)
    plot(data.x,data.y,'o')
    hold on
    plot(t,y(:,1))
    xlim([0 data.x(end)])
    drawnow
    xlabel(colNames(xColNum))
    ylabel(colNames(yColNum))
    grid on
    % err=err1^2;
    err=err1.^2;
    sumerr=sum(err)
    
    
end




function editDose_Callback(hObject, eventdata, handles)
% hObject    handle to editDose (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editDose as text
%        str2double(get(hObject,'String')) returns contents of editDose as a double


% --- Executes during object creation, after setting all properties.
function editDose_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editDose (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in checkbox4.
function checkbox4_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox4


% --- Executes on button press in checkbox5.
function checkbox5_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox5


% --- Executes on button press in checkbox6.
function checkbox6_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox6



function editEp7_Callback(hObject, eventdata, handles)
% hObject    handle to editEp7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editEp7 as text
%        str2double(get(hObject,'String')) returns contents of editEp7 as a double



% --- Executes during object creation, after setting all properties.
function editEp7_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editEp7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editEp9_Callback(hObject, eventdata, handles)
% hObject    handle to editEp9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editEp9 as text
%        str2double(get(hObject,'String')) returns contents of editEp9 as a double



% --- Executes during object creation, after setting all properties.
function editEp9_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editEp9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editEp10_Callback(hObject, eventdata, handles)
% hObject    handle to editEp10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editEp10 as text
%        str2double(get(hObject,'String')) returns contents of editEp10 as a double


% --- Executes during object creation, after setting all properties.
function editEp10_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editEp10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



% --- Executes on selection change in popupmenuModel.
function popupmenuModel_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenuModel (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenuModel contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenuModel
contents=cellstr(get(hObject,'String'));
popChoice=contents{get(hObject,'Value')};
tf=strcmp(popChoice,'Small molecule');
if tf==1
    set(handles.uibuttongroupTMDD,'Visible','off')
    set(handles.textp1,'String','Cardiac output - Qco [volume/time] :','horizontalalignment','left')
    set(handles.edit1,'String','5.6')
    set(handles.textp2,'String','Portal vein blood flow - Qhep [volume/time] :','horizontalalignment','left')
    set(handles.edit2,'String','1.45')
    set(handles.textp3,'String','Body weight or Extracellular Fluid [volume] :','horizontalalignment','left')
    set(handles.edit3,'String','70')
    set(handles.textp4,'String','Plasma volume - Vp [volume] :','horizontalalignment','left')
    set(handles.edit4,'String','5.2')
    set(handles.textp5,'String','Liver volume - Vhep [volume] :','horizontalalignment','left')
    set(handles.edit5,'String','1.69')
    set(handles.textp6,'String','Highly perfused tissue volume - V1 [volume] :','horizontalalignment','left')
    set(handles.edit6,'String','24.3')
    set(handles.textp7,'String','Cardiac output fraction to highly perfused tissues fd1 :','horizontalalignment','left')
    set(handles.edit7,'String','0.7')
    set(handles.textp8,'String','Cardiac output fraction to lower perfused tissues fd2 :','horizontalalignment','left')
    set(handles.edit8,'String','0.1')
    set(handles.textp9,'String','Partition coefficient - Kp :','horizontalalignment','left')
    set(handles.edit9,'String','0.7')
    set(handles.textp10,'String','Hepatic intrinsic clearance - CLintu [volume/time] :','horizontalalignment','left')
    set(handles.edit10,'String','0.7')
    set(handles.textp11,'String','Non-hepatic clearance - CLnh [volume/time] :','horizontalalignment','left')
    set(handles.edit11,'String','0.01')
    set(handles.textp14,'String','','horizontalalignment','left')
    set(handles.textp14,'Visible','off')
    set(handles.edit14,'Visible','off')
    set(handles.checkbox14,'Visible','off')
    set(handles.editlbub14,'Visible','off')
    set(handles.editEp14,'Visible','off')
    set(handles.editCIp14,'Visible','off')
    set(handles.checkboxs14,'Visible','off')
    set(handles.textp15,'String','','horizontalalignment','left')
    set(handles.textp15,'Visible','off')
    set(handles.edit15,'Visible','off')
    set(handles.checkbox15,'Visible','off')
    set(handles.editlbub15,'Visible','off')
    set(handles.editEp15,'Visible','off')
    set(handles.editCIp15,'Visible','off')
    set(handles.checkboxs15,'Visible','off')
    set(handles.radiobuttonPO,'Visible','on')
else
    set(handles.radiobuttonCentral,'Value',1)
    set(handles.uibuttongroupTMDD,'Visible','on')
    set(handles.textp1,'String','Lymph flow - L [volume/time] :','horizontalalignment','left')
    set(handles.edit1,'String','0.12')
    set(handles.textp2,'String','Plasma volume - Vp [volume] :','horizontalalignment','left')
    set(handles.edit2,'String','2.6')
    set(handles.textp3,'String','Interstitial fluid - ISF [volume] :','horizontalalignment','left')
    set(handles.edit3,'String','15.6')
    set(handles.textp4,'String','Partition coefficient - Kp :','horizontalalignment','left')
    set(handles.edit4,'String','0.8')
    set(handles.textp5,'String','Lymph volume - VL [volume] :','horizontalalignment','left')
    set(handles.edit5,'String','5.2')
    set(handles.textp6,'String','Lymph refl. coefficient - sigmaL :','horizontalalignment','left')
    set(handles.edit6,'String','0.2')
    set(handles.textp7,'String','Vascular refl. coefficient for tight tissues - sigma1  :','horizontalalignment','left')
    set(handles.edit7,'String','0.95')
    set(handles.textp8,'String','Vascular refl. coefficient for leaky tissues - sigma2  :','horizontalalignment','left')
    set(handles.edit8,'String','0.512')
    set(handles.textp9,'String','Plasma clearance - CLp [volume/time] :','horizontalalignment','left')
    set(handles.edit9,'String','0.001')
    set(handles.textp10,'String','Steady state constant - Kss [mass/volume] :','horizontalalignment','left')
    set(handles.edit10,'String','0.1')
    set(handles.textp10,'Visible','on')
    set(handles.edit10,'Visible','on')
    set(handles.checkbox10,'Visible','on')
    set(handles.editlbub10,'Visible','on')
    set(handles.editEp10,'Visible','on')
    set(handles.editCIp10,'Visible','on')
    set(handles.checkboxs10,'Visible','on')
    set(handles.textp11,'String','Target biosynthesis rate - ksyn [mass/volume/time] :','horizontalalignment','left')
    set(handles.edit11,'String','0.001')
    set(handles.textp11,'Visible','on')
    set(handles.edit11,'Visible','on')
    set(handles.checkbox11,'Visible','on')
    set(handles.editlbub11,'Visible','on')
    set(handles.editEp11,'Visible','on')
    set(handles.editCIp11,'Visible','on')
    set(handles.checkboxs11,'Visible','on')
    set(handles.textp14,'String','Free target degradation rate - kdeg [1/time] :','horizontalalignment','left')
    set(handles.edit14,'String','0.1')
    set(handles.textp14,'Visible','on')
    set(handles.edit14,'Visible','on')
    set(handles.checkbox14,'Visible','on')
    set(handles.editlbub14,'Visible','on')
    set(handles.editEp14,'Visible','on')
    set(handles.editCIp14,'Visible','on')
    set(handles.checkboxs14,'Visible','on')
    set(handles.textp15,'String','Complex internalization rate - kint [1/time] :','horizontalalignment','left')
    set(handles.edit15,'String','0.0117')
    set(handles.textp15,'Visible','on')
    set(handles.edit15,'Visible','on')
    set(handles.checkbox15,'Visible','on')
    set(handles.editlbub15,'Visible','on')
    set(handles.editEp15,'Visible','on')
    set(handles.editCIp15,'Visible','on')
    set(handles.checkboxs15,'Visible','on')
    set(handles.radiobuttonPO,'Visible','off')
end




% --- Executes during object creation, after setting all properties.
function popupmenuModel_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenuModel (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on key press with focus on popupmenuModel and none of its controls.
function popupmenuModel_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to popupmenuModel (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.CONTROL.UICONTROL)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)



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



function edit5_Callback(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit5 as text
%        str2double(get(hObject,'String')) returns contents of edit5 as a double


% --- Executes during object creation, after setting all properties.
function edit5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit6_Callback(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit6 as text
%        str2double(get(hObject,'String')) returns contents of edit6 as a double


% --- Executes during object creation, after setting all properties.
function edit6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit8_Callback(hObject, eventdata, handles)
% hObject    handle to edit8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit8 as text
%        str2double(get(hObject,'String')) returns contents of edit8 as a double


% --- Executes during object creation, after setting all properties.
function edit8_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit11_Callback(hObject, eventdata, handles)
% hObject    handle to edit11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit11 as text
%        str2double(get(hObject,'String')) returns contents of edit11 as a double


% --- Executes during object creation, after setting all properties.
function edit11_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editEp11_Callback(hObject, eventdata, handles)
% hObject    handle to editEp11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editEp11 as text
%        str2double(get(hObject,'String')) returns contents of editEp11 as a double


% --- Executes during object creation, after setting all properties.
function editEp11_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editEp11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in checkbox7.
function checkbox7_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox7


% --- Executes on button press in checkbox1.
function checkbox1_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox1


% --- Executes on button press in checkbox2.
function checkbox2_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox2


% --- Executes on button press in checkbox3.
function checkbox3_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox3


% --- Executes on button press in checkbox4.
function checkbox11_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox4


% --- Executes on button press in checkbox5.
function checkbox12_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox5


% --- Executes on button press in checkbox6.
function checkbox13_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox6


% --- Executes on button press in checkbox7.
function checkboxs1_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox7


% --- Executes on button press in checkbox8.
function checkbox8_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox8


% --- Executes on button press in checkbox9.
function checkbox9_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox9


% --- Executes on button press in checkbox10.
function checkbox10_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox10


% --- Executes on button press in checkbox11.
function checkboxs5_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox11



function editEp1_Callback(hObject, eventdata, handles)
% hObject    handle to editEp1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editEp1 as text
%        str2double(get(hObject,'String')) returns contents of editEp1 as a double


% --- Executes during object creation, after setting all properties.
function editEp1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editEp1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editEp2_Callback(hObject, eventdata, handles)
% hObject    handle to editEp2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editEp2 as text
%        str2double(get(hObject,'String')) returns contents of editEp2 as a double


% --- Executes during object creation, after setting all properties.
function editEp2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editEp2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editEp3_Callback(hObject, eventdata, handles)
% hObject    handle to editEp3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editEp3 as text
%        str2double(get(hObject,'String')) returns contents of editEp3 as a double


% --- Executes during object creation, after setting all properties.
function editEp3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editEp3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editEp4_Callback(hObject, eventdata, handles)
% hObject    handle to editEp4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editEp4 as text
%        str2double(get(hObject,'String')) returns contents of editEp4 as a double


% --- Executes during object creation, after setting all properties.
function editEp4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editEp4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editEp5_Callback(hObject, eventdata, handles)
% hObject    handle to editEp5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editEp5 as text
%        str2double(get(hObject,'String')) returns contents of editEp5 as a double


% --- Executes during object creation, after setting all properties.
function editEp5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editEp5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editEp6_Callback(hObject, eventdata, handles)
% hObject    handle to editEp6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editEp6 as text
%        str2double(get(hObject,'String')) returns contents of editEp6 as a double


% --- Executes during object creation, after setting all properties.
function editEp6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editEp6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editEp8_Callback(hObject, eventdata, handles)
% hObject    handle to editEp8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editEp8 as text
%        str2double(get(hObject,'String')) returns contents of editEp8 as a double


% --- Executes during object creation, after setting all properties.
function editEp8_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editEp8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editCIp7_Callback(hObject, eventdata, handles)
% hObject    handle to editCIp7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editCIp7 as text
%        str2double(get(hObject,'String')) returns contents of editCIp7 as a double


% --- Executes during object creation, after setting all properties.
function editCIp7_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editCIp7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editCIp9_Callback(hObject, eventdata, handles)
% hObject    handle to editCIp9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editCIp9 as text
%        str2double(get(hObject,'String')) returns contents of editCIp9 as a double


% --- Executes during object creation, after setting all properties.
function editCIp9_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editCIp9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editCIp10_Callback(hObject, eventdata, handles)
% hObject    handle to editCIp10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editCIp10 as text
%        str2double(get(hObject,'String')) returns contents of editCIp10 as a double


% --- Executes during object creation, after setting all properties.
function editCIp10_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editCIp10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editCIp11_Callback(hObject, eventdata, handles)
% hObject    handle to editCIp11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editCIp11 as text
%        str2double(get(hObject,'String')) returns contents of editCIp11 as a double


% --- Executes during object creation, after setting all properties.
function editCIp11_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editCIp11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editCIp1_Callback(hObject, eventdata, handles)
% hObject    handle to editCIp1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editCIp1 as text
%        str2double(get(hObject,'String')) returns contents of editCIp1 as a double


% --- Executes during object creation, after setting all properties.
function editCIp1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editCIp1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editCIp2_Callback(hObject, eventdata, handles)
% hObject    handle to editCIp2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editCIp2 as text
%        str2double(get(hObject,'String')) returns contents of editCIp2 as a double


% --- Executes during object creation, after setting all properties.
function editCIp2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editCIp2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editCIp3_Callback(hObject, eventdata, handles)
% hObject    handle to editCIp3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editCIp3 as text
%        str2double(get(hObject,'String')) returns contents of editCIp3 as a double


% --- Executes during object creation, after setting all properties.
function editCIp3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editCIp3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editCIp4_Callback(hObject, eventdata, handles)
% hObject    handle to editCIp4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editCIp4 as text
%        str2double(get(hObject,'String')) returns contents of editCIp4 as a double


% --- Executes during object creation, after setting all properties.
function editCIp4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editCIp4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editCIp5_Callback(hObject, eventdata, handles)
% hObject    handle to editCIp5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editCIp5 as text
%        str2double(get(hObject,'String')) returns contents of editCIp5 as a double


% --- Executes during object creation, after setting all properties.
function editCIp5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editCIp5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editCIp6_Callback(hObject, eventdata, handles)
% hObject    handle to editCIp6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editCIp6 as text
%        str2double(get(hObject,'String')) returns contents of editCIp6 as a double


% --- Executes during object creation, after setting all properties.
function editCIp6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editCIp6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editCIp8_Callback(hObject, eventdata, handles)
% hObject    handle to editCIp8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editCIp8 as text
%        str2double(get(hObject,'String')) returns contents of editCIp8 as a double


% --- Executes during object creation, after setting all properties.
function editCIp8_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editCIp8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit39_Callback(hObject, eventdata, handles)
% hObject    handle to edit39 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit39 as text
%        str2double(get(hObject,'String')) returns contents of edit39 as a double


% --- Executes during object creation, after setting all properties.
function edit39_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit39 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit40_Callback(hObject, eventdata, handles)
% hObject    handle to editDose (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editDose as text
%        str2double(get(hObject,'String')) returns contents of editDose as a double


% --- Executes during object creation, after setting all properties.
function edit40_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editDose (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editlbub1_Callback(hObject, eventdata, handles)
% hObject    handle to editlbub1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editlbub1 as text
%        str2double(get(hObject,'String')) returns contents of editlbub1 as a double


% --- Executes during object creation, after setting all properties.
function editlbub1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editlbub1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editlbub2_Callback(hObject, eventdata, handles)
% hObject    handle to editlbub2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editlbub2 as text
%        str2double(get(hObject,'String')) returns contents of editlbub2 as a double


% --- Executes during object creation, after setting all properties.
function editlbub2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editlbub2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editlbub3_Callback(hObject, eventdata, handles)
% hObject    handle to editlbub3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editlbub3 as text
%        str2double(get(hObject,'String')) returns contents of editlbub3 as a double


% --- Executes during object creation, after setting all properties.
function editlbub3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editlbub3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editlbub4_Callback(hObject, eventdata, handles)
% hObject    handle to editlbub4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editlbub4 as text
%        str2double(get(hObject,'String')) returns contents of editlbub4 as a double


% --- Executes during object creation, after setting all properties.
function editlbub4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editlbub4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editlbub5_Callback(hObject, eventdata, handles)
% hObject    handle to editlbub5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editlbub5 as text
%        str2double(get(hObject,'String')) returns contents of editlbub5 as a double


% --- Executes during object creation, after setting all properties.
function editlbub5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editlbub5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editlbub6_Callback(hObject, eventdata, handles)
% hObject    handle to editlbub6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editlbub6 as text
%        str2double(get(hObject,'String')) returns contents of editlbub6 as a double


% --- Executes during object creation, after setting all properties.
function editlbub6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editlbub6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editlbub7_Callback(hObject, eventdata, handles)
% hObject    handle to editlbub7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editlbub7 as text
%        str2double(get(hObject,'String')) returns contents of editlbub7 as a double


% --- Executes during object creation, after setting all properties.
function editlbub7_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editlbub7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editlbub8_Callback(hObject, eventdata, handles)
% hObject    handle to editlbub8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editlbub8 as text
%        str2double(get(hObject,'String')) returns contents of editlbub8 as a double


% --- Executes during object creation, after setting all properties.
function editlbub8_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editlbub8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editlbub9_Callback(hObject, eventdata, handles)
% hObject    handle to editlbub9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editlbub9 as text
%        str2double(get(hObject,'String')) returns contents of editlbub9 as a double


% --- Executes during object creation, after setting all properties.
function editlbub9_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editlbub9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editlbub10_Callback(hObject, eventdata, handles)
% hObject    handle to editlbub10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editlbub10 as text
%        str2double(get(hObject,'String')) returns contents of editlbub10 as a double


% --- Executes during object creation, after setting all properties.
function editlbub10_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editlbub10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editlbub11_Callback(hObject, eventdata, handles)
% hObject    handle to editlbub11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editlbub11 as text
%        str2double(get(hObject,'String')) returns contents of editlbub11 as a double


% --- Executes during object creation, after setting all properties.
function editlbub11_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editlbub11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in radiobuttonLL.
function radiobuttonLL_Callback(hObject, eventdata, handles)
% hObject    handle to radiobuttonLL (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobuttonLL
valrbll=get(hObject,'Value');
if valrbll==1
    hold on
    set(gca, 'YScale', 'log')
else
    hold on
    set(gca, 'YScale', 'lin')
end



function editka_Callback(hObject, eventdata, handles)
% hObject    handle to editka (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editka as text
%        str2double(get(hObject,'String')) returns contents of editka as a double


% --- Executes during object creation, after setting all properties.
function editka_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editka (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit87_Callback(hObject, eventdata, handles)
% hObject    handle to edit87 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit87 as text
%        str2double(get(hObject,'String')) returns contents of edit87 as a double


% --- Executes during object creation, after setting all properties.
function edit87_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit87 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit88_Callback(hObject, eventdata, handles)
% hObject    handle to edit88 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit88 as text
%        str2double(get(hObject,'String')) returns contents of edit88 as a double


% --- Executes during object creation, after setting all properties.
function edit88_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit88 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit89_Callback(hObject, eventdata, handles)
% hObject    handle to edit89 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit89 as text
%        str2double(get(hObject,'String')) returns contents of edit89 as a double


% --- Executes during object creation, after setting all properties.
function edit89_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit89 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit90_Callback(hObject, eventdata, handles)
% hObject    handle to edit90 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit90 as text
%        str2double(get(hObject,'String')) returns contents of edit90 as a double


% --- Executes during object creation, after setting all properties.
function edit90_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit90 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in checkbox30.
function checkbox30_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox30 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox30


% --- Executes on button press in checkbox31.
function checkbox31_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox31 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox31



function edit91_Callback(hObject, eventdata, handles)
% hObject    handle to edit91 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit91 as text
%        str2double(get(hObject,'String')) returns contents of edit91 as a double


% --- Executes during object creation, after setting all properties.
function edit91_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit91 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit92_Callback(hObject, eventdata, handles)
% hObject    handle to edit92 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit92 as text
%        str2double(get(hObject,'String')) returns contents of edit92 as a double


% --- Executes during object creation, after setting all properties.
function edit92_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit92 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit93_Callback(hObject, eventdata, handles)
% hObject    handle to edit93 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit93 as text
%        str2double(get(hObject,'String')) returns contents of edit93 as a double


% --- Executes during object creation, after setting all properties.
function edit93_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit93 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit94_Callback(hObject, eventdata, handles)
% hObject    handle to edit94 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit94 as text
%        str2double(get(hObject,'String')) returns contents of edit94 as a double


% --- Executes during object creation, after setting all properties.
function edit94_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit94 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit95_Callback(hObject, eventdata, handles)
% hObject    handle to edit95 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit95 as text
%        str2double(get(hObject,'String')) returns contents of edit95 as a double


% --- Executes during object creation, after setting all properties.
function edit95_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit95 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit12_Callback(hObject, eventdata, handles)
% hObject    handle to edit12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit12 as text
%        str2double(get(hObject,'String')) returns contents of edit12 as a double


% --- Executes during object creation, after setting all properties.
function edit12_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit13_Callback(hObject, eventdata, handles)
% hObject    handle to edit13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit13 as text
%        str2double(get(hObject,'String')) returns contents of edit13 as a double


% --- Executes during object creation, after setting all properties.
function edit13_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editEp12_Callback(hObject, eventdata, handles)
% hObject    handle to editEp12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editEp12 as text
%        str2double(get(hObject,'String')) returns contents of editEp12 as a double


% --- Executes during object creation, after setting all properties.
function editEp12_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editEp12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editEp13_Callback(hObject, eventdata, handles)
% hObject    handle to editEp13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editEp13 as text
%        str2double(get(hObject,'String')) returns contents of editEp13 as a double


% --- Executes during object creation, after setting all properties.
function editEp13_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editEp13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in checkbox12.
function checkbox32_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox12


% --- Executes on button press in checkbox13.
function checkbox33_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox13



function editCIp12_Callback(hObject, eventdata, handles)
% hObject    handle to editCIp12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editCIp12 as text
%        str2double(get(hObject,'String')) returns contents of editCIp12 as a double


% --- Executes during object creation, after setting all properties.
function editCIp12_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editCIp12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editCIp13_Callback(hObject, eventdata, handles)
% hObject    handle to editCIp13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editCIp13 as text
%        str2double(get(hObject,'String')) returns contents of editCIp13 as a double


% --- Executes during object creation, after setting all properties.
function editCIp13_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editCIp13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editlbub12_Callback(hObject, eventdata, handles)
% hObject    handle to editlbub12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editlbub12 as text
%        str2double(get(hObject,'String')) returns contents of editlbub12 as a double


% --- Executes during object creation, after setting all properties.
function editlbub12_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editlbub12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editlbub13_Callback(hObject, eventdata, handles)
% hObject    handle to editlbub13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editlbub13 as text
%        str2double(get(hObject,'String')) returns contents of editlbub13 as a double


% --- Executes during object creation, after setting all properties.
function editlbub13_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editlbub13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in radiobuttonPO.
function radiobuttonPO_Callback(hObject, eventdata, handles)
% hObject    handle to radiobuttonPO (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobuttonPO
if handles.radiobuttonPO.Value==1
    set(handles.editINFtime,'Visible','off')
    set(handles.textINFtime,'Visible','off')
end


% --- Executes on button press in checkboxs1.
function checkbox34_Callback(hObject, eventdata, handles)
% hObject    handle to checkboxs1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkboxs1


% --- Executes on button press in checkboxs2.
function checkboxs2_Callback(hObject, eventdata, handles)
% hObject    handle to checkboxs2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkboxs2


% --- Executes on button press in checkboxs3.
function checkboxs3_Callback(hObject, eventdata, handles)
% hObject    handle to checkboxs3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkboxs3


% --- Executes on button press in checkboxs4.
function checkboxs4_Callback(hObject, eventdata, handles)
% hObject    handle to checkboxs4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkboxs4


% --- Executes on button press in checkboxs5.
function checkbox38_Callback(hObject, eventdata, handles)
% hObject    handle to checkboxs5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkboxs5


% --- Executes on button press in checkboxs6.
function checkboxs6_Callback(hObject, eventdata, handles)
% hObject    handle to checkboxs6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkboxs6


% --- Executes on button press in checkboxs7.
function checkboxs7_Callback(hObject, eventdata, handles)
% hObject    handle to checkboxs7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkboxs7


% --- Executes on button press in checkboxs8.
function checkboxs8_Callback(hObject, eventdata, handles)
% hObject    handle to checkboxs8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkboxs8


% --- Executes on button press in checkboxs9.
function checkboxs9_Callback(hObject, eventdata, handles)
% hObject    handle to checkboxs9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkboxs9


% --- Executes on button press in checkboxs10.
function checkboxs10_Callback(hObject, eventdata, handles)
% hObject    handle to checkboxs10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkboxs10


% --- Executes on button press in checkboxs11.
function checkboxs11_Callback(hObject, eventdata, handles)
% hObject    handle to checkboxs11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkboxs11


% --- Executes on button press in checkboxs12.
function checkboxs12_Callback(hObject, eventdata, handles)
% hObject    handle to checkboxs12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkboxs12


% --- Executes on button press in checkboxs13.
function checkboxs13_Callback(hObject, eventdata, handles)
% hObject    handle to checkboxs13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkboxs13


% --- Executes on button press in pushbuttonSensitivity.
function pushbuttonSensitivity_Callback(hObject, eventdata, handles)
% hObject    handle to pushbuttonSensitivity (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


if handles.popupmenuModel.Value==1          % If small molecules
    
    % Get what parameters need sensitivty evaluation
    % Check values of checkboxes
    cbvs(1)=get(handles.checkboxs1,'Value');
    cbvs(2)=get(handles.checkboxs2,'Value');
    cbvs(3)=get(handles.checkboxs3,'Value');
    cbvs(4)=get(handles.checkboxs4,'Value');
    cbvs(5)=get(handles.checkboxs5,'Value');
    cbvs(6)=get(handles.checkboxs6,'Value');
    cbvs(7)=get(handles.checkboxs7,'Value');
    cbvs(8)=get(handles.checkboxs8,'Value');
    cbvs(9)=get(handles.checkboxs9,'Value');
    cbvs(10)=get(handles.checkboxs10,'Value');
    cbvs(11)=get(handles.checkboxs11,'Value');
    % For oral administration
    cbvs(12)=get(handles.checkboxs12,'Value');
    cbvs(13)=get(handles.checkboxs13,'Value');
    
    
    % Find the index of the parameters
    nzi=find(cbvs);
    
    % Loop to calculate sensitivities
    for i=1:length(nzi)
        
        % Dose
        s.dose=str2num(handles.editDose.String);
        % mPBPK parameters
        s.Qco=str2num(handles.edit1.String);         %Cardiac Output
        s.Qhep=str2num(handles.edit2.String);        %Hepatic flow
        s.BW=str2num(handles.edit3.String);          %Body weight
        s.Vp=str2num(handles.edit4.String);          %Plasma volume
        s.Vhep=str2num(handles.edit5.String);        %Hepatic volume
        s.V1=str2num(handles.edit6.String);          %V1
        s.fd1=str2num(handles.edit7.String);         %fd1
        s.fd2=str2num(handles.edit8.String);         %fd2
        s.Kp=str2num(handles.edit9.String);          %Kp
        s.CLintu=str2num(handles.edit10.String);     %CLintu
        s.CLnh=str2num(handles.edit11.String);       %CLnon-hep
        s.V2=s.BW-s.V1-s.Vp-s.Vhep;
        
        % Oral adminisration
        s.Fg=str2num(handles.edit12.String);         %Fg
        s.ka=str2num(handles.edit13.String);         %ka
        
        % Infusion
        s.inft=str2num(handles.editINFtime.String);        %Infusion time
        
        % Simulation time
        s.tfinal=str2num(handles.edittfinal.String);         %Infusion time
        
        
        % Run simulation
        if handles.radiobuttonPO.Value==1
            [t,y]=ode23(@(t,y)minPBPKoral(t,y,s),[0 s.tfinal],[0,0,0,0,s.dose]);
            y(:,1)=y(:,1)./s.Vp;
            y(:,2)=y(:,2)./s.V1;
            y(:,3)=y(:,3)./s.V2;
            y(:,4)=y(:,4)./s.Vhep;
        end
        if handles.radiobuttonINF.Value==1
            [t,y]=ode23(@(t,y)minPBPKinf(t,y,s),[0 s.tfinal],[0,0,0,0]);
            y(:,1)=y(:,1)./s.Vp;
            y(:,2)=y(:,2)./s.V1;
            y(:,3)=y(:,3)./s.V2;
            y(:,4)=y(:,4)./s.Vhep;
        end
        if handles.radiobuttonIV.Value==1
            [t,y]=ode23(@(t,y)minPBPK(t,y,s),[0 s.tfinal],[s.dose,0,0,0]);
            y(:,1)=y(:,1)./s.Vp;
            y(:,2)=y(:,2)./s.V1;
            y(:,3)=y(:,3)./s.V2;
            y(:,4)=y(:,4)./s.Vhep;
        end
        if handles.radiobuttonEV.Value==1
            [t,y]=ode23(@(t,y)minPBPKev(t,y,s),[0 s.tfinal],[0,0,0,0,s.dose]);
            y(:,1)=y(:,1)./s.Vp;
            y(:,2)=y(:,2)./s.V1;
            y(:,3)=y(:,3)./s.V2;
            y(:,4)=y(:,4)./s.Vhep;
        end
        auc1(i)=auccalc(t,y(:,1));
        cmax1(i)=cmaxcalc(y(:,1));
        
        if nzi(i)==1
            par1(i)=s.Qco;
            s.Qco=s.Qco+0.1*s.Qco;
            par2(i)=s.Qco;
            kp{i}='Qco';
        end
        if nzi(i)==2
            par1(i)=s.Qhep;
            s.Qhep=s.Qhep+0.1*s.Qhep;
            par2(i)=s.Qhep;
            kp{i}='Qhep';
        end
        if nzi(i)==3
            par1(i)=s.BW;
            s.BW=s.BW+0.1*s.BW;
            par2(i)=s.BW;
            kp{i}='BW';
        end
        if nzi(i)==4
            par1(i)=s.Vp;
            s.Vp=s.Vp+0.1*s.Vp;
            par2(i)=s.Vp;
            kp{i}='Vp';
        end
        if nzi(i)==5
            par1(i)=s.Vhep;
            s.Vhep=s.Vhep+0.1*s.Vhep;
            par2(i)=s.Vhep;
            kp{i}='Vhep';
        end
        if nzi(i)==6
            par1(i)=s.V1;
            s.V1=s.V1+0.1*s.V1;
            par2(i)=s.V1;
            kp{i}='V1';
        end
        if nzi(i)==7
            par1(i)=s.fd1;
            s.fd1=s.fd1+0.1*s.fd1;
            par2(i)=s.fd1;
            kp{i}='fd1';
        end
        if nzi(i)==8
            par1(i)=s.fd2;
            s.fd2=s.fd2+0.1*s.fd2;
            par2(i)=s.fd2;
            kp{i}='fd2';
        end
        if nzi(i)==9
            par1(i)=s.Kp;
            s.Kp=s.Kp+0.1*s.Kp;
            par2(i)=s.Kp;
            kp{i}='Kp';
        end
        if nzi(i)==10
            par1(i)=s.CLintu;
            s.CLintu=s.CLintu+0.1*s.CLintu;
            par2(i)=s.CLintu;
            kp{i}='CLintu';
        end
        if nzi(i)==11
            par1(i)=s.CLnh;
            s.CLnh=s.CLnh+0.1*s.CLnh;
            par2(i)=s.CLnh;
            kp{i}='CLnh';
        end
        s.V2=s.BW-s.V1-s.Vp-s.Vhep;
        
        
        % For oral/extravascular administration
        if nzi(i)==12
            par1(i)=s.Fg;
            s.Fg=s.Fg+0.1*s.Fg;
            par2(i)=s.Fg;
            kp{i}='Fg';
        end
        if nzi(i)==13
            par1(i)=s.ka;
            s.ka=s.ka+0.1*s.ka;
            par2(i)=s.ka;
            kp{i}='ka';
        end

        
        % Run simulation
        if handles.radiobuttonPO.Value==1
            [t,y]=ode23(@(t,y)minPBPKoral(t,y,s),[0 s.tfinal],[0,0,0,0,s.dose]);
            y(:,1)=y(:,1)./s.Vp;
            y(:,2)=y(:,2)./s.V1;
            y(:,3)=y(:,3)./s.V2;
            y(:,4)=y(:,4)./s.Vhep;
        end
        if handles.radiobuttonINF.Value==1
            [t,y]=ode23(@(t,y)minPBPKinf(t,y,s),[0 s.tfinal],[0,0,0,0]);
            y(:,1)=y(:,1)./s.Vp;
            y(:,2)=y(:,2)./s.V1;
            y(:,3)=y(:,3)./s.V2;
            y(:,4)=y(:,4)./s.Vhep;
        end
        if handles.radiobuttonIV.Value==1
            [t,y]=ode23(@(t,y)minPBPK(t,y,s),[0 s.tfinal],[s.dose,0,0,0]);
            y(:,1)=y(:,1)./s.Vp;
            y(:,2)=y(:,2)./s.V1;
            y(:,3)=y(:,3)./s.V2;
            y(:,4)=y(:,4)./s.Vhep;
        end
        if handles.radiobuttonEV.Value==1
            [t,y]=ode23(@(t,y)minPBPKev(t,y,s),[0 s.tfinal],[0,0,0,0,s.dose]);
            y(:,1)=y(:,1)./s.Vp;
            y(:,2)=y(:,2)./s.V1;
            y(:,3)=y(:,3)./s.V2;
            y(:,4)=y(:,4)./s.Vhep;
        end
        auc2(i)=auccalc(t,y(:,1));
        cmax2(i)=cmaxcalc(y(:,1));
        siauc(i)=(((auc2(i)-auc1(i))/auc1(i))/((par2(i)-par1(i))/par1(i)))^2;
        sicmax(i)=(((cmax2(i)-cmax1(i))/cmax1(i))/((par2(i)-par1(i))/par1(i)))^2;
    end

    
else     % for large molecules

    
    % Check values of checkboxes
    cbvs(1)=get(handles.checkboxs1,'Value');
    cbvs(2)=get(handles.checkboxs2,'Value');
    cbvs(3)=get(handles.checkboxs3,'Value');
    cbvs(4)=get(handles.checkboxs4,'Value');
    cbvs(5)=get(handles.checkboxs5,'Value');
    cbvs(6)=get(handles.checkboxs6,'Value');
    cbvs(7)=get(handles.checkboxs7,'Value');
    cbvs(8)=get(handles.checkboxs8,'Value');
    cbvs(9)=get(handles.checkboxs9,'Value');
    cbvs(10)=get(handles.checkboxs10,'Value');
    cbvs(11)=get(handles.checkboxs11,'Value');
    % For oral/extravascular administration
    cbvs(12)=get(handles.checkboxs12,'Value');
    cbvs(13)=get(handles.checkboxs13,'Value');
    % Back to IV
    cbvs(14)=get(handles.checkboxs14,'Value');
    cbvs(15)=get(handles.checkboxs15,'Value');
    
    
    % Find the index of the parameters
    nzi=find(cbvs);

    % Loop to calculate sensitivities
    for i=1:length(nzi)
        % Dose
        s.dose=str2num(handles.editDose.String);
        % mPBPK parameters
        s.L=str2num(handles.edit1.String);           %Lymph flow
        s.Vp=str2num(handles.edit2.String);          %Plasma volume
        s.ISF=str2num(handles.edit3.String);         %Interstitial fluid
        s.Kp=str2num(handles.edit4.String);          %Partition coefficient
        s.VL=str2num(handles.edit5.String);          %Lymph volume
        s.sigmaL=str2num(handles.edit6.String);      %Lymph reflection coeff.
        s.sigma1=str2num(handles.edit7.String);      %Tight tissues refl. coeff.
        s.sigma2=str2num(handles.edit8.String);      %Leaky tissues refl. coeff.
        s.CLp=str2num(handles.edit9.String);         %CLp
        s.Kss=str2num(handles.edit10.String);        %Kss
        s.ksyn=str2num(handles.edit11.String);       %koff
        s.kdeg=str2num(handles.edit14.String);       %ksyn
        s.kint=str2num(handles.edit15.String);       %kdeg
        
        s.L1=0.33*s.L;                               %L1
        s.L2=0.67*s.L;                               %L2
        s.Vtight=0.65*s.ISF*s.Kp;                    %Vtight
        s.Vleaky=0.35*s.ISF*s.Kp;                    %Vleaky
        s.Rb=s.ksyn/s.kdeg;                          % Receptor bound
        
        % Oral/extravascular adminisration
        s.Fg=str2num(handles.edit12.String);         %Fg
        s.ka=str2num(handles.edit13.String);         %ka
        
        % Infusion
        s.inft=str2num(handles.editINFtime.String);         %Infusion time
        
        % Simulation time
        s.tfinal=str2num(handles.edittfinal.String);         %Infusion time
        
        if handles.radiobuttonCentral.Value==1
            s.central=1;
            s.peripheral=0;
            s.nb=0;
        end
        if handles.radiobuttonPeripheral.Value==1
            s.central=0;
            s.peripheral=1;
            s.nb=0;
        end
        if handles.radiobuttonNB.Value==1
            s.central=0;
            s.peripheral=0;
            s.nb=1;
        end
        
        
        % Run simulation
        if handles.radiobuttonEV.Value==1    % Oral administration
            [t,y]=ode23(@(t,y)minPBPKlargeEV(t,y,s),[0 s.tfinal],[0,0,s.ksyn/s.kdeg,0,s.ksyn/s.kdeg,0,s.dose]);
        y(:,1)=y(:,1)./s.Vp;
        y(:,2)=y(:,2)./s.Vtight;
        y(:,3)=y(:,3)./s.Vtight;
        y(:,4)=y(:,4)./s.Vleaky;
        y(:,5)=y(:,5)./s.Vleaky;
        y(:,6)=y(:,6)./s.VL;
        end
        if handles.radiobuttonINF.Value==1
            [t,y]=ode23(@(t,y)minPBPKlargeINF(t,y,s),[0 s.tfinal],[0,0,s.ksyn/s.kdeg,0,s.ksyn/s.kdeg,0]);
        y(:,1)=y(:,1)./s.Vp;
        y(:,2)=y(:,2)./s.Vtight;
        y(:,3)=y(:,3)./s.Vtight;
        y(:,4)=y(:,4)./s.Vleaky;
        y(:,5)=y(:,5)./s.Vleaky;
        y(:,6)=y(:,6)./s.VL;
        end
        if handles.radiobuttonIV.Value==1
            [t,y]=ode23(@(t,y)minPBPKlarge(t,y,s),[0 s.tfinal],[s.dose,0,s.ksyn/s.kdeg,0,s.ksyn/s.kdeg,0]);
        y(:,1)=y(:,1)./s.Vp;
        y(:,2)=y(:,2)./s.Vtight;
        y(:,3)=y(:,3)./s.Vtight;
        y(:,4)=y(:,4)./s.Vleaky;
        y(:,5)=y(:,5)./s.Vleaky;
        y(:,6)=y(:,6)./s.VL;
        end
        auc1(i)=auccalc(t,y(:,1));
        cmax1(i)=cmaxcalc(y(:,1));
        
        if nzi(i)==1
            par1(i)=s.L;
            s.L=s.L+0.1*s.L;
            par2(i)=s.L;
            kp{i}='L';
        end
        if nzi(i)==2
            par1(i)=s.Vp;
            s.Vp=s.Vp+0.1*s.Vp;
            par2(i)=s.Vp;
            kp{i}='Vp';
        end
        if nzi(i)==3
            par1(i)=s.ISF;
            s.ISF=s.ISF+0.1*s.ISF;
            par2(i)=s.ISF;
            kp{i}='ISF';
        end
        if nzi(i)==4
            par1(i)=s.Kp;
            s.Kp=s.Kp+0.1*s.Kp;
            par2(i)=s.Vp;
            kp{i}='Kp';
        end
        if nzi(i)==5
            par1(i)=s.VL;
            s.VL=s.VL+0.1*s.VL;
            par2(i)=s.VL;
            kp{i}='VL';
        end
        if nzi(i)==6
            par1(i)=s.sigmaL;
            s.sigmaL=s.sigmaL+0.1*s.sigmaL;
            par2(i)=s.sigmaL;
            kp{i}='sigmaL';
        end
        if nzi(i)==7
            par1(i)=s.sigma1;
            s.sigma1=s.sigma1+0.1*s.sigma1;
            par2(i)=s.sigma1;
            kp{i}='sigma1';
        end
        if nzi(i)==8
            par1(i)=s.sigma2;
            s.sigma2=s.sigma2+0.1*s.sigma2;
            par2(i)=s.sigma2;
            kp{i}='sigma2';
        end
        if nzi(i)==9
            par1(i)=s.CLp;
            s.CLp=s.CLp+0.1*s.CLp;
            par2(i)=s.CLp;
            kp{i}='CLp';
        end
        if nzi(i)==10
            par1(i)=s.Kss;
            s.Kss=s.Kss+0.1*s.Kss;
            par2(i)=s.Kss;
            kp{i}='Kss';
        end
        if nzi(i)==11
            par1(i)=s.ksyn;
            s.ksyn=s.ksyn+0.1*s.ksyn;
            par2(i)=s.ksyn;
            kp{i}='ksyn';
        end
        
        % For oral/extravascular administration
        if nzi(i)==12
            par1(i)=s.Fg;
            s.Fg=s.Fg+0.1*s.Fg;
            par2(i)=s.Fg;
            kp{i}='Fg';
        end
        if nzi(i)==13
            par1(i)=s.ka;
            s.ka=s.ka+0.1*s.ka;
            par2(i)=s.ka;
            kp{i}='ka';
        end
        
        % For IV again
        if nzi(i)==14
            par1(i)=s.kdeg;
            s.kdeg=s.kdeg+0.1*s.kdeg;
            par2(i)=s.kdeg;
            kp{i}='kdeg';
        end
        if nzi(i)==15
            par1(i)=s.kint;
            s.kint=s.kint+0.1*s.kint;
            par2(i)=s.kint;
            kp{i}='kint';
        end
        
        
        if handles.radiobuttonCentral.Value==1
            s.central=1;
            s.peripheral=0;
            s.nb=0;
        end
        if handles.radiobuttonPeripheral.Value==1
            s.central=0;
            s.peripheral=1;
            s.nb=0;
        end
        if handles.radiobuttonNB.Value==1
            s.central=0;
            s.peripheral=0;
            s.nb=1;
        end
        
        
        % Run simulation
        if handles.radiobuttonEV.Value==1    % Oral administration
            [t,y]=ode23(@(t,y)minPBPKlargeEV(t,y,s),[0 s.tfinal],[0,0,s.ksyn/s.kdeg,0,s.ksyn/s.kdeg,0,s.dose]);
        y(:,1)=y(:,1)./s.Vp;
        y(:,2)=y(:,2)./s.Vtight;
        y(:,3)=y(:,3)./s.Vtight;
        y(:,4)=y(:,4)./s.Vleaky;
        y(:,5)=y(:,5)./s.Vleaky;
        y(:,6)=y(:,6)./s.VL;
        end
        if handles.radiobuttonINF.Value==1
            [t,y]=ode23(@(t,y)minPBPKlargeINF(t,y,s),[0 s.tfinal],[0,0,s.ksyn/s.kdeg,0,s.ksyn/s.kdeg,0]);
        y(:,1)=y(:,1)./s.Vp;
        y(:,2)=y(:,2)./s.Vtight;
        y(:,3)=y(:,3)./s.Vtight;
        y(:,4)=y(:,4)./s.Vleaky;
        y(:,5)=y(:,5)./s.Vleaky;
        y(:,6)=y(:,6)./s.VL;
        end
        if handles.radiobuttonIV.Value==1
            [t,y]=ode23(@(t,y)minPBPKlarge(t,y,s),[0 s.tfinal],[s.dose,0,s.ksyn/s.kdeg,0,s.ksyn/s.kdeg,0]);
        y(:,1)=y(:,1)./s.Vp;
        y(:,2)=y(:,2)./s.Vtight;
        y(:,3)=y(:,3)./s.Vtight;
        y(:,4)=y(:,4)./s.Vleaky;
        y(:,5)=y(:,5)./s.Vleaky;
        y(:,6)=y(:,6)./s.VL;
        end
        auc2(i)=auccalc(t,y(:,1));
        cmax2(i)=cmaxcalc(y(:,1));
        siauc(i)=(((auc2(i)-auc1(i))/auc1(i))/((par2(i)-par1(i))/par1(i)))^2;
        sicmax(i)=(((cmax2(i)-cmax1(i))/cmax1(i))/((par2(i)-par1(i))/par1(i)))^2;
    end
    
    
end




% Plot the sensitivity results
figure
subplot(2,1,1)
bar(siauc)
set(gca,'Xtick',1:length(kp))
set(gca, 'XTickLabel', kp)
ylabel('(\DeltaAUC/\Deltap)^2')
% set(gca, 'YScale', 'log')
grid on
subplot(2,1,2)
bar(sicmax)
set(gca,'Xtick',1:length(kp))
set(gca, 'XTickLabel', kp)
ylabel('(\DeltaC_{max}/\Deltap)^2')
% set(gca, 'YScale', 'log')
grid on



% Calculate AUC function
function [auc]=auccalc(t,y)
auc=trapz(t,y);

% Calculate Cmax function
function [auc]=cmaxcalc(y)
auc=max(y);



function edit14_Callback(hObject, eventdata, handles)
% hObject    handle to edit14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit14 as text
%        str2double(get(hObject,'String')) returns contents of edit14 as a double


% --- Executes during object creation, after setting all properties.
function edit14_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit15_Callback(hObject, eventdata, handles)
% hObject    handle to edit15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit15 as text
%        str2double(get(hObject,'String')) returns contents of edit15 as a double


% --- Executes during object creation, after setting all properties.
function edit15_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editEp14_Callback(hObject, eventdata, handles)
% hObject    handle to editEp14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editEp14 as text
%        str2double(get(hObject,'String')) returns contents of editEp14 as a double


% --- Executes during object creation, after setting all properties.
function editEp14_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editEp14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editEp15_Callback(hObject, eventdata, handles)
% hObject    handle to editEp15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editEp15 as text
%        str2double(get(hObject,'String')) returns contents of editEp15 as a double


% --- Executes during object creation, after setting all properties.
function editEp15_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editEp15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in checkbox14.
function checkbox14_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox14


% --- Executes on button press in checkboxs2.
function checkbox48_Callback(hObject, eventdata, handles)
% hObject    handle to checkboxs2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkboxs2



function editCIp14_Callback(hObject, eventdata, handles)
% hObject    handle to editCIp14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editCIp14 as text
%        str2double(get(hObject,'String')) returns contents of editCIp14 as a double


% --- Executes during object creation, after setting all properties.
function editCIp14_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editCIp14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editCIp15_Callback(hObject, eventdata, handles)
% hObject    handle to editCIp15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editCIp15 as text
%        str2double(get(hObject,'String')) returns contents of editCIp15 as a double


% --- Executes during object creation, after setting all properties.
function editCIp15_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editCIp15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editlbub14_Callback(hObject, eventdata, handles)
% hObject    handle to editlbub14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editlbub14 as text
%        str2double(get(hObject,'String')) returns contents of editlbub14 as a double


% --- Executes during object creation, after setting all properties.
function editlbub14_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editlbub14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editlbub15_Callback(hObject, eventdata, handles)
% hObject    handle to editlbub15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editlbub15 as text
%        str2double(get(hObject,'String')) returns contents of editlbub15 as a double


% --- Executes during object creation, after setting all properties.
function editlbub15_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editlbub15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in checkboxs14.
function checkboxs14_Callback(hObject, eventdata, handles)
% hObject    handle to checkboxs14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkboxs14


% --- Executes on button press in checkboxs15.
function checkboxs15_Callback(hObject, eventdata, handles)
% hObject    handle to checkboxs15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkboxs15



function edit112_Callback(hObject, eventdata, handles)
% hObject    handle to edit112 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit112 as text
%        str2double(get(hObject,'String')) returns contents of edit112 as a double


% --- Executes during object creation, after setting all properties.
function edit112_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit112 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit113_Callback(hObject, eventdata, handles)
% hObject    handle to edit113 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit113 as text
%        str2double(get(hObject,'String')) returns contents of edit113 as a double


% --- Executes during object creation, after setting all properties.
function edit113_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit113 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit16_Callback(hObject, eventdata, handles)
% hObject    handle to edit16 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit16 as text
%        str2double(get(hObject,'String')) returns contents of edit16 as a double


% --- Executes during object creation, after setting all properties.
function edit16_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit16 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editEp16_Callback(hObject, eventdata, handles)
% hObject    handle to editEp16 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editEp16 as text
%        str2double(get(hObject,'String')) returns contents of editEp16 as a double


% --- Executes during object creation, after setting all properties.
function editEp16_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editEp16 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in checkbox16.
function checkbox16_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox16 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox16



function editCIp16_Callback(hObject, eventdata, handles)
% hObject    handle to editCIp16 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editCIp16 as text
%        str2double(get(hObject,'String')) returns contents of editCIp16 as a double


% --- Executes during object creation, after setting all properties.
function editCIp16_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editCIp16 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editlbub16_Callback(hObject, eventdata, handles)
% hObject    handle to editlbub16 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editlbub16 as text
%        str2double(get(hObject,'String')) returns contents of editlbub16 as a double


% --- Executes during object creation, after setting all properties.
function editlbub16_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editlbub16 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in checkboxs16.
function checkboxs16_Callback(hObject, eventdata, handles)
% hObject    handle to checkboxs16 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkboxs16


% --- Executes on button press in checkbox15.
function checkbox15_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox15


% --- Executes on button press in radiobuttonPlotAll.
function radiobuttonPlotAll_Callback(hObject, eventdata, handles)
% hObject    handle to radiobuttonPlotAll (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobuttonPlotAll


% --- Executes on button press in radiobuttonNB.
function radiobuttonNB_Callback(hObject, eventdata, handles)
% hObject    handle to radiobuttonNB (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobuttonNB
if handles.radiobuttonNB.Value==1
    set(handles.textp10,'String','','horizontalalignment','left')
    set(handles.textp10,'Visible','off')
    set(handles.edit10,'Visible','off')
    set(handles.checkbox10,'Visible','off')
    set(handles.editlbub10,'Visible','off')
    set(handles.editEp10,'Visible','off')
    set(handles.editCIp10,'Visible','off')
    set(handles.checkboxs10,'Visible','off')
    set(handles.textp11,'String','','horizontalalignment','left')
    set(handles.textp11,'Visible','off')
    set(handles.edit11,'Visible','off')
    set(handles.checkbox11,'Visible','off')
    set(handles.editlbub11,'Visible','off')
    set(handles.editEp11,'Visible','off')
    set(handles.editCIp11,'Visible','off')
    set(handles.checkboxs11,'Visible','off')
    set(handles.textp14,'String','','horizontalalignment','left')
    set(handles.textp14,'Visible','off')
    set(handles.edit14,'Visible','off')
    set(handles.checkbox14,'Visible','off')
    set(handles.editlbub14,'Visible','off')
    set(handles.editEp14,'Visible','off')
    set(handles.editCIp14,'Visible','off')
    set(handles.checkboxs14,'Visible','off')
    set(handles.textp15,'String','','horizontalalignment','left')
    set(handles.textp15,'Visible','off')
    set(handles.edit15,'Visible','off')
    set(handles.checkbox15,'Visible','off')
    set(handles.editlbub15,'Visible','off')
    set(handles.editEp15,'Visible','off')
    set(handles.editCIp15,'Visible','off')
    set(handles.checkboxs15,'Visible','off')
end

% --- Executes on button press in pushbuttonExport.
function pushbuttonExport_Callback(hObject, eventdata, handles)
% hObject    handle to pushbuttonExport (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


filename='mPBPK_Results.xlsx';
% Run the model to get all the variables responses
if handles.popupmenuModel.Value==1          % If small molecules
    
    
    % Dose
    s.dose=str2num(handles.editDose.String);
    % mPBPK parameters
    s.Qco=str2num(handles.edit1.String);         %Cardiac Output
    s.Qhep=str2num(handles.edit2.String);        %Hepatic flow
    s.BW=str2num(handles.edit3.String);          %Body weight
    s.Vp=str2num(handles.edit4.String);          %Plasma volume
    s.Vhep=str2num(handles.edit5.String);        %Hepatic volume
    s.V1=str2num(handles.edit6.String);          %V1
    s.fd1=str2num(handles.edit7.String);         %fd1
    s.fd2=str2num(handles.edit8.String);         %fd2
    s.Kp=str2num(handles.edit9.String);          %Kp
    s.CLintu=str2num(handles.edit10.String);     %CLintu
    s.CLnh=str2num(handles.edit11.String);       %CLnon-hep
    s.V2=s.BW-s.V1-s.Vp-s.Vhep;
    
    % Oral adminisration
    s.Fg=str2num(handles.edit12.String);         %Fg
    s.ka=str2num(handles.edit13.String);         %ka
    
    % Infusion
    s.inft=str2num(handles.editINFtime.String);         %Infusion time
    
    % Simulation time
    s.tfinal=str2num(handles.edittfinal.String);         %Infusion time
    
    
    % Run simulation
    if handles.radiobuttonPO.Value==1    % Oral administration
        [t,y]=ode23(@(t,y)minPBPKoral(t,y,s),[0 s.tfinal],[0,0,0,0,s.dose]);
        y(:,1)=y(:,1)./s.Vp;
        y(:,2)=y(:,2)./s.V1;
        y(:,3)=y(:,3)./s.V2;
        y(:,4)=y(:,4)./s.Vhep;
    end
    if handles.radiobuttonINF.Value==1    % Oral administration
        [t,y]=ode23(@(t,y)minPBPKinf(t,y,s),[0 s.tfinal],[0,0,0,0]);
        y(:,1)=y(:,1)./s.Vp;
        y(:,2)=y(:,2)./s.V1;
        y(:,3)=y(:,3)./s.V2;
        y(:,4)=y(:,4)./s.Vhep;
    end
    if handles.radiobuttonIV.Value==1  % Oral administration
        [t,y]=ode23(@(t,y)minPBPK(t,y,s),[0 s.tfinal],[s.dose,0,0,0]);
        y(:,1)=y(:,1)./s.Vp;
        y(:,2)=y(:,2)./s.V1;
        y(:,3)=y(:,3)./s.V2;
        y(:,4)=y(:,4)./s.Vhep;
    end
    if handles.radiobuttonEV.Value==1    % Oral administration
        [t,y]=ode23(@(t,y)minPBPKev(t,y,s),[0 s.tfinal],[0,0,0,0,s.dose]);
        y(:,1)=y(:,1)./s.Vp;
        y(:,2)=y(:,2)./s.V1;
        y(:,3)=y(:,3)./s.V2;
        y(:,4)=y(:,4)./s.Vhep;
    end
    
    y2=[t y];
    col_header={'Time','Cp','C1','C2','Chepatic'};
    xlswrite(filename,col_header)
    xlswrite(filename,y2,1,'A2')
    
    
else    % Else large molecule model
    
    
    % Dose
    s.dose=str2num(handles.editDose.String);
    % mPBPK parameters
    s.L=str2num(handles.edit1.String);           %Lymph flow
    s.Vp=str2num(handles.edit2.String);          %Plasma volume
    s.ISF=str2num(handles.edit3.String);         %Interstitial fluid
    s.Kp=str2num(handles.edit4.String);          %Partition coefficient
    s.VL=str2num(handles.edit5.String);          %Lymph volume
    s.sigmaL=str2num(handles.edit6.String);      %Lymph reflection coeff.
    s.sigma1=str2num(handles.edit7.String);      %Tight tissues refl. coeff.
    s.sigma2=str2num(handles.edit8.String);      %Leaky tissues refl. coeff.
    s.CLp=str2num(handles.edit9.String);         %CLp
    s.Kss=str2num(handles.edit10.String);        %kon
    s.ksyn=str2num(handles.edit11.String);       %koff
    s.kdeg=str2num(handles.edit14.String);       %ksyn
    s.kint=str2num(handles.edit15.String);       %kdeg
    
    s.L1=0.33*s.L;                               %L1
    s.L2=0.67*s.L;                               %L2
    s.Vtight=0.65*s.ISF*s.Kp;                    %Vtight
    s.Vleaky=0.35*s.ISF*s.Kp;                    %Vleaky
    s.Rb=s.ksyn/s.kdeg;                          % Receptor bound
    
    % Oral adminisration
    s.Fg=str2num(handles.edit12.String);         %Fg
    s.ka=str2num(handles.edit13.String);         %ka
    
    % Infusion
    s.inft=str2num(handles.editINFtime.String);         %Infusion time
    
     % Simulation time
    s.tfinal=str2num(handles.edittfinal.String);         %Simulation time   
    
    if handles.radiobuttonCentral.Value==1
        s.central=1;
        s.peripheral=0;
        s.nb=0;
    end
    if handles.radiobuttonPeripheral.Value==1
        s.central=0;
        s.peripheral=1;
        s.nb=0;
    end
    if handles.radiobuttonNB.Value==1
        s.central=0;
        s.peripheral=0;
        s.nb=1;
    end
    

    % Run simulation
    if handles.radiobuttonEV.Value==1    % Oral administration
        [t,y]=ode23(@(t,y)minPBPKlargeEV(t,y,s),[0 s.tfinal],[0,0,s.ksyn/s.kdeg,0,s.ksyn/s.kdeg,0,s.dose]);
        y(:,1)=y(:,1)./s.Vp;
        y(:,2)=y(:,2)./s.Vtight;
        y(:,3)=y(:,3)./s.Vtight;
        y(:,4)=y(:,4)./s.Vleaky;
        y(:,5)=y(:,5)./s.Vleaky;
        y(:,6)=y(:,6)./s.VL;
    end
    if handles.radiobuttonINF.Value==1
        [t,y]=ode23(@(t,y)minPBPKlargeINF(t,y,s),[0 s.tfinal],[0,0,s.ksyn/s.kdeg,0,s.ksyn/s.kdeg,0]);
        y(:,1)=y(:,1)./s.Vp;
        y(:,2)=y(:,2)./s.Vtight;
        y(:,3)=y(:,3)./s.Vtight;
        y(:,4)=y(:,4)./s.Vleaky;
        y(:,5)=y(:,5)./s.Vleaky;
        y(:,6)=y(:,6)./s.VL;
    end
    if handles.radiobuttonIV.Value==1
        [t,y]=ode23(@(t,y)minPBPKlarge(t,y,s),[0 s.tfinal],[s.dose,0,s.ksyn/s.kdeg,0,s.ksyn/s.kdeg,0]);
        y(:,1)=y(:,1)./s.Vp;
        y(:,2)=y(:,2)./s.Vtight;
        y(:,3)=y(:,3)./s.Vtight;
        y(:,4)=y(:,4)./s.Vleaky;
        y(:,5)=y(:,5)./s.Vleaky;
        y(:,6)=y(:,6)./s.VL;
    end
    
    if handles.radiobuttonCentral.Value==1
        y2=[t y];
        y2(:,6)=[];
        col_header={'Time','Cp','Ctight','Rtotal','Cleaky','Clymph'};
        xlswrite(filename,col_header)
        xlswrite(filename,y2,1,'A2')
    end
    if handles.radiobuttonPeripheral.Value==1
        y2=[t y];
        col_header={'Time','Cp','Ctight','Rtight','Cleaky','Rleaky','Clymph'};
        xlswrite(filename,col_header)
        xlswrite(filename,y2,1,'A2')
    end
    if handles.radiobuttonNB.Value==1
        y2=[t y];
        y2(:,4)=[];
        y2(:,5)=[];
        col_header={'Time','Cp','Ctight','Cleaky','Clymph'};
        xlswrite(filename,col_header)
        xlswrite(filename,y2,1,'A2')
    end
end


% --- Executes on button press in radiobuttonINF.
function radiobuttonINF_Callback(hObject, eventdata, handles)
% hObject    handle to radiobuttonINF (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobuttonINF
if handles.radiobuttonINF.Value==1
    set(handles.editINFtime,'Visible','on')
    set(handles.textINFtime,'Visible','on')
end


function editINFtime_Callback(hObject, eventdata, handles)
% hObject    handle to editINFtime (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editINFtime as text
%        str2double(get(hObject,'String')) returns contents of editINFtime as a double


% --- Executes during object creation, after setting all properties.
function editINFtime_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editINFtime (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in radiobuttonIV.
function radiobuttonIV_Callback(hObject, eventdata, handles)
% hObject    handle to radiobuttonIV (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobuttonIV
if handles.radiobuttonIV.Value==1
    set(handles.editINFtime,'Visible','off')
    set(handles.textINFtime,'Visible','off')
end



function edittfinal_Callback(hObject, eventdata, handles)
% hObject    handle to edittfinal (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edittfinal as text
%        str2double(get(hObject,'String')) returns contents of edittfinal as a double


% --- Executes during object creation, after setting all properties.
function edittfinal_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edittfinal (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in radiobuttonCentral.
function radiobuttonCentral_Callback(hObject, eventdata, handles)
% hObject    handle to radiobuttonCentral (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobuttonCentral
if handles.radiobuttonCentral.Value==1 
set(handles.textp10,'String','Steady state constant - Kss [mass/volume] :','horizontalalignment','left')
    set(handles.textp10,'Visible','on')
    set(handles.edit10,'Visible','on')
    set(handles.checkbox10,'Visible','on')
    set(handles.editlbub10,'Visible','on')
    set(handles.editEp10,'Visible','on')
    set(handles.editCIp10,'Visible','on')
    set(handles.checkboxs10,'Visible','on')
    set(handles.textp11,'String','Target biosynthesis rate - ksyn [mass/volume/time] :','horizontalalignment','left')
    set(handles.textp11,'Visible','on')
    set(handles.edit11,'Visible','on')
    set(handles.checkbox11,'Visible','on')
    set(handles.editlbub11,'Visible','on')
    set(handles.editEp11,'Visible','on')
    set(handles.editCIp11,'Visible','on')
    set(handles.checkboxs11,'Visible','on')
    set(handles.textp14,'String','Free target degradation rate - kdeg [1/time] :','horizontalalignment','left')
    set(handles.textp14,'Visible','on')
    set(handles.edit14,'Visible','on')
    set(handles.checkbox14,'Visible','on')
    set(handles.editlbub14,'Visible','on')
    set(handles.editEp14,'Visible','on')
    set(handles.editCIp14,'Visible','on')
    set(handles.checkboxs14,'Visible','on')
    set(handles.textp15,'String','Complex internalization rate - kint [1/time] :','horizontalalignment','left')
    set(handles.textp15,'Visible','on')
    set(handles.edit15,'Visible','on')
    set(handles.checkbox15,'Visible','on')
    set(handles.editlbub15,'Visible','on')
    set(handles.editEp15,'Visible','on')
    set(handles.editCIp15,'Visible','on')
    set(handles.checkboxs15,'Visible','on')
end

% --- Executes on button press in radiobuttonPeripheral.
function radiobuttonPeripheral_Callback(hObject, eventdata, handles)
% hObject    handle to radiobuttonPeripheral (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobuttonPeripheral
if handles.radiobuttonPeripheral.Value==1 
set(handles.textp10,'String','Steady state constant - Kss [mass/volume] :','horizontalalignment','left')
    set(handles.textp10,'Visible','on')
    set(handles.edit10,'Visible','on')
    set(handles.checkbox10,'Visible','on')
    set(handles.editlbub10,'Visible','on')
    set(handles.editEp10,'Visible','on')
    set(handles.editCIp10,'Visible','on')
    set(handles.checkboxs10,'Visible','on')
    set(handles.textp11,'String','Target biosynthesis rate - ksyn [mass/volume/time] :','horizontalalignment','left')
    set(handles.textp11,'Visible','on')
    set(handles.edit11,'Visible','on')
    set(handles.checkbox11,'Visible','on')
    set(handles.editlbub11,'Visible','on')
    set(handles.editEp11,'Visible','on')
    set(handles.editCIp11,'Visible','on')
    set(handles.checkboxs11,'Visible','on')
    set(handles.textp14,'String','Free target degradation rate - kdeg [1/time] :','horizontalalignment','left')
    set(handles.textp14,'Visible','on')
    set(handles.edit14,'Visible','on')
    set(handles.checkbox14,'Visible','on')
    set(handles.editlbub14,'Visible','on')
    set(handles.editEp14,'Visible','on')
    set(handles.editCIp14,'Visible','on')
    set(handles.checkboxs14,'Visible','on')
    set(handles.textp15,'String','Complex internalization rate - kint [1/time] :','horizontalalignment','left')
    set(handles.textp15,'Visible','on')
    set(handles.edit15,'Visible','on')
    set(handles.checkbox15,'Visible','on')
    set(handles.editlbub15,'Visible','on')
    set(handles.editEp15,'Visible','on')
    set(handles.editCIp15,'Visible','on')
    set(handles.checkboxs15,'Visible','on')
end


% --- Executes on button press in radiobuttonEV.
function radiobuttonEV_Callback(hObject, eventdata, handles)
% hObject    handle to radiobuttonEV (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobuttonEV
if handles.radiobuttonEV.Value==1
    set(handles.editINFtime,'Visible','off')
    set(handles.textINFtime,'Visible','off')
end
