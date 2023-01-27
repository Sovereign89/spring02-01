CREATE TABLE "web-market".address_types
(
    id serial NOT NULL,
    name character varying(100) NOT NULL,
    CONSTRAINT adr_type_id_pk PRIMARY KEY (id)
);

ALTER TABLE IF EXISTS "web-market".address_types
    OWNER to postgres;

COMMENT ON TABLE "web-market".address_types
    IS 'Справочник типов адресов';

COMMENT ON COLUMN "web-market".address_types.id
    IS 'Идентификатор типа адреса';

COMMENT ON COLUMN "web-market".address_types.name
    IS 'Наименование типа адреса';
	
COMMENT ON CONSTRAINT adr_type_id_pk ON "web-market".address_types
    IS 'Первичный ключ идентификатор типа адреса';