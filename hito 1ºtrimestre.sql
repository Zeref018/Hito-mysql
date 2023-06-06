create table barrios
(
barrio_id int auto_increment,
barrio_tramo_fk int not null,
barrio_nombre varchar(100) not null,
constraint barrios_pk
primary key (barrio_id)
);
create table tramos
(
tramo_id int not null,
tramo_calle_fk int not null,
tramo_latitud decimal not null,
tramo_longitud decimal not null,
constraint tramos_pk

primary key (tramo_id)
);
alter table barrios
add constraint barrios_tramos_null_fk
foreign key (barrio_tramo_fk) references tramos (tramo_id);

create table calles
(
calle_id int auto_increment,
calle_nombre varchar(100) not null,
constraint calles_pk
primary key (calle_id)
);
alter table tramos
add constraint tramos_calles_null_fk
foreign key (tramo_calle_fk) references calles (calle_id);
alter table tramos
modify tramo_id int auto_increment;
alter table tramos
auto_increment = 1;
create table itinerarios
(
tr_id int auto_increment,
tr_tramo_fk int not null,
tr_nombre varchar(100) not null,
constraint itinerarios_pk
primary key (tr_id)
);
create table autobuses
(
autobus_id int auto_increment,
autobus_tr_fk int not null,
constraint autobuses_pk
primary key (autobus_id)
);
alter table itinerarios
add constraint itinerarios_tramos_null_fk
foreign key (tr_tramo_fk) references tramos (tramo_id);

alter table autobuses
add constraint autobuses_itinerarios_null_fk
foreign key (autobus_tr_fk) references itinerarios (tr_id);

create table puntos_interes
(
puntos_interes_id int auto_increment,
puntos_interes_tramo_fk int not null,
puntos_interes_nombre varchar(100) not null,
constraint puntos_interes_pk
primary key (puntos_interes_id)
);
alter table puntos_interes
add constraint puntos_interes_tramos_null_fk
foreign key (puntos_interes_tramo_fk) references tramos (tramo_id);
create table estaciones
(
estacion_id int auto_increment,
estacion_nombre varchar(100) not null,
estacion_tramo_fk int not null,
constraint estaciones_pk
primary key (estacion_id)
);

alter table estaciones
add constraint estaciones_tramos_null_fk
foreign key (estacion_tramo_fk) references tramos (tramo_id);

create table estaciones_linea
(
estacion_linea_estacion_fk int not null,
estacion_linea_linea_fk int not null,
constraint estaciones_linea_pk
primary key (estacion_linea_estacion_fk, estacion_linea_linea_fk),
constraint estaciones_linea_estaciones_null_fk
foreign key (estacion_linea_estacion_fk) references estaciones (estacion_id)
);

create table lineas_metro
(
linea_id int auto_increment,
linea_color int not null,
linea_estacion_fk int not null,
constraint lineas_metro_pk
primary key (linea_id),
constraint lineas_metro_estaciones_null_fk
foreign key (linea_estacion_fk) references estaciones (estacion_id)
);

alter table estaciones_linea
add constraint estaciones_linea_lineas_metro_null_fk
foreign key (estacion_linea_linea_fk) references lineas_metro (linea_id);

INSERT INTO hit1o.calles (calle_nombre) VALUES ('Fito')
INSERT INTO hit1o.calles (calle_nombre) VALUES ('Carmelo')
INSERT INTO hit1o.calles (calle_nombre) VALUES ('Amelia')
INSERT INTO hit1o.calles (calle_nombre) VALUES ('Alex')
INSERT INTO hit1o.tramos (tramo_calle_fk, tramo_latitud, tramo_longitud) VALUES (1, 4, 4)
INSERT INTO hit1o.tramos (tramo_calle_fk, tramo_latitud, tramo_longitud) VALUES (2, 4, 4)
INSERT INTO hit1o.tramos (tramo_calle_fk, tramo_latitud, tramo_longitud) VALUES (3, 4, 4)
INSERT INTO hit1o.tramos (tramo_calle_fk, tramo_latitud, tramo_longitud) VALUES (4, 4, 4)

INSERT INTO hit1o.barrios (barrio_tramo_fk, barrio_nombre) VALUES (3, 'Getafe')
INSERT INTO hit1o.barrios (barrio_tramo_fk, barrio_nombre) VALUES (4, 'Vidreres')
INSERT INTO hit1o.barrios (barrio_tramo_fk, barrio_nombre) VALUES (5, 'Parla')

INSERT INTO hit1o.barrios (barrio_tramo_fk, barrio_nombre) VALUES (6, 'Villaverde')

alter table itinerarios
change tr_id itinierario_id int auto_increment;
alter table itinerarios
change tr_tramo_fk itinerario_tramo_fk int not null;
alter table itinerarios
change tr_nombre itinerario_nombre varchar(100) not null;

INSERT INTO hit1o.itinerarios (itinerario_tramo_fk, itinerario_nombre) VALUES (3,
'getafe-italia')
INSERT INTO hit1o.itinerarios (itinerario_tramo_fk, itinerario_nombre) VALUES (4,
'italia-londres')
INSERT INTO hit1o.itinerarios (itinerario_tramo_fk, itinerario_nombre) VALUES (5,
'vidreres-paris')
INSERT INTO hit1o.itinerarios (itinerario_tramo_fk, itinerario_nombre) VALUES (6,
'vidreres-getafe')

INSERT INTO hit1o.puntos_interes (puntos_interes_tramo_fk, puntos_interes_nombre)
VALUES (3, 'museo del prado')
INSERT INTO hit1o.puntos_interes (puntos_interes_tramo_fk, puntos_interes_nombre)
VALUES (4, 'museo del jamon')
INSERT INTO hit1o.puntos_interes (puntos_interes_tramo_fk, puntos_interes_nombre)
VALUES (5, 'el retiro')
INSERT INTO hit1o.puntos_interes (puntos_interes_tramo_fk, puntos_interes_nombre)
VALUES (6, 'museo reina sofia')

INSERT INTO hit1o.estaciones (estacion_nombre, estacion_tramo_fk) VALUES ('getafe
centro', 3)
INSERT INTO hit1o.estaciones (estacion_nombre, estacion_tramo_fk) VALUES ('el casar',
4)

INSERT INTO hit1o.estaciones (estacion_nombre, estacion_tramo_fk) VALUES ('parla', 5)
INSERT INTO hit1o.estaciones (estacion_nombre, estacion_tramo_fk) VALUES ('atocha', 6)
INSERT INTO hit1o.autobuses (autobus_tr_fk) VALUES (1)
INSERT INTO hit1o.autobuses (autobus_tr_fk) VALUES (2)
INSERT INTO hit1o.autobuses (autobus_tr_fk) VALUES (3)
INSERT INTO hit1o.autobuses (autobus_tr_fk) VALUES (4)
alter table lineas_metro
modify linea_estacion_fk int not null after linea_id;
alter table lineas_metro
modify linea_color varchar(100) not null;
INSERT INTO hit1o.lineas_metro (linea_estacion_fk, linea_color) VALUES (1, 'blanco')
INSERT INTO hit1o.lineas_metro (linea_estacion_fk, linea_color) VALUES (2, 'escarlata')
INSERT INTO hit1o.lineas_metro (linea_estacion_fk, linea_color) VALUES (3, 'negro')
INSERT INTO hit1o.lineas_metro (linea_estacion_fk, linea_color) VALUES (4, 'violeta')
INSERT INTO hit1o.estaciones_linea (estacion_linea_estacion_fk, estacion_linea_linea_fk)
VALUES (1, 1)
INSERT INTO hit1o.estaciones_linea (estacion_linea_estacion_fk, estacion_linea_linea_fk)
VALUES (2, 2)
INSERT INTO hit1o.estaciones_linea (estacion_linea_estacion_fk, estacion_linea_linea_fk)
VALUES (3, 3)
INSERT INTO hit1o.estaciones_linea (estacion_linea_estacion_fk, estacion_linea_linea_fk)
VALUES (4, 4)

SELECT calle_nombre,
itinerario_nombre
FROM calles
LEFT JOIN tramos on calles.calle_id = tramos.tramo_calle_fk
LEFT JOIN itinerarios on tramos.tramo_id = itinerarios.itinerario_tramo_fk