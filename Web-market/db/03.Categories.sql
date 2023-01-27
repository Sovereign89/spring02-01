CREATE TABLE "web-market".categories
(
    id serial NOT NULL,
	parent_id integer,
    group_id integer NOT NULL,
    name character varying(250),   
    icon bytea,
	active boolean NOT NULL DEFAULT false,
    CONSTRAINT category_id_pk PRIMARY KEY (id),
    CONSTRAINT category_name_unq UNIQUE (name),
    CONSTRAINT category_group_id_fk FOREIGN KEY (group_id)
        REFERENCES "web-market".groups (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID,
    CONSTRAINT category_parent_id_fk FOREIGN KEY (parent_id)
        REFERENCES "web-market".categories (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
);

COMMENT ON TABLE "web-market".categories
    IS 'Категории товаров';

COMMENT ON COLUMN "web-market".categories.id
    IS 'Идентификатор категории товаров';

COMMENT ON COLUMN "web-market".categories.group_id
    IS 'Идентификатор группы категории';

COMMENT ON COLUMN "web-market".categories.name
    IS 'Наименовании категории';

COMMENT ON COLUMN "web-market".categories.parent_id
    IS 'Родительская категория (для подкатегорий)';

COMMENT ON COLUMN "web-market".categories.active
    IS 'Признак активности';

COMMENT ON COLUMN "web-market".categories.icon
    IS 'Иконка категории';
	
COMMENT ON CONSTRAINT category_id_pk ON "web-market".categories
    IS 'Первичный ключ по идентификатору категории';

COMMENT ON CONSTRAINT category_name_unq ON "web-market".categories
    IS 'Уникальный ключ по категории товара';

COMMENT ON CONSTRAINT category_group_id_fk ON "web-market".categories
    IS 'Ссылка на идентификатор группы категории';
	
COMMENT ON CONSTRAINT category_parent_id_fk ON "web-market".categories
    IS 'Уникальность родственной связи между подкатегорией и категорией';