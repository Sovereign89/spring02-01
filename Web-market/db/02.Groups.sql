CREATE TABLE "web-market".groups
(
    id serial NOT NULL,
    name character varying(250) NOT NULL,    
    description character varying(2000),
	icon bytea,
	active boolean NOT NULL DEFAULT false,
    CONSTRAINT groups_id_pk PRIMARY KEY (id),
    CONSTRAINT groups_name_unq UNIQUE (name)
);

COMMENT ON TABLE "web-market".groups
    IS 'Таблиц групп товаров';

COMMENT ON COLUMN "web-market".groups.id
    IS 'Идентификатор группы товаров';

COMMENT ON COLUMN "web-market".groups.name
    IS 'Наименование группы товаров';

COMMENT ON COLUMN "web-market".groups.active
    IS 'Признак активности группы товаров';

COMMENT ON COLUMN "web-market".groups.description
    IS 'Описание группы товаров';
	
COMMENT ON COLUMN "web-market".groups.icon
    IS 'Иконка группы товаров';
	
COMMENT ON CONSTRAINT groups_id_pk ON "web-market".groups
    IS 'Контроль реквизита "Идентификатор группы товаров"';

COMMENT ON CONSTRAINT groups_name_unq ON "web-market".groups
    IS 'Обеспечивает уникальность наименованию группы товаров';