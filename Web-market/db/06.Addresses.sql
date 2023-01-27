CREATE TABLE "web-market".addresses
(
    id serial NOT NULL,
    fias_id character varying(50) NOT NULL,
    address character varying(2500) NOT NULL,
	kladr_id character varying(50),
	country character varying(150),
    postal_code character varying(25),
    city character varying(150),   
    street character varying(150),
    region character varying(200),
    building character varying(10),
    block character varying(10),
    okato character varying(9),
    oktmo character varying(11),    
    CONSTRAINT addresses_id_pk PRIMARY KEY (id),
    CONSTRAINT addresses_fias_id_unq UNIQUE (fias_id)
);

COMMENT ON TABLE "web-market".addresses
    IS 'Справочник адресов (по ФИАС)';

COMMENT ON COLUMN "web-market".addresses.id
    IS 'Идентификатор адреса';

COMMENT ON COLUMN "web-market".addresses.fias_id
    IS 'Код ФИАС:';

COMMENT ON COLUMN "web-market".addresses.address
    IS 'Адрес одной строкой (полный, с индексом)';

COMMENT ON COLUMN "web-market".addresses.postal_code
    IS '	Индекс';

COMMENT ON COLUMN "web-market".addresses.city
    IS 'Город';

COMMENT ON COLUMN "web-market".addresses.country
    IS 'Страна';

COMMENT ON COLUMN "web-market".addresses.street
    IS 'Улица';

COMMENT ON COLUMN "web-market".addresses.region
    IS 'Регион';

COMMENT ON COLUMN "web-market".addresses.building
    IS 'Здание';

COMMENT ON COLUMN "web-market".addresses.block
    IS 'Корпус';

COMMENT ON COLUMN "web-market".addresses.okato
    IS 'Код ОКАТО';

COMMENT ON COLUMN "web-market".addresses.oktmo
    IS 'Код ОКТМО';

COMMENT ON COLUMN "web-market".addresses.kladr_id
    IS 'Код КЛАДР';
	
COMMENT ON CONSTRAINT addresses_id_pk ON "web-market".addresses
    IS 'Первичный ключ по идентификатору адреса';

COMMENT ON CONSTRAINT addresses_fias_id_unq ON "web-market".addresses
    IS 'Уникальный ключ по коду ФИАС';