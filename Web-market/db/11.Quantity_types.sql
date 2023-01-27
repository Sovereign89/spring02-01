CREATE TABLE "web-market".quantity_types
(
    id serial NOT NULL,
    name character varying(100) NOT NULL,
    shortname character varying(5) NOT NULL,
    description character varying(2000),
    active boolean NOT NULL DEFAULT false,
    CONSTRAINT quantity_type_id_pk PRIMARY KEY (id),
    CONSTRAINT quantity_type_name_unq UNIQUE (name)
        INCLUDE(shortname)
);

COMMENT ON TABLE "web-market".quantity_types
    IS 'Типы подсчёта количества (для продукции)';

COMMENT ON COLUMN "web-market".quantity_types.id
    IS 'Идентификатор типа';

COMMENT ON COLUMN "web-market".quantity_types.name
    IS 'Наименование типа';

COMMENT ON COLUMN "web-market".quantity_types.shortname
    IS 'Короткий вид записи типа';

COMMENT ON COLUMN "web-market".quantity_types.description
    IS 'Описание вида';

COMMENT ON COLUMN "web-market".quantity_types.active
    IS 'Признак активности';
	
COMMENT ON CONSTRAINT quantity_type_id_pk ON "web-market".quantity_types
    IS 'Первичный ключ типа подсчёта продукции';

COMMENT ON CONSTRAINT quantity_type_name_unq ON "web-market".quantity_types
    IS 'Уникальный ключ по наименованию типа подсчёта продукции';