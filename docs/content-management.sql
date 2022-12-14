--
-- PostgreSQL database dump
--

-- Dumped from database version 11.15
-- Dumped by pg_dump version 13.3

-- Started on 2022-03-11 21:06:54

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 3 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA public;


--
-- TOC entry 3793 (class 0 OID 0)
-- Dependencies: 3
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON SCHEMA public IS 'standard public schema';


SET default_tablespace = '';

--
-- TOC entry 203 (class 1259 OID 16544)
-- Name: categories; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.categories (
    id bigint NOT NULL,
    name character varying,
    parent_id integer,
    root_id integer,
    code character varying,
    type character varying,
    "position" integer DEFAULT 1,
    visible_mobile boolean DEFAULT true,
    visible_web boolean DEFAULT true,
    sub_name character varying,
    deleted_at timestamp without time zone,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- TOC entry 202 (class 1259 OID 16542)
-- Name: categories_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3794 (class 0 OID 0)
-- Dependencies: 202
-- Name: categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.categories_id_seq OWNED BY public.categories.id;


--
-- TOC entry 205 (class 1259 OID 16886)
-- Name: logs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.logs (
    id integer NOT NULL,
    user_id integer,
    updated_column character varying,
    old_value text,
    new_value text,
    updated_at timestamp without time zone
);


--
-- TOC entry 204 (class 1259 OID 16884)
-- Name: logs_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.logs_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3795 (class 0 OID 0)
-- Dependencies: 204
-- Name: logs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.logs_id_seq OWNED BY public.logs.id;


--
-- TOC entry 199 (class 1259 OID 16455)
-- Name: roles; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.roles (
    id integer NOT NULL,
    role character varying
);


--
-- TOC entry 198 (class 1259 OID 16453)
-- Name: role_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.role_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3796 (class 0 OID 0)
-- Dependencies: 198
-- Name: role_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.role_id_seq OWNED BY public.roles.id;


--
-- TOC entry 197 (class 1259 OID 16389)
-- Name: statuses; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.statuses (
    id integer NOT NULL,
    name character varying,
    tab integer,
    prefill integer
);


--
-- TOC entry 196 (class 1259 OID 16387)
-- Name: status_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.status_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3797 (class 0 OID 0)
-- Dependencies: 196
-- Name: status_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.status_id_seq OWNED BY public.statuses.id;


--
-- TOC entry 210 (class 1259 OID 16936)
-- Name: topic_canceled; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.topic_canceled (
    id_topic integer,
    reason text,
    id integer NOT NULL
);


--
-- TOC entry 209 (class 1259 OID 16934)
-- Name: topic_canceled_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.topic_canceled_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3798 (class 0 OID 0)
-- Dependencies: 209
-- Name: topic_canceled_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.topic_canceled_id_seq OWNED BY public.topic_canceled.id;


--
-- TOC entry 208 (class 1259 OID 16904)
-- Name: topics; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.topics (
    id integer NOT NULL,
    topic_id integer NOT NULL,
    original_name character varying,
    vi_name character varying,
    short_description text,
    author character varying,
    copyright_trustee character varying,
    keywords text,
    status_id integer,
    category_level_1 integer,
    category_level_2 integer,
    description text,
    type_of_sale character varying,
    contracted_at date,
    contract_term integer,
    cover_price double precision,
    produce_cost double precision,
    royalty double precision,
    copyright_price double precision,
    translation_cost double precision,
    buy_permission character varying,
    partner_note text,
    voice_note text,
    contract_note text,
    cover_url character varying,
    translation boolean,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    last_modified_status timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    expected_completion_day timestamp with time zone,
    completed_at timestamp with time zone,
    tab integer,
    created_on_produce_tab timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    created_on_upload_tab timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    completed_produce_at timestamp without time zone,
    completed_upload_at timestamp without time zone
);


--
-- TOC entry 212 (class 1259 OID 16952)
-- Name: topics_backup; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.topics_backup (
    id integer NOT NULL,
    topic_id integer,
    original_name character varying(255),
    vi_name character varying(255),
    short_description text,
    author character varying(255),
    copyright_trustee character varying(255),
    keywords text,
    status_id integer,
    category_level_1 integer,
    category_level_2 integer,
    description text,
    type_of_sale character varying(255),
    contracted_at timestamp with time zone,
    contract_term integer,
    cover_price double precision,
    royalty double precision,
    copyright_price double precision,
    translation_cost double precision,
    produce_cost double precision,
    buy_permission character varying(255),
    partner_note text,
    voice_note text,
    contract_note text,
    cover_url character varying(255),
    translation boolean,
    tab integer,
    expected_completion_day timestamp without time zone,
    completed_at timestamp without time zone,
    completed_produce_at timestamp without time zone,
    completed_upload_at timestamp without time zone,
    last_modified_status timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    created_on_produce_tab timestamp without time zone,
    created_on_upload_tab timestamp without time zone,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- TOC entry 211 (class 1259 OID 16950)
-- Name: topics_backup_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.topics_backup_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3799 (class 0 OID 0)
-- Dependencies: 211
-- Name: topics_backup_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.topics_backup_id_seq OWNED BY public.topics_backup.id;


--
-- TOC entry 206 (class 1259 OID 16900)
-- Name: topics_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.topics_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3800 (class 0 OID 0)
-- Dependencies: 206
-- Name: topics_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.topics_id_seq OWNED BY public.topics.id;


--
-- TOC entry 207 (class 1259 OID 16902)
-- Name: topics_topic_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.topics_topic_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3801 (class 0 OID 0)
-- Dependencies: 207
-- Name: topics_topic_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.topics_topic_id_seq OWNED BY public.topics.topic_id;


--
-- TOC entry 201 (class 1259 OID 16482)
-- Name: users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.users (
    id integer NOT NULL,
    email character varying,
    password character varying,
    role_id integer,
    created_at date
);


--
-- TOC entry 200 (class 1259 OID 16480)
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3802 (class 0 OID 0)
-- Dependencies: 200
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- TOC entry 3609 (class 2604 OID 16547)
-- Name: categories id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.categories ALTER COLUMN id SET DEFAULT nextval('public.categories_id_seq'::regclass);


--
-- TOC entry 3613 (class 2604 OID 16889)
-- Name: logs id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.logs ALTER COLUMN id SET DEFAULT nextval('public.logs_id_seq'::regclass);


--
-- TOC entry 3607 (class 2604 OID 16458)
-- Name: roles id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.roles ALTER COLUMN id SET DEFAULT nextval('public.role_id_seq'::regclass);


--
-- TOC entry 3606 (class 2604 OID 16392)
-- Name: statuses id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.statuses ALTER COLUMN id SET DEFAULT nextval('public.status_id_seq'::regclass);


--
-- TOC entry 3621 (class 2604 OID 16939)
-- Name: topic_canceled id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.topic_canceled ALTER COLUMN id SET DEFAULT nextval('public.topic_canceled_id_seq'::regclass);


--
-- TOC entry 3618 (class 2604 OID 16907)
-- Name: topics id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.topics ALTER COLUMN id SET DEFAULT nextval('public.topics_id_seq'::regclass);


--
-- TOC entry 3619 (class 2604 OID 16908)
-- Name: topics topic_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.topics ALTER COLUMN topic_id SET DEFAULT nextval('public.topics_topic_id_seq'::regclass);


--
-- TOC entry 3622 (class 2604 OID 16955)
-- Name: topics_backup id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.topics_backup ALTER COLUMN id SET DEFAULT nextval('public.topics_backup_id_seq'::regclass);


--
-- TOC entry 3608 (class 2604 OID 16485)
-- Name: users id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- TOC entry 3778 (class 0 OID 16544)
-- Dependencies: 203
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.categories VALUES (1, 'S??ch n??i', NULL, NULL, 'audio_book', 'Audiobook', 1, true, true, NULL, NULL, '2019-01-02 16:48:22.099312', '2021-03-24 04:49:42.664775');
INSERT INTO public.categories VALUES (2, 'Podcast', NULL, NULL, 'podcast', 'Podcast', 3, true, true, NULL, NULL, '2019-08-13 07:02:10.179103', '2021-03-16 13:52:28.630329');
INSERT INTO public.categories VALUES (3, 'S??ch t??m t???t', NULL, NULL, 'summary_book', 'SummaryBook', 4, true, true, NULL, NULL, '2020-07-15 08:48:59.652113', '2021-03-16 13:52:18.860619');
INSERT INTO public.categories VALUES (4, 'Truy???n n??i', NULL, NULL, 'story_book', 'Storybook', 2, true, true, NULL, NULL, '2021-03-16 13:51:41.513635', '2021-04-20 01:48:06.371936');
INSERT INTO public.categories VALUES (5, 'Thi???u nhi', NULL, NULL, 'children_book', 'ChildrenBook', 5, true, true, NULL, NULL, '2021-03-16 13:52:02.91401', '2021-03-23 15:45:41.331133');
INSERT INTO public.categories VALUES (6, 'S??ch V??n h???c', 1, 1, 'sach_van_hoc', 'Audiobook', 100, false, false, NULL, '2021-10-13 20:46:08.361166', '2019-01-03 15:12:33.220229', '2020-05-25 02:20:09.30221');
INSERT INTO public.categories VALUES (7, 'S??ch Kinh t???', 1, 1, 'sach_kinh_te', 'Audiobook', 100, false, false, NULL, '2021-10-13 20:46:08.36456', '2019-01-03 15:12:33.316557', '2020-05-25 02:20:09.556741');
INSERT INTO public.categories VALUES (8, 'S??ch Thi???u nhi', 1, 1, 'sach_thieu_nhi', 'Audiobook', 100, false, false, NULL, '2021-10-13 20:46:08.367374', '2019-01-03 15:12:33.414786', '2020-05-25 02:20:09.800502');
INSERT INTO public.categories VALUES (9, 'S??ch k??? n??ng - S???ng ?????p', 1, 1, 'sach_ky_nang_song_dep', 'Audiobook', 100, false, false, NULL, '2021-10-13 20:46:08.370289', '2019-01-03 15:12:33.510728', '2020-05-25 02:20:10.534611');
INSERT INTO public.categories VALUES (10, 'S??ch b?? m??? - em b??', 1, 1, 'sach_ba_me_em_be', 'Audiobook', 100, false, false, NULL, '2021-10-13 20:46:08.373435', '2019-01-03 15:12:33.605902', '2020-05-25 02:20:11.033048');
INSERT INTO public.categories VALUES (11, 'Ki???n th???c t???ng h???p', 1, 1, 'kien_thuc_tong_hop', 'Audiobook', 100, false, false, NULL, '2021-10-13 20:46:08.376306', '2019-01-03 15:12:33.706924', '2020-05-25 02:20:13.680699');
INSERT INTO public.categories VALUES (12, 'Truy???n tranh, Manga, Comic', 1, 1, 'truyen_tranh_manga_comic', 'Audiobook', 100, false, false, NULL, '2021-10-13 20:46:08.379188', '2019-01-03 15:12:33.803358', '2020-05-25 02:20:12.484641');
INSERT INTO public.categories VALUES (13, 'S??ch l???ch s???', 1, 1, 'sach_lich_su', 'Audiobook', 100, false, false, NULL, '2021-10-13 20:46:08.382019', '2019-01-03 15:12:33.901906', '2020-05-25 02:20:13.92072');
INSERT INTO public.categories VALUES (14, 'S??ch khoa h???c - k??? thu???t', 1, 1, 'sach_khoa_hoc_ky_thuat', 'Audiobook', 100, false, false, NULL, '2021-10-13 20:46:08.384913', '2019-01-03 15:12:34.003', '2020-05-25 02:20:14.158739');
INSERT INTO public.categories VALUES (15, 'S??ch ngh??? thu???t', 1, 1, 'sach_nghe_thuat', 'Audiobook', 100, false, false, NULL, '2021-10-13 20:46:08.387984', '2019-01-03 15:12:34.099299', '2020-05-25 02:20:14.413486');
INSERT INTO public.categories VALUES (16, 'S??ch t??n gi??o t??m linh', 1, 1, 'sach_ton_giao_tam_linh', 'Audiobook', 100, false, false, NULL, '2021-10-13 20:46:08.391087', '2019-01-03 15:12:34.19463', '2020-05-25 02:20:11.504895');
INSERT INTO public.categories VALUES (17, 'Ph??p lu???t', 1, 1, 'phap_luat', 'Audiobook', 100, false, false, '', '2021-10-13 20:46:08.393852', '2019-01-03 15:12:34.295408', '2020-09-30 03:36:43.696154');
INSERT INTO public.categories VALUES (18, 'S??ch v??n ho?? du l???ch', 1, 1, 'sach_van_hoa_du_lich', 'Audiobook', 100, false, false, NULL, '2021-10-13 20:46:08.396646', '2019-01-03 15:12:34.400352', '2020-05-25 02:20:14.890379');
INSERT INTO public.categories VALUES (19, 'S??ch N??ng - L??m - Ng?? nghi???p', 1, 1, 'sach_nong_lam_ngu_nghiep', 'Audiobook', 100, false, false, NULL, '2021-10-13 20:46:08.399569', '2019-01-03 15:12:34.499697', '2020-05-25 02:20:15.13385');
INSERT INTO public.categories VALUES (20, 'S??ch Y h???c - S???c kho???', 1, 1, 'sach_y_hoc_suc_khoe', 'Audiobook', 100, false, false, NULL, '2021-10-13 20:46:08.402459', '2019-01-03 15:12:34.594676', '2020-05-25 02:20:11.761508');
INSERT INTO public.categories VALUES (21, 'S??ch T??m l?? - gi???i tinh', 1, 1, 'sach_tam_ly_gioi_tinh', 'Audiobook', 100, false, false, NULL, '2021-10-13 20:46:08.405204', '2019-01-03 15:12:34.693414', '2020-05-25 02:20:10.055676');
INSERT INTO public.categories VALUES (22, 'S??ch Th?????ng th???c ?????i s???ng', 1, 1, 'sach_thuong_thuc_doi_song', 'Audiobook', 100, false, false, NULL, '2021-10-13 20:46:08.40832', '2019-01-03 15:12:34.788718', '2020-05-25 02:20:10.298038');
INSERT INTO public.categories VALUES (23, '?????u t??', 1, 1, 'dau_tu', 'Audiobook', 100, false, false, '', '2021-10-13 20:46:08.411193', '2019-01-03 15:12:34.886106', '2020-09-30 03:37:05.060666');
INSERT INTO public.categories VALUES (24, 'T???p ch?? - Catalogue', 1, 1, 'tap_chi_catalogue', 'Audiobook', 100, false, false, NULL, '2021-10-13 20:46:08.414024', '2019-01-03 15:12:34.987462', '2020-05-25 02:20:10.78178');
INSERT INTO public.categories VALUES (25, 'T??? ??i???n', 1, 1, 'tu_dien', 'Audiobook', 100, false, false, NULL, '2021-10-13 20:46:08.416746', '2019-01-03 15:12:35.08553', '2020-05-25 02:20:12.238929');
INSERT INTO public.categories VALUES (26, 'Ng??n ng???', 1, 1, 'ngon_ngu', 'Audiobook', 100, false, false, NULL, '2021-10-13 20:46:08.419572', '2019-01-03 15:12:35.185375', '2020-05-25 02:20:11.269293');
INSERT INTO public.categories VALUES (27, 'Kinh t???', 2, 2, 'kinh_te', 'Podcast', 9, false, false, NULL, '2021-10-13 20:46:08.422405', '2019-08-13 07:03:54.923661', '2020-05-25 02:20:15.862587');
INSERT INTO public.categories VALUES (28, 'V??n h???c', 2, 2, 'van_hoc', 'Podcast', 5, false, false, NULL, '2021-10-13 20:46:08.425353', '2019-08-13 07:04:13.681327', '2020-05-25 02:20:08.534562');
INSERT INTO public.categories VALUES (29, 'L??nh ?????o', 2, 2, 'lanh_dao', 'Podcast', 9, false, false, NULL, '2021-10-13 20:46:08.42823', '2019-08-13 07:04:23.769268', '2020-05-25 02:20:08.775974');
INSERT INTO public.categories VALUES (30, 'Gia ????nh', 2, 2, 'gia_dinh', 'Podcast', 6, false, false, NULL, '2021-10-13 20:46:08.431163', '2019-08-13 07:04:33.254664', '2020-05-25 02:20:07.328582');
INSERT INTO public.categories VALUES (31, 'K??? n??ng', 2, 2, 'ky_nang', 'Podcast', 7, false, false, NULL, '2021-10-13 20:46:08.43401', '2019-08-13 07:04:40.845156', '2020-05-25 02:19:52.283414');
INSERT INTO public.categories VALUES (32, 'Ph??p tho???i', 2, 2, 'phap_thoai', 'Podcast', 4, true, true, '', NULL, '2019-08-13 07:04:51.400866', '2021-03-24 02:29:04.889896');
INSERT INTO public.categories VALUES (33, 'Kh???i nghi???p', 2, 2, 'khoi_nghiep', 'Podcast', 9, false, false, NULL, '2021-10-13 20:46:08.439625', '2019-08-13 07:04:58.90832', '2020-05-25 02:19:54.673431');
INSERT INTO public.categories VALUES (34, 'H???c ngo???i ng???', 2, 2, 'hoc_ngoai_ngu', 'Podcast', 10, true, true, '', NULL, '2019-08-13 07:05:12.259442', '2020-10-28 07:07:23.954018');
INSERT INTO public.categories VALUES (35, 'T??m s???', 2, 2, 'tam_su', 'Podcast', 8, true, true, '', NULL, '2019-08-13 07:05:17.833792', '2020-09-25 15:31:01.513972');
INSERT INTO public.categories VALUES (36, 'Gi???i tr??', 2, 2, 'giai_tri', 'Podcast', 2, true, true, 'Gi???i tr??', NULL, '2019-08-26 05:07:20.29215', '2021-03-24 02:28:13.886169');
INSERT INTO public.categories VALUES (37, 'Tin t???c', 2, 2, 'tin_tuc', 'Podcast', 1, true, true, 'Tin t???c', NULL, '2019-08-26 05:07:38.638259', '2020-06-04 02:08:58.678415');
INSERT INTO public.categories VALUES (38, 'S??? Nghi???p', 2, 2, 'su_nghiep', 'Podcast', 3, false, false, NULL, '2021-10-13 20:46:08.453909', '2019-08-26 05:07:59.098696', '2020-05-25 02:19:47.45956');
INSERT INTO public.categories VALUES (39, 'V??n h???c', 1, 1, 'van_hoc', 'Audiobook', 6, false, false, NULL, '2021-10-13 20:46:08.456892', '2019-08-26 05:11:02.536635', '2020-05-25 02:19:46.986287');
INSERT INTO public.categories VALUES (40, 'L??nh ?????o', 1, 1, 'lanh_dao', 'Audiobook', 10, true, true, '', NULL, '2019-08-26 05:11:02.719603', '2020-09-03 09:45:48.302102');
INSERT INTO public.categories VALUES (41, 'S???p ph??t h??nh', 1, 1, 'coming_soon', 'Audiobook', 1, true, true, 'S???p ph??t h??nh', NULL, '2019-08-26 05:11:02.90118', '2021-05-05 08:53:10.915238');
INSERT INTO public.categories VALUES (42, 'Kinh t???', 1, 1, 'kinh_te', 'Audiobook', 2, false, false, NULL, '2021-10-13 20:46:08.46546', '2019-08-26 05:11:03.09343', '2020-05-25 02:19:45.276434');
INSERT INTO public.categories VALUES (43, 'T??m l??', 1, 1, 'tam_ly', 'Audiobook', 14, true, true, '', NULL, '2019-08-26 05:11:03.646703', '2021-05-05 08:22:10.29891');
INSERT INTO public.categories VALUES (44, 'K??? n??ng', 1, 1, 'ky_nang', 'Audiobook', 3, true, true, 'K??? n??ng m???m', NULL, '2019-08-26 05:11:03.830487', '2021-03-24 02:25:24.122693');
INSERT INTO public.categories VALUES (45, 'H???nh ph??c', 1, 1, 'hanh_phuc', 'Audiobook', 6, true, true, '', NULL, '2019-08-26 05:11:04.012782', '2021-03-24 02:25:47.031869');
INSERT INTO public.categories VALUES (46, 'Kh???i nghi???p', 1, 1, 'khoi_nghiep', 'Audiobook', 9, false, false, NULL, '2021-10-13 20:46:08.478248', '2019-08-26 05:11:04.197077', '2020-05-25 02:20:16.347897');
INSERT INTO public.categories VALUES (47, 'Ngo???i ng???', 1, 1, 'ngoai_ngu', 'Audiobook', 9, false, false, NULL, '2021-10-13 20:46:08.480986', '2019-08-26 05:11:04.381931', '2020-05-25 02:20:15.621031');
INSERT INTO public.categories VALUES (48, 'V??n h???c Qu???c t??? Hi???n ?????i', 4, 4, 'van_hoc_quoc_te_hien_dai', 'Storybook', 4, true, true, '', NULL, '2019-08-26 05:11:04.567489', '2021-04-04 05:02:54.875189');
INSERT INTO public.categories VALUES (49, 'An l???c', 2, 2, 'an_lac', 'Podcast', 10, false, false, NULL, '2021-10-13 20:46:08.486745', '2019-10-01 03:58:23.702737', '2020-05-25 02:19:53.477539');
INSERT INTO public.categories VALUES (50, 'H??n nh??n', 2, 2, 'hon_nhan', 'Podcast', 12, false, false, NULL, '2021-10-13 20:46:08.489564', '2019-10-01 03:58:23.879223', '2020-05-25 02:19:54.435418');
INSERT INTO public.categories VALUES (51, 'Kinh doanh', 2, 2, 'kinh_doanh', 'Podcast', 12, false, false, NULL, '2021-10-13 20:46:08.492372', '2019-10-01 03:58:24.066209', '2020-05-25 02:19:54.192279');
INSERT INTO public.categories VALUES (52, 'V??n ho??', 2, 2, 'van_hoa', 'Podcast', 1, true, true, '', NULL, '2019-10-01 03:58:24.247253', '2021-03-24 02:28:04.756668');
INSERT INTO public.categories VALUES (53, 'Hoa h???c tr??', 2, 2, 'hoa_hoc_tro', 'Podcast', 2, false, false, 'Hoa H???c Tr?? Magazine', '2021-10-13 20:46:08.498144', '2019-10-01 03:58:24.431005', '2021-01-04 11:44:05.149141');
INSERT INTO public.categories VALUES (55, 'Ki???n th???c', 2, 2, 'kien_thuc', 'Podcast', 3, true, true, 'Kinh t??? - X?? h???i', NULL, '2019-10-01 03:58:24.788044', '2021-06-08 10:49:38.173494');
INSERT INTO public.categories VALUES (56, 'Thi???u nhi', 5, 5, 'thieu_nhi', 'ChildrenBook', 1, true, true, 'Thi???u nhi', NULL, '2019-10-01 03:58:24.965638', '2021-03-23 15:45:35.909576');
INSERT INTO public.categories VALUES (57, 'Ng??? Ngon', 2, 2, 'ngu_ngon', 'Podcast', 6, true, true, '', NULL, '2019-10-01 03:58:25.145943', '2021-03-24 02:29:20.225248');
INSERT INTO public.categories VALUES (58, 'Kinh d???', 2, 2, 'kinh_di', 'Podcast', 5, true, true, 'Truy???n Ma gh?? r???n', NULL, '2019-10-01 03:58:25.325625', '2021-03-24 02:29:11.880159');
INSERT INTO public.categories VALUES (59, 'T??m linh', 1, 1, 'tam_linh', 'Audiobook', 2, true, true, 'B??nh an t??m h???n', NULL, '2019-10-01 04:02:47.673351', '2021-03-24 02:25:05.429423');
INSERT INTO public.categories VALUES (60, 'L???a ????i', 1, 1, 'lua_doi', 'Audiobook', 8, true, true, '', NULL, '2019-10-01 04:02:47.868265', '2020-10-28 07:59:40.590009');
INSERT INTO public.categories VALUES (61, 'C??ng ngh???', 1, 1, 'cong_nghe', 'Audiobook', 12, true, true, '', NULL, '2019-10-01 04:02:48.07602', '2020-09-03 09:53:53.001994');
INSERT INTO public.categories VALUES (63, 'C??ng s???', 1, 1, 'cong_so', 'Audiobook', 13, false, false, '', '2021-10-13 20:46:08.526426', '2019-10-01 04:02:48.528981', '2021-05-05 08:55:14.696363');
INSERT INTO public.categories VALUES (64, 'Ng??n t??nh', 4, 4, 'ngon_tinh', 'Storybook', 3, true, true, '', NULL, '2019-10-01 04:02:48.728269', '2021-03-24 02:27:10.315012');
INSERT INTO public.categories VALUES (65, 'Th??', 1, 1, 'tho', 'Audiobook', 20, false, false, '', '2019-10-15 04:02:48.966902', '2019-10-01 04:02:48.966902', '2020-09-30 03:37:13.964855');
INSERT INTO public.categories VALUES (54, 'Radio', 2, 2, 'radio', 'Podcast', 4, false, false, '', '2019-10-15 03:58:24.611497', '2019-10-01 03:58:24.611497', '2020-09-30 03:32:02.283517');
INSERT INTO public.categories VALUES (66, 'Kinh doanh', 1, 1, 'kinh_doanh', 'Audiobook', 13, true, true, 'Kinh doanh - Kh???i nghi???p', NULL, '2019-10-01 04:02:49.178704', '2021-05-05 08:55:36.695163');
INSERT INTO public.categories VALUES (67, 'L???ch s???', 1, 1, 'lich_su', 'Audiobook', 6, true, true, 'D??n ta ph???i bi???t S??? ta', NULL, '2019-10-01 04:02:49.377817', '2021-03-24 02:26:01.758061');
INSERT INTO public.categories VALUES (68, 'Marketing', 1, 1, 'marketing', 'Audiobook', 11, true, true, '', NULL, '2019-10-01 04:02:49.577173', '2020-09-03 09:46:12.953782');
INSERT INTO public.categories VALUES (69, 'Con c??i', 1, 1, 'con_cai', 'Audiobook', 2, true, true, 'Nu??i d???y con', NULL, '2019-10-01 04:02:49.762671', '2020-10-28 07:33:51.797317');
INSERT INTO public.categories VALUES (70, 'Th??nh c??ng', 1, 1, 'thanh_cong', 'Audiobook', 4, true, true, 'Ph??t tri???n b???n th??n', NULL, '2019-10-01 04:02:49.955956', '2021-03-24 02:25:35.814655');
INSERT INTO public.categories VALUES (71, 'S???c kho???', 1, 1, 'suc_khoe', 'Audiobook', 9, true, true, '', NULL, '2019-10-01 04:02:50.150878', '2020-09-03 09:45:10.149604');
INSERT INTO public.categories VALUES (72, 'Trinh th??m', 4, 4, 'trinh_tham', 'Storybook', 6, true, true, '', NULL, '2019-10-01 04:02:50.393043', '2021-03-24 02:27:41.160092');
INSERT INTO public.categories VALUES (73, 'Kinh ??i???n Vi???t Nam', 4, 4, 'kinh_dien_viet_nam', 'Storybook', 1, true, true, 'Vi???t Nam Danh T??c', NULL, '2019-10-01 04:02:50.652091', '2021-04-04 05:03:32.286975');
INSERT INTO public.categories VALUES (74, 'Kinh ??i???n Qu???c t???', 4, 4, 'kinh_dien_quoc_te', 'Storybook', 2, true, true, '', NULL, '2019-10-01 04:02:50.867108', '2021-03-24 02:26:52.496913');
INSERT INTO public.categories VALUES (75, 'V??n h???c VN Hi???n ?????i', 4, 4, 'van_hoc_vn_hien_dai', 'Storybook', 5, true, true, '', NULL, '2019-10-01 04:02:51.079379', '2021-04-04 05:02:36.171824');
INSERT INTO public.categories VALUES (76, 'T??m t???t s??ch', 2, 2, 'tom_tat_sach', 'Podcast', 10, false, false, 'T??m t???t s??ch - Nghe ??t, Hi???u nhi???u	', '2021-10-13 20:46:08.56213', '2019-10-01 04:02:51.331269', '2020-09-25 05:46:30.343117');
INSERT INTO public.categories VALUES (77, 'Danh nh??n', 1, 1, 'danh_nhan', 'Audiobook', 3, true, true, '', NULL, '2019-10-01 04:02:51.529165', '2021-03-18 05:47:45.57931');
INSERT INTO public.categories VALUES (78, 'Thi???n - T??nh t??m', 2, 2, 'thien_tinh_tam', 'Podcast', 7, true, true, '', NULL, '2019-10-03 04:09:36.171055', '2020-09-25 15:26:29.456759');
INSERT INTO public.categories VALUES (79, 'English books', 1, 1, 'english_books', 'Audiobook', 17, false, false, '', '2021-10-13 20:46:08.570579', '2019-10-03 04:10:10.35233', '2021-05-05 08:55:08.803374');
INSERT INTO public.categories VALUES (80, 'S??ch t??m t???t', 3, 3, 'sach_tom_tat', 'SummaryBook', 1, true, true, '', NULL, '2020-07-15 08:49:55.337704', '2020-07-31 16:30:14.808381');
INSERT INTO public.categories VALUES (81, 'HBR Audio', NULL, NULL, 'hbr_audio', 'HbrAudio', 0, true, true, 'HBR Audio', NULL, '2021-10-13 20:46:08.585838', '2021-10-13 20:46:08.585838');
INSERT INTO public.categories VALUES (82, 'HBR Audio', 81, 81, 'khoa_hoc', 'HbrAudio', 0, true, true, 'HBR Audio', NULL, '2021-10-13 20:46:08.587954', '2021-10-13 20:46:08.587954');
INSERT INTO public.categories VALUES (62, '?????u t??', 1, 1, 'dau_tu', 'Audiobook', 19, false, false, '', '2021-10-15 20:46:08.411193', '2019-10-01 04:02:48.288979', '2020-09-30 03:37:22.725956');


--
-- TOC entry 3780 (class 0 OID 16886)
-- Dependencies: 205
-- Data for Name: logs; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.logs VALUES (154, 15, 'status_id', '1', '10', NULL);
INSERT INTO public.logs VALUES (155, 10, 'status_id', '1', '7', NULL);
INSERT INTO public.logs VALUES (156, 15, 'status_id', '10', '3', NULL);
INSERT INTO public.logs VALUES (157, 15, 'status_id', '3', '7', NULL);


--
-- TOC entry 3774 (class 0 OID 16455)
-- Dependencies: 199
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.roles VALUES (1, 'admin');
INSERT INTO public.roles VALUES (2, 'copyright');
INSERT INTO public.roles VALUES (3, 'produce');
INSERT INTO public.roles VALUES (4, 'upload');


--
-- TOC entry 3772 (class 0 OID 16389)
-- Dependencies: 197
-- Data for Name: statuses; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.statuses VALUES (10, 'Pending', 1, NULL);
INSERT INTO public.statuses VALUES (13, 'Nh???n b???n th???o', 2, NULL);
INSERT INTO public.statuses VALUES (14, 'Casting', 2, 3);
INSERT INTO public.statuses VALUES (15, '??ang ch??? talent available', 2, 7);
INSERT INTO public.statuses VALUES (16, '??ang thu ??m', 2, 7);
INSERT INTO public.statuses VALUES (17, '??ang d?? so??t', 2, 3);
INSERT INTO public.statuses VALUES (18, '??ang s???a file', 2, 7);
INSERT INTO public.statuses VALUES (19, '??ang h???u k???', 2, 3);
INSERT INTO public.statuses VALUES (20, '???? giao audio', 2, NULL);
INSERT INTO public.statuses VALUES (21, '??ang ki???m tra audio', 3, NULL);
INSERT INTO public.statuses VALUES (22, 'Ch??a up, ch??? ch???nh audio', 3, NULL);
INSERT INTO public.statuses VALUES (23, '???? up, ch??? ph?? duy???t ', 3, NULL);
INSERT INTO public.statuses VALUES (24, 'Ch??a duy???t, ch??? ch???nh s???a', 3, NULL);
INSERT INTO public.statuses VALUES (25, '???? ho??n t???t', 3, NULL);
INSERT INTO public.statuses VALUES (1, 'Ch??a li??n h???', 1, NULL);
INSERT INTO public.statuses VALUES (2, '???? li??n h??? l???n ?????u', 1, NULL);
INSERT INTO public.statuses VALUES (3, '??ang trao ?????i', 1, NULL);
INSERT INTO public.statuses VALUES (4, '???? g???i offer', 1, NULL);
INSERT INTO public.statuses VALUES (5, '??ang l??m H?? mua BQ g???c', 1, NULL);
INSERT INTO public.statuses VALUES (6, '???? k?? H?? g???c', 1, NULL);
INSERT INTO public.statuses VALUES (7, 'Ch??? b???n th???o', 1, NULL);
INSERT INTO public.statuses VALUES (8, '??ang d???ch/mua b???n d???ch', 1, NULL);
INSERT INTO public.statuses VALUES (9, 'Ho??n t???t d???ch', 1, NULL);
INSERT INTO public.statuses VALUES (11, 'Kh??ng th??nh c??ng', 1, NULL);
INSERT INTO public.statuses VALUES (12, '???? giao b???n th???o', 1, NULL);


--
-- TOC entry 3785 (class 0 OID 16936)
-- Dependencies: 210
-- Data for Name: topic_canceled; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.topic_canceled VALUES (25, 'Khoong mua dc', 3);


--
-- TOC entry 3783 (class 0 OID 16904)
-- Dependencies: 208
-- Data for Name: topics; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.topics VALUES (26, 12, 'On Eearth We''re Briefly Gorgeous ', 'M???t tho??ng ta r???c r??? ??? nh??n gian ', NULL, 'Ocean Vuong', 'Ocean Vuong c/o BAA', 'Ocean Vuong', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, '2022-03-11 07:39:35.064194+00', '2022-03-11 07:53:25.053+00', '2022-03-11 07:53:25.053+00', NULL, NULL, 1, '2022-03-11 07:39:35.064194', '2022-03-11 07:39:35.064194', NULL, NULL);
INSERT INTO public.topics VALUES (25, 11, '?????ng S??? L??? Cu???c Ch??i', '?????ng S??? L??? Cu???c Ch??i', 'FOMO', 'Patrick MCGinnis', 'First News', 'fomo,', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, '2022-03-11 07:34:52.338445+00', '2022-03-11 07:58:28.141+00', '2022-03-11 07:58:28.141+00', NULL, NULL, 1, '2022-03-11 07:34:52.338445', '2022-03-11 07:34:52.338445', NULL, NULL);
INSERT INTO public.topics VALUES (27, 13, '?????c Nh??n', '?????c Nh??n', 'Th??nh c??ng', 'Dale Car', 'First News', 'th??nh c??ng', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, '2022-03-11 08:12:17.309815+00', '2022-03-11 08:12:17.309815+00', '2022-03-11 08:12:17.309815+00', NULL, NULL, 1, '2022-03-11 08:12:17.309815', '2022-03-11 08:12:17.309815', NULL, NULL);


--
-- TOC entry 3787 (class 0 OID 16952)
-- Dependencies: 212
-- Data for Name: topics_backup; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.topics_backup VALUES (24, 10, '?????ng S??? L??? Cu???c Ch??i (kh??ng t??n g???c)', '?????ng S??? L??? Cu???c Ch??i', 'FOMO', 'Patrick MCGinnis', 'First News', 'fomo, ', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, 1, NULL, NULL, NULL, NULL, '2022-03-11 07:32:15.284', '2022-03-11 07:32:15.284', '2022-03-11 07:32:15.284', '2022-03-11 07:32:15.284', '2022-03-11 07:32:15.284');


--
-- TOC entry 3776 (class 0 OID 16482)
-- Dependencies: 201
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.users VALUES (9, 'thach.le', '$2a$10$afZ6/xU9XuTNIkam2KTWle1q852GAknIbpkOgdCIvF3oPlszTkMu6', 1, '2022-03-08');
INSERT INTO public.users VALUES (10, 'thao.nguyen', '$2a$10$CeVoVvbMd1DwpvUNynMOLe4gM81cxFah1Cw6Dyl8LtNDD5nXoZzbq', 1, '2022-03-08');
INSERT INTO public.users VALUES (11, 'hang.nguyen', '$2a$10$IEf5mdYsPMmzGRSknk/nHOBGRTs3VwV7GpVYQosPCrP7Y01Tswh9W', 1, '2022-03-08');
INSERT INTO public.users VALUES (13, 'theanh.nguyen', '$2a$10$MvfAEhjJW0hV2TlGKWBHy.UzjZLDFEkZ.Z0APp2RIFfeSPVOVju8O', 3, '2022-03-08');
INSERT INTO public.users VALUES (14, 'tuyen.le', '$2a$10$5Vv.Zy7lLRdHZN6Qi3l1YelB0bG5T.dq6ZujA3ss1CCXs8U329Yv2', 4, '2022-03-08');
INSERT INTO public.users VALUES (15, 'luan.nguyen', '$2a$10$70jN13Ajr2cc1EuetocsSuU/h6EvCBSgdi9T76x.WjaI1TAiGsFbO', 2, '2022-03-08');


--
-- TOC entry 3803 (class 0 OID 0)
-- Dependencies: 202
-- Name: categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.categories_id_seq', 1, false);


--
-- TOC entry 3804 (class 0 OID 0)
-- Dependencies: 204
-- Name: logs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.logs_id_seq', 157, true);


--
-- TOC entry 3805 (class 0 OID 0)
-- Dependencies: 198
-- Name: role_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.role_id_seq', 1, false);


--
-- TOC entry 3806 (class 0 OID 0)
-- Dependencies: 196
-- Name: status_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.status_id_seq', 25, true);


--
-- TOC entry 3807 (class 0 OID 0)
-- Dependencies: 209
-- Name: topic_canceled_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.topic_canceled_id_seq', 3, true);


--
-- TOC entry 3808 (class 0 OID 0)
-- Dependencies: 211
-- Name: topics_backup_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.topics_backup_id_seq', 2, true);


--
-- TOC entry 3809 (class 0 OID 0)
-- Dependencies: 206
-- Name: topics_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.topics_id_seq', 27, true);


--
-- TOC entry 3810 (class 0 OID 0)
-- Dependencies: 207
-- Name: topics_topic_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.topics_topic_id_seq', 13, true);


--
-- TOC entry 3811 (class 0 OID 0)
-- Dependencies: 200
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.users_id_seq', 15, true);


--
-- TOC entry 3633 (class 2606 OID 16555)
-- Name: categories categories_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (id);


--
-- TOC entry 3637 (class 2606 OID 16894)
-- Name: logs logs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.logs
    ADD CONSTRAINT logs_pkey PRIMARY KEY (id);


--
-- TOC entry 3629 (class 2606 OID 16463)
-- Name: roles role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 3627 (class 2606 OID 16397)
-- Name: statuses status_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.statuses
    ADD CONSTRAINT status_pkey PRIMARY KEY (id);


--
-- TOC entry 3641 (class 2606 OID 16944)
-- Name: topic_canceled topic_canceled_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.topic_canceled
    ADD CONSTRAINT topic_canceled_pkey PRIMARY KEY (id);


--
-- TOC entry 3639 (class 2606 OID 16918)
-- Name: topics topic_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.topics
    ADD CONSTRAINT topic_pkey PRIMARY KEY (id);


--
-- TOC entry 3643 (class 2606 OID 16963)
-- Name: topics_backup topics_backup_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.topics_backup
    ADD CONSTRAINT topics_backup_pkey PRIMARY KEY (id);


--
-- TOC entry 3631 (class 2606 OID 16490)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 3634 (class 1259 OID 16566)
-- Name: index_categories_on_code; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_categories_on_code ON public.categories USING btree (code) WHERE (deleted_at IS NULL);


--
-- TOC entry 3635 (class 1259 OID 16567)
-- Name: index_categories_on_position; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_categories_on_position ON public.categories USING btree ("position");


--
-- TOC entry 3645 (class 2606 OID 16895)
-- Name: logs logs_user_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.logs
    ADD CONSTRAINT logs_user_fk FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- TOC entry 3649 (class 2606 OID 16945)
-- Name: topic_canceled topic_canceled_topic_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.topic_canceled
    ADD CONSTRAINT topic_canceled_topic_fk FOREIGN KEY (id_topic) REFERENCES public.topics(id);


--
-- TOC entry 3646 (class 2606 OID 16919)
-- Name: topics topic_category_level_1_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.topics
    ADD CONSTRAINT topic_category_level_1_fk FOREIGN KEY (category_level_1) REFERENCES public.categories(id);


--
-- TOC entry 3647 (class 2606 OID 16924)
-- Name: topics topic_category_level_2_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.topics
    ADD CONSTRAINT topic_category_level_2_fk FOREIGN KEY (category_level_2) REFERENCES public.categories(id);


--
-- TOC entry 3648 (class 2606 OID 16929)
-- Name: topics topic_status_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.topics
    ADD CONSTRAINT topic_status_fk FOREIGN KEY (status_id) REFERENCES public.statuses(id);


--
-- TOC entry 3644 (class 2606 OID 16491)
-- Name: users user_role_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT user_role_fk FOREIGN KEY (role_id) REFERENCES public.roles(id);


-- Completed on 2022-03-11 21:07:10

--
-- PostgreSQL database dump complete
--

