CREATE TABLE "web-market".producers
(
    id serial NOT NULL,
	inn character(12) NOT NULL,
    name character varying(250) NOT NULL,
    shortname character varying(50) NOT NULL,
	brandname character varying(200) NOT NULL,
    registration_date date NOT NULL DEFAULT CURRENT_DATE,   
    description character varying(2500),
    rating smallint NOT NULL DEFAULT 0,   
	active boolean NOT NULL DEFAULT false,
    CONSTRAINT producer_id_pk PRIMARY KEY (id),
    CONSTRAINT producers_inn_unq UNIQUE (inn),
    CONSTRAINT producer_rating_chk CHECK (rating between 0 and 10) NOT VALID
);

COMMENT ON TABLE "web-market".producers
    IS 'Справочник производителей';

COMMENT ON COLUMN "web-market".producers.id
    IS 'Идентификатор производителя';

COMMENT ON COLUMN "web-market".producers.name
    IS 'Наименование производителя';

COMMENT ON COLUMN "web-market".producers.shortname
    IS 'Краткое наименование производителя';

COMMENT ON COLUMN "web-market".producers.registration_date
    IS 'Дата регистрации';

COMMENT ON COLUMN "web-market".producers.active
    IS 'Признак активности производителя';

COMMENT ON COLUMN "web-market".producers.description
    IS 'Описание производителя';

COMMENT ON COLUMN "web-market".producers.rating
    IS 'Оценка производителя (Шкала от 0 до 10)';

COMMENT ON COLUMN "web-market".producers.inn
    IS 'ИНН организации, физ.лица, иностранного предприятия (ITIN)';
	
COMMENT ON COLUMN "web-market".producers.brandname
    IS 'Наименование бренда производителя';
	
COMMENT ON CONSTRAINT producer_id_pk ON "web-market".producers
    IS 'Контроль за реквизитом "Идентификатор производителя"';

COMMENT ON CONSTRAINT producers_inn_unq ON "web-market".producers
    IS 'Обеспечивает уникальность ИНН производителя';

COMMENT ON CONSTRAINT producer_rating_chk ON "web-market".producers
    IS 'Проверка, что оценка производителя от 0 до 10';