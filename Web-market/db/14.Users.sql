CREATE TABLE "web-market".users
(
    id serial NOT NULL,
    firstname character varying(150) NOT NULL,
    middlename character varying(150),
    surname character varying(150),
	shortname character varying(200) NOT NULL,
    nationality character varying(200),
    birth_date date NOT NULL,
    sex character(1) NOT NULL,
	phone integer NOT NULL,
    "position" character varying(400) NOT NULL,
    begin_activity date NOT NULL,
    end_activity date,
    store_id integer,
    email character varying(200),
    inn character(12) NOT NULL,
    snils character(15),
    status_id integer NOT NULL DEFAULT 0,
    CONSTRAINT user_id_pk PRIMARY KEY (id),
    CONSTRAINT user_inn_unq UNIQUE (inn),
    CONSTRAINT user_store_id_fk FOREIGN KEY (store_id)
        REFERENCES "web-market".stores (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID,
    CONSTRAINT user_status_id_fk FOREIGN KEY (status_id)
        REFERENCES "web-market".user_statuses (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID,
    CONSTRAINT user_sex_chk CHECK (sex = 'M' or sex='F') NOT VALID
);

COMMENT ON TABLE "web-market".users
    IS 'Пользователи системы и на местах';

COMMENT ON COLUMN "web-market".users.id
    IS 'Идентификатор пользователя';

COMMENT ON COLUMN "web-market".users.firstname
    IS 'Имя';

COMMENT ON COLUMN "web-market".users.middlename
    IS 'Фамилия';

COMMENT ON COLUMN "web-market".users.surname
    IS 'Отчество';

COMMENT ON COLUMN "web-market".users.birth_date
    IS 'Дата рождения';

COMMENT ON COLUMN "web-market".users.sex
    IS 'Пол';

COMMENT ON COLUMN "web-market".users."position"
    IS 'Должность';

COMMENT ON COLUMN "web-market".users.begin_activity
    IS 'Начало трудоустройства';

COMMENT ON COLUMN "web-market".users.end_activity
    IS 'Окончание трудоустройства';

COMMENT ON COLUMN "web-market".users.store_id
    IS 'Привязка к складу';

COMMENT ON COLUMN "web-market".users.email
    IS 'Электронный почтовый адрес';

COMMENT ON COLUMN "web-market".users.inn
    IS 'ИНН';

COMMENT ON COLUMN "web-market".users.snils
    IS 'СНИЛС';

COMMENT ON COLUMN "web-market".users.status_id
    IS 'Идентификатор статуса';

COMMENT ON COLUMN "web-market".users.shortname
    IS 'Краткое ФИО';

COMMENT ON COLUMN "web-market".users.nationality
    IS 'Национальность';
	
COMMENT ON COLUMN "web-market".users.phone
    IS 'Телефон';
	
COMMENT ON CONSTRAINT user_id_pk ON "web-market".users
    IS 'Первичный ключ идентификатора пользователя';

COMMENT ON CONSTRAINT user_inn_unq ON "web-market".users
    IS 'Уникальный ключ по ИНН пользователя';

COMMENT ON CONSTRAINT user_store_id_fk ON "web-market".users
    IS 'Ссылка на идентификатор склада';
	
COMMENT ON CONSTRAINT user_status_id_fk ON "web-market".users
    IS 'Ссылка на идентификатор статуса пользователя из таблицы User_statuses';

COMMENT ON CONSTRAINT user_sex_chk ON "web-market".users
    IS 'Ограничение реквизита "пол"';