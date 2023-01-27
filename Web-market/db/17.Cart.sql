CREATE TABLE "web-market".cart
(
    id bigserial NOT NULL,
    registered_user_id integer NOT NULL,
    product_id integer NOT NULL,
    store_id integer NOT NULL,
    item character varying(128) NOT NULL,
    quantity numeric NOT NULL DEFAULT 0,
    quantity_type_id integer NOT NULL,
    CONSTRAINT cart_id_pk PRIMARY KEY (id),
    CONSTRAINT cart_item_unq UNIQUE (item),
    CONSTRAINT cart_reguser_id_fk FOREIGN KEY (registered_user_id)
        REFERENCES "web-market".registered_users (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID,
    CONSTRAINT cart_product_id_fk FOREIGN KEY (product_id)
        REFERENCES "web-market".products (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID,
    CONSTRAINT cart_store_id_fk FOREIGN KEY (store_id)
        REFERENCES "web-market".stores (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID,
    CONSTRAINT cart_qntytype_id_fk FOREIGN KEY (quantity_type_id)
        REFERENCES "web-market".quantity_types (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
);

COMMENT ON TABLE "web-market".cart
    IS 'Корзина товаров';

COMMENT ON COLUMN "web-market".cart.id
    IS 'Идентификатор товара в корзине';

COMMENT ON COLUMN "web-market".cart.registered_user_id
    IS 'Зарегистрированный пользователь';

COMMENT ON COLUMN "web-market".cart.product_id
    IS 'Идентификатор товара';

COMMENT ON COLUMN "web-market".cart.store_id
    IS 'Идентификатор склада';

COMMENT ON COLUMN "web-market".cart.item
    IS 'Позиция на складе';

COMMENT ON COLUMN "web-market".cart.quantity
    IS 'Количество';

COMMENT ON COLUMN "web-market".cart.quantity_type_id
    IS 'Тип подсчёта количества';
	
COMMENT ON CONSTRAINT cart_id_pk ON "web-market".cart
    IS 'Первичный ключ позиции в корзине';

COMMENT ON CONSTRAINT cart_item_unq ON "web-market".cart
    IS 'Уникальный ключ по позиции товара на складе в таблице Store_products';

COMMENT ON CONSTRAINT cart_reguser_id_fk ON "web-market".cart
    IS 'Ссылка на зарегистрированного пользователя в таблице Registered_users';
	
COMMENT ON CONSTRAINT cart_product_id_fk ON "web-market".cart
    IS 'Ссылка на товар в таблице Products';
	
COMMENT ON CONSTRAINT cart_store_id_fk ON "web-market".cart
    IS 'Ссылка на склад в таблице Stores';
	
COMMENT ON CONSTRAINT cart_qntytype_id_fk ON "web-market".cart
    IS 'Ссылка на тип подсчёта количества в таблице quantity_types';