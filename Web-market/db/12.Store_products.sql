CREATE TABLE "web-market".store_products
(
    item uuid NOT NULL DEFAULT uuid_generate_v4 (),
    product_id bigint NOT NULL,
    store_id bigint NOT NULL,
    price money NOT NULL DEFAULT 0.00,
    price_type character(4) NOT NULL DEFAULT 'руб.',
    quantity numeric(10, 2) NOT NULL DEFAULT 0,
    quantity_type_id integer NOT NULL,
    discount smallint NOT NULL DEFAULT 0,
    CONSTRAINT store_products_pk PRIMARY KEY (product_id)
        INCLUDE(store_id),
    CONSTRAINT store_product_pid_fk FOREIGN KEY (product_id)
        REFERENCES "web-market".products (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID,
    CONSTRAINT store_product_sid_fk FOREIGN KEY (store_id)
        REFERENCES "web-market".stores (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID,
    CONSTRAINT store_product_qnty_fk FOREIGN KEY (quantity_type_id)
        REFERENCES "web-market".quantity_types (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
	CONSTRAINT store_product_discount_chk CHECK (discount >= 0 AND discount <= 100) 
	    NOT VALID
);

COMMENT ON TABLE "web-market".store_products
    IS 'Таблица продуктов в рамках складов';
	
COMMENT ON COLUMN "web-market".store_products.item
    IS 'Уникальная позиция на складе';

COMMENT ON COLUMN "web-market".store_products.product_id
    IS 'Идентификатор продукции';

COMMENT ON COLUMN "web-market".store_products.store_id
    IS 'Идентификатор склада';

COMMENT ON COLUMN "web-market".store_products.price
    IS 'Цена';

COMMENT ON COLUMN "web-market".store_products.price_type
    IS 'Иденификатор типы цены';

COMMENT ON COLUMN "web-market".store_products.quantity
    IS 'Количество';

COMMENT ON COLUMN "web-market".store_products.quantity_type_id
    IS 'Тип подсчёта количества';

COMMENT ON COLUMN "web-market".store_products.discount
    IS 'Скидка в процентах (от 0 до 100)';
	
COMMENT ON CONSTRAINT store_products_pk ON "web-market".store_products
    IS 'Первичный ключ продукции на складе';

COMMENT ON CONSTRAINT store_product_pid_fk ON "web-market".store_products
    IS 'Ссылка на идентификатор продукта из таблицы Products';
	
COMMENT ON CONSTRAINT store_product_sid_fk ON "web-market".store_products
    IS 'Ссылка на идентификатор склада из таблицы Stores';
	
COMMENT ON CONSTRAINT store_product_qnty_fk ON "web-market".store_products
    IS 'Ссылка на идентификатор типа подсчёта количества товара';
	
COMMENT ON CONSTRAINT store_products_discount_chk ON "web-market".store_products
    IS 'Проверка скидки';