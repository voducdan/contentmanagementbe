create table status (
	id serial primary key,
	name varchar,
	tab varchar,
	prefill int
);


create table category (
	id serial primary key,
	name varchar,
	parent int,
	constraint category_fk foreign key (parent) references public.category(id)
);

create table topic (
	id serial primary key,
	original_name varchar,
	vi_name varchar,
	short_description text,
	author varchar,
	copyright_trustee varchar,
	keywords text,
	status int,
	category_level_1 int,
	category_level_2 int,
	description text,
	type_of_sale varchar,
	contracted_at date,
	contract_term int,
	cover_price float,
	royalty float,
	copyright_price float,
	translation_cost float,
	buy_permission varchar,
	partner_note text,
	voice_note text,
	contract_note text,
	cover_url varchar,
	translation bool,
	
	constraint topic_category_level_1_fk foreign key (category_level_1) references public.category (id),
	constraint topic_category_level_2_fk foreign key (category_level_2) references public.category (id),
	constraint topic_status_fk foreign key (status) references public.status (id)
)
;

create table topic_canceled(
	id_topic int,
	reason text,
	constraint topic_canceled_pk primary key (id_topic, reason),
	constraint topic_canceled_topic_fk foreign key (id_topic) references public.topic (id)
);

create table role (
	id serial primary key,
	role varchar
);

create table users (
	id serial primary key,
	email varchar,
	password varchar,
	role int,
	created_at date,
	constraint user_role_fk foreign key (role) references public.role (id)
)
;


create table logs (
	id serial primary key,
	user_id int,
	updated_column varchar,
	old_value text,
	new_value text,
	updated_at timestamp,
	
	constraint logs_user_fk foreign key (user_id) references public.users (id)
)
;




















