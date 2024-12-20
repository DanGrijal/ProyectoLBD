PROYECTO - CREACIÓN DE USUARIOS
--CREACIÓN DE USUARIOS DE ESQUEMAS

create user tablas_peaje identified by tablas_peaje
default tablespace users 
temporary tablespace temp
quota unlimited on users;

grant create session, create table to tablas_peaje;

create user tablas_quickpass identified by tablas_quickpass
default tablespace users 
temporary tablespace temp
quota unlimited on users;

grant create session, create table, create sequence to tablas_quickpass;

create user tablas_banco identified by tablas_banco
default tablespace users 
temporary tablespace temp
quota unlimited on users;

grant create session, create table to tablas_banco;

--CREACIÓN TABLAS PROVINCIA, CIUDAD & PEAJE CON TABLAS_PEAJE

create table provincia(
    idProvincia number(2) CONSTRAINT pk_provincia primary key,
    nombreProvincia varchar2(50)
);

create table ciudad(
    idCiudad number(3) CONSTRAINT pk_ciudad primary key,
    nombreCiudad varchar2(50),
    idProvincia CONSTRAINT fk1_canton references provincia
);

create table peaje(
    idPeaje number(3) CONSTRAINT pk_peaje primary key,
    rutaPeaje varchar2(45),
    concesionaria varchar(50),
    idCiudad CONSTRAINT fk1_peaje references ciudad
);

create table antena(
    idAntena number(5) CONSTRAINT pk_antena primary key,
    idPeaje CONSTRAINT fk1_antena references peaje
);

grant references on antena to tablas_quickpass;
grant select on antena to tablas_quickpass;


--CREAR TABLA TIPOVEHICULO DESDE TABLAS_QUICKPASS

create table tipoVehiculo(
    idTipoVehiculo number(2) constraint pk_tipoVehiculo primary key,
    descripcion varchar2(50)
);

grant references on tipoVehiculo to tablas_peaje;
grant select on tipoVehiculo to tablas_peaje;



--CREAR TABLAS COSTOPEAJE CON TABLAS_PEAJE

create table costoPeaje(
    idCostoPeaje number(3) CONSTRAINT pk_costoPeaje primary key,
    monto number(8,2),
    fecha date,
    idPeaje CONSTRAINT fk1_costoPeaje references peaje,
    idTipoVehiculo CONSTRAINT fk2_costoPeaje references tablas_quickpass.tipoVehiculo
);


--CREAR TABLAS CLIENTE CON TABLAS_BANCO

create table cliente(
    idCliente number(10) constraint pk_cliente primary key,
    nombreBanco varchar2(45),
    cedulaJuridica varchar2(45)
);

grant references on cliente to tablas_quickpass;
grant select on cliente to tablas_quickpass;




--CREAR TABLA QUICKPASS CON TABLAS_QUICKPASS

create table quickPass(
    idQuickPass number(10) constraint pk_quickPass primary key,
    idCliente CONSTRAINT fk1_quickPass references tablas_banco.cliente,
    idTipoVehiculo CONSTRAINT fk2_quickPass references tipoVehiculo,
    activo number(1)
);

grant references on quickPass to tablas_banco;
grant select on quickPass to tablas_banco;

--SE CREA SECUENCIA PARA 
create sequence tablas_quickpass.seq_transaccion
start with 1
increment by 1
nocache
nocycle;

create table transaccion(
    idTransaccion number(10) constraint pk_transaccion primary key,
    monto number(8,2),
    fecha date,
    idQuickPass CONSTRAINT fk1_transaccion references quickPass,
    idAntena CONSTRAINT fk2_transaccion references tablas_peaje.antena
);


--CREAR TABLAS CUENTA & USUARIO CON TABLAS_BANCO


create table usuario(
    idUsuario number(10) constraint pk_usuario primary key,
    nombre varchar2(50),
    username varchar2(50),
    password varchar2(50)
);

create table cuenta(
    idCuenta number(10) constraint pk_cuenta primary key,
    saldo number(10,2),
    idUsuario constraint fk1_cuenta references usuario
);


create table cuentasPorQuickPass (
    idQuickPass NUMBER constraint fk1_cuentasPorQuickPass references tablas_quickpass.quickPass(idQuickPass),
    idCuenta NUMBER constraint fk2_cuentasPorQuickPass references cuenta(idCuenta),
    constraint pk_cuentasPorQuickPass primary key (idQuickPass, idCuenta)
);

--CREACION DE USUARIO DESARROLLADOR

create user desa01 identified by desa01
temporary tablespace temp;

create role roldesa;

grant create session, create procedure, create role, create sequence, create trigger, create view to roldesa;

grant roldesa to desa01;


--PERMISOS SOBRE TABLAS TABLAS_PEAJE

GRANT SELECT, INSERT, UPDATE, DELETE ON tablas_peaje.provincia TO desa01;
GRANT SELECT, INSERT, UPDATE, DELETE ON tablas_peaje.ciudad TO desa01;
GRANT SELECT, INSERT, UPDATE, DELETE ON tablas_peaje.peaje TO desa01;
GRANT SELECT, INSERT, UPDATE, DELETE ON tablas_peaje.antena TO desa01;
GRANT SELECT, INSERT, UPDATE, DELETE ON tablas_peaje.costoPeaje TO desa01;
GRANT REFERENCES ON tablas_peaje.provincia TO desa01;
GRANT REFERENCES ON tablas_peaje.ciudad TO desa01;
GRANT REFERENCES ON tablas_peaje.peaje TO desa01;


--PERMISOS SOBRE TABLAS TABLAS_QUICKPASS

GRANT SELECT, INSERT, UPDATE, DELETE ON tablas_quickpass.tipoVehiculo TO desa01;
GRANT SELECT, INSERT, UPDATE, DELETE ON tablas_quickpass.quickPass TO desa01;
GRANT SELECT, INSERT, UPDATE, DELETE ON tablas_quickpass.transaccion TO desa01;
GRANT SELECT ON TABLAS_QUICKPASS.SEQ_TRANSACCION TO DESA01;
GRANT REFERENCES ON tablas_quickpass.quickPass TO desa01;



--PERMISOS SOBRE TABLAS TABLAS_BANCO

GRANT SELECT, INSERT, UPDATE, DELETE ON tablas_banco.cliente TO desa01;
GRANT SELECT, INSERT, UPDATE, DELETE ON tablas_banco.usuario TO desa01;
GRANT SELECT, INSERT, UPDATE, DELETE ON tablas_banco.cuenta TO desa01;
GRANT SELECT, INSERT, UPDATE, DELETE ON tablas_banco.cuentasPorQuickPass TO desa01;
GRANT REFERENCES ON tablas_banco.cuenta TO desa01;

