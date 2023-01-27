CREATE TABLE "web-market".products
(
	id serial NOT NULL, 
	producer_id integer NOT NULL,
	category_id integer NOT NULL,
	group_id integer NOT NULL,
	vendor_code varchar(50) NOT NULL,
	name varchar(250) NOT NULL, 
	shortname varchar(50) NOT NULL, 
	description varchar(2500),
	insert_date date NOT NULL,
	update_date date NOT NULL,
	active boolean NOT NULL DEFAULT false,
	CONSTRAINT products_id_pk PRIMARY KEY (id),
	CONSTRAINT products_vc_unq UNIQUE (vendor_code)		
);					  
					   
COMMENT ON TABLE "web-market".products
    IS 'Справочник товаров';

COMMENT ON COLUMN "web-market".products.id
    IS 'Уникальный идентификатор товара';

COMMENT ON COLUMN "web-market".products.producer_id
    IS 'Идентификатор производителя';

COMMENT ON COLUMN "web-market".products.category_id
    IS 'Идентификатор категории принадлежности товара';

COMMENT ON COLUMN "web-market".products.group_id
    IS 'Идентификатор группы товаров';

COMMENT ON COLUMN "web-market".products.vendor_code
    IS 'Артикул товара';

COMMENT ON COLUMN "web-market".products.name
    IS 'Наименование товара';

COMMENT ON COLUMN "web-market".products.shortname
    IS 'Краткое наименование товара';

COMMENT ON COLUMN "web-market".products.description
    IS 'Описание товара';

COMMENT ON COLUMN "web-market".products.insert_date
    IS 'Дата вставки записи';

COMMENT ON COLUMN "web-market".products.update_date
    IS 'Дата обновления записи';

COMMENT ON COLUMN "web-market".products.active
    IS 'Признак доступности товара к использованию';
	
COMMENT ON CONSTRAINT products_id_pk ON "web-market".products
    IS 'Контроль за реквизитом "Идентификатор товара"';

COMMENT ON CONSTRAINT products_vc_unq ON "web-market".products
    IS 'Контроль за реквизитом "Артикул товара"';

CREATE UNIQUE INDEX PRODUCT_VC_UNQ ON "web-market".PRODUCTS (VENDOR_CODE);

COMMENT ON INDEX "web-market".product_vc_unq
    IS 'Обеспечивает уникальность по реквизиту "Артикул товара"';
	
ALTER TABLE IF EXISTS "web-market".products
    ADD CONSTRAINT products_producer_id_fk FOREIGN KEY (producer_id)
    REFERENCES "web-market".producers (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;

COMMENT ON CONSTRAINT products_producer_id_fk ON "web-market".products
    IS 'Ссылка на справочник производителей';
	
ALTER TABLE IF EXISTS "web-market".products
    ADD CONSTRAINT products_group_id_fk FOREIGN KEY (group_id)
    REFERENCES "web-market".groups (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;

COMMENT ON CONSTRAINT products_group_id_fk ON "web-market".products
    IS 'Ссылка на группу товаров';
	
ALTER TABLE IF EXISTS "web-market".products
    ADD CONSTRAINT products_category_id_fk FOREIGN KEY (category_id)
    REFERENCES "web-market".categories (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;

COMMENT ON CONSTRAINT products_category_id_fk ON "web-market".products
    IS 'Ссылка на идентификатор категории товара';