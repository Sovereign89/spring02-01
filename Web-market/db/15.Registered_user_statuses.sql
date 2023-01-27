CREATE TABLE "web-market".registered_user_statuses
(
    id serial NOT NULL,
    name character varying(100) NOT NULL,
    active boolean NOT NULL DEFAULT false,
    description character varying(2000),
    CONSTRAINT registered_user_status_id_pk PRIMARY KEY (id),
    CONSTRAINT registered_user_status_name_unq UNIQUE (name)
);

COMMENT ON TABLE "web-market".registered_user_statuses
    IS 'Статусы пользователя';

COMMENT ON COLUMN "web-market".registered_user_statuses.id
    IS 'Идентификатор статуса';

COMMENT ON COLUMN "web-market".registered_user_statuses.name
    IS 'Наименование статуса';

COMMENT ON COLUMN "web-market".registered_user_statuses.active
    IS 'Признак активности статуса';

COMMENT ON COLUMN "web-market".registered_user_statuses.description
    IS 'Описание статуса';
	
COMMENT ON CONSTRAINT registered_user_status_id_pk ON "web-market".registered_user_statuses
    IS 'Первичный ключ по идентификатору статуса';

COMMENT ON CONSTRAINT registered_user_status_name_unq ON "web-market".registered_user_statuses
    IS 'Уникальный ключ по наименованию статуса';