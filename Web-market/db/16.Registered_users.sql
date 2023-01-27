CREATE TABLE "web-market".registered_users
(
    id serial NOT NULL,
    firstname character varying(150) NOT NULL,
    middlename character varying(150),
    surname character varying(150),
	shortname character varying(200) NOT NULL,
    birth_date date NOT NULL,
    sex character(1) NOT NULL,
    registration_date date NOT NULL,
    email character varying(200),
	phone integer NOT NULL,
    status_id integer NOT NULL DEFAULT 0, 
    active boolean NOT NULL DEFAULT false,
    CONSTRAINT registered_user_id_pk PRIMARY KEY (id),
    CONSTRAINT registered_user_phone_unq UNIQUE (phone),
    CONSTRAINT registered_user_status_id_fk FOREIGN KEY (status_id)
        REFERENCES "web-market".registered_user_statuses (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID,
    CONSTRAINT registered_user_sex_chk CHECK (sex = 'M' or sex='F') NOT VALID
);

COMMENT ON TABLE "web-market".registered_users
    IS 'Зарегистрированные пользователи';

COMMENT ON COLUMN "web-market".registered_users.id
    IS 'Идентификатор пользователя';

COMMENT ON COLUMN "web-market".registered_users.firstname
    IS 'Имя';

COMMENT ON COLUMN "web-market".registered_users.middlename
    IS 'Фамилия';

COMMENT ON COLUMN "web-market".registered_users.surname
    IS 'Отчество';

COMMENT ON COLUMN "web-market".registered_users.birth_date
    IS 'Дата рождения';

COMMENT ON COLUMN "web-market".registered_users.sex
    IS 'Пол';

COMMENT ON COLUMN "web-market".registered_users.registration_date
    IS 'Дата регистрации';

COMMENT ON COLUMN "web-market".registered_users.email
    IS 'Электронный почтовый адрес';

COMMENT ON COLUMN "web-market".registered_users.status_id
    IS 'Идентификатор статуса';

COMMENT ON COLUMN "web-market".registered_users.shortname
    IS 'Краткое ФИО';
	
COMMENT ON COLUMN "web-market".users.phone
    IS 'Телефон';
	
COMMENT ON CONSTRAINT registered_user_id_pk ON "web-market".registered_users
    IS 'Первичный ключ идентификатора пользователя';

COMMENT ON CONSTRAINT registered_user_phone_unq ON "web-market".registered_users
    IS 'Уникальный ключ по телефону пользователя';
	
COMMENT ON CONSTRAINT registered_user_status_id_fk ON "web-market".registered_users
    IS 'Ссылка на идентификатор статуса пользователя из таблицы Registered_user_statuses';

COMMENT ON CONSTRAINT registered_user_sex_chk ON "web-market".registered_users
    IS 'Ограничение реквизита "пол"';