%           Modulaci?n de datos digitales con se?al anal?gica
% Nombre: Carlos Aguirre
% Asignatura: Sistemas de comunicaci?n

secuencia=[1 0 1 1 0 0 1]; %Ingreso de la secuancia de bits a modular

wask=50; %w=s*pi*f

t=0:2*pi/(wask-1):2*pi; %se forman un vector del tiempo de la se?al modulada ask

bit=[]; %Array para la grafica de los datos digitales

%************Asignaci?n de valores para gr?fica de datos (bits) *********

for n=1:length(secuencia); 

    if secuencia(n)==0; %Si el bit es 0

        gfSecuencia=zeros(1,wask); % gfSecuencia= array de 0's, desde 1 hasta el valor de la frecuencia de la se?al

    else secuencia(n)==1; %Si el bit es 1

        gfSecuencia=ones(1,wask); % gfSecuencia= array de 1's, desde 1 hasta el valor de la frecuencia de la se?al

    end

   bit=[bit  gfSecuencia]; % bit= array de la amplitud para la representaci?n de los bits
    
end


as=[]; 
sen_=[]; 

%************Asignaci?n de valores para gr?fica de se?alen ask *********

for n=1:length(secuencia); 

    if secuencia(n)==0; %Si el bit de la secuencia es 0

        a=zeros(1,wask); % A = array de 0's, desde 1 hasta el valor de la frecuencia de la se?al

    else secuencia(n)==1; %Si el bit de la secuencia es 1

        a=ones(1,wask);  % A = array de 1's, desde 1 hasta el valor de la frecuencia de la se?al

    end

    wt=sin(wask*t); %wt= array de las componentes sen(wt) de la se?al

    as=[as a]; %as= array de las amplitudes modulada

    sen_=[sen_ wt]; %sen_ = array total de componentes sen(wt) de la se?al

    
end

ask=as.*sen_; %ask= array de los puntos de la se?al a*sen(wt) en ask

a=zeros;
sen_=zeros;
as=zeros;


%frecuencias para se?al en fsk
ffsk1=50;
ffsk2=60;

%************Asignaci?n de valores para gr?fica de se?alen fsk *********

for n=1:length(datos);

    if secuencia(n)==0; %Si el bit de la secuencia es 0

        wt=sin(ffsk1*t); % wt = array de compponentes sen(wt) con ffsk1

    else datos(n)==1; %Si el bit de la secuencia es 0

        wt=sin(ffsk2*t); % wt = array de compponentes sen(wt) con ffsk2 (diferente de ffsk1)

    end
    
    a=ones(1,wask); % a = array de amplitudes de se?al en fsk

    sen_=[sen_ wt]; % sen_ = array de componentes wt de la se?al en fsk

    as=[as a]; % as = array de amplitudes totales de se?al en fsk
    
end

fsk=as.*sen_; % fsk = array de los puntos de la se?al a*sen(wt) en fsk



% **************************+Gr?ficas******************************


% ********************Gr?ficas datos digitales*********************
subplot(3,1,1);

plot(bit,'LineWidth',1.5); %datos digitales en la forma (bit(n), n)

grid on;

title('Datos Digitales (bits)');

axis([0 wask*length(secuencia) -2 2]);


% ********************Gr?ficas se?al en ask***********************
subplot(3,1,2);

plot(ask,'LineWidth',1.5); %se?al modulada en la forma (ask(n), n)

grid on;

title('modulacion ASK'); 

axis([0 wask*length(secuencia) -2 2]);


% ********************Gr?ficas se?al en fsk***********************
subplot(3,1,3);

plot(fsk,'LineWidth',1.5); %se?al modulada en la forma (fsk(n), n)

grid on;

title('modulacion FSK');

axis([0 wask*length(datos) -2 2]);

