CREATE TABLE "web-market".stores
(
    id serial NOT NULL,
    name character varying(250) NOT NULL,
    active boolean NOT NULL DEFAULT false,
    CONSTRAINT stores_id_pk PRIMARY KEY (id),
    CONSTRAINT stores_name_unq UNIQUE (name)
);

COMMENT ON TABLE "web-market".stores
    IS 'Склады';

COMMENT ON COLUMN "web-market".stores.id
    IS 'Идентификатор склада';

COMMENT ON COLUMN "web-market".stores.name
    IS 'Наименование склада';

COMMENT ON COLUMN "web-market".stores.active
    IS 'Признак активности';
	
COMMENT ON CONSTRAINT stores_id_pk ON "web-market".stores
    IS 'Первичный ключ по идентификатору склада';

COMMENT ON CONSTRAINT stores_name_unq ON "web-market".stores
    IS 'Уникальность по наименованию склада';