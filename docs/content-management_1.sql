--
-- PostgreSQL database dump
--

-- Dumped from database version 10.12 (Debian 10.12-2.pgdg90+1)
-- Dumped by pg_dump version 13.3

-- Started on 2022-04-23 11:48:49

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
-- TOC entry 4 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA public;


--
-- TOC entry 2990 (class 0 OID 0)
-- Dependencies: 4
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON SCHEMA public IS 'standard public schema';


--
-- TOC entry 535 (class 1247 OID 106511)
-- Name: mobile_complex_type; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.mobile_complex_type AS (
	mobile_brand_name text,
	mobile_marketing_name text,
	device_model text,
	os_version_group text,
	os_version text,
	dma text,
	ip text,
	wifi text,
	operator text,
	carrier text,
	language text,
	device_type text,
	browser text,
	browser_version text,
	stream_id text,
	is_limited_ad_tracking text
);


SET default_tablespace = '';

--
-- TOC entry 198 (class 1259 OID 107570)
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
-- TOC entry 199 (class 1259 OID 107579)
-- Name: categories_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2991 (class 0 OID 0)
-- Dependencies: 199
-- Name: categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.categories_id_seq OWNED BY public.categories.id;


--
-- TOC entry 200 (class 1259 OID 107581)
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
-- TOC entry 201 (class 1259 OID 107587)
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
-- TOC entry 2992 (class 0 OID 0)
-- Dependencies: 201
-- Name: logs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.logs_id_seq OWNED BY public.logs.id;


--
-- TOC entry 202 (class 1259 OID 107589)
-- Name: roles; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.roles (
    id integer NOT NULL,
    role character varying
);


--
-- TOC entry 203 (class 1259 OID 107595)
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
-- TOC entry 2993 (class 0 OID 0)
-- Dependencies: 203
-- Name: role_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.role_id_seq OWNED BY public.roles.id;


--
-- TOC entry 204 (class 1259 OID 107597)
-- Name: statuses; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.statuses (
    id integer NOT NULL,
    name character varying,
    tab integer,
    prefill integer
);


--
-- TOC entry 205 (class 1259 OID 107603)
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
-- TOC entry 2994 (class 0 OID 0)
-- Dependencies: 205
-- Name: status_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.status_id_seq OWNED BY public.statuses.id;


--
-- TOC entry 206 (class 1259 OID 107605)
-- Name: topic_canceled; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.topic_canceled (
    id_topic integer,
    reason text,
    id integer NOT NULL
);


--
-- TOC entry 207 (class 1259 OID 107611)
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
-- TOC entry 2995 (class 0 OID 0)
-- Dependencies: 207
-- Name: topic_canceled_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.topic_canceled_id_seq OWNED BY public.topic_canceled.id;


--
-- TOC entry 208 (class 1259 OID 107613)
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
    category_level_2 text,
    description text,
    type_of_sale character varying,
    contracted_at text,
    contract_term text,
    cover_price double precision,
    produce_cost double precision,
    royalty text,
    copyright_price text,
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
    completed_upload_at timestamp without time zone,
    agency character varying,
    release_date character varying,
    control_cost double precision,
    post_production_cost double precision
);


--
-- TOC entry 209 (class 1259 OID 107624)
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
    category_level_2 text,
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
-- TOC entry 210 (class 1259 OID 107633)
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
-- TOC entry 2996 (class 0 OID 0)
-- Dependencies: 210
-- Name: topics_backup_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.topics_backup_id_seq OWNED BY public.topics_backup.id;


--
-- TOC entry 211 (class 1259 OID 107635)
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
-- TOC entry 2997 (class 0 OID 0)
-- Dependencies: 211
-- Name: topics_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.topics_id_seq OWNED BY public.topics.id;


--
-- TOC entry 212 (class 1259 OID 107637)
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
-- TOC entry 2998 (class 0 OID 0)
-- Dependencies: 212
-- Name: topics_topic_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.topics_topic_id_seq OWNED BY public.topics.topic_id;


--
-- TOC entry 213 (class 1259 OID 107639)
-- Name: user_role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.user_role (
    user_id integer,
    role_id integer,
    id integer NOT NULL
);


--
-- TOC entry 214 (class 1259 OID 107642)
-- Name: user_role_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.user_role_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2999 (class 0 OID 0)
-- Dependencies: 214
-- Name: user_role_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.user_role_id_seq OWNED BY public.user_role.id;


--
-- TOC entry 215 (class 1259 OID 107644)
-- Name: users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.users (
    id integer NOT NULL,
    email character varying,
    password character varying,
    created_at date
);


--
-- TOC entry 216 (class 1259 OID 107650)
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
-- TOC entry 3000 (class 0 OID 0)
-- Dependencies: 216
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- TOC entry 2801 (class 2604 OID 107652)
-- Name: categories id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.categories ALTER COLUMN id SET DEFAULT nextval('public.categories_id_seq'::regclass);


--
-- TOC entry 2802 (class 2604 OID 107653)
-- Name: logs id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.logs ALTER COLUMN id SET DEFAULT nextval('public.logs_id_seq'::regclass);


--
-- TOC entry 2803 (class 2604 OID 107654)
-- Name: roles id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.roles ALTER COLUMN id SET DEFAULT nextval('public.role_id_seq'::regclass);


--
-- TOC entry 2804 (class 2604 OID 107655)
-- Name: statuses id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.statuses ALTER COLUMN id SET DEFAULT nextval('public.status_id_seq'::regclass);


--
-- TOC entry 2805 (class 2604 OID 107656)
-- Name: topic_canceled id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.topic_canceled ALTER COLUMN id SET DEFAULT nextval('public.topic_canceled_id_seq'::regclass);


--
-- TOC entry 2811 (class 2604 OID 107657)
-- Name: topics id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.topics ALTER COLUMN id SET DEFAULT nextval('public.topics_id_seq'::regclass);


--
-- TOC entry 2812 (class 2604 OID 107658)
-- Name: topics topic_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.topics ALTER COLUMN topic_id SET DEFAULT nextval('public.topics_topic_id_seq'::regclass);


--
-- TOC entry 2816 (class 2604 OID 107659)
-- Name: topics_backup id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.topics_backup ALTER COLUMN id SET DEFAULT nextval('public.topics_backup_id_seq'::regclass);


--
-- TOC entry 2817 (class 2604 OID 107660)
-- Name: user_role id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_role ALTER COLUMN id SET DEFAULT nextval('public.user_role_id_seq'::regclass);


--
-- TOC entry 2818 (class 2604 OID 107661)
-- Name: users id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- TOC entry 2966 (class 0 OID 107570)
-- Dependencies: 198
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.categories VALUES (1, 'Sách nói', NULL, NULL, 'audio_book', 'Audiobook', 1, true, true, NULL, NULL, '2019-01-02 16:48:22.099312', '2021-03-24 04:49:42.664775');
INSERT INTO public.categories VALUES (2, 'Podcast', NULL, NULL, 'podcast', 'Podcast', 3, true, true, NULL, NULL, '2019-08-13 07:02:10.179103', '2021-03-16 13:52:28.630329');
INSERT INTO public.categories VALUES (3, 'Sách tóm tắt', NULL, NULL, 'summary_book', 'SummaryBook', 4, true, true, NULL, NULL, '2020-07-15 08:48:59.652113', '2021-03-16 13:52:18.860619');
INSERT INTO public.categories VALUES (4, 'Truyện nói', NULL, NULL, 'story_book', 'Storybook', 2, true, true, NULL, NULL, '2021-03-16 13:51:41.513635', '2021-04-20 01:48:06.371936');
INSERT INTO public.categories VALUES (5, 'Thiếu nhi', NULL, NULL, 'children_book', 'ChildrenBook', 5, true, true, NULL, NULL, '2021-03-16 13:52:02.91401', '2021-03-23 15:45:41.331133');
INSERT INTO public.categories VALUES (6, 'Sách Văn học', 1, 1, 'sach_van_hoc', 'Audiobook', 100, false, false, NULL, '2021-10-13 20:46:08.361166', '2019-01-03 15:12:33.220229', '2020-05-25 02:20:09.30221');
INSERT INTO public.categories VALUES (7, 'Sách Kinh tế', 1, 1, 'sach_kinh_te', 'Audiobook', 100, false, false, NULL, '2021-10-13 20:46:08.36456', '2019-01-03 15:12:33.316557', '2020-05-25 02:20:09.556741');
INSERT INTO public.categories VALUES (8, 'Sách Thiếu nhi', 1, 1, 'sach_thieu_nhi', 'Audiobook', 100, false, false, NULL, '2021-10-13 20:46:08.367374', '2019-01-03 15:12:33.414786', '2020-05-25 02:20:09.800502');
INSERT INTO public.categories VALUES (9, 'Sách kỹ năng - Sống đẹp', 1, 1, 'sach_ky_nang_song_dep', 'Audiobook', 100, false, false, NULL, '2021-10-13 20:46:08.370289', '2019-01-03 15:12:33.510728', '2020-05-25 02:20:10.534611');
INSERT INTO public.categories VALUES (10, 'Sách bà mẹ - em bé', 1, 1, 'sach_ba_me_em_be', 'Audiobook', 100, false, false, NULL, '2021-10-13 20:46:08.373435', '2019-01-03 15:12:33.605902', '2020-05-25 02:20:11.033048');
INSERT INTO public.categories VALUES (11, 'Kiến thức tổng hợp', 1, 1, 'kien_thuc_tong_hop', 'Audiobook', 100, false, false, NULL, '2021-10-13 20:46:08.376306', '2019-01-03 15:12:33.706924', '2020-05-25 02:20:13.680699');
INSERT INTO public.categories VALUES (12, 'Truyện tranh, Manga, Comic', 1, 1, 'truyen_tranh_manga_comic', 'Audiobook', 100, false, false, NULL, '2021-10-13 20:46:08.379188', '2019-01-03 15:12:33.803358', '2020-05-25 02:20:12.484641');
INSERT INTO public.categories VALUES (13, 'Sách lịch sử', 1, 1, 'sach_lich_su', 'Audiobook', 100, false, false, NULL, '2021-10-13 20:46:08.382019', '2019-01-03 15:12:33.901906', '2020-05-25 02:20:13.92072');
INSERT INTO public.categories VALUES (14, 'Sách khoa học - kỹ thuật', 1, 1, 'sach_khoa_hoc_ky_thuat', 'Audiobook', 100, false, false, NULL, '2021-10-13 20:46:08.384913', '2019-01-03 15:12:34.003', '2020-05-25 02:20:14.158739');
INSERT INTO public.categories VALUES (15, 'Sách nghệ thuật', 1, 1, 'sach_nghe_thuat', 'Audiobook', 100, false, false, NULL, '2021-10-13 20:46:08.387984', '2019-01-03 15:12:34.099299', '2020-05-25 02:20:14.413486');
INSERT INTO public.categories VALUES (16, 'Sách tôn giáo tâm linh', 1, 1, 'sach_ton_giao_tam_linh', 'Audiobook', 100, false, false, NULL, '2021-10-13 20:46:08.391087', '2019-01-03 15:12:34.19463', '2020-05-25 02:20:11.504895');
INSERT INTO public.categories VALUES (17, 'Pháp luật', 1, 1, 'phap_luat', 'Audiobook', 100, false, false, '', '2021-10-13 20:46:08.393852', '2019-01-03 15:12:34.295408', '2020-09-30 03:36:43.696154');
INSERT INTO public.categories VALUES (18, 'Sách văn hoá du lịch', 1, 1, 'sach_van_hoa_du_lich', 'Audiobook', 100, false, false, NULL, '2021-10-13 20:46:08.396646', '2019-01-03 15:12:34.400352', '2020-05-25 02:20:14.890379');
INSERT INTO public.categories VALUES (19, 'Sách Nông - Lâm - Ngư nghiệp', 1, 1, 'sach_nong_lam_ngu_nghiep', 'Audiobook', 100, false, false, NULL, '2021-10-13 20:46:08.399569', '2019-01-03 15:12:34.499697', '2020-05-25 02:20:15.13385');
INSERT INTO public.categories VALUES (20, 'Sách Y học - Sức khoẻ', 1, 1, 'sach_y_hoc_suc_khoe', 'Audiobook', 100, false, false, NULL, '2021-10-13 20:46:08.402459', '2019-01-03 15:12:34.594676', '2020-05-25 02:20:11.761508');
INSERT INTO public.categories VALUES (21, 'Sách Tâm lý - giới tinh', 1, 1, 'sach_tam_ly_gioi_tinh', 'Audiobook', 100, false, false, NULL, '2021-10-13 20:46:08.405204', '2019-01-03 15:12:34.693414', '2020-05-25 02:20:10.055676');
INSERT INTO public.categories VALUES (22, 'Sách Thường thức đời sống', 1, 1, 'sach_thuong_thuc_doi_song', 'Audiobook', 100, false, false, NULL, '2021-10-13 20:46:08.40832', '2019-01-03 15:12:34.788718', '2020-05-25 02:20:10.298038');
INSERT INTO public.categories VALUES (23, 'Đầu tư', 1, 1, 'dau_tu', 'Audiobook', 100, false, false, '', '2021-10-13 20:46:08.411193', '2019-01-03 15:12:34.886106', '2020-09-30 03:37:05.060666');
INSERT INTO public.categories VALUES (24, 'Tạp chí - Catalogue', 1, 1, 'tap_chi_catalogue', 'Audiobook', 100, false, false, NULL, '2021-10-13 20:46:08.414024', '2019-01-03 15:12:34.987462', '2020-05-25 02:20:10.78178');
INSERT INTO public.categories VALUES (25, 'Từ Điển', 1, 1, 'tu_dien', 'Audiobook', 100, false, false, NULL, '2021-10-13 20:46:08.416746', '2019-01-03 15:12:35.08553', '2020-05-25 02:20:12.238929');
INSERT INTO public.categories VALUES (26, 'Ngôn ngữ', 1, 1, 'ngon_ngu', 'Audiobook', 100, false, false, NULL, '2021-10-13 20:46:08.419572', '2019-01-03 15:12:35.185375', '2020-05-25 02:20:11.269293');
INSERT INTO public.categories VALUES (27, 'Kinh tế', 2, 2, 'kinh_te', 'Podcast', 9, false, false, NULL, '2021-10-13 20:46:08.422405', '2019-08-13 07:03:54.923661', '2020-05-25 02:20:15.862587');
INSERT INTO public.categories VALUES (28, 'Văn học', 2, 2, 'van_hoc', 'Podcast', 5, false, false, NULL, '2021-10-13 20:46:08.425353', '2019-08-13 07:04:13.681327', '2020-05-25 02:20:08.534562');
INSERT INTO public.categories VALUES (29, 'Lãnh đạo', 2, 2, 'lanh_dao', 'Podcast', 9, false, false, NULL, '2021-10-13 20:46:08.42823', '2019-08-13 07:04:23.769268', '2020-05-25 02:20:08.775974');
INSERT INTO public.categories VALUES (30, 'Gia đình', 2, 2, 'gia_dinh', 'Podcast', 6, false, false, NULL, '2021-10-13 20:46:08.431163', '2019-08-13 07:04:33.254664', '2020-05-25 02:20:07.328582');
INSERT INTO public.categories VALUES (31, 'Kỹ năng', 2, 2, 'ky_nang', 'Podcast', 7, false, false, NULL, '2021-10-13 20:46:08.43401', '2019-08-13 07:04:40.845156', '2020-05-25 02:19:52.283414');
INSERT INTO public.categories VALUES (32, 'Pháp thoại', 2, 2, 'phap_thoai', 'Podcast', 4, true, true, '', NULL, '2019-08-13 07:04:51.400866', '2021-03-24 02:29:04.889896');
INSERT INTO public.categories VALUES (33, 'Khởi nghiệp', 2, 2, 'khoi_nghiep', 'Podcast', 9, false, false, NULL, '2021-10-13 20:46:08.439625', '2019-08-13 07:04:58.90832', '2020-05-25 02:19:54.673431');
INSERT INTO public.categories VALUES (34, 'Học ngoại ngữ', 2, 2, 'hoc_ngoai_ngu', 'Podcast', 10, true, true, '', NULL, '2019-08-13 07:05:12.259442', '2020-10-28 07:07:23.954018');
INSERT INTO public.categories VALUES (35, 'Tâm sự', 2, 2, 'tam_su', 'Podcast', 8, true, true, '', NULL, '2019-08-13 07:05:17.833792', '2020-09-25 15:31:01.513972');
INSERT INTO public.categories VALUES (36, 'Giải trí', 2, 2, 'giai_tri', 'Podcast', 2, true, true, 'Giải trí', NULL, '2019-08-26 05:07:20.29215', '2021-03-24 02:28:13.886169');
INSERT INTO public.categories VALUES (37, 'Tin tức', 2, 2, 'tin_tuc', 'Podcast', 1, true, true, 'Tin tức', NULL, '2019-08-26 05:07:38.638259', '2020-06-04 02:08:58.678415');
INSERT INTO public.categories VALUES (38, 'Sự Nghiệp', 2, 2, 'su_nghiep', 'Podcast', 3, false, false, NULL, '2021-10-13 20:46:08.453909', '2019-08-26 05:07:59.098696', '2020-05-25 02:19:47.45956');
INSERT INTO public.categories VALUES (39, 'Văn học', 1, 1, 'van_hoc', 'Audiobook', 6, false, false, NULL, '2021-10-13 20:46:08.456892', '2019-08-26 05:11:02.536635', '2020-05-25 02:19:46.986287');
INSERT INTO public.categories VALUES (40, 'Lãnh đạo', 1, 1, 'lanh_dao', 'Audiobook', 10, true, true, '', NULL, '2019-08-26 05:11:02.719603', '2020-09-03 09:45:48.302102');
INSERT INTO public.categories VALUES (41, 'Sắp phát hành', 1, 1, 'coming_soon', 'Audiobook', 1, true, true, 'Sắp phát hành', NULL, '2019-08-26 05:11:02.90118', '2021-05-05 08:53:10.915238');
INSERT INTO public.categories VALUES (42, 'Kinh tế', 1, 1, 'kinh_te', 'Audiobook', 2, false, false, NULL, '2021-10-13 20:46:08.46546', '2019-08-26 05:11:03.09343', '2020-05-25 02:19:45.276434');
INSERT INTO public.categories VALUES (43, 'Tâm lý', 1, 1, 'tam_ly', 'Audiobook', 14, true, true, '', NULL, '2019-08-26 05:11:03.646703', '2021-05-05 08:22:10.29891');
INSERT INTO public.categories VALUES (44, 'Kỹ năng', 1, 1, 'ky_nang', 'Audiobook', 3, true, true, 'Kỹ năng mềm', NULL, '2019-08-26 05:11:03.830487', '2021-03-24 02:25:24.122693');
INSERT INTO public.categories VALUES (45, 'Hạnh phúc', 1, 1, 'hanh_phuc', 'Audiobook', 6, true, true, '', NULL, '2019-08-26 05:11:04.012782', '2021-03-24 02:25:47.031869');
INSERT INTO public.categories VALUES (46, 'Khởi nghiệp', 1, 1, 'khoi_nghiep', 'Audiobook', 9, false, false, NULL, '2021-10-13 20:46:08.478248', '2019-08-26 05:11:04.197077', '2020-05-25 02:20:16.347897');
INSERT INTO public.categories VALUES (47, 'Ngoại ngữ', 1, 1, 'ngoai_ngu', 'Audiobook', 9, false, false, NULL, '2021-10-13 20:46:08.480986', '2019-08-26 05:11:04.381931', '2020-05-25 02:20:15.621031');
INSERT INTO public.categories VALUES (48, 'Văn học Quốc tế Hiện đại', 4, 4, 'van_hoc_quoc_te_hien_dai', 'Storybook', 4, true, true, '', NULL, '2019-08-26 05:11:04.567489', '2021-04-04 05:02:54.875189');
INSERT INTO public.categories VALUES (49, 'An lạc', 2, 2, 'an_lac', 'Podcast', 10, false, false, NULL, '2021-10-13 20:46:08.486745', '2019-10-01 03:58:23.702737', '2020-05-25 02:19:53.477539');
INSERT INTO public.categories VALUES (50, 'Hôn nhân', 2, 2, 'hon_nhan', 'Podcast', 12, false, false, NULL, '2021-10-13 20:46:08.489564', '2019-10-01 03:58:23.879223', '2020-05-25 02:19:54.435418');
INSERT INTO public.categories VALUES (51, 'Kinh doanh', 2, 2, 'kinh_doanh', 'Podcast', 12, false, false, NULL, '2021-10-13 20:46:08.492372', '2019-10-01 03:58:24.066209', '2020-05-25 02:19:54.192279');
INSERT INTO public.categories VALUES (52, 'Văn hoá', 2, 2, 'van_hoa', 'Podcast', 1, true, true, '', NULL, '2019-10-01 03:58:24.247253', '2021-03-24 02:28:04.756668');
INSERT INTO public.categories VALUES (53, 'Hoa học trò', 2, 2, 'hoa_hoc_tro', 'Podcast', 2, false, false, 'Hoa Học Trò Magazine', '2021-10-13 20:46:08.498144', '2019-10-01 03:58:24.431005', '2021-01-04 11:44:05.149141');
INSERT INTO public.categories VALUES (55, 'Kiến thức', 2, 2, 'kien_thuc', 'Podcast', 3, true, true, 'Kinh tế - Xã hội', NULL, '2019-10-01 03:58:24.788044', '2021-06-08 10:49:38.173494');
INSERT INTO public.categories VALUES (56, 'Thiếu nhi', 5, 5, 'thieu_nhi', 'ChildrenBook', 1, true, true, 'Thiếu nhi', NULL, '2019-10-01 03:58:24.965638', '2021-03-23 15:45:35.909576');
INSERT INTO public.categories VALUES (57, 'Ngủ Ngon', 2, 2, 'ngu_ngon', 'Podcast', 6, true, true, '', NULL, '2019-10-01 03:58:25.145943', '2021-03-24 02:29:20.225248');
INSERT INTO public.categories VALUES (58, 'Kinh dị', 2, 2, 'kinh_di', 'Podcast', 5, true, true, 'Truyện Ma ghê rợn', NULL, '2019-10-01 03:58:25.325625', '2021-03-24 02:29:11.880159');
INSERT INTO public.categories VALUES (59, 'Tâm linh', 1, 1, 'tam_linh', 'Audiobook', 2, true, true, 'Bình an tâm hồn', NULL, '2019-10-01 04:02:47.673351', '2021-03-24 02:25:05.429423');
INSERT INTO public.categories VALUES (60, 'Lứa đôi', 1, 1, 'lua_doi', 'Audiobook', 8, true, true, '', NULL, '2019-10-01 04:02:47.868265', '2020-10-28 07:59:40.590009');
INSERT INTO public.categories VALUES (61, 'Công nghệ', 1, 1, 'cong_nghe', 'Audiobook', 12, true, true, '', NULL, '2019-10-01 04:02:48.07602', '2020-09-03 09:53:53.001994');
INSERT INTO public.categories VALUES (63, 'Công sở', 1, 1, 'cong_so', 'Audiobook', 13, false, false, '', '2021-10-13 20:46:08.526426', '2019-10-01 04:02:48.528981', '2021-05-05 08:55:14.696363');
INSERT INTO public.categories VALUES (64, 'Ngôn tình', 4, 4, 'ngon_tinh', 'Storybook', 3, true, true, '', NULL, '2019-10-01 04:02:48.728269', '2021-03-24 02:27:10.315012');
INSERT INTO public.categories VALUES (65, 'Thơ', 1, 1, 'tho', 'Audiobook', 20, false, false, '', '2019-10-15 04:02:48.966902', '2019-10-01 04:02:48.966902', '2020-09-30 03:37:13.964855');
INSERT INTO public.categories VALUES (54, 'Radio', 2, 2, 'radio', 'Podcast', 4, false, false, '', '2019-10-15 03:58:24.611497', '2019-10-01 03:58:24.611497', '2020-09-30 03:32:02.283517');
INSERT INTO public.categories VALUES (66, 'Kinh doanh', 1, 1, 'kinh_doanh', 'Audiobook', 13, true, true, 'Kinh doanh - Khởi nghiệp', NULL, '2019-10-01 04:02:49.178704', '2021-05-05 08:55:36.695163');
INSERT INTO public.categories VALUES (67, 'Lịch sử', 1, 1, 'lich_su', 'Audiobook', 6, true, true, 'Dân ta phải biết Sử ta', NULL, '2019-10-01 04:02:49.377817', '2021-03-24 02:26:01.758061');
INSERT INTO public.categories VALUES (68, 'Marketing', 1, 1, 'marketing', 'Audiobook', 11, true, true, '', NULL, '2019-10-01 04:02:49.577173', '2020-09-03 09:46:12.953782');
INSERT INTO public.categories VALUES (69, 'Con cái', 1, 1, 'con_cai', 'Audiobook', 2, true, true, 'Nuôi dạy con', NULL, '2019-10-01 04:02:49.762671', '2020-10-28 07:33:51.797317');
INSERT INTO public.categories VALUES (70, 'Thành công', 1, 1, 'thanh_cong', 'Audiobook', 4, true, true, 'Phát triển bản thân', NULL, '2019-10-01 04:02:49.955956', '2021-03-24 02:25:35.814655');
INSERT INTO public.categories VALUES (71, 'Sức khoẻ', 1, 1, 'suc_khoe', 'Audiobook', 9, true, true, '', NULL, '2019-10-01 04:02:50.150878', '2020-09-03 09:45:10.149604');
INSERT INTO public.categories VALUES (72, 'Trinh thám', 4, 4, 'trinh_tham', 'Storybook', 6, true, true, '', NULL, '2019-10-01 04:02:50.393043', '2021-03-24 02:27:41.160092');
INSERT INTO public.categories VALUES (73, 'Kinh điển Việt Nam', 4, 4, 'kinh_dien_viet_nam', 'Storybook', 1, true, true, 'Việt Nam Danh Tác', NULL, '2019-10-01 04:02:50.652091', '2021-04-04 05:03:32.286975');
INSERT INTO public.categories VALUES (74, 'Kinh điển Quốc tế', 4, 4, 'kinh_dien_quoc_te', 'Storybook', 2, true, true, '', NULL, '2019-10-01 04:02:50.867108', '2021-03-24 02:26:52.496913');
INSERT INTO public.categories VALUES (75, 'Văn học VN Hiện đại', 4, 4, 'van_hoc_vn_hien_dai', 'Storybook', 5, true, true, '', NULL, '2019-10-01 04:02:51.079379', '2021-04-04 05:02:36.171824');
INSERT INTO public.categories VALUES (76, 'Tóm tắt sách', 2, 2, 'tom_tat_sach', 'Podcast', 10, false, false, 'Tóm tắt sách - Nghe ít, Hiểu nhiều	', '2021-10-13 20:46:08.56213', '2019-10-01 04:02:51.331269', '2020-09-25 05:46:30.343117');
INSERT INTO public.categories VALUES (77, 'Danh nhân', 1, 1, 'danh_nhan', 'Audiobook', 3, true, true, '', NULL, '2019-10-01 04:02:51.529165', '2021-03-18 05:47:45.57931');
INSERT INTO public.categories VALUES (78, 'Thiền - Tĩnh tâm', 2, 2, 'thien_tinh_tam', 'Podcast', 7, true, true, '', NULL, '2019-10-03 04:09:36.171055', '2020-09-25 15:26:29.456759');
INSERT INTO public.categories VALUES (79, 'English books', 1, 1, 'english_books', 'Audiobook', 17, false, false, '', '2021-10-13 20:46:08.570579', '2019-10-03 04:10:10.35233', '2021-05-05 08:55:08.803374');
INSERT INTO public.categories VALUES (80, 'Sách tóm tắt', 3, 3, 'sach_tom_tat', 'SummaryBook', 1, true, true, '', NULL, '2020-07-15 08:49:55.337704', '2020-07-31 16:30:14.808381');
INSERT INTO public.categories VALUES (81, 'HBR Audio', NULL, NULL, 'hbr_audio', 'HbrAudio', 0, true, true, 'HBR Audio', NULL, '2021-10-13 20:46:08.585838', '2021-10-13 20:46:08.585838');
INSERT INTO public.categories VALUES (82, 'HBR Audio', 81, 81, 'khoa_hoc', 'HbrAudio', 0, true, true, 'HBR Audio', NULL, '2021-10-13 20:46:08.587954', '2021-10-13 20:46:08.587954');
INSERT INTO public.categories VALUES (62, 'Đầu tư', 1, 1, 'dau_tu', 'Audiobook', 19, false, false, '', '2021-10-15 20:46:08.411193', '2019-10-01 04:02:48.288979', '2020-09-30 03:37:22.725956');


--
-- TOC entry 2968 (class 0 OID 107581)
-- Dependencies: 200
-- Data for Name: logs; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.logs VALUES (154, 15, 'status_id', '1', '10', NULL);
INSERT INTO public.logs VALUES (155, 10, 'status_id', '1', '7', NULL);
INSERT INTO public.logs VALUES (156, 15, 'status_id', '10', '3', NULL);
INSERT INTO public.logs VALUES (157, 15, 'status_id', '3', '7', NULL);
INSERT INTO public.logs VALUES (158, NULL, 'status_id', '7', '1', NULL);
INSERT INTO public.logs VALUES (159, NULL, 'status_id', '1', '7', NULL);
INSERT INTO public.logs VALUES (160, NULL, 'status_id', '7', '8', NULL);
INSERT INTO public.logs VALUES (161, NULL, 'status_id', '1', '8', NULL);
INSERT INTO public.logs VALUES (162, NULL, 'status_id', '1', '8', NULL);
INSERT INTO public.logs VALUES (163, NULL, 'status_id', '1', '8', NULL);
INSERT INTO public.logs VALUES (164, NULL, 'status_id', '1', '8', NULL);
INSERT INTO public.logs VALUES (165, NULL, 'status_id', '1', '8', NULL);
INSERT INTO public.logs VALUES (166, NULL, 'status_id', '1', '7', NULL);
INSERT INTO public.logs VALUES (167, NULL, 'status_id', '1', '8', NULL);
INSERT INTO public.logs VALUES (168, NULL, 'status_id', '1', '8', NULL);
INSERT INTO public.logs VALUES (169, NULL, 'status_id', '1', '8', NULL);
INSERT INTO public.logs VALUES (170, NULL, 'status_id', '1', '8', NULL);
INSERT INTO public.logs VALUES (171, NULL, 'status_id', '1', '12', NULL);
INSERT INTO public.logs VALUES (172, NULL, 'category_level_1', NULL, '3', NULL);
INSERT INTO public.logs VALUES (173, NULL, 'category_level_2', NULL, '80', NULL);
INSERT INTO public.logs VALUES (174, NULL, 'description', NULL, 'Thần hổ', NULL);
INSERT INTO public.logs VALUES (175, NULL, 'type_of_sale', NULL, 'Free', NULL);
INSERT INTO public.logs VALUES (176, NULL, 'contracted_at', NULL, '2/3/2022', NULL);
INSERT INTO public.logs VALUES (177, NULL, 'contract_term', NULL, '1', NULL);
INSERT INTO public.logs VALUES (178, NULL, 'cover_price', NULL, '1', NULL);
INSERT INTO public.logs VALUES (179, NULL, 'royalty', NULL, '1', NULL);
INSERT INTO public.logs VALUES (180, NULL, 'copyright_price', NULL, '1', NULL);
INSERT INTO public.logs VALUES (181, NULL, 'translation_cost', NULL, '1', NULL);
INSERT INTO public.logs VALUES (182, NULL, 'buy_permission', NULL, '1', NULL);
INSERT INTO public.logs VALUES (183, NULL, 'partner_note', NULL, '1', NULL);
INSERT INTO public.logs VALUES (184, NULL, 'voice_note', NULL, '1', NULL);
INSERT INTO public.logs VALUES (185, NULL, 'contract_note', NULL, 'undefined', NULL);
INSERT INTO public.logs VALUES (186, NULL, 'release_date', NULL, '1', NULL);
INSERT INTO public.logs VALUES (187, NULL, 'status_id', '13', '16', NULL);
INSERT INTO public.logs VALUES (188, NULL, 'status_id', '16', '20', NULL);
INSERT INTO public.logs VALUES (189, NULL, 'status_id', '1', '12', NULL);
INSERT INTO public.logs VALUES (190, NULL, 'category_level_1', NULL, '4', NULL);
INSERT INTO public.logs VALUES (191, NULL, 'category_level_2', NULL, '75', NULL);
INSERT INTO public.logs VALUES (192, NULL, 'description', NULL, 'Nếu người đàn bà sinh ra chỉ để làm bạn với bếp núc, thì cái câu “Giặc đến nhà đàn bà phải đánh” chẳng là vô nghĩa lắm?
Không, giang san đôi gánh nặng, trách nhiệm gái trai chung, nếu tài lực và tâm đức cho phép thì đối với xã hội, ngưài đàn bà cũng phải có một phần nhiệm vụ như người đàn ông vậy.
Và nếu quốc gia, xã hội mà đòi hỏi, thì người đàn bà cũng phải vứt chỉ kim mà đứng dậy, đạp gai góc để lên đường.
Trong lịch sử nước nhà, hai bà Trưng, một bà Triệu, há không là tấm gương sáng nghìn thu cho nữ nhi ta đấy ư?
Lệ Hằng, nhân vật chính của Bóng người xưa, là điển hình của loại nhân vật cao thượng ấy trong thời Pháp thuộc. Là một cô gái có sắc, có tài, lại có lòng yêu nước, cô phải làm thế nào để thực hiện chí nguyện của cô?    .
Lệ Hằng tham gia một đảng chống Pháp và lãnh nhiệm vụ cung cấp tài chính. Cô lấy chồng là Anh Kiệt, một nhà tư sản giàu có theo sự phân công của tổ chức đảng, và lấy tiền của Anh Kiệt trao cho tổ chức.
Sự hy sinh của cô đáng quý mến, mà cách hành động của cô cũng đáng ghi chép. Nhưng Anh Kiệt không phải là người chỉ biết tiền. Với cô, anh còn là người chồng chung thủy. Bên tình, bên nghĩa, cô phải làm sao? Và làm sao trong tình thế ấy, cô phải xử trí như thế nào để người bạn trăm năm của cô khỏi phải vì cô mà mang họa? Lệ Hằng đã dùng đến chước “kim thiền thoát xác” để trọn vẹn một gánh nghĩa tình.
Nhưng cốt truyện không phải đến đây là dứt. Ta thấy cái cao quý của người đàn bà Việt Nam ở nhân cách cô Thúy Ái, một nhân vật chính khác.
Về sống bên chồng giữa một không khí không chút thuận lợi, thế mà ngày một ngày hai, với cử chỉ đoan trang mà điềm đạm, với đức độ bao dung mà khiêm tốn, cô đã chinh phục được tất cả những người quanh cô.
Và cái đáng quý nhất là một khi biết được hành tung và tâm chí của Lệ Hằng, Thúy Ái đã tình nguyện nhận nhiệm vụ tiếp tế mà không một chút ghen tuông, ganh tị.
Hơn thế nữa, cô còn tự vận dụng tài sức của mình để làm ra của cải, chứ không khoanh tay ngồi dùng sẵn của chồng. Một tấm gương hoạt động cho các bà chủ gia đình ở chốn gác tía lầu son.
Trong công cuộc kiến thiết nước nhà, người như cô Lệ Hằng cần phải ra mặt góp sức với nhân dân, và người như Thúy Ái phải trở thành một gương mẫu chung cho cả thế hệ.
Đó là điều tác giả hằng mong mỏi.', NULL);
INSERT INTO public.logs VALUES (193, NULL, 'type_of_sale', NULL, 'Vip', NULL);
INSERT INTO public.logs VALUES (194, NULL, 'contracted_at', NULL, '07/03/2022', NULL);
INSERT INTO public.logs VALUES (195, NULL, 'contract_term', NULL, '5', NULL);
INSERT INTO public.logs VALUES (196, NULL, 'cover_price', NULL, '92000', NULL);
INSERT INTO public.logs VALUES (197, NULL, 'royalty', NULL, '25', NULL);
INSERT INTO public.logs VALUES (198, NULL, 'copyright_price', NULL, '2000000', NULL);
INSERT INTO public.logs VALUES (199, NULL, 'translation_cost', NULL, 'undefined', NULL);
INSERT INTO public.logs VALUES (200, NULL, 'buy_permission', NULL, 'audio', NULL);
INSERT INTO public.logs VALUES (201, NULL, 'partner_note', NULL, 'undefined', NULL);
INSERT INTO public.logs VALUES (202, NULL, 'voice_note', NULL, 'Giọng Sài Gòn: giọng miền Nam chuẩn, không ngọng, không tiếng địa phương (ví dụ: "r" với "g", "tr" với "t")', NULL);
INSERT INTO public.logs VALUES (203, NULL, 'contract_note', NULL, 'undefined', NULL);
INSERT INTO public.logs VALUES (204, NULL, 'release_date', NULL, '07/09/2022', NULL);
INSERT INTO public.logs VALUES (205, NULL, 'status_id', '1', '12', NULL);
INSERT INTO public.logs VALUES (206, NULL, 'status_id', '1', '7', NULL);
INSERT INTO public.logs VALUES (207, NULL, 'status_id', '7', '6', NULL);
INSERT INTO public.logs VALUES (208, NULL, 'status_id', '6', '2', NULL);
INSERT INTO public.logs VALUES (209, NULL, 'status_id', '1', '12', NULL);
INSERT INTO public.logs VALUES (210, NULL, 'status_id', '2', '12', NULL);
INSERT INTO public.logs VALUES (211, NULL, 'category_level_1', NULL, '1', NULL);
INSERT INTO public.logs VALUES (212, NULL, 'category_level_2', NULL, '8,11', NULL);
INSERT INTO public.logs VALUES (213, NULL, 'description', NULL, 'Dropbox', NULL);
INSERT INTO public.logs VALUES (214, NULL, 'type_of_sale', NULL, 'Vip', NULL);
INSERT INTO public.logs VALUES (215, NULL, 'contract_term', NULL, '3', NULL);
INSERT INTO public.logs VALUES (216, NULL, 'cover_price', NULL, '138000', NULL);
INSERT INTO public.logs VALUES (217, NULL, 'royalty', NULL, '50', NULL);
INSERT INTO public.logs VALUES (218, NULL, 'category_level_2', '8,11', '11', NULL);
INSERT INTO public.logs VALUES (219, NULL, 'contracted_at', NULL, '20/09/2021', NULL);
INSERT INTO public.logs VALUES (220, NULL, 'description', 'Dropbox', 'Dropbox
https://www.dropbox.com/scl/fi/trh302r5czhp831kmavbi/Gi-i-thi-u-s-ch-Tr-Em-L-Thi-n-T-i.docx?dl=0&rlkey=8249em4149j39pyppb0pc4fnb', NULL);
INSERT INTO public.logs VALUES (221, NULL, 'contracted_at', NULL, '20/09/2021', NULL);
INSERT INTO public.logs VALUES (222, NULL, 'contract_term', NULL, '3', NULL);
INSERT INTO public.logs VALUES (223, NULL, 'cover_price', NULL, '138000', NULL);
INSERT INTO public.logs VALUES (224, NULL, 'royalty', NULL, '50', NULL);
INSERT INTO public.logs VALUES (225, NULL, 'contract_term', '3', '19/03/2024', NULL);
INSERT INTO public.logs VALUES (226, NULL, 'contracted_at', 'Invalid date', '20/09/2021', NULL);
INSERT INTO public.logs VALUES (227, NULL, 'status_id', '1', '12', NULL);
INSERT INTO public.logs VALUES (228, NULL, 'category_level_1', NULL, '1', NULL);
INSERT INTO public.logs VALUES (229, NULL, 'category_level_2', NULL, '11', NULL);
INSERT INTO public.logs VALUES (230, NULL, 'contract_term', NULL, '5', NULL);
INSERT INTO public.logs VALUES (231, NULL, 'contracted_at', NULL, '05/05/2021', NULL);
INSERT INTO public.logs VALUES (232, NULL, 'cover_price', NULL, '50.000 ₫', NULL);
INSERT INTO public.logs VALUES (233, NULL, 'royalty', NULL, '60%', NULL);
INSERT INTO public.logs VALUES (234, NULL, 'type_of_sale', NULL, 'Vip', NULL);
INSERT INTO public.logs VALUES (235, NULL, 'status_id', '1', '12', NULL);
INSERT INTO public.logs VALUES (236, NULL, 'category_level_1', NULL, '4', NULL);
INSERT INTO public.logs VALUES (237, NULL, 'category_level_2', NULL, '74', NULL);
INSERT INTO public.logs VALUES (238, NULL, 'contracted_at', NULL, '05/05/2021', NULL);
INSERT INTO public.logs VALUES (239, NULL, 'contract_term', NULL, '5', NULL);
INSERT INTO public.logs VALUES (240, NULL, 'cover_price', NULL, '68.000 ₫', NULL);
INSERT INTO public.logs VALUES (241, NULL, 'royalty', NULL, '60%', NULL);
INSERT INTO public.logs VALUES (242, NULL, 'copyright_price', NULL, '2.000.000 ₫', NULL);
INSERT INTO public.logs VALUES (243, NULL, 'contracted_at', '2021-05-05 00:00:00.000 +00:00', '05/05/2021', NULL);
INSERT INTO public.logs VALUES (244, NULL, 'cover_price', 'NaN', '50.000 ₫', NULL);
INSERT INTO public.logs VALUES (245, NULL, 'royalty', 'NaN', '25%', NULL);
INSERT INTO public.logs VALUES (246, NULL, 'contracted_at', '2021-05-05 00:00:00.000 +00:00', '05/05/2021', NULL);
INSERT INTO public.logs VALUES (247, NULL, 'cover_price', 'NaN', '50.000 ₫', NULL);
INSERT INTO public.logs VALUES (248, NULL, 'royalty', 'NaN', '25%', NULL);
INSERT INTO public.logs VALUES (249, NULL, 'contracted_at', '2021-05-05 00:00:00.000 +00:00', '05-05-2021', NULL);
INSERT INTO public.logs VALUES (250, NULL, 'cover_price', 'NaN', '50.000 ₫', NULL);
INSERT INTO public.logs VALUES (251, NULL, 'royalty', 'NaN', '25%', NULL);
INSERT INTO public.logs VALUES (252, NULL, 'contracted_at', '2021-05-05 00:00:00.000 +00:00', '05-05-2021', NULL);
INSERT INTO public.logs VALUES (253, NULL, 'cover_price', NULL, '68.000 ₫', NULL);
INSERT INTO public.logs VALUES (254, NULL, 'royalty', NULL, '25%', NULL);
INSERT INTO public.logs VALUES (255, NULL, 'contracted_at', '2021-05-05 00:00:00.000 +00:00', '05-05-2021', NULL);
INSERT INTO public.logs VALUES (256, NULL, 'cover_price', 'NaN', '50000', NULL);
INSERT INTO public.logs VALUES (257, NULL, 'royalty', 'NaN', '25', NULL);
INSERT INTO public.logs VALUES (258, NULL, 'contracted_at', '2021-05-05 00:00:00.000 +00:00', '05-05-2021', NULL);
INSERT INTO public.logs VALUES (259, NULL, 'cover_price', 'NaN', '68000', NULL);
INSERT INTO public.logs VALUES (260, NULL, 'keywords', 'Ernest hemingway, văn học phương tây ', '2000000 ', NULL);
INSERT INTO public.logs VALUES (261, NULL, 'royalty', 'NaN', '25', NULL);
INSERT INTO public.logs VALUES (262, NULL, 'status_id', '1', '12', NULL);
INSERT INTO public.logs VALUES (263, NULL, 'category_level_1', NULL, '1', NULL);
INSERT INTO public.logs VALUES (264, NULL, 'category_level_2', NULL, '62', NULL);
INSERT INTO public.logs VALUES (265, NULL, 'description', NULL, 'dropbox
https://www.dropbox.com/scl/fi/gsbb0xntm9ufdwxczx6nu/Gi-i-thi-u-s-ch-C-Phi-u-Th-ng-L-i-Nhu-n-Phi-Th-ng.docx?dl=0&rlkey=hhlrgbj017vu5wowxrz9got8d', NULL);
INSERT INTO public.logs VALUES (266, NULL, 'contracted_at', NULL, '22-10-2021', NULL);
INSERT INTO public.logs VALUES (267, NULL, 'contract_term', NULL, '3 năm', NULL);
INSERT INTO public.logs VALUES (268, NULL, 'cover_price', NULL, '199000', NULL);
INSERT INTO public.logs VALUES (269, NULL, 'royalty', NULL, '50', NULL);
INSERT INTO public.logs VALUES (270, NULL, 'copyright_price', NULL, '8015500 ', NULL);
INSERT INTO public.logs VALUES (271, NULL, 'status_id', '1', '12', NULL);
INSERT INTO public.logs VALUES (272, NULL, 'category_level_1', NULL, '1', NULL);
INSERT INTO public.logs VALUES (273, NULL, 'category_level_2', NULL, '70', NULL);
INSERT INTO public.logs VALUES (274, NULL, 'description', NULL, 'Dropbox
https://www.dropbox.com/scl/fi/p2ohxu3q3osunoqlvgdof/Gi-i-thi-u-s-ch-Chi-n-th-ng-tr-ch-i-trong-cu-c-s-ng.docx?dl=0&rlkey=diu0cf88rgduqe3ji9kf3d5i5', NULL);
INSERT INTO public.logs VALUES (275, NULL, 'type_of_sale', NULL, 'Vip', NULL);
INSERT INTO public.logs VALUES (276, NULL, 'contracted_at', NULL, '06-04-2021', NULL);
INSERT INTO public.logs VALUES (277, NULL, 'contract_term', NULL, '5', NULL);
INSERT INTO public.logs VALUES (278, NULL, 'cover_price', NULL, '95000 ', NULL);
INSERT INTO public.logs VALUES (279, NULL, 'royalty', NULL, '37,5', NULL);
INSERT INTO public.logs VALUES (280, NULL, 'copyright_price', NULL, '300 đô trên 1 tựa', NULL);
INSERT INTO public.logs VALUES (281, NULL, 'translation_cost', NULL, '0', NULL);
INSERT INTO public.logs VALUES (282, NULL, 'partner_note', NULL, '12,5 %', NULL);
INSERT INTO public.logs VALUES (283, NULL, 'status_id', '1', '12', NULL);
INSERT INTO public.logs VALUES (284, NULL, 'category_level_1', NULL, '1', NULL);
INSERT INTO public.logs VALUES (285, NULL, 'category_level_2', NULL, '44,70', NULL);
INSERT INTO public.logs VALUES (286, NULL, 'description', NULL, 'Dropbox https://www.dropbox.com/scl/fi/jx5m0itteotnnn6zgz07w/Gi-i-thi-u-s-ch-S-ng-can-m-i-vi-n-m-n.docx?dl=0&rlkey=r0onu4a6gzzzdkomkginux430', NULL);
INSERT INTO public.logs VALUES (287, NULL, 'type_of_sale', NULL, 'Vip', NULL);
INSERT INTO public.logs VALUES (288, NULL, 'contracted_at', NULL, '27-09-2021', NULL);
INSERT INTO public.logs VALUES (289, NULL, 'contract_term', NULL, '5', NULL);
INSERT INTO public.logs VALUES (290, NULL, 'cover_price', NULL, '109000', NULL);
INSERT INTO public.logs VALUES (291, NULL, 'royalty', NULL, '35', NULL);
INSERT INTO public.logs VALUES (292, NULL, 'status_id', '1', '12', NULL);
INSERT INTO public.logs VALUES (293, NULL, 'category_level_1', NULL, '4', NULL);
INSERT INTO public.logs VALUES (294, NULL, 'category_level_2', NULL, '74', NULL);
INSERT INTO public.logs VALUES (295, NULL, 'description', NULL, 'Dropbox https://www.dropbox.com/scl/fi/6nag3cs773hb6q7ljk0gx/Gi-i-thi-u-s-ch-Nh-n.docx?dl=0&rlkey=ksmaftvc4f8ek0cfrkz2tcy90', NULL);
INSERT INTO public.logs VALUES (296, NULL, 'type_of_sale', NULL, 'Vip', NULL);
INSERT INTO public.logs VALUES (297, NULL, 'contracted_at', NULL, '27-09-2021', NULL);
INSERT INTO public.logs VALUES (298, NULL, 'contract_term', NULL, '5', NULL);
INSERT INTO public.logs VALUES (299, NULL, 'cover_price', NULL, '68000', NULL);
INSERT INTO public.logs VALUES (300, NULL, 'royalty', NULL, '35', NULL);
INSERT INTO public.logs VALUES (301, NULL, 'status_id', '1', '12', NULL);
INSERT INTO public.logs VALUES (302, NULL, 'category_level_1', NULL, '1', NULL);
INSERT INTO public.logs VALUES (303, NULL, 'category_level_2', NULL, '70', NULL);
INSERT INTO public.logs VALUES (304, NULL, 'description', NULL, 'Dropbox
https://www.dropbox.com/scl/fi/p7g9l74a5j1721ub5ilw8/Gi-i-thi-u-s-ch-Chi-n-th-ng-cu-c-ch-i-th-k-21.docx?dl=0&rlkey=cmgiervj1nfuey32h8gaplzjj', NULL);
INSERT INTO public.logs VALUES (305, NULL, 'contracted_at', NULL, '06-04-2021', NULL);
INSERT INTO public.logs VALUES (306, NULL, 'contract_term', NULL, '5', NULL);
INSERT INTO public.logs VALUES (307, NULL, 'cover_price', NULL, '95000', NULL);
INSERT INTO public.logs VALUES (308, NULL, 'royalty', NULL, '37,5', NULL);
INSERT INTO public.logs VALUES (309, NULL, 'copyright_price', NULL, '300 đô trên 1 tựa', NULL);
INSERT INTO public.logs VALUES (310, NULL, 'translation_cost', NULL, '0', NULL);
INSERT INTO public.logs VALUES (311, NULL, 'partner_note', NULL, '12,5', NULL);
INSERT INTO public.logs VALUES (312, NULL, 'status_id', '1', '12', NULL);
INSERT INTO public.logs VALUES (313, NULL, 'category_level_1', NULL, '4', NULL);
INSERT INTO public.logs VALUES (314, NULL, 'category_level_2', NULL, '74', NULL);
INSERT INTO public.logs VALUES (315, NULL, 'description', NULL, '
', NULL);
INSERT INTO public.logs VALUES (316, NULL, 'contracted_at', NULL, '05-05-2021', NULL);
INSERT INTO public.logs VALUES (317, NULL, 'contract_term', NULL, '5', NULL);
INSERT INTO public.logs VALUES (318, NULL, 'cover_price', NULL, '129000', NULL);
INSERT INTO public.logs VALUES (319, NULL, 'royalty', NULL, '25', NULL);
INSERT INTO public.logs VALUES (320, NULL, 'copyright_price', NULL, '2000000', NULL);
INSERT INTO public.logs VALUES (321, NULL, 'status_id', '1', '12', NULL);
INSERT INTO public.logs VALUES (322, NULL, 'description', NULL, 'Dropbox https://www.dropbox.com/scl/fi/fhcsbiywh5y5ac5e6u89n/Gi-i-thi-u-s-ch-Chi-n-th-ng-tr-ch-i-ch-ng-kho-n.docx?dl=0&rlkey=qte7lmukpz7n34t1yigbtyadc', NULL);
INSERT INTO public.logs VALUES (323, NULL, 'contracted_at', NULL, '06-04-2021', NULL);
INSERT INTO public.logs VALUES (324, NULL, 'contract_term', NULL, '5', NULL);
INSERT INTO public.logs VALUES (325, NULL, 'cover_price', NULL, '240000', NULL);
INSERT INTO public.logs VALUES (326, NULL, 'royalty', NULL, '37,5', NULL);
INSERT INTO public.logs VALUES (327, NULL, 'copyright_price', NULL, '300 đô trên 1 tựa', NULL);
INSERT INTO public.logs VALUES (328, NULL, 'translation_cost', NULL, '0', NULL);
INSERT INTO public.logs VALUES (329, NULL, 'partner_note', NULL, '12,5', NULL);
INSERT INTO public.logs VALUES (330, NULL, 'status_id', '1', '12', NULL);
INSERT INTO public.logs VALUES (331, NULL, 'category_level_1', NULL, '1', NULL);
INSERT INTO public.logs VALUES (332, NULL, 'category_level_2', NULL, '44,70', NULL);
INSERT INTO public.logs VALUES (333, NULL, 'description', NULL, 'Dropbox https://www.dropbox.com/scl/fi/lj64dll5w24isbak51fa2/Gi-i-thi-u-s-ch-Ghi-Ch-Si-u-Ph-m.docx?dl=0&rlkey=smxarcj3jcoeh5oyrcji8dnub', NULL);
INSERT INTO public.logs VALUES (334, NULL, 'contracted_at', NULL, '21-10-2021', NULL);
INSERT INTO public.logs VALUES (335, NULL, 'contract_term', NULL, '5 ', NULL);
INSERT INTO public.logs VALUES (336, NULL, 'cover_price', NULL, '65000 ', NULL);
INSERT INTO public.logs VALUES (337, NULL, 'royalty', NULL, '25', NULL);
INSERT INTO public.logs VALUES (338, NULL, 'status_id', '1', '12', NULL);
INSERT INTO public.logs VALUES (339, NULL, 'category_level_1', NULL, '1', NULL);
INSERT INTO public.logs VALUES (340, NULL, 'category_level_2', NULL, '44,70', NULL);
INSERT INTO public.logs VALUES (341, NULL, 'description', NULL, 'Dropbox https://www.dropbox.com/scl/fi/duze64e3gnssqioxfsdl3/Gi-i-thi-u-s-ch-Kh-i-Nghi-p-T-Ti-m-Nh.docx?dl=0&rlkey=t26zdbz2p7dfx34euvf7hr8dw', NULL);
INSERT INTO public.logs VALUES (342, NULL, 'contracted_at', NULL, '21-10-2021', NULL);
INSERT INTO public.logs VALUES (343, NULL, 'contract_term', NULL, '5', NULL);
INSERT INTO public.logs VALUES (344, NULL, 'cover_price', NULL, '85000', NULL);
INSERT INTO public.logs VALUES (345, NULL, 'royalty', NULL, '25', NULL);
INSERT INTO public.logs VALUES (346, NULL, 'status_id', '1', '12', NULL);
INSERT INTO public.logs VALUES (347, NULL, 'category_level_1', NULL, '1', NULL);
INSERT INTO public.logs VALUES (348, NULL, 'category_level_2', NULL, '7,61', NULL);
INSERT INTO public.logs VALUES (349, NULL, 'contracted_at', NULL, '22-10-2021', NULL);
INSERT INTO public.logs VALUES (350, NULL, 'contract_term', NULL, '3', NULL);
INSERT INTO public.logs VALUES (351, NULL, 'cover_price', NULL, '299000', NULL);
INSERT INTO public.logs VALUES (352, NULL, 'royalty', NULL, '50', NULL);
INSERT INTO public.logs VALUES (353, NULL, 'copyright_price', NULL, '10948000', NULL);
INSERT INTO public.logs VALUES (354, NULL, 'status_id', '1', '12', NULL);
INSERT INTO public.logs VALUES (355, NULL, 'category_level_1', NULL, '1', NULL);
INSERT INTO public.logs VALUES (356, NULL, 'category_level_2', NULL, '69', NULL);
INSERT INTO public.logs VALUES (357, NULL, 'description', NULL, 'Dropbox https://www.dropbox.com/scl/fi/icbsnrzjabez4drmqns5q/gi-i-thi-u-cu-n-s-ch-Con-c-i-ch-ng-ta-u-gi-i.docx?dl=0&rlkey=tt36aebld282z1o1c5e5bwwt4', NULL);
INSERT INTO public.logs VALUES (358, NULL, 'type_of_sale', NULL, 'Vip', NULL);
INSERT INTO public.logs VALUES (359, NULL, 'contracted_at', NULL, '06-04-2021', NULL);
INSERT INTO public.logs VALUES (360, NULL, 'contract_term', NULL, '5', NULL);
INSERT INTO public.logs VALUES (361, NULL, 'cover_price', NULL, '100000', NULL);
INSERT INTO public.logs VALUES (362, NULL, 'royalty', NULL, '37,5', NULL);
INSERT INTO public.logs VALUES (363, NULL, 'copyright_price', NULL, '300 đô trên 1 tựa', NULL);
INSERT INTO public.logs VALUES (364, NULL, 'translation_cost', NULL, '0', NULL);
INSERT INTO public.logs VALUES (365, NULL, 'partner_note', NULL, '12,5 %', NULL);
INSERT INTO public.logs VALUES (366, NULL, 'status_id', '1', '12', NULL);
INSERT INTO public.logs VALUES (367, NULL, 'category_level_1', NULL, '1', NULL);
INSERT INTO public.logs VALUES (368, NULL, 'category_level_2', NULL, '70,44', NULL);
INSERT INTO public.logs VALUES (369, NULL, 'description', NULL, 'Dropbox https://www.dropbox.com/scl/fi/g8y1q93rgdl3qc71kf9hr/Gi-i-thi-u-s-ch-B-quy-t-th-nh-c-ng-cho-tu-i-Teen.docx?dl=0&rlkey=agt0yrq82nemmi8q9d5y8eyvq', NULL);
INSERT INTO public.logs VALUES (370, NULL, 'contracted_at', NULL, '06-04-2021', NULL);
INSERT INTO public.logs VALUES (371, NULL, 'contract_term', NULL, '5', NULL);
INSERT INTO public.logs VALUES (372, NULL, 'cover_price', NULL, '98000', NULL);
INSERT INTO public.logs VALUES (373, NULL, 'royalty', NULL, '37,5', NULL);
INSERT INTO public.logs VALUES (374, NULL, 'copyright_price', NULL, '300 đô trên 1 tựa', NULL);
INSERT INTO public.logs VALUES (375, NULL, 'translation_cost', NULL, '0', NULL);
INSERT INTO public.logs VALUES (376, NULL, 'partner_note', NULL, '12,5%', NULL);
INSERT INTO public.logs VALUES (377, NULL, 'status_id', '1', '12', NULL);
INSERT INTO public.logs VALUES (378, NULL, 'category_level_1', NULL, '1', NULL);
INSERT INTO public.logs VALUES (379, NULL, 'category_level_2', NULL, '42', NULL);
INSERT INTO public.logs VALUES (380, NULL, 'type_of_sale', NULL, 'Vip', NULL);
INSERT INTO public.logs VALUES (381, NULL, 'contracted_at', NULL, '22-10-2021', NULL);
INSERT INTO public.logs VALUES (382, NULL, 'contract_term', NULL, '3 ', NULL);
INSERT INTO public.logs VALUES (383, NULL, 'cover_price', NULL, '259000', NULL);
INSERT INTO public.logs VALUES (384, NULL, 'royalty', NULL, '50 ', NULL);
INSERT INTO public.logs VALUES (385, NULL, 'copyright_price', NULL, '10580000', NULL);
INSERT INTO public.logs VALUES (386, NULL, 'status_id', '1', '12', NULL);
INSERT INTO public.logs VALUES (387, NULL, 'category_level_1', NULL, '1', NULL);
INSERT INTO public.logs VALUES (388, NULL, 'category_level_2', NULL, '42', NULL);
INSERT INTO public.logs VALUES (389, NULL, 'contracted_at', NULL, '22-10-2021', NULL);
INSERT INTO public.logs VALUES (390, NULL, 'contract_term', NULL, '3', NULL);
INSERT INTO public.logs VALUES (391, NULL, 'cover_price', NULL, '279000 ', NULL);
INSERT INTO public.logs VALUES (392, NULL, 'royalty', NULL, '50', NULL);
INSERT INTO public.logs VALUES (393, NULL, 'copyright_price', NULL, '10580000 ', NULL);
INSERT INTO public.logs VALUES (394, NULL, 'status_id', '1', '12', NULL);
INSERT INTO public.logs VALUES (395, NULL, 'category_level_1', NULL, '5', NULL);
INSERT INTO public.logs VALUES (396, NULL, 'category_level_2', NULL, '56', NULL);
INSERT INTO public.logs VALUES (397, NULL, 'type_of_sale', NULL, 'Vip', NULL);
INSERT INTO public.logs VALUES (398, NULL, 'contracted_at', NULL, '05-05-2021', NULL);
INSERT INTO public.logs VALUES (399, NULL, 'contract_term', NULL, '5', NULL);
INSERT INTO public.logs VALUES (400, NULL, 'cover_price', NULL, '77000 ', NULL);
INSERT INTO public.logs VALUES (401, NULL, 'royalty', NULL, '25', NULL);
INSERT INTO public.logs VALUES (402, NULL, 'copyright_price', NULL, '2000000', NULL);
INSERT INTO public.logs VALUES (403, NULL, 'status_id', '1', '12', NULL);
INSERT INTO public.logs VALUES (404, NULL, 'category_level_1', NULL, '4', NULL);
INSERT INTO public.logs VALUES (405, NULL, 'cover_price', NULL, '268000', NULL);
INSERT INTO public.logs VALUES (406, NULL, 'status_id', '13', '18', NULL);
INSERT INTO public.logs VALUES (407, NULL, 'status_id', '18', '20', NULL);
INSERT INTO public.logs VALUES (408, NULL, 'status_id', '20', '13', NULL);
INSERT INTO public.logs VALUES (409, NULL, 'status_id', '13', '18', NULL);
INSERT INTO public.logs VALUES (410, NULL, 'status_id', '18', '16', NULL);
INSERT INTO public.logs VALUES (411, NULL, 'status_id', '16', '13', NULL);
INSERT INTO public.logs VALUES (412, NULL, 'status_id', '1', '5', NULL);
INSERT INTO public.logs VALUES (413, NULL, 'status_id', '1', '5', NULL);
INSERT INTO public.logs VALUES (414, NULL, 'status_id', '13', '20', NULL);
INSERT INTO public.logs VALUES (415, NULL, 'status_id', '13', '20', NULL);
INSERT INTO public.logs VALUES (416, NULL, 'status_id', '13', '16', NULL);
INSERT INTO public.logs VALUES (417, NULL, 'status_id', '13', '17', NULL);
INSERT INTO public.logs VALUES (418, NULL, 'status_id', '13', '17', NULL);
INSERT INTO public.logs VALUES (419, NULL, 'status_id', '13', '20', NULL);
INSERT INTO public.logs VALUES (420, NULL, 'status_id', '13', '18', NULL);
INSERT INTO public.logs VALUES (421, NULL, 'status_id', '13', '18', NULL);
INSERT INTO public.logs VALUES (422, NULL, 'status_id', '13', '18', NULL);
INSERT INTO public.logs VALUES (423, NULL, 'status_id', '13', '15', NULL);
INSERT INTO public.logs VALUES (424, NULL, 'status_id', '13', '18', NULL);
INSERT INTO public.logs VALUES (425, NULL, 'status_id', '13', '18', NULL);
INSERT INTO public.logs VALUES (426, NULL, 'status_id', '13', '20', NULL);
INSERT INTO public.logs VALUES (427, NULL, 'status_id', '13', '18', NULL);
INSERT INTO public.logs VALUES (428, NULL, 'status_id', '18', '13', NULL);
INSERT INTO public.logs VALUES (429, NULL, 'status_id', '13', '18', NULL);
INSERT INTO public.logs VALUES (430, NULL, 'status_id', '18', '13', NULL);
INSERT INTO public.logs VALUES (431, NULL, 'status_id', '13', '18', NULL);
INSERT INTO public.logs VALUES (432, NULL, 'status_id', '13', '18', NULL);
INSERT INTO public.logs VALUES (433, NULL, 'status_id', '13', '18', NULL);
INSERT INTO public.logs VALUES (434, NULL, 'status_id', '13', '17', NULL);
INSERT INTO public.logs VALUES (435, NULL, 'status_id', '13', '14', NULL);
INSERT INTO public.logs VALUES (436, NULL, 'status_id', '13', '18', NULL);
INSERT INTO public.logs VALUES (437, NULL, 'status_id', '13', '18', NULL);
INSERT INTO public.logs VALUES (438, NULL, 'status_id', '1', '12', NULL);
INSERT INTO public.logs VALUES (439, NULL, 'status_id', '1', '12', NULL);
INSERT INTO public.logs VALUES (440, NULL, 'status_id', '1', '12', NULL);
INSERT INTO public.logs VALUES (441, NULL, 'status_id', '1', '12', NULL);
INSERT INTO public.logs VALUES (442, NULL, 'status_id', '1', '12', NULL);
INSERT INTO public.logs VALUES (443, NULL, 'status_id', '1', '7', NULL);
INSERT INTO public.logs VALUES (444, NULL, 'status_id', '1', '12', NULL);
INSERT INTO public.logs VALUES (445, NULL, 'status_id', '1', '12', NULL);
INSERT INTO public.logs VALUES (446, NULL, 'status_id', '1', '12', NULL);
INSERT INTO public.logs VALUES (447, NULL, 'status_id', '1', '12', NULL);
INSERT INTO public.logs VALUES (448, NULL, 'status_id', '1', '12', NULL);
INSERT INTO public.logs VALUES (449, NULL, 'status_id', '1', '12', NULL);
INSERT INTO public.logs VALUES (450, NULL, 'status_id', '1', '12', NULL);
INSERT INTO public.logs VALUES (451, NULL, 'status_id', '1', '12', NULL);
INSERT INTO public.logs VALUES (452, NULL, 'status_id', '1', '12', NULL);
INSERT INTO public.logs VALUES (453, NULL, 'status_id', '1', '5', NULL);
INSERT INTO public.logs VALUES (454, NULL, 'status_id', '13', '20', NULL);
INSERT INTO public.logs VALUES (455, NULL, 'status_id', '13', '16', NULL);
INSERT INTO public.logs VALUES (456, NULL, 'status_id', '13', '15', NULL);
INSERT INTO public.logs VALUES (457, NULL, 'status_id', '13', '15', NULL);
INSERT INTO public.logs VALUES (458, NULL, 'status_id', '13', '16', NULL);
INSERT INTO public.logs VALUES (459, NULL, 'status_id', '16', '18', NULL);
INSERT INTO public.logs VALUES (460, NULL, 'status_id', '17', '18', NULL);
INSERT INTO public.logs VALUES (461, NULL, 'status_id', '17', '18', NULL);
INSERT INTO public.logs VALUES (462, NULL, 'status_id', '17', '18', NULL);
INSERT INTO public.logs VALUES (463, NULL, 'status_id', '18', '17', NULL);
INSERT INTO public.logs VALUES (464, NULL, 'status_id', '21', '22', NULL);
INSERT INTO public.logs VALUES (465, NULL, 'status_id', '22', '23', NULL);
INSERT INTO public.logs VALUES (466, NULL, 'status_id', '23', '24', NULL);
INSERT INTO public.logs VALUES (467, NULL, 'status_id', '17', '18', NULL);
INSERT INTO public.logs VALUES (468, NULL, 'status_id', '18', '17', NULL);
INSERT INTO public.logs VALUES (469, NULL, 'status_id', '17', '16', NULL);
INSERT INTO public.logs VALUES (470, NULL, 'status_id', '16', '17', NULL);
INSERT INTO public.logs VALUES (471, NULL, 'status_id', '1', '12', NULL);
INSERT INTO public.logs VALUES (472, NULL, 'type_of_sale', NULL, 'Vip', NULL);
INSERT INTO public.logs VALUES (473, NULL, 'contracted_at', NULL, '27-09/2021', NULL);
INSERT INTO public.logs VALUES (474, NULL, 'contract_term', NULL, '5 năm ', NULL);
INSERT INTO public.logs VALUES (475, NULL, 'royalty', NULL, '35%', NULL);
INSERT INTO public.logs VALUES (476, NULL, 'status_id', '1', '12', NULL);
INSERT INTO public.logs VALUES (477, NULL, 'type_of_sale', NULL, 'Vip', NULL);
INSERT INTO public.logs VALUES (478, NULL, 'contracted_at', NULL, '10- 12/2021', NULL);
INSERT INTO public.logs VALUES (479, NULL, 'contract_term', NULL, '3 năm ', NULL);
INSERT INTO public.logs VALUES (480, NULL, 'cover_price', NULL, '53000', NULL);
INSERT INTO public.logs VALUES (481, NULL, 'royalty', NULL, '24', NULL);
INSERT INTO public.logs VALUES (482, NULL, 'copyright_price', NULL, '2000000', NULL);
INSERT INTO public.logs VALUES (483, NULL, 'translation_cost', NULL, '200000', NULL);
INSERT INTO public.logs VALUES (484, NULL, 'copyright_price', '2000000', 'USD 150 ', NULL);
INSERT INTO public.logs VALUES (485, NULL, 'status_id', '1', '12', NULL);
INSERT INTO public.logs VALUES (486, NULL, 'type_of_sale', NULL, 'Vip', NULL);
INSERT INTO public.logs VALUES (487, NULL, 'contracted_at', NULL, '06-04/2021', NULL);
INSERT INTO public.logs VALUES (488, NULL, 'contract_term', NULL, '5 năm', NULL);
INSERT INTO public.logs VALUES (489, NULL, 'cover_price', NULL, '129000', NULL);
INSERT INTO public.logs VALUES (490, NULL, 'royalty', NULL, '37.5 %', NULL);
INSERT INTO public.logs VALUES (491, NULL, 'copyright_price', NULL, 'US$ 300 / 1 tựa', NULL);
INSERT INTO public.logs VALUES (492, NULL, 'status_id', '1', '12', NULL);
INSERT INTO public.logs VALUES (493, NULL, 'type_of_sale', NULL, 'Vip', NULL);
INSERT INTO public.logs VALUES (494, NULL, 'contracted_at', NULL, 'từ 20-09/2021', NULL);
INSERT INTO public.logs VALUES (495, NULL, 'contract_term', NULL, '5 năm', NULL);
INSERT INTO public.logs VALUES (496, NULL, 'cover_price', NULL, '62.326 ', NULL);
INSERT INTO public.logs VALUES (497, NULL, 'royalty', NULL, '50%', NULL);
INSERT INTO public.logs VALUES (498, NULL, 'status_id', '1', '12', NULL);
INSERT INTO public.logs VALUES (499, NULL, 'type_of_sale', NULL, 'Vip', NULL);
INSERT INTO public.logs VALUES (500, NULL, 'contracted_at', NULL, '20-09/2021 ', NULL);
INSERT INTO public.logs VALUES (501, NULL, 'contract_term', NULL, '1 năm', NULL);
INSERT INTO public.logs VALUES (502, NULL, 'cover_price', NULL, '108000', NULL);
INSERT INTO public.logs VALUES (503, NULL, 'royalty', NULL, '50%', NULL);
INSERT INTO public.logs VALUES (504, NULL, 'status_id', '1', '12', NULL);
INSERT INTO public.logs VALUES (505, NULL, 'type_of_sale', NULL, 'Vip', NULL);
INSERT INTO public.logs VALUES (506, NULL, 'contracted_at', NULL, '27- 09/ 2021', NULL);
INSERT INTO public.logs VALUES (507, NULL, 'contract_term', NULL, '5 năm ', NULL);
INSERT INTO public.logs VALUES (508, NULL, 'cover_price', NULL, '78000', NULL);
INSERT INTO public.logs VALUES (509, NULL, 'royalty', NULL, '35%', NULL);
INSERT INTO public.logs VALUES (510, NULL, 'status_id', '1', '12', NULL);
INSERT INTO public.logs VALUES (511, NULL, 'contracted_at', NULL, '27-09/2021', NULL);
INSERT INTO public.logs VALUES (512, NULL, 'contract_term', NULL, '5 năm ', NULL);
INSERT INTO public.logs VALUES (513, NULL, 'cover_price', NULL, '49000', NULL);
INSERT INTO public.logs VALUES (514, NULL, 'royalty', NULL, '35%', NULL);
INSERT INTO public.logs VALUES (515, NULL, 'status_id', '1', '12', NULL);
INSERT INTO public.logs VALUES (516, NULL, 'type_of_sale', NULL, 'Vip', NULL);
INSERT INTO public.logs VALUES (517, NULL, 'contracted_at', NULL, '10-12/2021', NULL);
INSERT INTO public.logs VALUES (518, NULL, 'contract_term', NULL, '3 năm ', NULL);
INSERT INTO public.logs VALUES (519, NULL, 'cover_price', NULL, '82000', NULL);
INSERT INTO public.logs VALUES (520, NULL, 'royalty', NULL, '24%', NULL);
INSERT INTO public.logs VALUES (521, NULL, 'copyright_price', NULL, 'USD 150', NULL);
INSERT INTO public.logs VALUES (522, NULL, 'translation_cost', NULL, '2000000', NULL);
INSERT INTO public.logs VALUES (523, NULL, 'status_id', '1', '12', NULL);
INSERT INTO public.logs VALUES (524, NULL, 'type_of_sale', NULL, 'Vip', NULL);
INSERT INTO public.logs VALUES (525, NULL, 'contracted_at', NULL, '10-12/2021', NULL);
INSERT INTO public.logs VALUES (526, NULL, 'contract_term', NULL, '3 năm ', NULL);
INSERT INTO public.logs VALUES (527, NULL, 'cover_price', NULL, '265000', NULL);
INSERT INTO public.logs VALUES (528, NULL, 'translation_cost', NULL, '3000000', NULL);
INSERT INTO public.logs VALUES (529, NULL, 'copyright_price', NULL, 'USD 150 ', NULL);
INSERT INTO public.logs VALUES (530, NULL, 'status_id', '1', '12', NULL);
INSERT INTO public.logs VALUES (531, NULL, 'type_of_sale', NULL, 'Vip', NULL);
INSERT INTO public.logs VALUES (532, NULL, 'contracted_at', NULL, '15-04/2021', NULL);
INSERT INTO public.logs VALUES (533, NULL, 'contract_term', NULL, '3 năm ', NULL);
INSERT INTO public.logs VALUES (534, NULL, 'cover_price', NULL, '80.000', NULL);
INSERT INTO public.logs VALUES (535, NULL, 'royalty', NULL, '25%', NULL);
INSERT INTO public.logs VALUES (536, NULL, 'royalty', NULL, '25%', NULL);
INSERT INTO public.logs VALUES (537, NULL, 'copyright_price', NULL, '300000', NULL);
INSERT INTO public.logs VALUES (538, NULL, 'status_id', '1', '12', NULL);
INSERT INTO public.logs VALUES (539, NULL, 'type_of_sale', NULL, 'Vip', NULL);
INSERT INTO public.logs VALUES (540, NULL, 'contracted_at', NULL, '15-04/2021', NULL);
INSERT INTO public.logs VALUES (541, NULL, 'contract_term', NULL, '3 năm ', NULL);
INSERT INTO public.logs VALUES (542, NULL, 'cover_price', NULL, '75000', NULL);
INSERT INTO public.logs VALUES (543, NULL, 'royalty', NULL, '25%', NULL);
INSERT INTO public.logs VALUES (544, NULL, 'copyright_price', NULL, '300000', NULL);
INSERT INTO public.logs VALUES (545, NULL, 'status_id', '1', '12', NULL);
INSERT INTO public.logs VALUES (546, NULL, 'type_of_sale', NULL, 'Vip', NULL);
INSERT INTO public.logs VALUES (547, NULL, 'contracted_at', NULL, '09-04/2021', NULL);
INSERT INTO public.logs VALUES (548, NULL, 'contract_term', NULL, '5 năm', NULL);
INSERT INTO public.logs VALUES (549, NULL, 'cover_price', NULL, '65000', NULL);
INSERT INTO public.logs VALUES (550, NULL, 'royalty', NULL, '35%', NULL);
INSERT INTO public.logs VALUES (551, NULL, 'status_id', '1', '12', NULL);
INSERT INTO public.logs VALUES (552, NULL, 'type_of_sale', NULL, 'Vip', NULL);
INSERT INTO public.logs VALUES (553, NULL, 'contracted_at', NULL, '27-09/2021', NULL);
INSERT INTO public.logs VALUES (554, NULL, 'contract_term', NULL, '5 năm ', NULL);
INSERT INTO public.logs VALUES (555, NULL, 'cover_price', NULL, '89000', NULL);
INSERT INTO public.logs VALUES (556, NULL, 'royalty', NULL, '35%', NULL);
INSERT INTO public.logs VALUES (557, NULL, 'status_id', '1', '12', NULL);
INSERT INTO public.logs VALUES (558, NULL, 'type_of_sale', NULL, 'Vip', NULL);
INSERT INTO public.logs VALUES (559, NULL, 'contracted_at', NULL, '06-04/2021', NULL);
INSERT INTO public.logs VALUES (560, NULL, 'contract_term', NULL, '5 năm ', NULL);
INSERT INTO public.logs VALUES (561, NULL, 'cover_price', NULL, '129000', NULL);
INSERT INTO public.logs VALUES (562, NULL, 'royalty', NULL, '37,5%', NULL);
INSERT INTO public.logs VALUES (563, NULL, 'copyright_price', NULL, 'US 300 $', NULL);
INSERT INTO public.logs VALUES (564, NULL, 'royalty', NULL, '37,5%', NULL);
INSERT INTO public.logs VALUES (565, NULL, 'copyright_price', NULL, 'US 300 $', NULL);
INSERT INTO public.logs VALUES (566, NULL, 'contract_term', NULL, '3 năm ', NULL);
INSERT INTO public.logs VALUES (567, NULL, 'royalty', NULL, '50', NULL);
INSERT INTO public.logs VALUES (568, NULL, 'status_id', '21', '25', NULL);
INSERT INTO public.logs VALUES (569, NULL, 'produce_cost', NULL, '3.072.090', NULL);
INSERT INTO public.logs VALUES (570, NULL, 'control_cost', NULL, '161.330', NULL);
INSERT INTO public.logs VALUES (571, NULL, 'post_production_cost', NULL, '0', NULL);
INSERT INTO public.logs VALUES (572, NULL, 'status_id', '25', '21', NULL);
INSERT INTO public.logs VALUES (573, NULL, 'status_id', '21', '25', NULL);
INSERT INTO public.logs VALUES (574, NULL, 'produce_cost', 'NaN', '3.072.090', NULL);
INSERT INTO public.logs VALUES (575, NULL, 'control_cost', '161.33', '161.330', NULL);
INSERT INTO public.logs VALUES (576, NULL, 'status_id', '1', '12', NULL);
INSERT INTO public.logs VALUES (577, NULL, 'type_of_sale', NULL, 'Vip', NULL);
INSERT INTO public.logs VALUES (578, NULL, 'contract_term', NULL, '3 năm ', NULL);
INSERT INTO public.logs VALUES (579, NULL, 'cover_price', NULL, '60000', NULL);
INSERT INTO public.logs VALUES (580, NULL, 'royalty', NULL, '50', NULL);
INSERT INTO public.logs VALUES (581, NULL, 'category_level_1', NULL, '1', NULL);
INSERT INTO public.logs VALUES (582, NULL, 'category_level_2', NULL, ',16', NULL);
INSERT INTO public.logs VALUES (583, NULL, 'keywords', NULL, 'phật giáo, tâm linh, phật pháp ứng dụng ', NULL);
INSERT INTO public.logs VALUES (584, NULL, 'status_id', '1', '12', NULL);
INSERT INTO public.logs VALUES (585, NULL, 'type_of_sale', NULL, 'Vip', NULL);
INSERT INTO public.logs VALUES (586, NULL, 'contracted_at', NULL, '10-12/2021', NULL);
INSERT INTO public.logs VALUES (587, NULL, 'contract_term', NULL, '3 năm', NULL);
INSERT INTO public.logs VALUES (588, NULL, 'cover_price', NULL, '45000', NULL);
INSERT INTO public.logs VALUES (589, NULL, 'royalty', NULL, '24', NULL);
INSERT INTO public.logs VALUES (590, NULL, 'translation_cost', NULL, '2000000', NULL);
INSERT INTO public.logs VALUES (591, NULL, 'copyright_price', NULL, 'USD 150', NULL);
INSERT INTO public.logs VALUES (592, NULL, 'status_id', '1', '12', NULL);
INSERT INTO public.logs VALUES (593, NULL, 'type_of_sale', NULL, 'Vip', NULL);
INSERT INTO public.logs VALUES (594, NULL, 'contracted_at', NULL, '27-09/2021', NULL);
INSERT INTO public.logs VALUES (595, NULL, 'contract_term', NULL, '5 năm', NULL);
INSERT INTO public.logs VALUES (596, NULL, 'cover_price', NULL, '105000', NULL);
INSERT INTO public.logs VALUES (597, NULL, 'royalty', NULL, '35', NULL);
INSERT INTO public.logs VALUES (598, NULL, 'status_id', '1', '12', NULL);
INSERT INTO public.logs VALUES (599, NULL, 'type_of_sale', NULL, 'Vip', NULL);
INSERT INTO public.logs VALUES (600, NULL, 'contracted_at', NULL, '05-04/2021', NULL);
INSERT INTO public.logs VALUES (601, NULL, 'contract_term', NULL, '5 năm', NULL);
INSERT INTO public.logs VALUES (602, NULL, 'cover_price', NULL, '72000', NULL);
INSERT INTO public.logs VALUES (603, NULL, 'royalty', NULL, '25', NULL);
INSERT INTO public.logs VALUES (604, NULL, 'copyright_price', NULL, '4000000', NULL);
INSERT INTO public.logs VALUES (605, NULL, 'status_id', '1', '12', NULL);
INSERT INTO public.logs VALUES (606, NULL, 'type_of_sale', NULL, 'Vip', NULL);
INSERT INTO public.logs VALUES (607, NULL, 'contracted_at', NULL, '25-02/2022', NULL);
INSERT INTO public.logs VALUES (608, NULL, 'contract_term', NULL, '5 năm ', NULL);
INSERT INTO public.logs VALUES (609, NULL, 'cover_price', NULL, '135000', NULL);
INSERT INTO public.logs VALUES (610, NULL, 'royalty', NULL, '42,5', NULL);
INSERT INTO public.logs VALUES (611, NULL, 'copyright_price', NULL, 'USD 500', NULL);
INSERT INTO public.logs VALUES (612, NULL, 'translation_cost', NULL, '2000000', NULL);
INSERT INTO public.logs VALUES (613, NULL, 'status_id', '1', '12', NULL);
INSERT INTO public.logs VALUES (614, NULL, 'type_of_sale', NULL, 'Vip', NULL);
INSERT INTO public.logs VALUES (615, NULL, 'contract_term', NULL, '3 năm', NULL);
INSERT INTO public.logs VALUES (616, NULL, 'cover_price', NULL, '210000', NULL);
INSERT INTO public.logs VALUES (617, NULL, 'royalty', NULL, '50', NULL);
INSERT INTO public.logs VALUES (618, NULL, 'status_id', '1', '12', NULL);
INSERT INTO public.logs VALUES (619, NULL, 'type_of_sale', NULL, 'Vip', NULL);
INSERT INTO public.logs VALUES (620, NULL, 'contracted_at', NULL, '07-03/2021', NULL);
INSERT INTO public.logs VALUES (621, NULL, 'contract_term', NULL, '5 năm', NULL);
INSERT INTO public.logs VALUES (622, NULL, 'cover_price', NULL, '67000', NULL);
INSERT INTO public.logs VALUES (623, NULL, 'royalty', NULL, '25', NULL);
INSERT INTO public.logs VALUES (624, NULL, 'copyright_price', NULL, '2000000', NULL);
INSERT INTO public.logs VALUES (625, NULL, 'status_id', '1', '12', NULL);
INSERT INTO public.logs VALUES (626, NULL, 'type_of_sale', NULL, 'Vip', NULL);
INSERT INTO public.logs VALUES (627, NULL, 'contracted_at', NULL, '07-03/2021', NULL);
INSERT INTO public.logs VALUES (628, NULL, 'contract_term', NULL, '5 năm ', NULL);
INSERT INTO public.logs VALUES (629, NULL, 'cover_price', NULL, '92000', NULL);
INSERT INTO public.logs VALUES (630, NULL, 'royalty', NULL, '25', NULL);
INSERT INTO public.logs VALUES (631, NULL, 'copyright_price', NULL, '2000000', NULL);
INSERT INTO public.logs VALUES (632, NULL, 'status_id', '1', '12', NULL);
INSERT INTO public.logs VALUES (633, NULL, 'type_of_sale', NULL, 'Vip', NULL);
INSERT INTO public.logs VALUES (634, NULL, 'contracted_at', NULL, '07-03/2021', NULL);
INSERT INTO public.logs VALUES (635, NULL, 'contract_term', NULL, '5 năm ', NULL);
INSERT INTO public.logs VALUES (636, NULL, 'cover_price', NULL, '150000', NULL);
INSERT INTO public.logs VALUES (637, NULL, 'royalty', NULL, '25', NULL);
INSERT INTO public.logs VALUES (638, NULL, 'copyright_price', NULL, '2000000', NULL);
INSERT INTO public.logs VALUES (639, NULL, 'status_id', '1', '12', NULL);
INSERT INTO public.logs VALUES (640, NULL, 'type_of_sale', NULL, 'Vip', NULL);
INSERT INTO public.logs VALUES (641, NULL, 'contracted_at', NULL, '07-03/2021', NULL);
INSERT INTO public.logs VALUES (642, NULL, 'contract_term', NULL, '5 năm ', NULL);
INSERT INTO public.logs VALUES (643, NULL, 'cover_price', NULL, '185000', NULL);
INSERT INTO public.logs VALUES (644, NULL, 'royalty', NULL, '25', NULL);
INSERT INTO public.logs VALUES (645, NULL, 'copyright_price', NULL, '2000000', NULL);
INSERT INTO public.logs VALUES (646, NULL, 'status_id', '1', '12', NULL);
INSERT INTO public.logs VALUES (647, NULL, 'type_of_sale', NULL, 'Vip', NULL);
INSERT INTO public.logs VALUES (648, NULL, 'contracted_at', NULL, '07-03/2021', NULL);
INSERT INTO public.logs VALUES (649, NULL, 'contract_term', NULL, '5 năm ', NULL);
INSERT INTO public.logs VALUES (650, NULL, 'cover_price', NULL, '68000', NULL);
INSERT INTO public.logs VALUES (651, NULL, 'royalty', NULL, '25', NULL);
INSERT INTO public.logs VALUES (652, NULL, 'copyright_price', NULL, '2000000', NULL);
INSERT INTO public.logs VALUES (653, NULL, 'contracted_at', '07-03/2021', '07-03/2022', NULL);
INSERT INTO public.logs VALUES (654, NULL, 'contracted_at', '07-03/2021', '07-03/2022', NULL);
INSERT INTO public.logs VALUES (655, NULL, 'contracted_at', '07-03/2021', '07-03/2022', NULL);
INSERT INTO public.logs VALUES (656, NULL, 'contracted_at', '07-03/2021', '07-03/2022', NULL);
INSERT INTO public.logs VALUES (657, NULL, 'contracted_at', '07-03/2021', '07-03/2022', NULL);
INSERT INTO public.logs VALUES (658, NULL, 'status_id', '1', '12', NULL);
INSERT INTO public.logs VALUES (659, NULL, 'type_of_sale', NULL, 'Vip', NULL);
INSERT INTO public.logs VALUES (660, NULL, 'contract_term', NULL, '3 năm ', NULL);
INSERT INTO public.logs VALUES (661, NULL, 'cover_price', NULL, '168000', NULL);
INSERT INTO public.logs VALUES (662, NULL, 'royalty', NULL, '50', NULL);
INSERT INTO public.logs VALUES (663, NULL, 'status_id', '1', '12', NULL);
INSERT INTO public.logs VALUES (664, NULL, 'type_of_sale', NULL, 'Vip', NULL);
INSERT INTO public.logs VALUES (665, NULL, 'contracted_at', NULL, '06-05/2020', NULL);
INSERT INTO public.logs VALUES (666, NULL, 'contract_term', NULL, '3 năm ', NULL);
INSERT INTO public.logs VALUES (667, NULL, 'cover_price', NULL, '140000', NULL);
INSERT INTO public.logs VALUES (668, NULL, 'royalty', NULL, '30', NULL);
INSERT INTO public.logs VALUES (669, NULL, 'status_id', '1', '12', NULL);
INSERT INTO public.logs VALUES (670, NULL, 'type_of_sale', NULL, 'Vip', NULL);
INSERT INTO public.logs VALUES (671, NULL, 'contracted_at', NULL, '15-04/2021', NULL);
INSERT INTO public.logs VALUES (672, NULL, 'contract_term', NULL, '3 năm ', NULL);
INSERT INTO public.logs VALUES (673, NULL, 'cover_price', NULL, '110000', NULL);
INSERT INTO public.logs VALUES (674, NULL, 'royalty', NULL, '25', NULL);
INSERT INTO public.logs VALUES (675, NULL, 'copyright_price', NULL, '250000', NULL);
INSERT INTO public.logs VALUES (676, NULL, 'status_id', '1', '12', NULL);
INSERT INTO public.logs VALUES (677, NULL, 'type_of_sale', NULL, 'Vip', NULL);
INSERT INTO public.logs VALUES (678, NULL, 'contracted_at', NULL, '15-04/2021', NULL);
INSERT INTO public.logs VALUES (679, NULL, 'contract_term', NULL, '3 năm ', NULL);
INSERT INTO public.logs VALUES (680, NULL, 'cover_price', NULL, '110.000', NULL);
INSERT INTO public.logs VALUES (681, NULL, 'royalty', NULL, '25', NULL);
INSERT INTO public.logs VALUES (682, NULL, 'copyright_price', NULL, '250000', NULL);
INSERT INTO public.logs VALUES (683, NULL, 'status_id', '1', '12', NULL);
INSERT INTO public.logs VALUES (684, NULL, 'type_of_sale', NULL, 'Vip', NULL);
INSERT INTO public.logs VALUES (685, NULL, 'contracted_at', NULL, '15-04/2021', NULL);
INSERT INTO public.logs VALUES (686, NULL, 'contract_term', NULL, '3 năm ', NULL);
INSERT INTO public.logs VALUES (687, NULL, 'cover_price', NULL, '110000', NULL);
INSERT INTO public.logs VALUES (688, NULL, 'royalty', NULL, '25', NULL);
INSERT INTO public.logs VALUES (689, NULL, 'copyright_price', NULL, '250000', NULL);
INSERT INTO public.logs VALUES (690, NULL, 'status_id', '1', '12', NULL);
INSERT INTO public.logs VALUES (691, NULL, 'type_of_sale', NULL, 'Vip', NULL);
INSERT INTO public.logs VALUES (692, NULL, 'contracted_at', NULL, '15-04/2021', NULL);
INSERT INTO public.logs VALUES (693, NULL, 'contract_term', NULL, '3 năm ', NULL);
INSERT INTO public.logs VALUES (694, NULL, 'cover_price', NULL, '110000', NULL);
INSERT INTO public.logs VALUES (695, NULL, 'royalty', NULL, '25', NULL);
INSERT INTO public.logs VALUES (696, NULL, 'copyright_price', NULL, '250000', NULL);
INSERT INTO public.logs VALUES (697, NULL, 'status_id', '1', '12', NULL);
INSERT INTO public.logs VALUES (698, NULL, 'type_of_sale', NULL, 'Vip', NULL);
INSERT INTO public.logs VALUES (699, NULL, 'contracted_at', NULL, '15-04/2021', NULL);
INSERT INTO public.logs VALUES (700, NULL, 'contract_term', NULL, '3 năm ', NULL);
INSERT INTO public.logs VALUES (701, NULL, 'cover_price', NULL, '125000', NULL);
INSERT INTO public.logs VALUES (702, NULL, 'royalty', NULL, '25', NULL);
INSERT INTO public.logs VALUES (703, NULL, 'copyright_price', NULL, '300000', NULL);
INSERT INTO public.logs VALUES (704, NULL, 'status_id', '1', '12', NULL);
INSERT INTO public.logs VALUES (705, NULL, 'type_of_sale', NULL, 'Vip', NULL);
INSERT INTO public.logs VALUES (706, NULL, 'contracted_at', NULL, '15-04/2021', NULL);
INSERT INTO public.logs VALUES (707, NULL, 'contract_term', NULL, '3 năm ', NULL);
INSERT INTO public.logs VALUES (708, NULL, 'cover_price', NULL, '110000', NULL);
INSERT INTO public.logs VALUES (709, NULL, 'royalty', NULL, '25', NULL);
INSERT INTO public.logs VALUES (710, NULL, 'copyright_price', NULL, '250000', NULL);
INSERT INTO public.logs VALUES (711, NULL, 'status_id', '1', '12', NULL);
INSERT INTO public.logs VALUES (712, NULL, 'type_of_sale', NULL, 'Vip', NULL);
INSERT INTO public.logs VALUES (713, NULL, 'contracted_at', NULL, '15-04/2021', NULL);
INSERT INTO public.logs VALUES (714, NULL, 'contract_term', NULL, '3 năm ', NULL);
INSERT INTO public.logs VALUES (715, NULL, 'cover_price', NULL, '110000', NULL);
INSERT INTO public.logs VALUES (716, NULL, 'royalty', NULL, '25', NULL);
INSERT INTO public.logs VALUES (717, NULL, 'copyright_price', NULL, '250000', NULL);
INSERT INTO public.logs VALUES (718, NULL, 'status_id', '1', '12', NULL);
INSERT INTO public.logs VALUES (719, NULL, 'type_of_sale', NULL, 'Vip', NULL);
INSERT INTO public.logs VALUES (720, NULL, 'contracted_at', NULL, '15-04/2021', NULL);
INSERT INTO public.logs VALUES (721, NULL, 'contract_term', NULL, '3 năm ', NULL);
INSERT INTO public.logs VALUES (722, NULL, 'cover_price', NULL, '110000', NULL);
INSERT INTO public.logs VALUES (723, NULL, 'royalty', NULL, '25', NULL);
INSERT INTO public.logs VALUES (724, NULL, 'copyright_price', NULL, '250000', NULL);
INSERT INTO public.logs VALUES (725, NULL, 'status_id', '1', '12', NULL);
INSERT INTO public.logs VALUES (726, NULL, 'type_of_sale', NULL, 'Vip', NULL);
INSERT INTO public.logs VALUES (727, NULL, 'contracted_at', NULL, '15-04/2021', NULL);
INSERT INTO public.logs VALUES (728, NULL, 'contract_term', NULL, '3 năm ', NULL);
INSERT INTO public.logs VALUES (729, NULL, 'cover_price', NULL, '70.000', NULL);
INSERT INTO public.logs VALUES (730, NULL, 'royalty', NULL, '25', NULL);
INSERT INTO public.logs VALUES (731, NULL, 'copyright_price', NULL, '300000', NULL);
INSERT INTO public.logs VALUES (732, NULL, 'status_id', '1', '12', NULL);
INSERT INTO public.logs VALUES (733, NULL, 'type_of_sale', NULL, 'Vip', NULL);
INSERT INTO public.logs VALUES (734, NULL, 'contracted_at', NULL, '15-04/2021', NULL);
INSERT INTO public.logs VALUES (735, NULL, 'contract_term', NULL, '3 năm ', NULL);
INSERT INTO public.logs VALUES (736, NULL, 'cover_price', NULL, '110000', NULL);
INSERT INTO public.logs VALUES (737, NULL, 'royalty', NULL, '25', NULL);
INSERT INTO public.logs VALUES (738, NULL, 'copyright_price', NULL, '250000', NULL);
INSERT INTO public.logs VALUES (739, NULL, 'status_id', '1', '12', NULL);
INSERT INTO public.logs VALUES (740, NULL, 'type_of_sale', NULL, 'Vip', NULL);
INSERT INTO public.logs VALUES (741, NULL, 'contracted_at', NULL, '15-04/2021', NULL);
INSERT INTO public.logs VALUES (742, NULL, 'contract_term', NULL, '3 năm ', NULL);
INSERT INTO public.logs VALUES (743, NULL, 'cover_price', NULL, '110000', NULL);
INSERT INTO public.logs VALUES (744, NULL, 'royalty', NULL, '25', NULL);
INSERT INTO public.logs VALUES (745, NULL, 'copyright_price', NULL, '250000', NULL);
INSERT INTO public.logs VALUES (746, NULL, 'status_id', '1', '12', NULL);
INSERT INTO public.logs VALUES (747, NULL, 'type_of_sale', NULL, 'Vip', NULL);
INSERT INTO public.logs VALUES (748, NULL, 'contracted_at', NULL, '15-04/2021', NULL);
INSERT INTO public.logs VALUES (749, NULL, 'contract_term', NULL, '3 năm ', NULL);
INSERT INTO public.logs VALUES (750, NULL, 'cover_price', NULL, '110000', NULL);
INSERT INTO public.logs VALUES (751, NULL, 'royalty', NULL, '25', NULL);
INSERT INTO public.logs VALUES (752, NULL, 'copyright_price', NULL, '250000', NULL);
INSERT INTO public.logs VALUES (753, NULL, 'status_id', '1', '12', NULL);
INSERT INTO public.logs VALUES (754, NULL, 'type_of_sale', NULL, 'Vip', NULL);
INSERT INTO public.logs VALUES (755, NULL, 'contracted_at', NULL, '15-04/2021', NULL);
INSERT INTO public.logs VALUES (756, NULL, 'contract_term', NULL, '3 năm ', NULL);
INSERT INTO public.logs VALUES (757, NULL, 'cover_price', NULL, '110000', NULL);
INSERT INTO public.logs VALUES (758, NULL, 'royalty', NULL, '25', NULL);
INSERT INTO public.logs VALUES (759, NULL, 'copyright_price', NULL, '250000', NULL);
INSERT INTO public.logs VALUES (760, NULL, 'status_id', '1', '12', NULL);
INSERT INTO public.logs VALUES (761, NULL, 'type_of_sale', NULL, 'Vip', NULL);
INSERT INTO public.logs VALUES (762, NULL, 'contracted_at', NULL, '15-04/2021', NULL);
INSERT INTO public.logs VALUES (763, NULL, 'contract_term', NULL, '3 năm ', NULL);
INSERT INTO public.logs VALUES (764, NULL, 'cover_price', NULL, '110000', NULL);
INSERT INTO public.logs VALUES (765, NULL, 'royalty', NULL, '25', NULL);
INSERT INTO public.logs VALUES (766, NULL, 'copyright_price', NULL, '250000', NULL);
INSERT INTO public.logs VALUES (767, NULL, 'status_id', '1', '12', NULL);
INSERT INTO public.logs VALUES (768, NULL, 'type_of_sale', NULL, 'Vip', NULL);
INSERT INTO public.logs VALUES (769, NULL, 'contracted_at', NULL, '15-04/2021', NULL);
INSERT INTO public.logs VALUES (770, NULL, 'contract_term', NULL, '3 năm ', NULL);
INSERT INTO public.logs VALUES (771, NULL, 'cover_price', NULL, '110000', NULL);
INSERT INTO public.logs VALUES (772, NULL, 'royalty', NULL, '25', NULL);
INSERT INTO public.logs VALUES (773, NULL, 'copyright_price', NULL, '250000', NULL);
INSERT INTO public.logs VALUES (774, NULL, 'status_id', '1', '12', NULL);
INSERT INTO public.logs VALUES (775, NULL, 'type_of_sale', NULL, 'Vip', NULL);
INSERT INTO public.logs VALUES (776, NULL, 'contracted_at', NULL, '15-04/2021', NULL);
INSERT INTO public.logs VALUES (777, NULL, 'contract_term', NULL, '3 năm ', NULL);
INSERT INTO public.logs VALUES (778, NULL, 'cover_price', NULL, '110000', NULL);
INSERT INTO public.logs VALUES (779, NULL, 'royalty', NULL, '25', NULL);
INSERT INTO public.logs VALUES (780, NULL, 'copyright_price', NULL, '250000', NULL);
INSERT INTO public.logs VALUES (781, NULL, 'status_id', '1', '12', NULL);
INSERT INTO public.logs VALUES (782, NULL, 'type_of_sale', NULL, 'Vip', NULL);
INSERT INTO public.logs VALUES (783, NULL, 'contracted_at', NULL, '15-04/2021', NULL);
INSERT INTO public.logs VALUES (784, NULL, 'contract_term', NULL, '3 năm ', NULL);
INSERT INTO public.logs VALUES (785, NULL, 'cover_price', NULL, '110000', NULL);
INSERT INTO public.logs VALUES (786, NULL, 'royalty', NULL, '25', NULL);
INSERT INTO public.logs VALUES (787, NULL, 'copyright_price', NULL, '250000', NULL);
INSERT INTO public.logs VALUES (788, NULL, 'status_id', '1', '12', NULL);
INSERT INTO public.logs VALUES (789, NULL, 'type_of_sale', NULL, 'Vip', NULL);
INSERT INTO public.logs VALUES (790, NULL, 'contracted_at', NULL, '15-04/2021', NULL);
INSERT INTO public.logs VALUES (791, NULL, 'contract_term', NULL, '3 năm ', NULL);
INSERT INTO public.logs VALUES (792, NULL, 'cover_price', NULL, '110000', NULL);
INSERT INTO public.logs VALUES (793, NULL, 'royalty', NULL, '25', NULL);
INSERT INTO public.logs VALUES (794, NULL, 'copyright_price', NULL, '250000', NULL);
INSERT INTO public.logs VALUES (795, NULL, 'status_id', '1', '12', NULL);
INSERT INTO public.logs VALUES (796, NULL, 'type_of_sale', NULL, 'Vip', NULL);
INSERT INTO public.logs VALUES (797, NULL, 'contracted_at', NULL, '15-04/2021', NULL);
INSERT INTO public.logs VALUES (798, NULL, 'contract_term', NULL, '3 năm ', NULL);
INSERT INTO public.logs VALUES (799, NULL, 'cover_price', NULL, '110000', NULL);
INSERT INTO public.logs VALUES (800, NULL, 'royalty', NULL, '25', NULL);
INSERT INTO public.logs VALUES (801, NULL, 'copyright_price', NULL, '250000', NULL);
INSERT INTO public.logs VALUES (802, NULL, 'status_id', '1', '12', NULL);
INSERT INTO public.logs VALUES (803, NULL, 'type_of_sale', NULL, 'Vip', NULL);
INSERT INTO public.logs VALUES (804, NULL, 'contracted_at', NULL, '15-04/2021', NULL);
INSERT INTO public.logs VALUES (805, NULL, 'contract_term', NULL, '3 năm ', NULL);
INSERT INTO public.logs VALUES (806, NULL, 'cover_price', NULL, '110000', NULL);
INSERT INTO public.logs VALUES (807, NULL, 'royalty', NULL, '25', NULL);
INSERT INTO public.logs VALUES (808, NULL, 'copyright_price', NULL, '250000', NULL);
INSERT INTO public.logs VALUES (809, NULL, 'status_id', '1', '12', NULL);
INSERT INTO public.logs VALUES (810, NULL, 'type_of_sale', NULL, 'Vip', NULL);
INSERT INTO public.logs VALUES (811, NULL, 'contracted_at', NULL, '15-04/2021', NULL);
INSERT INTO public.logs VALUES (812, NULL, 'contract_term', NULL, '3 năm ', NULL);
INSERT INTO public.logs VALUES (813, NULL, 'cover_price', NULL, '180.000', NULL);
INSERT INTO public.logs VALUES (814, NULL, 'royalty', NULL, '25', NULL);
INSERT INTO public.logs VALUES (815, NULL, 'copyright_price', NULL, '300000', NULL);
INSERT INTO public.logs VALUES (816, NULL, 'cover_price', '180', '180000', NULL);
INSERT INTO public.logs VALUES (817, NULL, 'status_id', '1', '12', NULL);
INSERT INTO public.logs VALUES (818, NULL, 'type_of_sale', NULL, 'Vip', NULL);
INSERT INTO public.logs VALUES (819, NULL, 'contracted_at', NULL, '15-04/2021', NULL);
INSERT INTO public.logs VALUES (820, NULL, 'contract_term', NULL, '3 năm ', NULL);
INSERT INTO public.logs VALUES (821, NULL, 'cover_price', NULL, '55000', NULL);
INSERT INTO public.logs VALUES (822, NULL, 'royalty', NULL, '25', NULL);
INSERT INTO public.logs VALUES (823, NULL, 'copyright_price', NULL, '250000', NULL);
INSERT INTO public.logs VALUES (824, NULL, 'status_id', '1', '12', NULL);
INSERT INTO public.logs VALUES (825, NULL, 'type_of_sale', NULL, 'Vip', NULL);
INSERT INTO public.logs VALUES (826, NULL, 'contracted_at', NULL, '15-04/2021', NULL);
INSERT INTO public.logs VALUES (827, NULL, 'contract_term', NULL, '3 năm ', NULL);
INSERT INTO public.logs VALUES (828, NULL, 'cover_price', NULL, '70000', NULL);
INSERT INTO public.logs VALUES (829, NULL, 'royalty', NULL, '25', NULL);
INSERT INTO public.logs VALUES (830, NULL, 'copyright_price', NULL, '300000', NULL);
INSERT INTO public.logs VALUES (831, NULL, 'status_id', '1', '12', NULL);
INSERT INTO public.logs VALUES (832, NULL, 'type_of_sale', NULL, 'Vip', NULL);
INSERT INTO public.logs VALUES (833, NULL, 'contracted_at', NULL, '15-04/2021', NULL);
INSERT INTO public.logs VALUES (834, NULL, 'contract_term', NULL, '3 năm ', NULL);
INSERT INTO public.logs VALUES (835, NULL, 'cover_price', NULL, '200000', NULL);
INSERT INTO public.logs VALUES (836, NULL, 'royalty', NULL, '25', NULL);
INSERT INTO public.logs VALUES (837, NULL, 'copyright_price', NULL, '300000', NULL);
INSERT INTO public.logs VALUES (838, NULL, 'status_id', '1', '12', NULL);
INSERT INTO public.logs VALUES (839, NULL, 'type_of_sale', NULL, 'Vip', NULL);
INSERT INTO public.logs VALUES (840, NULL, 'contracted_at', NULL, '15-04/2021', NULL);
INSERT INTO public.logs VALUES (841, NULL, 'contract_term', NULL, '3 năm ', NULL);
INSERT INTO public.logs VALUES (842, NULL, 'cover_price', NULL, '220000', NULL);
INSERT INTO public.logs VALUES (843, NULL, 'royalty', NULL, '25', NULL);
INSERT INTO public.logs VALUES (844, NULL, 'copyright_price', NULL, '300000', NULL);
INSERT INTO public.logs VALUES (845, NULL, 'status_id', '1', '12', NULL);
INSERT INTO public.logs VALUES (846, NULL, 'type_of_sale', NULL, 'Vip', NULL);
INSERT INTO public.logs VALUES (847, NULL, 'contracted_at', NULL, '15-04/2021', NULL);
INSERT INTO public.logs VALUES (848, NULL, 'contract_term', NULL, '3 năm ', NULL);
INSERT INTO public.logs VALUES (849, NULL, 'cover_price', NULL, '82000', NULL);
INSERT INTO public.logs VALUES (850, NULL, 'royalty', NULL, '25', NULL);
INSERT INTO public.logs VALUES (851, NULL, 'copyright_price', NULL, '250000', NULL);
INSERT INTO public.logs VALUES (852, NULL, 'status_id', '1', '12', NULL);
INSERT INTO public.logs VALUES (853, NULL, 'type_of_sale', NULL, 'Vip', NULL);
INSERT INTO public.logs VALUES (854, NULL, 'contracted_at', NULL, '15-04/2021', NULL);
INSERT INTO public.logs VALUES (855, NULL, 'contract_term', NULL, '3 năm ', NULL);
INSERT INTO public.logs VALUES (856, NULL, 'cover_price', NULL, '110000', NULL);
INSERT INTO public.logs VALUES (857, NULL, 'royalty', NULL, '25', NULL);
INSERT INTO public.logs VALUES (858, NULL, 'copyright_price', NULL, '250000', NULL);
INSERT INTO public.logs VALUES (859, NULL, 'status_id', '1', '12', NULL);
INSERT INTO public.logs VALUES (860, NULL, 'type_of_sale', NULL, 'Vip', NULL);
INSERT INTO public.logs VALUES (861, NULL, 'contracted_at', NULL, '10-12/2021', NULL);
INSERT INTO public.logs VALUES (862, NULL, 'contract_term', NULL, '3 năm ', NULL);
INSERT INTO public.logs VALUES (863, NULL, 'cover_price', NULL, '109000', NULL);
INSERT INTO public.logs VALUES (864, NULL, 'royalty', NULL, '24', NULL);
INSERT INTO public.logs VALUES (865, NULL, 'copyright_price', NULL, 'USD 150 ', NULL);
INSERT INTO public.logs VALUES (866, NULL, 'translation_cost', NULL, '3000000', NULL);
INSERT INTO public.logs VALUES (867, NULL, 'copyright_price', NULL, '300 $/ 1 tựa', NULL);
INSERT INTO public.logs VALUES (868, NULL, 'royalty', '25', '37', NULL);
INSERT INTO public.logs VALUES (869, NULL, 'contract_term', NULL, '5 năm ', NULL);
INSERT INTO public.logs VALUES (870, NULL, 'contracted_at', NULL, '05-05/2021', NULL);
INSERT INTO public.logs VALUES (871, NULL, 'royalty', NULL, '37', NULL);
INSERT INTO public.logs VALUES (872, NULL, 'type_of_sale', NULL, 'Vip', NULL);
INSERT INTO public.logs VALUES (873, NULL, 'copyright_price', NULL, '2000000', NULL);
INSERT INTO public.logs VALUES (874, NULL, 'type_of_sale', NULL, 'Vip', NULL);
INSERT INTO public.logs VALUES (875, NULL, 'royalty', 'NaN', '37,5', NULL);
INSERT INTO public.logs VALUES (876, NULL, 'copyright_price', 'NaN', '300 $/ 1 tựa', NULL);
INSERT INTO public.logs VALUES (877, NULL, 'royalty', 'NaN', NULL, NULL);
INSERT INTO public.logs VALUES (878, NULL, 'copyright_price', 'NaN', '300 đô', NULL);
INSERT INTO public.logs VALUES (879, NULL, 'copyright_price', 'NaN', '300 đô', NULL);
INSERT INTO public.logs VALUES (880, NULL, 'copyright_price', 'NaN', '300 US', NULL);
INSERT INTO public.logs VALUES (881, NULL, 'royalty', NULL, '37.5', NULL);
INSERT INTO public.logs VALUES (882, NULL, 'copyright_price', 'NaN', NULL, NULL);
INSERT INTO public.logs VALUES (883, NULL, 'royalty', NULL, '37.5', NULL);
INSERT INTO public.logs VALUES (884, NULL, 'copyright_price', NULL, '300 US', NULL);
INSERT INTO public.logs VALUES (885, NULL, 'copyright_price', 'NaN', '300 US', NULL);
INSERT INTO public.logs VALUES (886, NULL, 'copyright_price', 'NaN', NULL, NULL);
INSERT INTO public.logs VALUES (887, NULL, 'royalty', NULL, '37.5', NULL);
INSERT INTO public.logs VALUES (888, NULL, 'copyright_price', NULL, '300 US', NULL);
INSERT INTO public.logs VALUES (889, NULL, 'copyright_price', 'NaN', '300 US', NULL);
INSERT INTO public.logs VALUES (890, NULL, 'copyright_price', 'NaN', '300 US', NULL);
INSERT INTO public.logs VALUES (891, NULL, 'copyright_price', 'NaN', '300 ', NULL);
INSERT INTO public.logs VALUES (892, NULL, 'contracted_at', '2021-06-04 00:00:00.000 +00:00', '06-04/2021', NULL);
INSERT INTO public.logs VALUES (893, NULL, 'royalty', NULL, '37.5', NULL);
INSERT INTO public.logs VALUES (894, NULL, 'copyright_price', 'NaN', '300 $', NULL);
INSERT INTO public.logs VALUES (895, NULL, 'contracted_at', '2021-05-05 00:00:00.000 +00:00', '05-05/2021', NULL);
INSERT INTO public.logs VALUES (896, NULL, 'partner_note', NULL, '12', NULL);
INSERT INTO public.logs VALUES (897, NULL, 'royalty', '25', '37', NULL);
INSERT INTO public.logs VALUES (898, NULL, 'partner_note', NULL, '12', NULL);
INSERT INTO public.logs VALUES (899, NULL, 'translation_cost', '200000', '2000000', NULL);
INSERT INTO public.logs VALUES (900, NULL, 'copyright_price', 'NaN', '150 $', NULL);
INSERT INTO public.logs VALUES (901, NULL, 'translation_cost', NULL, '2000000', NULL);
INSERT INTO public.logs VALUES (902, NULL, 'copyright_price', '2000000', '', NULL);
INSERT INTO public.logs VALUES (903, NULL, 'contracted_at', '2021-06-04 00:00:00.000 +00:00', '06-04/2021', NULL);
INSERT INTO public.logs VALUES (904, NULL, 'royalty', NULL, '37,5', NULL);
INSERT INTO public.logs VALUES (905, NULL, 'type_of_sale', NULL, 'Vip', NULL);
INSERT INTO public.logs VALUES (906, NULL, 'copyright_price', NULL, '300 $', NULL);
INSERT INTO public.logs VALUES (907, NULL, 'contracted_at', 'Invalid date', '21-10/2021', NULL);
INSERT INTO public.logs VALUES (908, NULL, 'type_of_sale', NULL, 'Vip', NULL);
INSERT INTO public.logs VALUES (909, NULL, 'contracted_at', 'Invalid date', '21-10/2021', NULL);
INSERT INTO public.logs VALUES (910, NULL, 'contracted_at', 'Invalid date', '20-11/2021', NULL);
INSERT INTO public.logs VALUES (911, NULL, 'type_of_sale', NULL, 'Vip', NULL);
INSERT INTO public.logs VALUES (912, NULL, 'contracted_at', '2021-06-04 00:00:00.000 +00:00', '06-04/2021', NULL);
INSERT INTO public.logs VALUES (913, NULL, 'partner_note', '12,5 %', '12,5 ', NULL);
INSERT INTO public.logs VALUES (914, NULL, 'royalty', NULL, '37, 5', NULL);
INSERT INTO public.logs VALUES (915, NULL, 'copyright_price', NULL, '300 $', NULL);
INSERT INTO public.logs VALUES (916, NULL, 'contracted_at', '2021-06-04 00:00:00.000 +00:00', '06-04/2021', NULL);
INSERT INTO public.logs VALUES (917, NULL, 'partner_note', '12,5%', '12,5', NULL);
INSERT INTO public.logs VALUES (918, NULL, 'royalty', NULL, '37, 5', NULL);
INSERT INTO public.logs VALUES (919, NULL, 'type_of_sale', NULL, 'Vip', NULL);
INSERT INTO public.logs VALUES (920, NULL, 'copyright_price', NULL, '300 $', NULL);
INSERT INTO public.logs VALUES (921, NULL, 'contracted_at', 'Invalid date', '22-10/2021', NULL);
INSERT INTO public.logs VALUES (922, NULL, 'contracted_at', 'Invalid date', '22-10/2021', NULL);
INSERT INTO public.logs VALUES (923, NULL, 'type_of_sale', NULL, 'Vip', NULL);
INSERT INTO public.logs VALUES (924, NULL, 'contracted_at', '2021-05-05 00:00:00.000 +00:00', '05-05/2021', NULL);
INSERT INTO public.logs VALUES (925, NULL, 'partner_note', NULL, '12', NULL);
INSERT INTO public.logs VALUES (926, NULL, 'translation_cost', NULL, '2000000', NULL);
INSERT INTO public.logs VALUES (927, NULL, 'copyright_price', '2000000', 'đang chờ bổ sung', NULL);
INSERT INTO public.logs VALUES (928, NULL, 'copyright_price', 'đang chờ bổ sung', 'thiếu', NULL);
INSERT INTO public.logs VALUES (929, NULL, 'type_of_sale', NULL, 'Vip', NULL);
INSERT INTO public.logs VALUES (930, NULL, 'cover_price', NULL, '60000', NULL);
INSERT INTO public.logs VALUES (931, NULL, 'partner_note', NULL, '12', NULL);
INSERT INTO public.logs VALUES (932, NULL, 'translation_cost', NULL, '2000000', NULL);
INSERT INTO public.logs VALUES (933, NULL, 'copyright_price', '2000000', 'thiếu', NULL);
INSERT INTO public.logs VALUES (934, NULL, 'contract_term', NULL, '5 năm ', NULL);
INSERT INTO public.logs VALUES (935, NULL, 'contracted_at', NULL, '07-03/2021', NULL);
INSERT INTO public.logs VALUES (936, NULL, 'copyright_trustee', 'Nguyễn Đông Thức', 'Bà Tùng Long', NULL);
INSERT INTO public.logs VALUES (937, NULL, 'cover_price', NULL, '130000', NULL);
INSERT INTO public.logs VALUES (938, NULL, 'original_name', 'Người Xưa Đã Về', '', NULL);
INSERT INTO public.logs VALUES (939, NULL, 'royalty', NULL, '25', NULL);
INSERT INTO public.logs VALUES (940, NULL, 'contract_term', NULL, '5 năm ', NULL);
INSERT INTO public.logs VALUES (941, NULL, 'contracted_at', NULL, '07-03/2021', NULL);
INSERT INTO public.logs VALUES (942, NULL, 'copyright_trustee', 'Nguyễn Đông Thức', 'Bà Tùng Long', NULL);
INSERT INTO public.logs VALUES (943, NULL, 'cover_price', NULL, '110000', NULL);
INSERT INTO public.logs VALUES (944, NULL, 'royalty', NULL, '25', NULL);
INSERT INTO public.logs VALUES (945, NULL, 'type_of_sale', NULL, 'Vip', NULL);
INSERT INTO public.logs VALUES (946, NULL, 'cover_price', NULL, '41000', NULL);
INSERT INTO public.logs VALUES (947, NULL, 'royalty', NULL, '35', NULL);
INSERT INTO public.logs VALUES (948, NULL, 'partner_note', '12', '', NULL);
INSERT INTO public.logs VALUES (949, NULL, 'partner_note', '12', '', NULL);
INSERT INTO public.logs VALUES (950, NULL, 'partner_note', '12', '', NULL);
INSERT INTO public.logs VALUES (951, NULL, 'partner_note', '12', '', NULL);
INSERT INTO public.logs VALUES (952, NULL, 'royalty', NULL, '50', NULL);
INSERT INTO public.logs VALUES (953, NULL, 'royalty', NULL, '35', NULL);
INSERT INTO public.logs VALUES (954, NULL, 'royalty', NULL, '35', NULL);
INSERT INTO public.logs VALUES (955, NULL, 'type_of_sale', NULL, 'Vip', NULL);
INSERT INTO public.logs VALUES (956, NULL, 'royalty', NULL, '24', NULL);
INSERT INTO public.logs VALUES (957, NULL, 'copyright_price', NULL, 'USD 150', NULL);
INSERT INTO public.logs VALUES (958, NULL, 'royalty', NULL, '24', NULL);
INSERT INTO public.logs VALUES (959, NULL, 'copyright_price', 'NaN', 'USD 150', NULL);
INSERT INTO public.logs VALUES (960, NULL, 'royalty', 'NaN', '25', NULL);
INSERT INTO public.logs VALUES (961, NULL, 'royalty', NULL, '25', NULL);
INSERT INTO public.logs VALUES (962, NULL, 'royalty', NULL, '35', NULL);
INSERT INTO public.logs VALUES (963, NULL, 'royalty', NULL, '35', NULL);
INSERT INTO public.logs VALUES (964, NULL, 'partner_note', NULL, '12,5', NULL);
INSERT INTO public.logs VALUES (965, NULL, 'royalty', '37.5', '37,5', NULL);
INSERT INTO public.logs VALUES (966, NULL, 'copyright_price', '300', '300 $', NULL);
INSERT INTO public.logs VALUES (967, NULL, 'category_level_2', ',16', '0,16', NULL);
INSERT INTO public.logs VALUES (968, NULL, 'copyright_price', 'NaN', 'USD 150', NULL);
INSERT INTO public.logs VALUES (969, NULL, 'royalty', NULL, '42,5', NULL);
INSERT INTO public.logs VALUES (970, NULL, 'copyright_price', NULL, 'USD 500', NULL);
INSERT INTO public.logs VALUES (971, NULL, 'copyright_price', NULL, '2000000', NULL);
INSERT INTO public.logs VALUES (972, NULL, 'cover_price', '110', '110000', NULL);
INSERT INTO public.logs VALUES (973, NULL, 'copyright_price', NULL, 'USD 150', NULL);
INSERT INTO public.logs VALUES (974, NULL, 'status_id', '1', '12', NULL);
INSERT INTO public.logs VALUES (975, NULL, 'type_of_sale', NULL, 'Vip', NULL);
INSERT INTO public.logs VALUES (976, NULL, 'contracted_at', NULL, '15-04/2021', NULL);
INSERT INTO public.logs VALUES (977, NULL, 'contract_term', NULL, '3 năm ', NULL);
INSERT INTO public.logs VALUES (978, NULL, 'cover_price', NULL, '75000', NULL);
INSERT INTO public.logs VALUES (979, NULL, 'royalty', NULL, '25', NULL);
INSERT INTO public.logs VALUES (980, NULL, 'copyright_price', NULL, '300000', NULL);
INSERT INTO public.logs VALUES (981, NULL, 'status_id', '1', '12', NULL);
INSERT INTO public.logs VALUES (982, NULL, 'type_of_sale', NULL, 'Vip', NULL);
INSERT INTO public.logs VALUES (983, NULL, 'contracted_at', NULL, '15-04/2021', NULL);
INSERT INTO public.logs VALUES (984, NULL, 'contract_term', NULL, '3 năm ', NULL);
INSERT INTO public.logs VALUES (985, NULL, 'cover_price', NULL, '195000', NULL);
INSERT INTO public.logs VALUES (986, NULL, 'royalty', NULL, '25', NULL);
INSERT INTO public.logs VALUES (987, NULL, 'copyright_price', NULL, '300000', NULL);
INSERT INTO public.logs VALUES (988, NULL, 'status_id', '1', '12', NULL);
INSERT INTO public.logs VALUES (989, NULL, 'type_of_sale', NULL, 'Vip', NULL);
INSERT INTO public.logs VALUES (990, NULL, 'contracted_at', NULL, '15-04/2021', NULL);
INSERT INTO public.logs VALUES (991, NULL, 'contract_term', NULL, '3 năm ', NULL);
INSERT INTO public.logs VALUES (992, NULL, 'cover_price', NULL, '60000', NULL);
INSERT INTO public.logs VALUES (993, NULL, 'royalty', NULL, '25', NULL);
INSERT INTO public.logs VALUES (994, NULL, 'copyright_price', NULL, '300000', NULL);
INSERT INTO public.logs VALUES (995, NULL, 'status_id', '1', '12', NULL);
INSERT INTO public.logs VALUES (996, NULL, 'type_of_sale', NULL, 'Vip', NULL);
INSERT INTO public.logs VALUES (997, NULL, 'contracted_at', NULL, '15-04/2021', NULL);
INSERT INTO public.logs VALUES (998, NULL, 'contract_term', NULL, '3 năm ', NULL);
INSERT INTO public.logs VALUES (999, NULL, 'cover_price', NULL, '63000', NULL);
INSERT INTO public.logs VALUES (1000, NULL, 'royalty', NULL, '25', NULL);
INSERT INTO public.logs VALUES (1001, NULL, 'copyright_price', NULL, '300000', NULL);
INSERT INTO public.logs VALUES (1002, NULL, 'status_id', '1', '12', NULL);
INSERT INTO public.logs VALUES (1003, NULL, 'type_of_sale', NULL, 'Vip', NULL);
INSERT INTO public.logs VALUES (1004, NULL, 'contracted_at', NULL, '15-04/2021', NULL);
INSERT INTO public.logs VALUES (1005, NULL, 'contract_term', NULL, '3 năm ', NULL);
INSERT INTO public.logs VALUES (1006, NULL, 'cover_price', NULL, '85000', NULL);
INSERT INTO public.logs VALUES (1007, NULL, 'royalty', NULL, '25', NULL);
INSERT INTO public.logs VALUES (1008, NULL, 'copyright_price', NULL, '300000', NULL);
INSERT INTO public.logs VALUES (1009, NULL, 'status_id', '1', '12', NULL);
INSERT INTO public.logs VALUES (1010, NULL, 'type_of_sale', NULL, 'Vip', NULL);
INSERT INTO public.logs VALUES (1011, NULL, 'contracted_at', NULL, '15-04/2021', NULL);
INSERT INTO public.logs VALUES (1012, NULL, 'contract_term', NULL, '3 năm ', NULL);
INSERT INTO public.logs VALUES (1013, NULL, 'cover_price', NULL, '80000', NULL);
INSERT INTO public.logs VALUES (1014, NULL, 'royalty', NULL, '25', NULL);
INSERT INTO public.logs VALUES (1015, NULL, 'copyright_price', NULL, '300000', NULL);
INSERT INTO public.logs VALUES (1016, NULL, 'status_id', '1', '12', NULL);
INSERT INTO public.logs VALUES (1017, NULL, 'type_of_sale', NULL, 'Vip', NULL);
INSERT INTO public.logs VALUES (1018, NULL, 'contracted_at', NULL, '15-04/2021', NULL);
INSERT INTO public.logs VALUES (1019, NULL, 'contract_term', NULL, '3 năm ', NULL);
INSERT INTO public.logs VALUES (1020, NULL, 'cover_price', NULL, '58000', NULL);
INSERT INTO public.logs VALUES (1021, NULL, 'royalty', NULL, '25', NULL);
INSERT INTO public.logs VALUES (1022, NULL, 'copyright_price', NULL, '300000', NULL);
INSERT INTO public.logs VALUES (1023, NULL, 'status_id', '1', '12', NULL);
INSERT INTO public.logs VALUES (1024, NULL, 'type_of_sale', NULL, 'Vip', NULL);
INSERT INTO public.logs VALUES (1025, NULL, 'contracted_at', NULL, '15-04/2021', NULL);
INSERT INTO public.logs VALUES (1026, NULL, 'contract_term', NULL, '3 năm ', NULL);
INSERT INTO public.logs VALUES (1027, NULL, 'cover_price', NULL, '110000', NULL);
INSERT INTO public.logs VALUES (1028, NULL, 'royalty', NULL, '25', NULL);
INSERT INTO public.logs VALUES (1029, NULL, 'copyright_price', NULL, '300000', NULL);
INSERT INTO public.logs VALUES (1030, NULL, 'status_id', '1', '12', NULL);
INSERT INTO public.logs VALUES (1031, NULL, 'type_of_sale', NULL, 'Vip', NULL);
INSERT INTO public.logs VALUES (1032, NULL, 'contracted_at', NULL, '15-04/2021', NULL);
INSERT INTO public.logs VALUES (1033, NULL, 'contract_term', NULL, '3 năm ', NULL);
INSERT INTO public.logs VALUES (1034, NULL, 'cover_price', NULL, '65000', NULL);
INSERT INTO public.logs VALUES (1035, NULL, 'royalty', NULL, '25', NULL);
INSERT INTO public.logs VALUES (1036, NULL, 'copyright_price', NULL, '300000', NULL);
INSERT INTO public.logs VALUES (1037, NULL, 'status_id', '1', '12', NULL);
INSERT INTO public.logs VALUES (1038, NULL, 'type_of_sale', NULL, 'Vip', NULL);
INSERT INTO public.logs VALUES (1039, NULL, 'contracted_at', NULL, '15-04/2021', NULL);
INSERT INTO public.logs VALUES (1040, NULL, 'contract_term', NULL, '3 năm ', NULL);
INSERT INTO public.logs VALUES (1041, NULL, 'cover_price', NULL, '60000', NULL);
INSERT INTO public.logs VALUES (1042, NULL, 'royalty', NULL, '25', NULL);
INSERT INTO public.logs VALUES (1043, NULL, 'copyright_price', NULL, '300000', NULL);
INSERT INTO public.logs VALUES (1044, NULL, 'status_id', '1', '12', NULL);
INSERT INTO public.logs VALUES (1045, NULL, 'type_of_sale', NULL, 'Vip', NULL);
INSERT INTO public.logs VALUES (1046, NULL, 'contracted_at', NULL, '15-04/2021', NULL);
INSERT INTO public.logs VALUES (1047, NULL, 'contract_term', NULL, '3 năm ', NULL);
INSERT INTO public.logs VALUES (1048, NULL, 'cover_price', NULL, '48000', NULL);
INSERT INTO public.logs VALUES (1049, NULL, 'royalty', NULL, '25', NULL);
INSERT INTO public.logs VALUES (1050, NULL, 'copyright_price', NULL, '300000', NULL);
INSERT INTO public.logs VALUES (1051, NULL, 'status_id', '1', '12', NULL);
INSERT INTO public.logs VALUES (1052, NULL, 'type_of_sale', NULL, 'Vip', NULL);
INSERT INTO public.logs VALUES (1053, NULL, 'contracted_at', NULL, '15-04/2021', NULL);
INSERT INTO public.logs VALUES (1054, NULL, 'contract_term', NULL, '3 năm ', NULL);
INSERT INTO public.logs VALUES (1055, NULL, 'cover_price', NULL, '110000', NULL);
INSERT INTO public.logs VALUES (1056, NULL, 'royalty', NULL, '25', NULL);
INSERT INTO public.logs VALUES (1057, NULL, 'copyright_price', NULL, '250000', NULL);
INSERT INTO public.logs VALUES (1058, NULL, 'status_id', '1', '12', NULL);
INSERT INTO public.logs VALUES (1059, NULL, 'type_of_sale', NULL, 'Vip', NULL);
INSERT INTO public.logs VALUES (1060, NULL, 'contracted_at', NULL, '15-04/2021', NULL);
INSERT INTO public.logs VALUES (1061, NULL, 'contract_term', NULL, '3 năm ', NULL);
INSERT INTO public.logs VALUES (1062, NULL, 'cover_price', NULL, '110000', NULL);
INSERT INTO public.logs VALUES (1063, NULL, 'royalty', NULL, '25', NULL);
INSERT INTO public.logs VALUES (1064, NULL, 'copyright_price', NULL, '250000', NULL);
INSERT INTO public.logs VALUES (1065, NULL, 'status_id', '1', '12', NULL);
INSERT INTO public.logs VALUES (1066, NULL, 'type_of_sale', NULL, 'Vip', NULL);
INSERT INTO public.logs VALUES (1067, NULL, 'contracted_at', NULL, '15-04/2021', NULL);
INSERT INTO public.logs VALUES (1068, NULL, 'contract_term', NULL, '3 năm ', NULL);
INSERT INTO public.logs VALUES (1069, NULL, 'cover_price', NULL, '110000', NULL);
INSERT INTO public.logs VALUES (1070, NULL, 'royalty', NULL, '25', NULL);
INSERT INTO public.logs VALUES (1071, NULL, 'copyright_price', NULL, '250000', NULL);
INSERT INTO public.logs VALUES (1072, NULL, 'status_id', '1', '12', NULL);
INSERT INTO public.logs VALUES (1073, NULL, 'type_of_sale', NULL, 'Vip', NULL);
INSERT INTO public.logs VALUES (1074, NULL, 'contracted_at', NULL, '15-04/2021', NULL);
INSERT INTO public.logs VALUES (1075, NULL, 'contract_term', NULL, '3 năm ', NULL);
INSERT INTO public.logs VALUES (1076, NULL, 'cover_price', NULL, '110000', NULL);
INSERT INTO public.logs VALUES (1077, NULL, 'royalty', NULL, '25', NULL);
INSERT INTO public.logs VALUES (1078, NULL, 'copyright_price', NULL, '250000', NULL);
INSERT INTO public.logs VALUES (1079, NULL, 'status_id', '1', '12', NULL);
INSERT INTO public.logs VALUES (1080, NULL, 'type_of_sale', NULL, 'Vip', NULL);
INSERT INTO public.logs VALUES (1081, NULL, 'contracted_at', NULL, '15-04/2021', NULL);
INSERT INTO public.logs VALUES (1082, NULL, 'contract_term', NULL, '3 năm ', NULL);
INSERT INTO public.logs VALUES (1083, NULL, 'cover_price', NULL, '110000', NULL);
INSERT INTO public.logs VALUES (1084, NULL, 'royalty', NULL, '25', NULL);
INSERT INTO public.logs VALUES (1085, NULL, 'copyright_price', NULL, '250000', NULL);
INSERT INTO public.logs VALUES (1086, NULL, 'status_id', '1', '12', NULL);
INSERT INTO public.logs VALUES (1087, NULL, 'type_of_sale', NULL, 'Vip', NULL);
INSERT INTO public.logs VALUES (1088, NULL, 'contracted_at', NULL, '15-04/2021', NULL);
INSERT INTO public.logs VALUES (1089, NULL, 'contract_term', NULL, '3 năm ', NULL);
INSERT INTO public.logs VALUES (1090, NULL, 'cover_price', NULL, '110000', NULL);
INSERT INTO public.logs VALUES (1091, NULL, 'royalty', NULL, '25', NULL);
INSERT INTO public.logs VALUES (1092, NULL, 'copyright_price', NULL, '250000', NULL);
INSERT INTO public.logs VALUES (1093, NULL, 'status_id', '1', '12', NULL);
INSERT INTO public.logs VALUES (1094, NULL, 'type_of_sale', NULL, 'Vip', NULL);
INSERT INTO public.logs VALUES (1095, NULL, 'contract_term', NULL, '3 năm ', NULL);
INSERT INTO public.logs VALUES (1096, NULL, 'royalty', NULL, '30', NULL);
INSERT INTO public.logs VALUES (1097, NULL, 'status_id', '1', '12', NULL);
INSERT INTO public.logs VALUES (1098, NULL, 'type_of_sale', NULL, 'Vip', NULL);
INSERT INTO public.logs VALUES (1099, NULL, 'contract_term', NULL, '3 năm ', NULL);
INSERT INTO public.logs VALUES (1100, NULL, 'cover_price', NULL, '88000', NULL);
INSERT INTO public.logs VALUES (1101, NULL, 'royalty', NULL, '50', NULL);
INSERT INTO public.logs VALUES (1102, NULL, 'status_id', '1', '12', NULL);
INSERT INTO public.logs VALUES (1103, NULL, 'type_of_sale', NULL, 'Vip', NULL);
INSERT INTO public.logs VALUES (1104, NULL, 'contract_term', NULL, '3 năm ', NULL);
INSERT INTO public.logs VALUES (1105, NULL, 'cover_price', NULL, '78000', NULL);
INSERT INTO public.logs VALUES (1106, NULL, 'royalty', NULL, '35', NULL);
INSERT INTO public.logs VALUES (1107, NULL, 'status_id', '1', '12', NULL);
INSERT INTO public.logs VALUES (1108, NULL, 'type_of_sale', NULL, 'Vip', NULL);
INSERT INTO public.logs VALUES (1109, NULL, 'contract_term', NULL, '3 năm ', NULL);
INSERT INTO public.logs VALUES (1110, NULL, 'cover_price', NULL, '54000', NULL);
INSERT INTO public.logs VALUES (1111, NULL, 'royalty', NULL, '50', NULL);
INSERT INTO public.logs VALUES (1112, NULL, 'status_id', '1', '12', NULL);
INSERT INTO public.logs VALUES (1113, NULL, 'type_of_sale', NULL, 'Vip', NULL);
INSERT INTO public.logs VALUES (1114, NULL, 'contract_term', NULL, '3 năm ', NULL);
INSERT INTO public.logs VALUES (1115, NULL, 'cover_price', NULL, '78000', NULL);
INSERT INTO public.logs VALUES (1116, NULL, 'royalty', NULL, '50', NULL);
INSERT INTO public.logs VALUES (1117, NULL, 'status_id', '1', '12', NULL);
INSERT INTO public.logs VALUES (1118, NULL, 'type_of_sale', NULL, 'Vip', NULL);
INSERT INTO public.logs VALUES (1119, NULL, 'contracted_at', NULL, '10-10/2020', NULL);
INSERT INTO public.logs VALUES (1120, NULL, 'contract_term', NULL, '3 năm ', NULL);
INSERT INTO public.logs VALUES (1121, NULL, 'cover_price', NULL, '90000', NULL);
INSERT INTO public.logs VALUES (1122, NULL, 'royalty', NULL, '30', NULL);
INSERT INTO public.logs VALUES (1123, NULL, 'status_id', '1', '12', NULL);
INSERT INTO public.logs VALUES (1124, NULL, 'type_of_sale', NULL, 'Vip', NULL);
INSERT INTO public.logs VALUES (1125, NULL, 'contract_term', NULL, '3 năm ', NULL);
INSERT INTO public.logs VALUES (1126, NULL, 'cover_price', NULL, '188000', NULL);
INSERT INTO public.logs VALUES (1127, NULL, 'royalty', NULL, '50', NULL);
INSERT INTO public.logs VALUES (1128, NULL, 'status_id', '1', '12', NULL);
INSERT INTO public.logs VALUES (1129, NULL, 'type_of_sale', NULL, 'Vip', NULL);
INSERT INTO public.logs VALUES (1130, NULL, 'contracted_at', NULL, '10-03/2021', NULL);
INSERT INTO public.logs VALUES (1131, NULL, 'contract_term', NULL, '5 năm ', NULL);
INSERT INTO public.logs VALUES (1132, NULL, 'cover_price', NULL, '110000', NULL);
INSERT INTO public.logs VALUES (1133, NULL, 'royalty', NULL, '50', NULL);
INSERT INTO public.logs VALUES (1134, NULL, 'status_id', '1', '12', NULL);
INSERT INTO public.logs VALUES (1135, NULL, 'type_of_sale', NULL, 'Vip', NULL);
INSERT INTO public.logs VALUES (1136, NULL, 'contract_term', NULL, '3 năm ', NULL);
INSERT INTO public.logs VALUES (1137, NULL, 'cover_price', NULL, '108000', NULL);
INSERT INTO public.logs VALUES (1138, NULL, 'royalty', NULL, '50', NULL);
INSERT INTO public.logs VALUES (1139, NULL, 'status_id', '18', '20', NULL);
INSERT INTO public.logs VALUES (1140, NULL, 'status_id', '13', '17', NULL);
INSERT INTO public.logs VALUES (1141, NULL, 'status_id', '13', '17', NULL);
INSERT INTO public.logs VALUES (1142, NULL, 'status_id', '13', '14', NULL);
INSERT INTO public.logs VALUES (1143, NULL, 'status_id', '13', '14', NULL);
INSERT INTO public.logs VALUES (1144, NULL, 'status_id', '13', '15', NULL);
INSERT INTO public.logs VALUES (1145, NULL, 'status_id', '13', '17', NULL);
INSERT INTO public.logs VALUES (1146, NULL, 'status_id', '13', '17', NULL);
INSERT INTO public.logs VALUES (1147, NULL, 'status_id', '13', '15', NULL);
INSERT INTO public.logs VALUES (1148, NULL, 'status_id', '13', '17', NULL);
INSERT INTO public.logs VALUES (1149, NULL, 'status_id', '13', '18', NULL);
INSERT INTO public.logs VALUES (1150, NULL, 'status_id', '13', '18', NULL);
INSERT INTO public.logs VALUES (1151, NULL, 'status_id', '13', '18', NULL);
INSERT INTO public.logs VALUES (1152, NULL, 'status_id', '13', '18', NULL);
INSERT INTO public.logs VALUES (1153, NULL, 'status_id', '13', '17', NULL);
INSERT INTO public.logs VALUES (1154, NULL, 'status_id', '13', '17', NULL);
INSERT INTO public.logs VALUES (1155, NULL, 'status_id', '13', '20', NULL);
INSERT INTO public.logs VALUES (1156, NULL, 'status_id', '13', '18', NULL);
INSERT INTO public.logs VALUES (1157, NULL, 'status_id', '13', '18', NULL);
INSERT INTO public.logs VALUES (1158, NULL, 'status_id', '13', '18', NULL);
INSERT INTO public.logs VALUES (1159, NULL, 'status_id', '13', '20', NULL);
INSERT INTO public.logs VALUES (1160, NULL, 'status_id', '13', '18', NULL);
INSERT INTO public.logs VALUES (1161, NULL, 'status_id', '13', '18', NULL);
INSERT INTO public.logs VALUES (1162, NULL, 'status_id', '13', '18', NULL);
INSERT INTO public.logs VALUES (1163, NULL, 'status_id', '13', '18', NULL);
INSERT INTO public.logs VALUES (1164, NULL, 'status_id', '13', '18', NULL);
INSERT INTO public.logs VALUES (1165, NULL, 'status_id', '13', '18', NULL);
INSERT INTO public.logs VALUES (1166, NULL, 'status_id', '13', '20', NULL);
INSERT INTO public.logs VALUES (1167, NULL, 'status_id', '13', '20', NULL);
INSERT INTO public.logs VALUES (1168, NULL, 'status_id', '13', '15', NULL);
INSERT INTO public.logs VALUES (1169, NULL, 'status_id', '13', '14', NULL);
INSERT INTO public.logs VALUES (1170, NULL, 'status_id', '18', '20', NULL);
INSERT INTO public.logs VALUES (1171, NULL, 'status_id', '18', '20', NULL);
INSERT INTO public.logs VALUES (1172, NULL, 'status_id', '13', '20', NULL);
INSERT INTO public.logs VALUES (1173, NULL, 'status_id', '13', '17', NULL);
INSERT INTO public.logs VALUES (1174, NULL, 'status_id', '13', '20', NULL);
INSERT INTO public.logs VALUES (1175, NULL, 'status_id', '13', '15', NULL);
INSERT INTO public.logs VALUES (1176, NULL, 'status_id', '13', '20', NULL);
INSERT INTO public.logs VALUES (1177, NULL, 'status_id', '13', '20', NULL);
INSERT INTO public.logs VALUES (1178, NULL, 'status_id', '13', '18', NULL);
INSERT INTO public.logs VALUES (1179, NULL, 'status_id', '13', '17', NULL);
INSERT INTO public.logs VALUES (1180, NULL, 'status_id', '13', '17', NULL);
INSERT INTO public.logs VALUES (1181, NULL, 'status_id', '13', '15', NULL);
INSERT INTO public.logs VALUES (1182, NULL, 'status_id', '13', '15', NULL);
INSERT INTO public.logs VALUES (1183, NULL, 'status_id', '13', '15', NULL);
INSERT INTO public.logs VALUES (1184, NULL, 'status_id', '13', '14', NULL);
INSERT INTO public.logs VALUES (1185, NULL, 'status_id', '13', '20', NULL);
INSERT INTO public.logs VALUES (1186, NULL, 'status_id', '13', '15', NULL);
INSERT INTO public.logs VALUES (1187, NULL, 'status_id', '13', '15', NULL);
INSERT INTO public.logs VALUES (1188, NULL, 'status_id', '13', '15', NULL);
INSERT INTO public.logs VALUES (1189, NULL, 'status_id', '13', '18', NULL);
INSERT INTO public.logs VALUES (1190, NULL, 'status_id', '18', '19', NULL);
INSERT INTO public.logs VALUES (1191, NULL, 'status_id', '18', '19', NULL);
INSERT INTO public.logs VALUES (1192, NULL, 'status_id', '18', '19', NULL);
INSERT INTO public.logs VALUES (1193, NULL, 'status_id', '13', '15', NULL);
INSERT INTO public.logs VALUES (1194, NULL, 'status_id', '13', '14', NULL);
INSERT INTO public.logs VALUES (1195, NULL, 'status_id', '13', '18', NULL);
INSERT INTO public.logs VALUES (1196, NULL, 'status_id', '13', '15', NULL);
INSERT INTO public.logs VALUES (1197, NULL, 'status_id', '13', '16', NULL);
INSERT INTO public.logs VALUES (1198, NULL, 'status_id', '13', '15', NULL);
INSERT INTO public.logs VALUES (1199, NULL, 'status_id', '13', '18', NULL);
INSERT INTO public.logs VALUES (1200, NULL, 'status_id', '13', '18', NULL);
INSERT INTO public.logs VALUES (1201, NULL, 'status_id', '13', '18', NULL);
INSERT INTO public.logs VALUES (1202, NULL, 'status_id', '13', '16', NULL);
INSERT INTO public.logs VALUES (1203, NULL, 'status_id', '13', '18', NULL);
INSERT INTO public.logs VALUES (1204, NULL, 'status_id', '13', '18', NULL);
INSERT INTO public.logs VALUES (1205, NULL, 'status_id', '13', '18', NULL);
INSERT INTO public.logs VALUES (1206, NULL, 'status_id', '13', '18', NULL);
INSERT INTO public.logs VALUES (1207, NULL, 'status_id', '18', '17', NULL);
INSERT INTO public.logs VALUES (1208, NULL, 'status_id', '18', '17', NULL);
INSERT INTO public.logs VALUES (1209, NULL, 'status_id', '18', '17', NULL);
INSERT INTO public.logs VALUES (1210, NULL, 'status_id', '13', '19', NULL);
INSERT INTO public.logs VALUES (1211, NULL, 'status_id', '13', '20', NULL);
INSERT INTO public.logs VALUES (1212, NULL, 'status_id', '13', '20', NULL);
INSERT INTO public.logs VALUES (1213, NULL, 'status_id', '13', '19', NULL);
INSERT INTO public.logs VALUES (1214, NULL, 'status_id', '13', '16', NULL);
INSERT INTO public.logs VALUES (1215, NULL, 'status_id', '13', '14', NULL);
INSERT INTO public.logs VALUES (1216, NULL, 'status_id', '13', '18', NULL);
INSERT INTO public.logs VALUES (1217, NULL, 'status_id', '13', '18', NULL);
INSERT INTO public.logs VALUES (1218, NULL, 'status_id', '13', '20', NULL);
INSERT INTO public.logs VALUES (1219, NULL, 'status_id', '13', '20', NULL);
INSERT INTO public.logs VALUES (1220, NULL, 'status_id', '13', '17', NULL);
INSERT INTO public.logs VALUES (1221, NULL, 'status_id', '13', '14', NULL);
INSERT INTO public.logs VALUES (1222, NULL, 'status_id', '13', '16', NULL);
INSERT INTO public.logs VALUES (1223, NULL, 'status_id', '13', '20', NULL);
INSERT INTO public.logs VALUES (1224, NULL, 'status_id', '13', '20', NULL);
INSERT INTO public.logs VALUES (1225, NULL, 'status_id', '13', '14', NULL);
INSERT INTO public.logs VALUES (1226, NULL, 'status_id', '13', '14', NULL);
INSERT INTO public.logs VALUES (1227, NULL, 'status_id', '13', '17', NULL);
INSERT INTO public.logs VALUES (1228, NULL, 'status_id', '13', '14', NULL);
INSERT INTO public.logs VALUES (1229, NULL, 'status_id', '13', '14', NULL);
INSERT INTO public.logs VALUES (1230, NULL, 'status_id', '13', '14', NULL);
INSERT INTO public.logs VALUES (1231, NULL, 'status_id', '13', '14', NULL);
INSERT INTO public.logs VALUES (1232, NULL, 'status_id', '13', '14', NULL);
INSERT INTO public.logs VALUES (1233, NULL, 'status_id', '13', '14', NULL);
INSERT INTO public.logs VALUES (1234, NULL, 'status_id', '13', '14', NULL);
INSERT INTO public.logs VALUES (1235, NULL, 'status_id', '18', '20', NULL);
INSERT INTO public.logs VALUES (1236, NULL, 'status_id', '18', '20', NULL);
INSERT INTO public.logs VALUES (1237, NULL, 'status_id', '14', '13', NULL);
INSERT INTO public.logs VALUES (1238, NULL, 'status_id', '13', '14', NULL);
INSERT INTO public.logs VALUES (1239, NULL, 'status_id', '13', '20', NULL);
INSERT INTO public.logs VALUES (1240, NULL, 'status_id', '18', '20', NULL);
INSERT INTO public.logs VALUES (1241, NULL, 'status_id', '18', '13', NULL);
INSERT INTO public.logs VALUES (1242, NULL, 'status_id', '13', '18', NULL);
INSERT INTO public.logs VALUES (1243, NULL, 'status_id', '21', '25', NULL);
INSERT INTO public.logs VALUES (1244, NULL, 'produce_cost', NULL, '2.019.583', NULL);
INSERT INTO public.logs VALUES (1245, NULL, 'control_cost', NULL, '0', NULL);
INSERT INTO public.logs VALUES (1246, NULL, 'post_production_cost', NULL, '0', NULL);


--
-- TOC entry 2970 (class 0 OID 107589)
-- Dependencies: 202
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.roles VALUES (1, 'admin');
INSERT INTO public.roles VALUES (2, 'copyright');
INSERT INTO public.roles VALUES (3, 'produce');
INSERT INTO public.roles VALUES (4, 'upload');


--
-- TOC entry 2972 (class 0 OID 107597)
-- Dependencies: 204
-- Data for Name: statuses; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.statuses VALUES (10, 'Pending', 1, NULL);
INSERT INTO public.statuses VALUES (13, 'Nhận bản thảo', 2, NULL);
INSERT INTO public.statuses VALUES (14, 'Casting', 2, 3);
INSERT INTO public.statuses VALUES (15, 'Đang chờ talent available', 2, 7);
INSERT INTO public.statuses VALUES (16, 'Đang thu âm', 2, 7);
INSERT INTO public.statuses VALUES (17, 'Đang dò soát', 2, 3);
INSERT INTO public.statuses VALUES (18, 'Đang sửa file', 2, 7);
INSERT INTO public.statuses VALUES (19, 'Đang hậu kỳ', 2, 3);
INSERT INTO public.statuses VALUES (20, 'Đã giao audio', 2, NULL);
INSERT INTO public.statuses VALUES (21, 'Đang kiểm tra audio', 3, NULL);
INSERT INTO public.statuses VALUES (22, 'Chưa up, chờ chỉnh audio', 3, NULL);
INSERT INTO public.statuses VALUES (23, 'Đã up, chờ phê duyệt ', 3, NULL);
INSERT INTO public.statuses VALUES (24, 'Chưa duyệt, chờ chỉnh sửa', 3, NULL);
INSERT INTO public.statuses VALUES (25, 'Đã hoàn tất', 3, NULL);
INSERT INTO public.statuses VALUES (1, 'Chưa liên hệ', 1, NULL);
INSERT INTO public.statuses VALUES (2, 'Đã liên hệ lần đầu', 1, NULL);
INSERT INTO public.statuses VALUES (3, 'Đang trao đổi', 1, NULL);
INSERT INTO public.statuses VALUES (4, 'Đã gửi offer', 1, NULL);
INSERT INTO public.statuses VALUES (5, 'Đang làm HĐ mua BQ gốc', 1, NULL);
INSERT INTO public.statuses VALUES (6, 'Đã ký HĐ gốc', 1, NULL);
INSERT INTO public.statuses VALUES (7, 'Chờ bản thảo', 1, NULL);
INSERT INTO public.statuses VALUES (8, 'Đang dịch/mua bản dịch', 1, NULL);
INSERT INTO public.statuses VALUES (9, 'Hoàn tất dịch', 1, NULL);
INSERT INTO public.statuses VALUES (11, 'Không thành công', 1, NULL);
INSERT INTO public.statuses VALUES (12, 'Đã giao bản thảo', 1, NULL);


--
-- TOC entry 2974 (class 0 OID 107605)
-- Dependencies: 206
-- Data for Name: topic_canceled; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.topic_canceled VALUES (25, 'Khoong mua dc', 3);


--
-- TOC entry 2976 (class 0 OID 107613)
-- Dependencies: 208
-- Data for Name: topics; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.topics VALUES (28, 14, 'Outwitting the devil in you ', 'Chiến thắng con quỷ trong bạn', 'Bí quyết Tự do & Thành công ', 'Napoleon Hill ', 'Napoleon Hill Foundation', 'self help, thành công, giàu có, hạnh phúc ', 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, true, '2022-03-16 09:16:06.203509+00', '2022-03-16 09:16:44.802+00', '2022-03-16 09:16:44.802+00', NULL, NULL, 1, '2022-03-16 09:16:06.203509', '2022-03-16 09:16:06.203509', NULL, NULL, 'Không ', NULL, NULL, NULL);
INSERT INTO public.topics VALUES (29, 15, 'Hidden spring: A Buddhist Woman Confronts Cancer', 'Hồi sinh ', 'Thực hành đạo Phật để chuyển hóa tế bào ung thư ', 'Sandy Boucher ', 'Wisdom Publications ', 'sức khỏe, ung thư, Phật pháp ', 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, true, '2022-03-16 09:19:13.990442+00', '2022-03-16 09:19:21.194+00', '2022-03-16 09:19:21.194+00', NULL, NULL, 1, '2022-03-16 09:19:13.990442', '2022-03-16 09:19:13.990442', NULL, NULL, 'Không ', NULL, NULL, NULL);
INSERT INTO public.topics VALUES (33, 19, 'A Hunter-Gatherer''s Guide to the 21st Century', 'A Hunter-Gatherer''s Guide to the 21st Century', 'Evolution and the Challenges of Modern Life', 'Heather Heying; Bret Wenstein ', 'Heather Heying; Bret Wenstein c/o The Ross Yoon Agency ', 'kiến thức tổng quát, chủ ngĩa hiện sinh, sách tinh hoa ', 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, true, '2022-03-16 09:29:30.878857+00', '2022-03-16 09:29:35.924+00', '2022-03-16 09:29:35.924+00', NULL, NULL, 1, '2022-03-16 09:29:30.878857', '2022-03-16 09:29:30.878857', NULL, NULL, 'The GrayHawk Agency ', NULL, NULL, NULL);
INSERT INTO public.topics VALUES (38, 24, 'Every minute is a Day', 'Every minute is a Day', 'A Doctor, an Emergency Room, and a City Under Siege', 'Robert Meyer MD; Dan Koeppel ', 'Robert Meyer MD; Dan Koeppel c/o Sterling Lord Literistic ', 'sức khỏe, covid-19, đại dịch', 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, true, '2022-03-16 09:33:14.391902+00', '2022-03-16 09:33:39.731+00', '2022-03-16 09:33:39.731+00', NULL, NULL, 1, '2022-03-16 09:33:14.391902', '2022-03-16 09:33:14.391902', NULL, NULL, 'The GrayHawk Agency ', NULL, NULL, NULL);
INSERT INTO public.topics VALUES (40, 26, 'The Four Tendencies ', 'Bạn là ai và làm thế nào để sống tốt hơn ', '4 loại tính cách giúp bạn nhận ra mình ', 'Gretchen Rubin ', 'Gretchen Rubin c/o Fletcher & Co. ', 'hạnh phúc, khám phá bản thân, tâm lý ', 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, true, '2022-03-16 09:42:27.487034+00', '2022-03-16 09:42:36.248+00', '2022-03-16 09:42:36.248+00', NULL, NULL, 1, '2022-03-16 09:42:27.487034', '2022-03-16 09:42:27.487034', NULL, NULL, 'Maxima Creative Agency ', NULL, NULL, NULL);
INSERT INTO public.topics VALUES (41, 27, 'The Start up Way ', 'Con đường Khởi nghiệp ', 'Cách các công ty hiện đại áp dụng quản trị khởi nghiệp chuyển đổi văn hóa & thúc đẩy tăng trưởng dài hạn', 'Eric Ries ', 'Eric Ries c/o Fletcher & Co. ', 'khởi nghiệp, khởi nghiệp tinh gọn, quản trị ', 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, true, '2022-03-16 09:45:29.983147+00', '2022-03-16 09:45:39.282+00', '2022-03-16 09:45:39.282+00', NULL, NULL, 1, '2022-03-16 09:45:29.983147', '2022-03-16 09:45:29.983147', NULL, NULL, 'Maxima Creative Agency ', NULL, NULL, NULL);
INSERT INTO public.topics VALUES (42, 28, 'The Good Billionaire', 'The Good Billionaire', NULL, 'Tim Schwab ', 'Macmillan Publishing Group d/b/a Henry Holt & Company ', 'Bill Gates, bí mật, doanh nhân, người nổi tiếng ', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, true, '2022-03-16 09:53:14.986227+00', '2022-03-16 09:53:32.159+00', '2022-03-16 09:53:32.159+00', NULL, NULL, 1, '2022-03-16 09:53:14.986227', '2022-03-16 09:53:14.986227', NULL, NULL, 'Maxima Creative Agency ', NULL, NULL, NULL);
INSERT INTO public.topics VALUES (43, 29, 'Thursday is the new Friday ', 'Thursday is the new Friday ', 'How to work fewer hours, make more money, and spend time doing what you want', 'Joe Sanok ', 'HarperCollins Focus ', 'quản lý thời gian, tuần làm việc 4 ngày, tuần làm việc 4 giờ, làm như chơi', 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, true, '2022-03-16 09:57:03.944174+00', '2022-03-16 09:57:10.256+00', '2022-03-16 09:57:10.256+00', NULL, NULL, 1, '2022-03-16 09:57:03.944174', '2022-03-16 09:57:03.944174', NULL, NULL, 'Maxima Creative Agency ', NULL, NULL, NULL);
INSERT INTO public.topics VALUES (45, 31, 'The Art of Reading Minds', 'The Art of Reading Minds', 'How to Understand and Influence Others Without Them Noticing', 'Henrik Fexeus ', 'Henrik Fexues AB c/o Nordin Agency ', 'đọc vị, đọc tâm trí, ngôn ngữ cơ thể ', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, true, '2022-03-16 09:59:27.406717+00', '2022-03-16 09:59:27.406717+00', '2022-03-16 09:59:27.406717+00', NULL, NULL, 1, '2022-03-16 09:59:27.406717', '2022-03-16 09:59:27.406717', NULL, NULL, 'The GrayHawk Agency ', NULL, NULL, NULL);
INSERT INTO public.topics VALUES (49, 35, 'Elephant in the Brain ', 'Elephant in the Brain ', 'Hidden motives in everyday life ', 'Kevin Simler; Robin Hanson ', 'Oxford Publishing Limited ', 'tâm lý học, khoa học xã hội, tâm lý ứng dụng, chủ nghĩa hiện sinh', 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, true, '2022-03-16 10:02:41.393049+00', '2022-03-16 10:02:51.328+00', '2022-03-16 10:02:51.328+00', NULL, NULL, 1, '2022-03-16 10:02:41.393049', '2022-03-16 10:02:41.393049', NULL, NULL, 'Không ', NULL, NULL, NULL);
INSERT INTO public.topics VALUES (25, 11, 'Đừng Sợ Lỡ Cuộc Chơi', 'Đừng Sợ Lỡ Cuộc Chơi', 'FOMO', 'Patrick MCGinnis', 'First News', 'fomo,', 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, '2022-03-11 07:34:52.338445+00', '2022-03-16 09:13:03.126+00', '2022-04-05 03:57:58.824+00', NULL, '2022-04-05 03:57:58.824+00', 1, '2022-03-11 07:34:52.338445', '2022-03-11 07:34:52.338445', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.topics VALUES (53, 39, 'Power Ambition Glory', 'Tướng quân và CEO ', 'Bài học từ sự tương đồng đầy bất ngờ giữa các tướng quân cổ đại và CEO thời nay ', 'Steve Forbes; John Prevas ', 'Random House ', 'quản trị, quản lý doanh nghiệp, lịch sử', 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, true, '2022-03-16 10:07:43.662918+00', '2022-03-16 10:07:56.238+00', '2022-03-16 10:07:56.238+00', NULL, NULL, 1, '2022-03-16 10:07:43.662918', '2022-03-16 10:07:43.662918', NULL, NULL, 'Maxima Creative Agency ', NULL, NULL, NULL);
INSERT INTO public.topics VALUES (32, 18, 'Bên Hồ Thanh Thủy', 'Bên Hồ Thanh Thủy', NULL, 'Bà Tùng Long', 'Nguyễn Đông Thức', 'tiểu thuyết, tình yêu, phụ nữ, thân phận đàn bà, hôn nhân, gia đình', 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, '2022-03-16 09:29:26.394931+00', '2022-03-16 09:29:26.394931+00', '2022-04-13 08:11:35.15+00', NULL, '2022-04-13 08:11:35.15+00', 1, '2022-03-16 09:29:26.394931', '2022-03-16 09:29:26.394931', NULL, NULL, 'Không', NULL, NULL, NULL);
INSERT INTO public.topics VALUES (34, 20, 'Duyên Tình Lạc Bến', 'Duyên Tình Lạc Bến', NULL, 'Bà Tùng Long', 'Nguyễn Đông Thức', 'tiểu thuyết, tình yêu, phụ nữ, thân phận đàn bà, hôn nhân, gia đình', 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, '2022-03-16 09:30:39.124508+00', '2022-03-16 09:30:39.124508+00', '2022-04-13 08:11:44.515+00', NULL, '2022-04-13 08:11:44.515+00', 1, '2022-03-16 09:30:39.124508', '2022-03-16 09:30:39.124508', NULL, NULL, 'Không', NULL, NULL, NULL);
INSERT INTO public.topics VALUES (35, 21, 'Mẹ Chồng Nàng Dâu', 'Mẹ Chồng Nàng Dâu', NULL, 'Bà Tùng Long', 'Nguyễn Đông Thức', 'tiểu thuyết, tình yêu, phụ nữ, thân phận đàn bà, hôn nhân, gia đình', 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, '2022-03-16 09:31:15.644829+00', '2022-03-16 09:31:15.644829+00', '2022-04-13 08:11:51.129+00', NULL, '2022-04-13 08:11:51.129+00', 1, '2022-03-16 09:31:15.644829', '2022-03-16 09:31:15.644829', NULL, NULL, 'Không', NULL, NULL, NULL);
INSERT INTO public.topics VALUES (36, 22, 'Một Vụ Án Tình', 'Một Vụ Án Tình', NULL, 'Bà Tùng Long', 'Nguyễn Đông Thức', 'tiểu thuyết, tình yêu, phụ nữ, thân phận đàn bà, hôn nhân, gia đình, thù hận', 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, '2022-03-16 09:32:04.44948+00', '2022-03-16 09:32:04.44948+00', '2022-04-13 08:11:58.848+00', NULL, '2022-04-13 08:11:58.848+00', 1, '2022-03-16 09:32:04.44948', '2022-03-16 09:32:04.44948', NULL, NULL, 'Không', NULL, NULL, NULL);
INSERT INTO public.topics VALUES (37, 23, 'Những Ai Gieo Gió', 'Những Ai Gieo Gió', NULL, 'Bà Tùng Long', 'Nguyễn Đông Thức', 'tiểu thuyết, tình yêu, phụ nữ, thân phận đàn bà, hôn nhân, gia đình, nhân quả', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, '2022-03-16 09:32:58.891977+00', '2022-04-13 08:12:02.567+00', '2022-04-13 08:12:02.567+00', NULL, NULL, 1, '2022-03-16 09:32:58.891977', '2022-03-16 09:32:58.891977', NULL, NULL, 'Không', NULL, NULL, NULL);
INSERT INTO public.topics VALUES (44, 30, 'Hồng Nhan Đa Truân', 'Hồng Nhan Đa Truân', NULL, 'Bà Tùng Long', 'Nguyễn Đông Thức', 'tiểu thuyết, tình yêu, phụ nữ, thân phận đàn bà, hôn nhân, gia đình, hồng nhan', 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, '2022-03-16 09:58:56.39109+00', '2022-03-16 09:58:56.39109+00', '2022-04-13 08:12:13.78+00', NULL, '2022-04-13 08:12:13.78+00', 1, '2022-03-16 09:58:56.39109', '2022-03-16 09:58:56.39109', NULL, NULL, 'Không', NULL, NULL, NULL);
INSERT INTO public.topics VALUES (46, 32, 'Nghĩa Tình Ràng Buộc', 'Nghĩa Tình Ràng Buộc', NULL, 'Bà Tùng Long', 'Nguyễn Đông Thức', 'tiểu thuyết, tình yêu, phụ nữ, thân phận đàn bà, hôn nhân, gia đình', 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, '2022-03-16 09:59:37.459225+00', '2022-03-16 09:59:37.459225+00', '2022-04-13 08:12:30.25+00', NULL, '2022-04-13 08:12:30.25+00', 1, '2022-03-16 09:59:37.459225', '2022-03-16 09:59:37.459225', NULL, NULL, 'Không', NULL, NULL, NULL);
INSERT INTO public.topics VALUES (47, 33, 'Đời Con Gái', 'Đời Con Gái', NULL, 'Bà Tùng Long', 'Nguyễn Đông Thức', 'tiểu thuyết, tình yêu, phụ nữ, thân phận đàn bà, hôn nhân, gia đình', 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, '2022-03-16 10:00:19.894663+00', '2022-03-16 10:00:19.894663+00', '2022-04-13 08:12:36.897+00', NULL, '2022-04-13 08:12:36.897+00', 1, '2022-03-16 10:00:19.894663', '2022-03-16 10:00:19.894663', NULL, NULL, 'Không', NULL, NULL, NULL);
INSERT INTO public.topics VALUES (48, 34, 'Ngọc Trong Đá', 'Ngọc Trong Đá', NULL, 'Nguyễn Đông Thức', 'Nguyễn Đông Thức', 'tiểu thuyết, tình yêu, tình cảm, văn học VN, thập niên 90', 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, '2022-03-16 10:01:34.441247+00', '2022-03-16 10:01:34.441247+00', '2022-04-13 08:12:43.995+00', NULL, '2022-04-13 08:12:43.995+00', 1, '2022-03-16 10:01:34.441247', '2022-03-16 10:01:34.441247', NULL, NULL, 'Không', NULL, NULL, NULL);
INSERT INTO public.topics VALUES (50, 36, 'Ngôi Sao Cô Đơn', 'Ngôi Sao Cô Đơn', NULL, 'Nguyễn Đông Thức', 'Nguyễn Đông Thức', 'tiểu thuyết, tình yêu, tình cảm, văn học VN, thập niên 90', 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, '2022-03-16 10:02:57.244941+00', '2022-03-16 10:02:57.244941+00', '2022-04-13 08:12:53.535+00', NULL, '2022-04-13 08:12:53.535+00', 1, '2022-03-16 10:02:57.244941', '2022-03-16 10:02:57.244941', NULL, NULL, 'Không', NULL, NULL, NULL);
INSERT INTO public.topics VALUES (51, 37, 'Vĩnh Biệt Mùa Hè', 'Vĩnh Biệt Mùa Hè', NULL, 'Nguyễn Đông Thức', 'Nguyễn Đông Thức', 'tiểu thuyết, tình yêu, tình cảm, văn học VN, thập niên 90', 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, '2022-03-16 10:03:29.232391+00', '2022-03-16 10:03:29.232391+00', '2022-04-13 08:12:59.263+00', NULL, '2022-04-13 08:12:59.263+00', 1, '2022-03-16 10:03:29.232391', '2022-03-16 10:03:29.232391', NULL, NULL, 'Không', NULL, NULL, NULL);
INSERT INTO public.topics VALUES (52, 38, 'Trăm Sông Về Biển', 'Trăm Sông Về Biển', NULL, 'Nguyễn Đông Thức', 'Nguyễn Đông Thức', 'tiểu thuyết, tình yêu, tình cảm, văn học VN, thập niên 90', 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, '2022-03-16 10:04:12.939144+00', '2022-03-16 10:04:12.939144+00', '2022-04-13 08:13:38.203+00', NULL, '2022-04-13 08:13:38.203+00', 1, '2022-03-16 10:04:12.939144', '2022-03-16 10:04:12.939144', NULL, NULL, 'Không', NULL, NULL, NULL);
INSERT INTO public.topics VALUES (54, 40, 'On Earth We''re Briefly Gorgeous ', 'Một thoáng ta rực rỡ ở nhân gian ', NULL, 'Ocean Vuong', 'Ocean Vuong c/o The Marsh Agency ', 'tiểu thuyết, Ocean Vuong', 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, true, '2022-03-16 10:11:51.69853+00', '2022-03-16 10:12:02.546+00', '2022-03-16 10:12:02.546+00', NULL, NULL, 1, '2022-03-16 10:11:51.69853', '2022-03-16 10:11:51.69853', NULL, NULL, 'Big Apple Agency ', NULL, NULL, NULL);
INSERT INTO public.topics VALUES (151, 82, NULL, 'Amitie Nuôi Dưỡng Tâm Hồn Trẻ Em Thông Qua Bóng Đá', NULL, 'Kitaguchi Haruki ', 'Phương Nam Books', NULL, 12, NULL, NULL, NULL, 'Vip', '27-09/2021', '5 năm ', 89000, NULL, 'NaN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-13 14:33:50.136201+00', '2022-04-13 14:33:50.136201+00', '2022-04-13 14:36:01.026+00', NULL, '2022-04-13 14:36:01.026+00', 1, '2022-04-13 14:33:50.136201', '2022-04-13 14:33:50.136201', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.topics VALUES (30, 16, 'Bóng Người Xưa ', 'Bóng Người Xưa ', NULL, 'Bà Tùng Long', 'Nguyễn Đông Thức', 'tiểu thuyết, phụ nữ, thân phận đàn bà, tình yêu, hôn nhân, gia đình', 12, 4, '75', 'Nếu người đàn bà sinh ra chỉ để làm bạn với bếp núc, thì cái câu “Giặc đến nhà đàn bà phải đánh” chẳng là vô nghĩa lắm?
Không, giang san đôi gánh nặng, trách nhiệm gái trai chung, nếu tài lực và tâm đức cho phép thì đối với xã hội, ngưài đàn bà cũng phải có một phần nhiệm vụ như người đàn ông vậy.
Và nếu quốc gia, xã hội mà đòi hỏi, thì người đàn bà cũng phải vứt chỉ kim mà đứng dậy, đạp gai góc để lên đường.
Trong lịch sử nước nhà, hai bà Trưng, một bà Triệu, há không là tấm gương sáng nghìn thu cho nữ nhi ta đấy ư?
Lệ Hằng, nhân vật chính của Bóng người xưa, là điển hình của loại nhân vật cao thượng ấy trong thời Pháp thuộc. Là một cô gái có sắc, có tài, lại có lòng yêu nước, cô phải làm thế nào để thực hiện chí nguyện của cô?    .
Lệ Hằng tham gia một đảng chống Pháp và lãnh nhiệm vụ cung cấp tài chính. Cô lấy chồng là Anh Kiệt, một nhà tư sản giàu có theo sự phân công của tổ chức đảng, và lấy tiền của Anh Kiệt trao cho tổ chức.
Sự hy sinh của cô đáng quý mến, mà cách hành động của cô cũng đáng ghi chép. Nhưng Anh Kiệt không phải là người chỉ biết tiền. Với cô, anh còn là người chồng chung thủy. Bên tình, bên nghĩa, cô phải làm sao? Và làm sao trong tình thế ấy, cô phải xử trí như thế nào để người bạn trăm năm của cô khỏi phải vì cô mà mang họa? Lệ Hằng đã dùng đến chước “kim thiền thoát xác” để trọn vẹn một gánh nghĩa tình.
Nhưng cốt truyện không phải đến đây là dứt. Ta thấy cái cao quý của người đàn bà Việt Nam ở nhân cách cô Thúy Ái, một nhân vật chính khác.
Về sống bên chồng giữa một không khí không chút thuận lợi, thế mà ngày một ngày hai, với cử chỉ đoan trang mà điềm đạm, với đức độ bao dung mà khiêm tốn, cô đã chinh phục được tất cả những người quanh cô.
Và cái đáng quý nhất là một khi biết được hành tung và tâm chí của Lệ Hằng, Thúy Ái đã tình nguyện nhận nhiệm vụ tiếp tế mà không một chút ghen tuông, ganh tị.
Hơn thế nữa, cô còn tự vận dụng tài sức của mình để làm ra của cải, chứ không khoanh tay ngồi dùng sẵn của chồng. Một tấm gương hoạt động cho các bà chủ gia đình ở chốn gác tía lầu son.
Trong công cuộc kiến thiết nước nhà, người như cô Lệ Hằng cần phải ra mặt góp sức với nhân dân, và người như Thúy Ái phải trở thành một gương mẫu chung cho cả thế hệ.
Đó là điều tác giả hằng mong mỏi.', 'Vip', '2022-07-03', '5', 92000, NULL, '25', '2000000', 'NaN', 'audio', 'undefined', 'Giọng Sài Gòn: giọng miền Nam chuẩn, không ngọng, không tiếng địa phương (ví dụ: "r" với "g", "tr" với "t")', 'undefined', NULL, false, '2022-03-16 09:27:11.896233+00', '2022-03-16 09:27:11.896233+00', '2022-03-16 23:48:41.478+00', NULL, '2022-03-16 23:48:41.478+00', 1, '2022-03-16 09:27:11.896233', '2022-03-16 09:27:11.896233', NULL, NULL, 'Không', '07/09/2022', NULL, NULL);
INSERT INTO public.topics VALUES (72, 49, NULL, 'Cổ phiếu thường lợi nhuận phi thường', NULL, 'Philip Fisher', 'Alphabooks', 'đầu tư, chứng khoán ', 12, 1, '62', 'dropbox
https://www.dropbox.com/scl/fi/gsbb0xntm9ufdwxczx6nu/Gi-i-thi-u-s-ch-C-Phi-u-Th-ng-L-i-Nhu-n-Phi-Th-ng.docx?dl=0&rlkey=hhlrgbj017vu5wowxrz9got8d', NULL, 'Invalid date', '3 năm', 199000, NULL, '50', '8015500', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-05 05:13:24.289649+00', '2022-04-05 05:13:24.289649+00', '2022-04-05 05:19:10.561+00', NULL, '2022-04-05 05:19:10.561+00', 1, '2022-04-05 05:13:24.289649', '2022-04-05 05:13:24.289649', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.topics VALUES (67, 46, NULL, 'Utopia Địa Đàng Trần Gian', NULL, 'Thomas More', 'Nhã Nam', 'chính trị, văn hóa, kinh điển quốc tế', 12, 1, '11', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-05 04:35:48.039013+00', '2022-04-05 04:35:48.039013+00', '2022-04-05 04:43:41.901+00', NULL, '2022-04-05 04:43:41.901+00', 1, '2022-04-05 04:35:48.039013', '2022-04-05 04:35:48.039013', NULL, NULL, 'Squirrel Communication and Culture', NULL, NULL, NULL);
INSERT INTO public.topics VALUES (69, 47, NULL, 'Hội Hè Miên Man', NULL, 'Ernest Hemingway', 'Nhã Nam', 'Ernest hemingway, văn học phương tây ', 12, 4, '74', NULL, NULL, '2021-05-05 00:00:00.000 +00:00', '5', 'NaN', NULL, 'NaN', 'NaN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-05 04:52:59.806346+00', '2022-04-05 04:52:59.806346+00', '2022-04-05 04:55:28.519+00', NULL, '2022-04-05 04:55:28.519+00', 1, '2022-04-05 04:52:59.806346', '2022-04-05 04:52:59.806346', NULL, NULL, 'Squirrel Communication and Culture', NULL, NULL, NULL);
INSERT INTO public.topics VALUES (74, 50, 'Winning the Game of Life', 'Chiến Thắng Trò Chơi Cuộc Sống ', NULL, 'Adam Khoo', 'AKLTG', 'Adam Khoo', 12, 1, '70', 'Dropbox
https://www.dropbox.com/scl/fi/p2ohxu3q3osunoqlvgdof/Gi-i-thi-u-s-ch-Chi-n-th-ng-tr-ch-i-trong-cu-c-s-ng.docx?dl=0&rlkey=diu0cf88rgduqe3ji9kf3d5i5', 'Vip', '2021-06-04 00:00:00.000 +00:00', '5', 95000, NULL, 'NaN', 'NaN', 0, NULL, '12,5 %', NULL, NULL, NULL, NULL, '2022-04-05 05:22:06.360461+00', '2022-04-05 05:22:06.360461+00', '2022-04-05 05:30:16.445+00', NULL, '2022-04-05 05:30:16.445+00', 1, '2022-04-05 05:22:06.360461', '2022-04-05 05:22:06.360461', NULL, NULL, '', NULL, NULL, NULL);
INSERT INTO public.topics VALUES (76, 51, NULL, 'Sống can đảm đời viên mãn ', NULL, 'Dale Carnegie', 'Phương Nam Books', 'Dale Carnegie', 12, 1, '44,70', 'Dropbox https://www.dropbox.com/scl/fi/jx5m0itteotnnn6zgz07w/Gi-i-thi-u-s-ch-S-ng-can-m-i-vi-n-m-n.docx?dl=0&rlkey=r0onu4a6gzzzdkomkginux430', 'Vip', 'Invalid date', '5', 109000, NULL, '35', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-05 05:34:57.35186+00', '2022-04-05 05:34:57.35186+00', '2022-04-05 08:02:15.88+00', NULL, '2022-04-05 08:02:15.88+00', 1, '2022-04-05 05:34:57.35186', '2022-04-05 05:34:57.35186', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.topics VALUES (71, 48, NULL, 'Trí tuệ đức Phật', NULL, 'Lama Thamthog Rinpoche', 'Tuệ Tri', 'phật giáo, tâm linh, phật pháp ứng dụng ', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-05 05:05:44.629093+00', '2022-04-13 08:13:55.767+00', '2022-04-13 08:13:55.767+00', NULL, NULL, 1, '2022-04-05 05:05:44.629093', '2022-04-05 05:05:44.629093', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.topics VALUES (78, 52, NULL, 'Nhạn', NULL, 'Mori Ogai', 'Phương Nam Books', 'tiểu thuyết, văn học Nhật Bản ', 12, 4, '74', 'Dropbox https://www.dropbox.com/scl/fi/6nag3cs773hb6q7ljk0gx/Gi-i-thi-u-s-ch-Nh-n.docx?dl=0&rlkey=ksmaftvc4f8ek0cfrkz2tcy90', 'Vip', 'Invalid date', '5', 68000, NULL, '35', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-05 08:41:14.421787+00', '2022-04-05 08:41:14.421787+00', '2022-04-05 08:52:54.651+00', NULL, '2022-04-05 08:52:54.651+00', 1, '2022-04-05 08:41:14.421787', '2022-04-05 08:41:14.421787', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.topics VALUES (80, 53, 'Winning the 21st the century games', 'Chiến thắng Cuộc chơi Thế kỉ 21', NULL, 'Adam Khoo, Jeremy Han', 'AKLTG', 'Adam Khoo', 12, 1, '70', 'Dropbox
https://www.dropbox.com/scl/fi/p7g9l74a5j1721ub5ilw8/Gi-i-thi-u-s-ch-Chi-n-th-ng-cu-c-ch-i-th-k-21.docx?dl=0&rlkey=cmgiervj1nfuey32h8gaplzjj', NULL, '2021-06-04 00:00:00.000 +00:00', '5', 95000, NULL, 'NaN', 'NaN', 0, NULL, '12,5', NULL, NULL, NULL, true, '2022-04-05 08:54:41.671899+00', '2022-04-05 08:54:41.671899+00', '2022-04-05 08:59:32.797+00', NULL, '2022-04-05 08:59:32.797+00', 1, '2022-04-05 08:54:41.671899', '2022-04-05 08:54:41.671899', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.topics VALUES (82, 54, NULL, 'Lý Trí Và Tình Cảm', NULL, 'Jane Austen', 'Nhã Nam', 'văn học phương Tây, tiểu thuyết ', 12, 4, '74', '
', NULL, '2021-05-05 00:00:00.000 +00:00', '5', 129000, NULL, '25', '2000000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-05 09:03:15.704067+00', '2022-04-05 09:03:15.704067+00', '2022-04-05 09:11:38.963+00', NULL, '2022-04-05 09:11:38.963+00', 1, '2022-04-05 09:03:15.704067', '2022-04-05 09:03:15.704067', NULL, NULL, 'Squirrel Communication and Culture', NULL, NULL, NULL);
INSERT INTO public.topics VALUES (64, 11, 'Đừng Sợ Lỡ Cuộc Chơi', 'Đừng Sợ Lỡ Cuộc Chơi', 'FOMO', 'Patrick MCGinnis', 'First News', 'fomo,', 20, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, '2022-03-11 07:34:52.338+00', '2022-04-08 08:23:13.229+00', '2022-04-08 08:23:13.229+00', NULL, '2022-04-05 03:57:58.824+00', 2, '2022-04-05 03:57:59.376', '2022-03-11 07:34:52.338', '2022-04-08 08:23:13.229', NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.topics VALUES (68, 46, NULL, 'Utopia Địa Đàng Trần Gian', NULL, 'Thomas More', 'Nhã Nam', 'chính trị, văn hóa, kinh điển quốc tế', 15, 1, '11', NULL, 'Vip', '2021-05-05 00:00:00.000 +00:00', '5', 50000, NULL, '25', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-05 04:35:48.039+00', '2022-04-05 05:08:33.13+00', '2022-04-08 09:14:24.706+00', '2022-04-20 04:43:41.901+00', '2022-04-05 04:43:41.901+00', 2, '2022-04-05 04:43:42.117', '2022-04-05 04:35:48.039', NULL, NULL, 'Squirrel Communication and Culture', NULL, NULL, NULL);
INSERT INTO public.topics VALUES (75, 50, 'Winning the Game of Life', 'Chiến Thắng Trò Chơi Cuộc Sống ', NULL, 'Adam Khoo', 'AKLTG', 'Adam Khoo', 20, 1, '70', 'Dropbox
https://www.dropbox.com/scl/fi/p2ohxu3q3osunoqlvgdof/Gi-i-thi-u-s-ch-Chi-n-th-ng-tr-ch-i-trong-cu-c-s-ng.docx?dl=0&rlkey=diu0cf88rgduqe3ji9kf3d5i5', 'Vip', '2021-06-04 00:00:00.000 +00:00', '5', 95000, NULL, '37.5', NULL, 0, NULL, '12,5 %', NULL, NULL, NULL, NULL, '2022-04-05 05:22:06.36+00', '2022-04-14 10:27:40.554+00', '2022-04-08 08:24:46.185+00', NULL, '2022-04-05 05:30:16.445+00', 2, '2022-04-05 05:30:16.767', '2022-04-05 05:22:06.36', '2022-04-08 08:24:46.185', NULL, '', NULL, NULL, NULL);
INSERT INTO public.topics VALUES (70, 47, NULL, 'Hội Hè Miên Man', NULL, 'Ernest Hemingway', 'Nhã Nam', '2000000 ', 20, 4, '74', NULL, NULL, '2021-05-05 00:00:00.000 +00:00', '5', 68000, NULL, '25', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-05 04:52:59.806+00', '2022-04-08 08:45:21.299+00', '2022-04-08 08:45:21.299+00', NULL, '2022-04-05 04:55:28.519+00', 2, '2022-04-05 04:55:28.848', '2022-04-05 04:52:59.806', '2022-04-08 08:45:21.299', NULL, 'Squirrel Communication and Culture', NULL, NULL, NULL);
INSERT INTO public.topics VALUES (129, 71, NULL, 'Tư duy sáng tạo - Cưỡi thuyền ngược gió', NULL, 'Nobuyuki Takahashi', 'Thái Hà books', NULL, 12, NULL, NULL, NULL, 'Vip', '10- 12/2021', '3 năm ', 53000, NULL, '24', '2000000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-13 09:54:51.391101+00', '2022-04-13 09:54:51.391101+00', '2022-04-13 09:56:33.321+00', NULL, '2022-04-13 09:56:33.321+00', 1, '2022-04-13 09:54:51.391101', '2022-04-13 09:54:51.391101', NULL, NULL, 'Squirrel Communication and Culture', NULL, NULL, NULL);
INSERT INTO public.topics VALUES (84, 55, ' Winning the Game of Stock', 'Chiến thắng trò chơi chứng khoán', NULL, 'Adam Khoo', 'AKLTG', NULL, 12, NULL, NULL, 'Dropbox https://www.dropbox.com/scl/fi/fhcsbiywh5y5ac5e6u89n/Gi-i-thi-u-s-ch-Chi-n-th-ng-tr-ch-i-ch-ng-kho-n.docx?dl=0&rlkey=qte7lmukpz7n34t1yigbtyadc', NULL, '2021-06-04 00:00:00.000 +00:00', '5', 240000, NULL, 'NaN', 'NaN', 0, NULL, '12,5', NULL, NULL, NULL, true, '2022-04-05 09:13:52.877972+00', '2022-04-05 09:13:52.877972+00', '2022-04-05 09:17:24.238+00', NULL, '2022-04-05 09:17:24.239+00', 1, '2022-04-05 09:13:52.877972', '2022-04-05 09:13:52.877972', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.topics VALUES (86, 56, NULL, 'Ghi Chú Siêu Phàm', NULL, 'Thương Tâm Bích', 'Nhân Sinh Cửu Bảo ', 'Nhân sinh cửu bảo, thương tâm bích, kỹ năng ', 12, 1, '44,70', 'Dropbox https://www.dropbox.com/scl/fi/lj64dll5w24isbak51fa2/Gi-i-thi-u-s-ch-Ghi-Ch-Si-u-Ph-m.docx?dl=0&rlkey=smxarcj3jcoeh5oyrcji8dnub', NULL, 'Invalid date', '5 ', 65000, NULL, '25', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-05 09:27:19.167392+00', '2022-04-05 09:27:19.167392+00', '2022-04-05 09:31:02.66+00', NULL, '2022-04-05 09:31:02.66+00', 1, '2022-04-05 09:27:19.167392', '2022-04-05 09:27:19.167392', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.topics VALUES (130, 71, NULL, 'Tư duy sáng tạo - Cưỡi thuyền ngược gió', NULL, 'Nobuyuki Takahashi', 'Thái Hà books', NULL, 20, NULL, NULL, NULL, 'Vip', '10- 12/2021', '3 năm ', 53000, NULL, '24', '150 $', 2000000, NULL, '', NULL, NULL, NULL, NULL, '2022-04-13 09:54:51.391+00', '2022-04-20 08:45:21.189+00', '2022-04-20 08:45:21.189+00', NULL, '2022-04-13 09:56:33.321+00', 2, '2022-04-13 09:56:33.677', '2022-04-13 09:54:51.391', '2022-04-20 08:45:21.189', NULL, 'Squirrel Communication and Culture', NULL, NULL, NULL);
INSERT INTO public.topics VALUES (83, 54, NULL, 'Lý Trí Và Tình Cảm', NULL, 'Jane Austen', 'Nhã Nam', 'văn học phương Tây, tiểu thuyết ', 20, 4, '74', '
', NULL, '05-05/2021', '5', 129000, NULL, '37', '', 2000000, NULL, '', NULL, NULL, NULL, NULL, '2022-04-05 09:03:15.704+00', '2022-04-20 08:13:03.716+00', '2022-04-20 08:13:03.716+00', '2022-04-20 09:11:38.963+00', '2022-04-05 09:11:38.963+00', 2, '2022-04-05 09:11:39.201', '2022-04-05 09:03:15.704', '2022-04-20 08:13:03.716', NULL, 'Squirrel Communication and Culture', NULL, NULL, NULL);
INSERT INTO public.topics VALUES (77, 51, NULL, 'Sống can đảm đời viên mãn ', NULL, 'Dale Carnegie', 'Phương Nam Books', 'Dale Carnegie', 20, 1, '44,70', 'Dropbox https://www.dropbox.com/scl/fi/jx5m0itteotnnn6zgz07w/Gi-i-thi-u-s-ch-S-ng-can-m-i-vi-n-m-n.docx?dl=0&rlkey=r0onu4a6gzzzdkomkginux430', 'Vip', 'Invalid date', '5', 109000, NULL, '35', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-05 05:34:57.351+00', '2022-04-20 08:45:25.623+00', '2022-04-20 08:45:25.623+00', '2022-04-18 08:30:56.388+00', '2022-04-05 08:02:15.88+00', 2, '2022-04-05 08:02:16.184', '2022-04-05 05:34:57.351', '2022-04-20 08:45:25.623', NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.topics VALUES (73, 49, NULL, 'Cổ phiếu thường lợi nhuận phi thường', NULL, 'Philip Fisher', 'Alphabooks', 'đầu tư, chứng khoán ', 18, 1, '62', 'dropbox
https://www.dropbox.com/scl/fi/gsbb0xntm9ufdwxczx6nu/Gi-i-thi-u-s-ch-C-Phi-u-Th-ng-L-i-Nhu-n-Phi-Th-ng.docx?dl=0&rlkey=hhlrgbj017vu5wowxrz9got8d', NULL, 'Invalid date', '3 năm', 199000, NULL, '50', '8015500', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-05 05:13:24.289+00', '2022-04-20 08:45:29.109+00', '2022-04-20 08:45:33.15+00', '2022-04-30 08:45:29.109+00', '2022-04-05 05:19:10.561+00', 2, '2022-04-05 05:19:11.085', '2022-04-05 05:13:24.289', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.topics VALUES (88, 57, NULL, 'Khởi Nghiệp Từ Tiệm Nhỏ', NULL, 'Donnie Luân', 'Nhân Sinh Cửu Bảo ', 'Nhân sinh cửu bảo, thương tâm bích, kỹ năng ', 12, 1, '44,70', 'Dropbox https://www.dropbox.com/scl/fi/duze64e3gnssqioxfsdl3/Gi-i-thi-u-s-ch-Kh-i-Nghi-p-T-Ti-m-Nh.docx?dl=0&rlkey=t26zdbz2p7dfx34euvf7hr8dw', NULL, 'Invalid date', '5', 85000, NULL, '25', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-05 09:32:31.422375+00', '2022-04-05 09:32:31.422375+00', '2022-04-05 09:35:53.842+00', NULL, '2022-04-05 09:35:53.842+00', 1, '2022-04-05 09:32:31.422375', '2022-04-05 09:32:31.422375', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.topics VALUES (153, 83, 'Master Your Mind, Design Your Destiny', 'Làm Chủ Tư Duy, Thay Đổi Vận Mệnh', NULL, 'Adam Khoo', 'AKLTG', NULL, 12, NULL, NULL, NULL, 'Vip', '06-04/2021', '5 năm ', 129000, NULL, 'NaN', 'NaN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-13 14:37:43.83669+00', '2022-04-13 14:37:43.83669+00', '2022-04-13 14:41:11.009+00', NULL, '2022-04-13 14:41:11.009+00', 1, '2022-04-13 14:37:43.83669', '2022-04-13 14:37:43.83669', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.topics VALUES (90, 58, NULL, 'Cuộc Cách Mạng Nền Tảng', NULL, 'Geoffrey G. Parker, Marshall W. Van Alstyne, Sangeet Paul Choudary', 'Alphabooks', 'kinh tế, platform, cách mạng 4.0 ', 12, 1, '7,61', NULL, NULL, 'Invalid date', '3', 299000, NULL, '50', '10948000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-05 09:41:51.637731+00', '2022-04-05 09:41:51.637731+00', '2022-04-05 09:50:37.862+00', NULL, '2022-04-05 09:50:37.862+00', 1, '2022-04-05 09:41:51.637731', '2022-04-05 09:41:51.637731', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.topics VALUES (92, 59, 'Nuturing the winner & Genius in Your Child', 'Con cái chúng ta đều giỏi', NULL, ' Adam Khoo, Gary Lee', 'AKLTG', 'Adam khoo, nuôi dạy con thông minh ', 12, 1, '69', 'Dropbox https://www.dropbox.com/scl/fi/icbsnrzjabez4drmqns5q/gi-i-thi-u-cu-n-s-ch-Con-c-i-ch-ng-ta-u-gi-i.docx?dl=0&rlkey=tt36aebld282z1o1c5e5bwwt4', 'Vip', '2021-06-04 00:00:00.000 +00:00', '5', 100000, NULL, 'NaN', 'NaN', 0, NULL, '12,5 %', NULL, NULL, NULL, true, '2022-04-05 09:51:50.62599+00', '2022-04-05 09:51:50.62599+00', '2022-04-05 09:54:34.754+00', NULL, '2022-04-05 09:54:34.754+00', 1, '2022-04-05 09:51:50.62599', '2022-04-05 09:51:50.62599', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.topics VALUES (94, 60, 'Secrets of Successful Teen', 'Bí quyết teen thành công', NULL, ' Adam Khoo, Gary Lee', 'AKLTG', 'Adam khoo, teens, kỹ năng học tập, phát triển bản thân', 12, 1, '70,44', 'Dropbox https://www.dropbox.com/scl/fi/g8y1q93rgdl3qc71kf9hr/Gi-i-thi-u-s-ch-B-quy-t-th-nh-c-ng-cho-tu-i-Teen.docx?dl=0&rlkey=agt0yrq82nemmi8q9d5y8eyvq', NULL, '2021-06-04 00:00:00.000 +00:00', '5', 98000, NULL, 'NaN', 'NaN', 0, NULL, '12,5%', NULL, NULL, NULL, true, '2022-04-05 09:55:41.960069+00', '2022-04-05 09:55:41.960069+00', '2022-04-05 09:57:46.346+00', NULL, '2022-04-05 09:57:46.346+00', 1, '2022-04-05 09:55:41.960069', '2022-04-05 09:55:41.960069', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.topics VALUES (96, 61, NULL, 'Đồng Tiền Lên Ngôi', NULL, 'Niall Ferguson', 'Alphabooks', 'lịch sử, kinh tế, tiền tệ, kiến thức tổng quát, sách tinh hoa ', 12, 1, '42', NULL, 'Vip', 'Invalid date', '3 ', 259000, NULL, '50', '10580000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-05 09:59:09.869971+00', '2022-04-05 09:59:09.869971+00', '2022-04-05 10:01:33.721+00', NULL, '2022-04-05 10:01:33.721+00', 1, '2022-04-05 09:59:09.869971', '2022-04-05 09:59:09.869971', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.topics VALUES (98, 62, NULL, 'Dám Hành Động', NULL, 'Ben S. Bernanke', 'Alphabooks', 'Ben Bernake, Kinh tế, tiền tệ, suy thoái kinh tế, chính trị', 12, 1, '42', NULL, NULL, 'Invalid date', '3', 279000, NULL, '50', '10580000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-05 10:03:13.938435+00', '2022-04-05 10:03:13.938435+00', '2022-04-05 10:08:25.51+00', NULL, '2022-04-05 10:08:25.51+00', 1, '2022-04-05 10:03:13.938435', '2022-04-05 10:03:13.938435', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.topics VALUES (100, 63, NULL, 'Công Chúa Nhỏ', NULL, 'Frances Hodgson Burnett', 'Nhã Nam ', 'văn học phương tây, kinh điển, thiếu nhi ', 12, 5, '56', NULL, 'Vip', '2021-05-05 00:00:00.000 +00:00', '5', 77000, NULL, '25', '2000000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-05 10:16:52.172018+00', '2022-04-05 10:16:52.172018+00', '2022-04-05 10:20:32.42+00', NULL, '2022-04-05 10:20:32.42+00', 1, '2022-04-05 10:16:52.172018', '2022-04-05 10:16:52.172018', NULL, NULL, 'Squirrel Communication and Culture', NULL, NULL, NULL);
INSERT INTO public.topics VALUES (102, 64, NULL, 'Linh Ứng (tựa cũ Gọi Hồn)', NULL, 'Nguyễn Mạnh Tuấn', 'First News', 'tiểu thuyết, văn học việt nam, nhân quả báo ứng, tiền kiếp  ', 12, 4, NULL, NULL, NULL, NULL, NULL, 268000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-05 10:35:37.176701+00', '2022-04-05 10:35:37.176701+00', '2022-04-05 10:40:11.269+00', NULL, '2022-04-05 10:40:11.269+00', 1, '2022-04-05 10:35:37.176701', '2022-04-05 10:35:37.176701', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.topics VALUES (89, 57, NULL, 'Khởi Nghiệp Từ Tiệm Nhỏ', NULL, 'Donnie Luân', 'Nhân Sinh Cửu Bảo ', 'Nhân sinh cửu bảo, thương tâm bích, kỹ năng ', 18, 1, '44,70', 'Dropbox https://www.dropbox.com/scl/fi/duze64e3gnssqioxfsdl3/Gi-i-thi-u-s-ch-Kh-i-Nghi-p-T-Ti-m-Nh.docx?dl=0&rlkey=t26zdbz2p7dfx34euvf7hr8dw', NULL, 'Invalid date', '5', 85000, NULL, '25', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-05 09:32:31.422+00', '2022-04-05 09:32:31.422+00', '2022-04-08 09:15:59.329+00', '2022-04-20 09:35:53.842+00', '2022-04-05 09:35:53.842+00', 2, '2022-04-05 09:35:54.131', '2022-04-05 09:32:31.422', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.topics VALUES (104, 65, NULL, 'Siddhartha', NULL, 'Hermann Hesse', 'Nhã Nam', NULL, 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-06 06:44:06.49429+00', '2022-04-06 06:44:06.49429+00', '2022-04-13 08:13:28.68+00', NULL, '2022-04-13 08:13:28.68+00', 1, '2022-04-06 06:44:06.49429', '2022-04-06 06:44:06.49429', NULL, NULL, 'Squirrel Communication and Culture', NULL, NULL, NULL);
INSERT INTO public.topics VALUES (106, 66, 'Bí Ẩn Làng Ma Sói - Tập 1', 'Bí Ẩn Làng Ma Sói - Tập 1', NULL, 'Nguyên Trường', 'CÔNG TY TNHH BOARDGAME VIỆT NAM', 'ma sói, boardgame, rùng rợn, kinh dị, bí ẩn', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-08 05:20:55.511795+00', '2022-04-08 05:23:25.572+00', '2022-04-08 05:23:25.572+00', NULL, NULL, 1, '2022-04-08 05:20:55.511795', '2022-04-08 05:20:55.511795', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.topics VALUES (107, 67, 'Bí Ẩn Làng Ma Sói - Tập 2', 'Bí Ẩn Làng Ma Sói - Tập 2', NULL, 'Nguyên Trường', 'CÔNG TY TNHH BOARDGAME VIỆT NAM', 'ma sói, boardgame, bí ẩn, kinh dị, rùng rợn', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-08 05:23:09.447828+00', '2022-04-08 05:23:28.287+00', '2022-04-08 05:23:28.287+00', NULL, NULL, 1, '2022-04-08 05:23:09.447828', '2022-04-08 05:23:09.447828', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.topics VALUES (108, 68, NULL, NULL, NULL, NULL, NULL, NULL, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-08 08:23:14.792051+00', '2022-04-08 08:23:14.792051+00', '2022-04-08 08:23:14.792051+00', NULL, NULL, 3, '2022-04-08 08:23:14.792051', '2022-04-08 08:23:13.555', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.topics VALUES (110, 46, NULL, 'Utopia Địa Đàng Trần Gian', NULL, 'Thomas More', 'Nhã Nam', 'chính trị, văn hóa, kinh điển quốc tế', 21, 1, '11', NULL, 'Vip', '2021-05-05 00:00:00.000 +00:00', '5', 50000, NULL, '25', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-05 04:35:48.039+00', '2022-04-05 05:08:33.13+00', '2022-04-05 04:43:41.901+00', NULL, '2022-04-05 04:43:41.901+00', 3, '2022-04-05 04:43:42.117', '2022-04-08 08:45:21.671', NULL, NULL, 'Squirrel Communication and Culture', NULL, NULL, NULL);
INSERT INTO public.topics VALUES (87, 56, NULL, 'Ghi Chú Siêu Phàm', NULL, 'Thương Tâm Bích', 'Nhân Sinh Cửu Bảo ', 'Nhân sinh cửu bảo, thương tâm bích, kỹ năng ', 18, 1, '44,70', 'Dropbox https://www.dropbox.com/scl/fi/lj64dll5w24isbak51fa2/Gi-i-thi-u-s-ch-Ghi-Ch-Si-u-Ph-m.docx?dl=0&rlkey=smxarcj3jcoeh5oyrcji8dnub', 'Vip', '21-10/2021', '5 ', 65000, NULL, '25', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-05 09:27:19.167+00', '2022-04-15 02:51:15.766+00', '2022-04-08 09:14:50.276+00', '2022-04-15 09:31:02.66+00', '2022-04-05 09:31:02.66+00', 2, '2022-04-05 09:31:02.931', '2022-04-05 09:27:19.167', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.topics VALUES (91, 58, NULL, 'Cuộc Cách Mạng Nền Tảng', NULL, 'Geoffrey G. Parker, Marshall W. Van Alstyne, Sangeet Paul Choudary', 'Alphabooks', 'kinh tế, platform, cách mạng 4.0 ', 20, 1, '7,61', NULL, 'Vip', '20-11/2021', '3', 299000, NULL, '50', '10948000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-05 09:41:51.637+00', '2022-04-15 02:54:23.683+00', '2022-04-08 09:18:03.187+00', NULL, '2022-04-05 09:50:37.862+00', 2, '2022-04-05 09:50:38.109', '2022-04-05 09:41:51.637', '2022-04-08 09:18:03.187', NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.topics VALUES (97, 61, NULL, 'Đồng Tiền Lên Ngôi', NULL, 'Niall Ferguson', 'Alphabooks', 'lịch sử, kinh tế, tiền tệ, kiến thức tổng quát, sách tinh hoa ', 18, 1, '42', NULL, 'Vip', '22-10/2021', '3 ', 259000, NULL, '50', '10580000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-05 09:59:09.869+00', '2022-04-15 03:00:03.114+00', '2022-04-08 10:38:18.241+00', '2022-04-20 10:01:33.721+00', '2022-04-05 10:01:33.721+00', 2, '2022-04-05 10:01:33.882', '2022-04-05 09:59:09.869', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.topics VALUES (99, 62, NULL, 'Dám Hành Động', NULL, 'Ben S. Bernanke', 'Alphabooks', 'Ben Bernake, Kinh tế, tiền tệ, suy thoái kinh tế, chính trị', 18, 1, '42', NULL, 'Vip', '22-10/2021', '3', 279000, NULL, '50', '10580000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-05 10:03:13.938+00', '2022-04-15 03:01:51.121+00', '2022-04-08 10:38:03.528+00', '2022-04-20 10:08:25.51+00', '2022-04-05 10:08:25.51+00', 2, '2022-04-05 10:08:25.879', '2022-04-05 10:03:13.938', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.topics VALUES (95, 60, 'Secrets of Successful Teen', 'Bí quyết teen thành công', NULL, ' Adam Khoo, Gary Lee', 'AKLTG', 'Adam khoo, teens, kỹ năng học tập, phát triển bản thân', 20, 1, '70,44', 'Dropbox https://www.dropbox.com/scl/fi/g8y1q93rgdl3qc71kf9hr/Gi-i-thi-u-s-ch-B-quy-t-th-nh-c-ng-cho-tu-i-Teen.docx?dl=0&rlkey=agt0yrq82nemmi8q9d5y8eyvq', 'Vip', '06-04/2021', '5', 98000, NULL, '37, 5', '300 $', 0, NULL, '12,5', NULL, NULL, NULL, true, '2022-04-05 09:55:41.96+00', '2022-04-20 08:44:27.847+00', '2022-04-20 08:44:27.847+00', '2022-04-20 09:57:46.346+00', '2022-04-05 09:57:46.346+00', 2, '2022-04-05 09:57:46.65', '2022-04-05 09:55:41.96', '2022-04-20 08:44:27.847', NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.topics VALUES (103, 64, NULL, 'Linh Ứng (tựa cũ Gọi Hồn)', NULL, 'Nguyễn Mạnh Tuấn', 'First News', 'tiểu thuyết, văn học việt nam, nhân quả báo ứng, tiền kiếp  ', 20, 4, NULL, NULL, 'Vip', NULL, '3 năm ', 268000, NULL, '50', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-05 10:35:37.176+00', '2022-04-20 08:43:51.549+00', '2022-04-20 08:43:51.549+00', '2022-04-20 10:40:11.269+00', '2022-04-05 10:40:11.269+00', 2, '2022-04-05 10:40:11.542', '2022-04-05 10:35:37.176', '2022-04-20 08:43:51.549', NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.topics VALUES (101, 63, NULL, 'Công Chúa Nhỏ', NULL, 'Frances Hodgson Burnett', 'Nhã Nam ', 'văn học phương tây, kinh điển, thiếu nhi ', 17, 5, '56', NULL, 'Vip', '05-05/2021', '5', 77000, NULL, '37', 'thiếu', 2000000, NULL, '', NULL, NULL, NULL, NULL, '2022-04-05 10:16:52.172+00', '2022-04-15 03:23:06.028+00', '2022-04-13 08:52:34.256+00', '2022-04-23 08:52:28.18+00', '2022-04-05 10:20:32.42+00', 2, '2022-04-05 10:20:32.625', '2022-04-05 10:16:52.172', NULL, NULL, 'Squirrel Communication and Culture', NULL, NULL, NULL);
INSERT INTO public.topics VALUES (59, 16, 'Bóng Người Xưa ', 'Bóng Người Xưa ', NULL, 'Bà Tùng Long', 'Nguyễn Đông Thức', 'tiểu thuyết, phụ nữ, thân phận đàn bà, tình yêu, hôn nhân, gia đình', 14, 4, '75', 'Nếu người đàn bà sinh ra chỉ để làm bạn với bếp núc, thì cái câu “Giặc đến nhà đàn bà phải đánh” chẳng là vô nghĩa lắm?
Không, giang san đôi gánh nặng, trách nhiệm gái trai chung, nếu tài lực và tâm đức cho phép thì đối với xã hội, ngưài đàn bà cũng phải có một phần nhiệm vụ như người đàn ông vậy.
Và nếu quốc gia, xã hội mà đòi hỏi, thì người đàn bà cũng phải vứt chỉ kim mà đứng dậy, đạp gai góc để lên đường.
Trong lịch sử nước nhà, hai bà Trưng, một bà Triệu, há không là tấm gương sáng nghìn thu cho nữ nhi ta đấy ư?
Lệ Hằng, nhân vật chính của Bóng người xưa, là điển hình của loại nhân vật cao thượng ấy trong thời Pháp thuộc. Là một cô gái có sắc, có tài, lại có lòng yêu nước, cô phải làm thế nào để thực hiện chí nguyện của cô?    .
Lệ Hằng tham gia một đảng chống Pháp và lãnh nhiệm vụ cung cấp tài chính. Cô lấy chồng là Anh Kiệt, một nhà tư sản giàu có theo sự phân công của tổ chức đảng, và lấy tiền của Anh Kiệt trao cho tổ chức.
Sự hy sinh của cô đáng quý mến, mà cách hành động của cô cũng đáng ghi chép. Nhưng Anh Kiệt không phải là người chỉ biết tiền. Với cô, anh còn là người chồng chung thủy. Bên tình, bên nghĩa, cô phải làm sao? Và làm sao trong tình thế ấy, cô phải xử trí như thế nào để người bạn trăm năm của cô khỏi phải vì cô mà mang họa? Lệ Hằng đã dùng đến chước “kim thiền thoát xác” để trọn vẹn một gánh nghĩa tình.
Nhưng cốt truyện không phải đến đây là dứt. Ta thấy cái cao quý của người đàn bà Việt Nam ở nhân cách cô Thúy Ái, một nhân vật chính khác.
Về sống bên chồng giữa một không khí không chút thuận lợi, thế mà ngày một ngày hai, với cử chỉ đoan trang mà điềm đạm, với đức độ bao dung mà khiêm tốn, cô đã chinh phục được tất cả những người quanh cô.
Và cái đáng quý nhất là một khi biết được hành tung và tâm chí của Lệ Hằng, Thúy Ái đã tình nguyện nhận nhiệm vụ tiếp tế mà không một chút ghen tuông, ganh tị.
Hơn thế nữa, cô còn tự vận dụng tài sức của mình để làm ra của cải, chứ không khoanh tay ngồi dùng sẵn của chồng. Một tấm gương hoạt động cho các bà chủ gia đình ở chốn gác tía lầu son.
Trong công cuộc kiến thiết nước nhà, người như cô Lệ Hằng cần phải ra mặt góp sức với nhân dân, và người như Thúy Ái phải trở thành một gương mẫu chung cho cả thế hệ.
Đó là điều tác giả hằng mong mỏi.', 'Vip', '2022-07-03', '5', 92000, NULL, '25', '2000000', NULL, 'audio', 'undefined', 'Giọng Sài Gòn: giọng miền Nam chuẩn, không ngọng, không tiếng địa phương (ví dụ: "r" với "g", "tr" với "t")', 'undefined', NULL, false, '2022-03-16 09:27:11.896+00', '2022-04-20 08:45:06.977+00', '2022-04-20 08:45:10.448+00', '2022-05-05 08:45:06.977+00', '2022-03-16 23:48:41.478+00', 2, '2022-03-16 23:48:41.903', '2022-03-16 09:27:11.896', NULL, NULL, 'Không', '07/09/2022', NULL, NULL);
INSERT INTO public.topics VALUES (31, 17, 'Người Xưa Đã Về', 'Người Xưa Đã Về', NULL, 'Bà Tùng Long', 'Nguyễn Đông Thức', 'tiểu thuyết, tình yêu, phụ nữ, thân phận đàn bà, hôn nhân, gia đình', 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, '2022-03-16 09:28:36.13009+00', '2022-03-16 09:28:36.13009+00', '2022-04-13 08:11:28.733+00', NULL, '2022-04-13 08:11:28.733+00', 1, '2022-03-16 09:28:36.13009', '2022-03-16 09:28:36.13009', NULL, NULL, 'Không', NULL, NULL, NULL);
INSERT INTO public.topics VALUES (39, 25, 'Tình Yêu Và Thù Hận', 'Tình Yêu Và Thù Hận', NULL, 'Bà Tùng Long', 'Nguyễn Đông Thức', 'tiểu thuyết, tình yêu, phụ nữ, thân phận đàn bà, hôn nhân, gia đình, thù hận', 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, '2022-03-16 09:33:59.140167+00', '2022-03-16 09:33:59.140167+00', '2022-04-13 08:12:08.693+00', NULL, '2022-04-13 08:12:08.693+00', 1, '2022-03-16 09:33:59.140167', '2022-03-16 09:33:59.140167', NULL, NULL, 'Không', NULL, NULL, NULL);
INSERT INTO public.topics VALUES (126, 69, NULL, NULL, NULL, NULL, NULL, NULL, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-13 08:16:50.294198+00', '2022-04-13 08:16:50.294198+00', '2022-04-13 08:16:50.294198+00', NULL, NULL, 3, '2022-04-13 08:16:50.294198', '2022-04-13 08:16:49.873', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.topics VALUES (115, 21, 'Mẹ Chồng Nàng Dâu', 'Mẹ Chồng Nàng Dâu', NULL, 'Bà Tùng Long', 'Nguyễn Đông Thức', 'tiểu thuyết, tình yêu, phụ nữ, thân phận đàn bà, hôn nhân, gia đình', 16, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, '2022-03-16 09:31:15.644+00', '2022-03-16 09:31:15.644+00', '2022-04-13 08:17:49.104+00', '2022-04-27 08:11:51.129+00', '2022-04-13 08:11:51.129+00', 2, '2022-04-13 08:11:51.375', '2022-03-16 09:31:15.644', NULL, NULL, 'Không', NULL, NULL, NULL);
INSERT INTO public.topics VALUES (118, 30, 'Hồng Nhan Đa Truân', 'Hồng Nhan Đa Truân', NULL, 'Bà Tùng Long', 'Nguyễn Đông Thức', 'tiểu thuyết, tình yêu, phụ nữ, thân phận đàn bà, hôn nhân, gia đình, hồng nhan', 15, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, '2022-03-16 09:58:56.391+00', '2022-03-16 09:58:56.391+00', '2022-04-13 08:18:13.899+00', '2022-04-27 08:12:13.78+00', '2022-04-13 08:12:13.78+00', 2, '2022-04-13 08:12:13.928', '2022-03-16 09:58:56.391', NULL, NULL, 'Không', NULL, NULL, NULL);
INSERT INTO public.topics VALUES (121, 34, 'Ngọc Trong Đá', 'Ngọc Trong Đá', NULL, 'Nguyễn Đông Thức', 'Nguyễn Đông Thức', 'tiểu thuyết, tình yêu, tình cảm, văn học VN, thập niên 90', 15, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, '2022-03-16 10:01:34.441+00', '2022-03-16 10:01:34.441+00', '2022-04-13 08:21:40.248+00', '2022-05-03 08:12:43.995+00', '2022-04-13 08:12:43.995+00', 2, '2022-04-13 08:12:44.166', '2022-03-16 10:01:34.441', NULL, NULL, 'Không', NULL, NULL, NULL);
INSERT INTO public.topics VALUES (123, 37, 'Vĩnh Biệt Mùa Hè', 'Vĩnh Biệt Mùa Hè', NULL, 'Nguyễn Đông Thức', 'Nguyễn Đông Thức', 'tiểu thuyết, tình yêu, tình cảm, văn học VN, thập niên 90', 16, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, '2022-03-16 10:03:29.232+00', '2022-03-16 10:03:29.232+00', '2022-04-13 08:25:24.96+00', '2022-05-03 08:12:59.263+00', '2022-04-13 08:12:59.263+00', 2, '2022-04-13 08:12:59.405', '2022-03-16 10:03:29.232', NULL, NULL, 'Không', NULL, NULL, NULL);
INSERT INTO public.topics VALUES (105, 49, NULL, 'Cổ phiếu thường lợi nhuận phi thường', NULL, 'Philip Fisher', 'Alphabooks', 'đầu tư, chứng khoán ', 24, 1, '62', 'dropbox
https://www.dropbox.com/scl/fi/gsbb0xntm9ufdwxczx6nu/Gi-i-thi-u-s-ch-C-Phi-u-Th-ng-L-i-Nhu-n-Phi-Th-ng.docx?dl=0&rlkey=hhlrgbj017vu5wowxrz9got8d', NULL, 'Invalid date', '3 năm', 199000, NULL, '50', '8015500', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-05 05:13:24.289+00', '2022-04-13 08:46:28.828+00', '2022-04-13 08:46:28.828+00', '2022-05-05 05:19:10.561+00', '2022-04-05 05:19:10.561+00', 3, '2022-04-05 05:19:11.085', '2022-04-06 07:00:38.53', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.topics VALUES (127, 70, NULL, 'Mùa Hè Tươi Đẹp', NULL, 'Casere Pavese', 'Phương Nam Books', NULL, 12, NULL, NULL, NULL, 'Vip', '27-09/2021', '5 năm ', NULL, NULL, 'NaN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-13 09:46:59.853157+00', '2022-04-13 09:46:59.853157+00', '2022-04-13 09:50:26.069+00', NULL, '2022-04-13 09:50:26.069+00', 1, '2022-04-13 09:46:59.853157', '2022-04-13 09:46:59.853157', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.topics VALUES (131, 72, ' Secrets of building multi- million dollar bussiness', 'Bí quyết gây dựng cơ nghiệp bạc tỷ', NULL, 'Adam Khoo', 'AKLTG', NULL, 12, NULL, NULL, NULL, 'Vip', '06-04/2021', '5 năm', 129000, NULL, 'NaN', 'NaN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-13 10:01:26.627365+00', '2022-04-13 10:01:26.627365+00', '2022-04-13 10:10:14.754+00', NULL, '2022-04-13 10:10:14.754+00', 1, '2022-04-13 10:01:26.627365', '2022-04-13 10:01:26.627365', NULL, NULL, '', NULL, NULL, NULL);
INSERT INTO public.topics VALUES (133, 73, NULL, 'Giáo Dục Não Phải - Tương Lai Cho Con Bạn', NULL, 'Makoto Shichida', 'First News', NULL, 12, NULL, NULL, NULL, 'Vip', 'từ 20-09/2021', '5 năm', 62.3260000000000005, NULL, 'NaN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-13 10:13:50.856429+00', '2022-04-13 10:13:50.856429+00', '2022-04-13 10:29:29.369+00', NULL, '2022-04-13 10:29:29.369+00', 1, '2022-04-13 10:13:50.856429', '2022-04-13 10:13:50.856429', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.topics VALUES (135, 74, NULL, '277 Lời Khuyên Dạy Con Của Giáo Sư Shichida', NULL, 'Makoto Shichida', 'Viện Giáo Dục Shichida', NULL, 12, NULL, NULL, NULL, 'Vip', '20-09/2021 ', '1 năm', 108000, NULL, 'NaN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-13 10:40:05.597155+00', '2022-04-13 10:40:05.597155+00', '2022-04-13 10:47:45.727+00', NULL, '2022-04-13 10:47:45.727+00', 1, '2022-04-13 10:40:05.597155', '2022-04-13 10:40:05.597155', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.topics VALUES (137, 75, NULL, 'Độc Chiếm Hoa Khôi', NULL, 'Nhiều Tác Giả', 'Phương Nam Books', NULL, 12, NULL, NULL, NULL, 'Vip', '27- 09/ 2021', '5 năm ', 78000, NULL, 'NaN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-13 10:48:58.597797+00', '2022-04-13 10:48:58.597797+00', '2022-04-13 14:12:29.281+00', NULL, '2022-04-13 14:12:29.281+00', 1, '2022-04-13 10:48:58.597797', '2022-04-13 10:48:58.597797', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.topics VALUES (134, 73, NULL, 'Giáo Dục Não Phải - Tương Lai Cho Con Bạn', NULL, 'Makoto Shichida', 'First News', NULL, 17, NULL, NULL, NULL, 'Vip', 'từ 20-09/2021', '5 năm', 62.3260000000000005, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-13 10:13:50.856+00', '2022-04-13 10:13:50.856+00', '2022-04-20 08:41:06.255+00', '2022-04-28 10:29:29.369+00', '2022-04-13 10:29:29.369+00', 2, '2022-04-13 10:29:29.64', '2022-04-13 10:13:50.856', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.topics VALUES (93, 59, 'Nuturing the winner & Genius in Your Child', 'Con cái chúng ta đều giỏi', NULL, ' Adam Khoo, Gary Lee', 'AKLTG', 'Adam khoo, nuôi dạy con thông minh ', 18, 1, '69', 'Dropbox https://www.dropbox.com/scl/fi/icbsnrzjabez4drmqns5q/gi-i-thi-u-cu-n-s-ch-Con-c-i-ch-ng-ta-u-gi-i.docx?dl=0&rlkey=tt36aebld282z1o1c5e5bwwt4', 'Vip', '06-04/2021', '5', 100000, NULL, '37, 5', '300 $', 0, NULL, '12,5 ', NULL, NULL, NULL, true, '2022-04-05 09:51:50.625+00', '2022-04-15 02:57:01.072+00', '2022-04-08 09:36:49.777+00', '2022-04-23 09:36:42.843+00', '2022-04-05 09:54:34.754+00', 2, '2022-04-05 09:54:35.054', '2022-04-05 09:51:50.625', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.topics VALUES (138, 75, NULL, 'Độc Chiếm Hoa Khôi', NULL, 'Nhiều Tác Giả', 'Phương Nam Books', NULL, 16, NULL, NULL, NULL, 'Vip', '27- 09/ 2021', '5 năm ', 78000, NULL, '35', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-13 10:48:58.597+00', '2022-04-15 03:24:59.92+00', '2022-04-20 08:37:39.184+00', '2022-04-26 14:12:29.281+00', '2022-04-13 14:12:29.281+00', 2, '2022-04-13 14:12:29.675', '2022-04-13 10:48:58.597', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.topics VALUES (112, 17, '', 'Người Xưa Đã Về', NULL, 'Bà Tùng Long', 'Bà Tùng Long', 'tiểu thuyết, tình yêu, phụ nữ, thân phận đàn bà, hôn nhân, gia đình', 14, NULL, NULL, NULL, 'Vip', '07-03/2021', '5 năm ', 130000, NULL, '25', NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, '2022-03-16 09:28:36.13+00', '2022-04-15 03:12:34.389+00', '2022-04-20 08:40:33.119+00', '2022-04-28 08:11:28.733+00', '2022-04-13 08:11:28.733+00', 2, '2022-04-13 08:11:29.077', '2022-03-16 09:28:36.13', NULL, NULL, 'Không', NULL, NULL, NULL);
INSERT INTO public.topics VALUES (117, 25, 'Tình Yêu Và Thù Hận', 'Tình Yêu Và Thù Hận', NULL, 'Bà Tùng Long', 'Bà Tùng Long', 'tiểu thuyết, tình yêu, phụ nữ, thân phận đàn bà, hôn nhân, gia đình, thù hận', 14, NULL, NULL, NULL, 'Vip', '07-03/2021', '5 năm ', 110000, NULL, '25', NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, '2022-03-16 09:33:59.14+00', '2022-04-15 03:17:50.179+00', '2022-04-20 08:39:32.09+00', '2022-04-28 08:12:08.693+00', '2022-04-13 08:12:08.693+00', 2, '2022-04-13 08:12:08.907', '2022-03-16 09:33:59.14', NULL, NULL, 'Không', NULL, NULL, NULL);
INSERT INTO public.topics VALUES (124, 65, NULL, 'Siddhartha', NULL, 'Hermann Hesse', 'Nhã Nam', NULL, 20, NULL, NULL, NULL, 'Vip', '05-05/2021', '5 năm ', 60000, NULL, '37', 'thiếu', 2000000, NULL, '', NULL, NULL, NULL, NULL, '2022-04-06 06:44:06.494+00', '2022-04-15 03:22:49.018+00', '2022-04-13 08:16:49.701+00', NULL, '2022-04-13 08:13:28.68+00', 2, '2022-04-13 08:13:29.112', '2022-04-06 06:44:06.494', '2022-04-13 08:16:49.701', NULL, 'Squirrel Communication and Culture', NULL, NULL, NULL);
INSERT INTO public.topics VALUES (128, 70, NULL, 'Mùa Hè Tươi Đẹp', NULL, 'Casere Pavese', 'Phương Nam Books', NULL, 20, NULL, NULL, NULL, 'Vip', '27-09/2021', '5 năm ', 41000, NULL, '35', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-13 09:46:59.853+00', '2022-04-20 08:38:44.287+00', '2022-04-20 08:38:44.287+00', NULL, '2022-04-13 09:50:26.069+00', 2, '2022-04-13 09:50:26.245', '2022-04-13 09:46:59.853', '2022-04-20 08:38:44.287', NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.topics VALUES (136, 74, NULL, '277 Lời Khuyên Dạy Con Của Giáo Sư Shichida', NULL, 'Makoto Shichida', 'Viện Giáo Dục Shichida', NULL, 17, NULL, NULL, NULL, 'Vip', '20-09/2021 ', '1 năm', 108000, NULL, '50', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-13 10:40:05.597+00', '2022-04-15 03:24:38.751+00', '2022-04-20 08:36:39.403+00', '2022-04-27 10:47:45.727+00', '2022-04-13 10:47:45.727+00', 2, '2022-04-13 10:47:45.928', '2022-04-13 10:40:05.597', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.topics VALUES (114, 20, 'Duyên Tình Lạc Bến', 'Duyên Tình Lạc Bến', NULL, 'Bà Tùng Long', 'Nguyễn Đông Thức', 'tiểu thuyết, tình yêu, phụ nữ, thân phận đàn bà, hôn nhân, gia đình', 14, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, '2022-03-16 09:30:39.124+00', '2022-03-16 09:30:39.124+00', '2022-04-20 08:41:27.54+00', '2022-04-28 08:11:44.515+00', '2022-04-13 08:11:44.515+00', 2, '2022-04-13 08:11:44.652', '2022-03-16 09:30:39.124', NULL, NULL, 'Không', NULL, NULL, NULL);
INSERT INTO public.topics VALUES (116, 22, 'Một Vụ Án Tình', 'Một Vụ Án Tình', NULL, 'Bà Tùng Long', 'Nguyễn Đông Thức', 'tiểu thuyết, tình yêu, phụ nữ, thân phận đàn bà, hôn nhân, gia đình, thù hận', 14, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, '2022-03-16 09:32:04.449+00', '2022-03-16 09:32:04.449+00', '2022-04-20 08:41:40.044+00', '2022-04-28 08:11:58.848+00', '2022-04-13 08:11:58.848+00', 2, '2022-04-13 08:11:59.117', '2022-03-16 09:32:04.449', NULL, NULL, 'Không', NULL, NULL, NULL);
INSERT INTO public.topics VALUES (120, 33, 'Đời Con Gái', 'Đời Con Gái', NULL, 'Bà Tùng Long', 'Nguyễn Đông Thức', 'tiểu thuyết, tình yêu, phụ nữ, thân phận đàn bà, hôn nhân, gia đình', 14, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, '2022-03-16 10:00:19.894+00', '2022-03-16 10:00:19.894+00', '2022-04-20 08:41:53.602+00', '2022-04-28 08:12:36.897+00', '2022-04-13 08:12:36.897+00', 2, '2022-04-13 08:12:37.12', '2022-03-16 10:00:19.894', NULL, NULL, 'Không', NULL, NULL, NULL);
INSERT INTO public.topics VALUES (122, 36, 'Ngôi Sao Cô Đơn', 'Ngôi Sao Cô Đơn', NULL, 'Nguyễn Đông Thức', 'Nguyễn Đông Thức', 'tiểu thuyết, tình yêu, tình cảm, văn học VN, thập niên 90', 14, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, '2022-03-16 10:02:57.244+00', '2022-03-16 10:02:57.244+00', '2022-04-20 08:42:31.658+00', '2022-04-28 08:12:53.535+00', '2022-04-13 08:12:53.535+00', 2, '2022-04-13 08:12:53.824', '2022-03-16 10:02:57.244', NULL, NULL, 'Không', NULL, NULL, NULL);
INSERT INTO public.topics VALUES (125, 38, 'Trăm Sông Về Biển', 'Trăm Sông Về Biển', NULL, 'Nguyễn Đông Thức', 'Nguyễn Đông Thức', 'tiểu thuyết, tình yêu, tình cảm, văn học VN, thập niên 90', 14, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, '2022-03-16 10:04:12.939+00', '2022-03-16 10:04:12.939+00', '2022-04-20 08:42:49.792+00', '2022-04-28 08:13:38.203+00', '2022-04-13 08:13:38.203+00', 2, '2022-04-13 08:13:38.41', '2022-03-16 10:04:12.939', NULL, NULL, 'Không', NULL, NULL, NULL);
INSERT INTO public.topics VALUES (119, 32, 'Nghĩa Tình Ràng Buộc', 'Nghĩa Tình Ràng Buộc', NULL, 'Bà Tùng Long', 'Nguyễn Đông Thức', 'tiểu thuyết, tình yêu, phụ nữ, thân phận đàn bà, hôn nhân, gia đình', 14, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, '2022-03-16 09:59:37.459+00', '2022-03-16 09:59:37.459+00', '2022-04-20 08:43:46.794+00', '2022-04-28 08:12:30.25+00', '2022-04-13 08:12:30.25+00', 2, '2022-04-13 08:12:30.404', '2022-03-16 09:59:37.459', NULL, NULL, 'Không', NULL, NULL, NULL);
INSERT INTO public.topics VALUES (139, 76, NULL, 'Năm Người Đàn Bà Si Tình', NULL, 'Ihara Saikaru', 'Phương Nam Books', NULL, 12, NULL, NULL, NULL, NULL, '27-09/2021', '5 năm ', 49000, NULL, 'NaN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-13 14:13:11.828914+00', '2022-04-13 14:13:11.828914+00', '2022-04-13 14:14:09.932+00', NULL, '2022-04-13 14:14:09.932+00', 1, '2022-04-13 14:13:11.828914', '2022-04-13 14:13:11.828914', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.topics VALUES (141, 77, NULL, 'Lãnh đạo bằng trí óc trái tim và khí phách', NULL, 'David L. Dotlich, Peter C. Cairo, Stephen H. Rhinesmith', 'Thái Hà Books', NULL, 12, NULL, NULL, NULL, 'Vip', '10-12/2021', '3 năm ', 82000, NULL, 'NaN', 'NaN', 2000000, NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-13 14:14:59.084143+00', '2022-04-13 14:14:59.084143+00', '2022-04-13 14:16:34.882+00', NULL, '2022-04-13 14:16:34.882+00', 1, '2022-04-13 14:14:59.084143', '2022-04-13 14:14:59.084143', NULL, NULL, 'Squirrel Communication and Culture', NULL, NULL, NULL);
INSERT INTO public.topics VALUES (143, 78, NULL, 'Kinh điển về khởi nghiệp', NULL, 'Bill Aulet', 'Thái Hà Books', NULL, 12, NULL, NULL, NULL, 'Vip', '10-12/2021', '3 năm ', 265000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-13 14:17:13.681831+00', '2022-04-13 14:17:13.681831+00', '2022-04-13 14:19:30.428+00', NULL, '2022-04-13 14:19:30.428+00', 1, '2022-04-13 14:17:13.681831', '2022-04-13 14:17:13.681831', NULL, NULL, 'Squirrel Communication and Culture', NULL, NULL, NULL);
INSERT INTO public.topics VALUES (145, 79, NULL, 'Cho Tôi Xin Một Vé Đi Tuổi Thơ ', NULL, 'Nguyễn Nhật Ánh', 'Nguyễn Nhật Ánh', NULL, 12, NULL, NULL, NULL, 'Vip', '15-04/2021', '3 năm ', 80, NULL, 'NaN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-13 14:23:02.9137+00', '2022-04-13 14:23:02.9137+00', '2022-04-13 14:27:15.013+00', NULL, '2022-04-13 14:27:15.013+00', 1, '2022-04-13 14:23:02.9137', '2022-04-13 14:23:02.9137', NULL, NULL, 'NXB Trẻ', NULL, NULL, NULL);
INSERT INTO public.topics VALUES (147, 80, NULL, 'Đảo Mộng Mơ', NULL, 'Nguyễn Nhật Ánh', 'Nguyễn Nhật Ánh', NULL, 12, NULL, NULL, NULL, 'Vip', '15-04/2021', '3 năm ', 75000, NULL, 'NaN', '300000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-13 14:29:15.1879+00', '2022-04-13 14:29:15.1879+00', '2022-04-13 14:30:12.382+00', NULL, '2022-04-13 14:30:12.382+00', 1, '2022-04-13 14:29:15.1879', '2022-04-13 14:29:15.1879', NULL, NULL, 'NXB Trẻ', NULL, NULL, NULL);
INSERT INTO public.topics VALUES (149, 81, NULL, 'Về Thu Xếp Lại...', NULL, 'Đỗ Hồng Ngọc', 'Bác Sĩ Đỗ Hồng Ngọc', NULL, 12, NULL, NULL, NULL, 'Vip', '09-04/2021', '5 năm', 65000, NULL, 'NaN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-13 14:31:39.651245+00', '2022-04-13 14:31:39.651245+00', '2022-04-13 14:33:04.466+00', NULL, '2022-04-13 14:33:04.466+00', 1, '2022-04-13 14:31:39.651245', '2022-04-13 14:31:39.651245', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.topics VALUES (109, 11, 'Đừng Sợ Lỡ Cuộc Chơi', 'Đừng Sợ Lỡ Cuộc Chơi', 'FOMO', 'Patrick MCGinnis', 'First News', 'fomo,', 25, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'NaN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, '2022-03-11 07:34:52.338+00', '2022-04-14 03:22:15.433+00', '2022-04-14 03:24:25.356+00', NULL, '2022-04-05 03:57:58.824+00', 3, '2022-04-05 03:57:59.376', '2022-04-08 08:24:46.543', '2022-04-08 08:23:13.229', '2022-04-14 03:24:25.356', NULL, NULL, 161.330000000000013, 0);
INSERT INTO public.topics VALUES (155, 84, NULL, 'Làm chủ cuộc đời ', NULL, 'Khangser Rinpoche', 'First News', NULL, 12, NULL, NULL, NULL, 'Vip', NULL, '3 năm ', 60000, NULL, '50', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-14 07:59:58.585915+00', '2022-04-14 07:59:58.585915+00', '2022-04-14 08:13:52.341+00', NULL, '2022-04-14 08:13:52.341+00', 1, '2022-04-14 07:59:58.585915', '2022-04-14 07:59:58.585915', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.topics VALUES (157, 85, NULL, 'Uốn lưỡi bảy lần trước khi nói -> thay bằng tựa "Khéo ăn nói sẽ được lòng thiên hạ"', NULL, 'Bill McFarlan', 'Thái Hà books', NULL, 12, NULL, NULL, NULL, 'Vip', '10-12/2021', '3 năm', 45000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-14 08:17:21.744892+00', '2022-04-14 08:17:21.744892+00', '2022-04-14 08:18:10.002+00', NULL, '2022-04-14 08:18:10.002+00', 1, '2022-04-14 08:17:21.744892', '2022-04-14 08:17:21.744892', NULL, NULL, 'Squirrel Communication and Culture', NULL, NULL, NULL);
INSERT INTO public.topics VALUES (159, 86, NULL, 'Truyện Ngắn A.P.Chekhov', NULL, 'Anton Chekhov', 'Phương Nam ', NULL, 12, NULL, NULL, NULL, 'Vip', '27-09/2021', '5 năm', 105000, NULL, '35', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-14 08:30:41.750712+00', '2022-04-14 08:30:41.750712+00', '2022-04-14 08:42:51.256+00', NULL, '2022-04-14 08:42:51.256+00', 1, '2022-04-14 08:30:41.750712', '2022-04-14 08:30:41.750712', NULL, NULL, '                                                                  QQQQQQQQQQQQQQQQ                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         ', NULL, NULL, NULL);
INSERT INTO public.topics VALUES (161, 87, NULL, 'Là Đánh Mất Hay Chưa Từng Có', NULL, 'Gari', 'Gari ', NULL, 12, NULL, NULL, NULL, 'Vip', '05-04/2021', '5 năm', 72000, NULL, '25', '4000000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-14 08:43:59.035703+00', '2022-04-14 08:43:59.035703+00', '2022-04-14 08:45:28.135+00', NULL, '2022-04-14 08:45:28.135+00', 1, '2022-04-14 08:43:59.035703', '2022-04-14 08:43:59.035703', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.topics VALUES (163, 88, 'On earth we''re briefly goreous', 'Một Thoáng Ta Rực Rỡ Ở Nhân Gian', NULL, 'Ocean Vương ', 'Nhã Nam ', NULL, 12, NULL, NULL, NULL, 'Vip', '25-02/2022', '5 năm ', 135000, NULL, 'NaN', 'NaN', 2000000, NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-14 08:47:48.244983+00', '2022-04-14 08:47:48.244983+00', '2022-04-14 08:51:43.804+00', NULL, '2022-04-14 08:51:43.804+00', 1, '2022-04-14 08:47:48.244983', '2022-04-14 08:47:48.244983', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.topics VALUES (165, 89, NULL, 'Yêu như là sống', NULL, 'Nguyễn Mạnh Tuấn', 'First News', NULL, 12, NULL, NULL, NULL, 'Vip', NULL, '3 năm', 210000, NULL, '50', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-14 08:52:35.588342+00', '2022-04-14 08:52:35.588342+00', '2022-04-14 08:53:43.386+00', NULL, '2022-04-14 08:53:43.386+00', 1, '2022-04-14 08:52:35.588342', '2022-04-14 08:52:35.588342', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.topics VALUES (167, 90, NULL, 'Mẹ Chồng Nàng Dâu ', NULL, 'Bà Tùng Long', 'Bà Tùng Long', NULL, 12, NULL, NULL, NULL, 'Vip', '07-03/2021', '5 năm', 67000, NULL, '25', '2000000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-14 08:55:05.996593+00', '2022-04-14 08:55:05.996593+00', '2022-04-14 08:56:19.128+00', NULL, '2022-04-14 08:56:19.128+00', 1, '2022-04-14 08:55:05.996593', '2022-04-14 08:55:05.996593', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.topics VALUES (169, 91, NULL, 'Bóng người xưa', NULL, 'Bà Tùng Long', 'Bà Tùng Long', NULL, 12, NULL, NULL, NULL, 'Vip', '07-03/2021', '5 năm ', 92000, NULL, '25', '2000000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-14 08:57:04.736162+00', '2022-04-14 08:57:04.736162+00', '2022-04-14 08:58:52.256+00', NULL, '2022-04-14 08:58:52.256+00', 1, '2022-04-14 08:57:04.736162', '2022-04-14 08:57:04.736162', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.topics VALUES (171, 92, NULL, 'Hồng Nhan Đa Truân ', NULL, 'Bà Tùng Long', 'Bà Tùng Long', NULL, 12, NULL, NULL, NULL, 'Vip', '07-03/2021', '5 năm ', 150000, NULL, '25', '2000000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-14 08:59:46.031562+00', '2022-04-14 08:59:46.031562+00', '2022-04-14 09:01:01.774+00', NULL, '2022-04-14 09:01:01.774+00', 1, '2022-04-14 08:59:46.031562', '2022-04-14 08:59:46.031562', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.topics VALUES (173, 93, NULL, 'Ngọc trong đá', NULL, 'Nguyễn Đông Thức', 'Bà Tùng Long', NULL, 12, NULL, NULL, NULL, 'Vip', '07-03/2021', '5 năm ', 185000, NULL, '25', '2000000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-14 09:01:49.831536+00', '2022-04-14 09:01:49.831536+00', '2022-04-14 09:02:41.302+00', NULL, '2022-04-14 09:02:41.302+00', 1, '2022-04-14 09:01:49.831536', '2022-04-14 09:01:49.831536', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.topics VALUES (175, 94, NULL, 'Vĩnh biệt mùa hè', NULL, 'Nguyễn Đông Thức', 'Bà Tùng Long', NULL, 12, NULL, NULL, NULL, 'Vip', '07-03/2021', '5 năm ', 68000, NULL, '25', '2000000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-14 09:03:16.550575+00', '2022-04-14 09:03:16.550575+00', '2022-04-14 09:04:13.736+00', NULL, '2022-04-14 09:04:13.736+00', 1, '2022-04-14 09:03:16.550575', '2022-04-14 09:03:16.550575', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.topics VALUES (148, 80, NULL, 'Đảo Mộng Mơ', NULL, 'Nguyễn Nhật Ánh', 'Nguyễn Nhật Ánh', NULL, 20, NULL, NULL, NULL, 'Vip', '15-04/2021', '3 năm ', 75000, NULL, '25', '300000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-13 14:29:15.187+00', '2022-04-20 08:38:04.373+00', '2022-04-20 08:38:04.373+00', NULL, '2022-04-13 14:30:12.382+00', 2, '2022-04-13 14:30:12.648', '2022-04-13 14:29:15.187', '2022-04-20 08:38:04.373', NULL, 'NXB Trẻ', NULL, NULL, NULL);
INSERT INTO public.topics VALUES (146, 79, NULL, 'Cho Tôi Xin Một Vé Đi Tuổi Thơ ', NULL, 'Nguyễn Nhật Ánh', 'Nguyễn Nhật Ánh', NULL, 13, NULL, NULL, NULL, 'Vip', '15-04/2021', '3 năm ', 80, NULL, '25', '300000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-13 14:23:02.913+00', '2022-04-15 03:30:17.692+00', '2022-04-13 14:27:15.013+00', NULL, '2022-04-13 14:27:15.013+00', 2, '2022-04-13 14:27:15.384', '2022-04-13 14:23:02.913', NULL, NULL, 'NXB Trẻ', NULL, NULL, NULL);
INSERT INTO public.topics VALUES (144, 78, NULL, 'Kinh điển về khởi nghiệp', NULL, 'Bill Aulet', 'Thái Hà Books', NULL, 14, NULL, NULL, NULL, 'Vip', '10-12/2021', '3 năm ', 265000, NULL, '24', 'USD 150', 3000000, NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-13 14:17:13.681+00', '2022-04-15 03:29:14.533+00', '2022-04-20 08:37:33.11+00', '2022-04-27 14:19:30.428+00', '2022-04-13 14:19:30.428+00', 2, '2022-04-13 14:19:30.698', '2022-04-13 14:17:13.681', NULL, NULL, 'Squirrel Communication and Culture', NULL, NULL, NULL);
INSERT INTO public.topics VALUES (158, 85, NULL, 'Uốn lưỡi bảy lần trước khi nói -> thay bằng tựa "Khéo ăn nói sẽ được lòng thiên hạ"', NULL, 'Bill McFarlan', 'Thái Hà books', NULL, 19, NULL, NULL, NULL, 'Vip', '10-12/2021', '3 năm', 45000, NULL, '24', 'USD 150', 2000000, NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-14 08:17:21.744+00', '2022-04-15 03:37:31.642+00', '2022-04-20 08:33:47.826+00', '2022-04-17 08:18:10.002+00', '2022-04-14 08:18:10.002+00', 2, '2022-04-14 08:18:10.397', '2022-04-14 08:17:21.744', NULL, NULL, 'Squirrel Communication and Culture', NULL, NULL, NULL);
INSERT INTO public.topics VALUES (150, 81, NULL, 'Về Thu Xếp Lại...', NULL, 'Đỗ Hồng Ngọc', 'Bác Sĩ Đỗ Hồng Ngọc', NULL, 20, NULL, NULL, NULL, 'Vip', '09-04/2021', '5 năm', 65000, NULL, '35', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-13 14:31:39.651+00', '2022-04-20 08:36:27.11+00', '2022-04-20 08:36:27.11+00', NULL, '2022-04-13 14:33:04.466+00', 2, '2022-04-13 14:33:04.717', '2022-04-13 14:31:39.651', '2022-04-20 08:36:27.11', NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.topics VALUES (154, 83, 'Master Your Mind, Design Your Destiny', 'Làm Chủ Tư Duy, Thay Đổi Vận Mệnh', NULL, 'Adam Khoo', 'AKLTG', NULL, 20, NULL, NULL, NULL, 'Vip', '06-04/2021', '5 năm ', 129000, NULL, '37,5', '300 $', NULL, NULL, '12,5', NULL, NULL, NULL, NULL, '2022-04-13 14:37:43.836+00', '2022-04-20 08:36:04.371+00', '2022-04-20 08:36:04.371+00', NULL, '2022-04-13 14:41:11.009+00', 2, '2022-04-13 14:41:11.206', '2022-04-13 14:37:43.836', '2022-04-20 08:36:04.371', NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.topics VALUES (166, 89, NULL, 'Yêu như là sống', NULL, 'Nguyễn Mạnh Tuấn', 'First News', NULL, 14, NULL, NULL, NULL, 'Vip', NULL, '3 năm', 210000, NULL, '50', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-14 08:52:35.588+00', '2022-04-15 03:41:52.626+00', '2022-04-20 08:34:44.74+00', '2022-04-24 08:53:43.386+00', '2022-04-14 08:53:43.386+00', 2, '2022-04-14 08:53:43.655', '2022-04-14 08:52:35.588', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.topics VALUES (164, 88, 'On earth we''re briefly goreous', 'Một Thoáng Ta Rực Rỡ Ở Nhân Gian', NULL, 'Ocean Vương ', 'Nhã Nam ', NULL, 20, NULL, NULL, NULL, 'Vip', '25-02/2022', '5 năm ', 135000, NULL, '42,5', 'USD 500', 2000000, NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-14 08:47:48.244+00', '2022-04-20 08:33:39.724+00', '2022-04-20 08:33:39.724+00', NULL, '2022-04-14 08:51:43.804+00', 2, '2022-04-14 08:51:44.115', '2022-04-14 08:47:48.244', '2022-04-20 08:33:39.724', NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.topics VALUES (156, 84, NULL, 'Làm chủ cuộc đời ', NULL, 'Khangser Rinpoche', 'First News', 'phật giáo, tâm linh, phật pháp ứng dụng ', 18, 1, '0,16', NULL, 'Vip', NULL, '3 năm ', 60000, NULL, '50', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-14 07:59:58.585+00', '2022-04-15 03:34:12.948+00', '2022-04-20 08:35:48.724+00', '2022-04-28 08:13:52.341+00', '2022-04-14 08:13:52.341+00', 2, '2022-04-14 08:13:52.652', '2022-04-14 07:59:58.585', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.topics VALUES (152, 82, NULL, 'Amitie Nuôi Dưỡng Tâm Hồn Trẻ Em Thông Qua Bóng Đá', NULL, 'Kitaguchi Haruki ', 'Phương Nam Books', NULL, 20, NULL, NULL, NULL, 'Vip', '27-09/2021', '5 năm ', 89000, NULL, '35', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-13 14:33:50.136+00', '2022-04-20 08:33:44.711+00', '2022-04-20 08:33:44.711+00', NULL, '2022-04-13 14:36:01.026+00', 2, '2022-04-13 14:36:01.437', '2022-04-13 14:33:50.136', '2022-04-20 08:33:44.711', NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.topics VALUES (162, 87, NULL, 'Là Đánh Mất Hay Chưa Từng Có', NULL, 'Gari', 'Gari ', NULL, 18, NULL, NULL, NULL, 'Vip', '05-04/2021', '5 năm', 72000, NULL, '25', '4000000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-14 08:43:59.035+00', '2022-04-15 03:39:09.011+00', '2022-04-20 08:35:13.945+00', '2022-04-28 08:45:28.135+00', '2022-04-14 08:45:28.135+00', 2, '2022-04-14 08:45:28.404', '2022-04-14 08:43:59.035', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.topics VALUES (160, 86, NULL, 'Truyện Ngắn A.P.Chekhov', NULL, 'Anton Chekhov', 'Phương Nam ', NULL, 19, NULL, NULL, NULL, 'Vip', '27-09/2021', '5 năm', 105000, NULL, '35', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-14 08:30:41.75+00', '2022-04-15 03:38:08.699+00', '2022-04-20 08:33:34.99+00', '2022-04-17 08:42:51.256+00', '2022-04-14 08:42:51.256+00', 2, '2022-04-14 08:42:51.463', '2022-04-14 08:30:41.75', NULL, NULL, '                                                                  QQQQQQQQQQQQQQQQ                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         ', NULL, NULL, NULL);
INSERT INTO public.topics VALUES (177, 95, NULL, 'Châu Nhuận Phát - Đại Hiệp Hồng Kông', NULL, 'Lin Feng Ph.D', 'First News', NULL, 12, NULL, NULL, NULL, 'Vip', NULL, '3 năm ', 168000, NULL, '50', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-14 09:06:30.536374+00', '2022-04-14 09:06:30.536374+00', '2022-04-14 09:07:17.46+00', NULL, '2022-04-14 09:07:17.46+00', 1, '2022-04-14 09:06:30.536374', '2022-04-14 09:06:30.536374', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.topics VALUES (179, 96, NULL, 'Tây Du Ký 3 ', NULL, 'Ngô Thừa Ân', 'NXB Văn Học', NULL, 12, NULL, NULL, NULL, 'Vip', '06-05/2020', '3 năm ', 140000, NULL, '30', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-14 09:08:00.06128+00', '2022-04-14 09:08:00.06128+00', '2022-04-14 09:10:42.026+00', NULL, '2022-04-14 09:10:42.026+00', 1, '2022-04-14 09:08:00.06128', '2022-04-14 09:08:00.06128', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.topics VALUES (181, 97, NULL, 'Kính Vạn Hoa - Tập 8 - Bắt Đền Hoa Sứ', NULL, 'Nguyễn Nhật Ánh', 'Nguyễn Nhật Ánh ', NULL, 12, NULL, NULL, NULL, 'Vip', '15-04/2021', '3 năm ', 110000, NULL, '25', '250000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-14 09:13:26.290401+00', '2022-04-14 09:13:26.290401+00', '2022-04-14 09:15:35.663+00', NULL, '2022-04-14 09:15:35.663+00', 1, '2022-04-14 09:13:26.290401', '2022-04-14 09:13:26.290401', NULL, NULL, 'NXB Trẻ', NULL, NULL, NULL);
INSERT INTO public.topics VALUES (183, 98, NULL, 'Kính Vạn Hoa - Tập 14 - Thủ Môn Bị Từ Chối', NULL, 'Nguyễn Nhật Ánh', 'Nguyễn Nhật Ánh', NULL, 12, NULL, NULL, NULL, 'Vip', '15-04/2021', '3 năm ', 110, NULL, '25', '250000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-14 09:16:24.287461+00', '2022-04-14 09:16:24.287461+00', '2022-04-14 09:17:11.88+00', NULL, '2022-04-14 09:17:11.88+00', 1, '2022-04-14 09:16:24.287461', '2022-04-14 09:16:24.287461', NULL, NULL, 'NXB Trẻ', NULL, NULL, NULL);
INSERT INTO public.topics VALUES (185, 99, NULL, 'Kính Vạn Hoa - Tập 15 - Thi Sĩ Hạng Ruồi', NULL, 'Nguyễn Nhật Ánh', 'Nguyễn Nhật Ánh', NULL, 12, NULL, NULL, NULL, 'Vip', '15-04/2021', '3 năm ', 110000, NULL, '25', '250000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-14 09:18:21.292338+00', '2022-04-14 09:18:21.292338+00', '2022-04-14 09:18:50.119+00', NULL, '2022-04-14 09:18:50.119+00', 1, '2022-04-14 09:18:21.292338', '2022-04-14 09:18:21.292338', NULL, NULL, 'NXB Trẻ', NULL, NULL, NULL);
INSERT INTO public.topics VALUES (187, 100, NULL, 'Kính Vạn Hoa - Tập 18 - Cuộc So Tài Vất Vả', NULL, 'Nguyễn Nhật Ánh', 'Nguyễn Nhật Ánh', NULL, 12, NULL, NULL, NULL, 'Vip', '15-04/2021', '3 năm ', 110000, NULL, '25', '250000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-14 09:19:48.04609+00', '2022-04-14 09:19:48.04609+00', '2022-04-14 09:20:20.382+00', NULL, '2022-04-14 09:20:20.382+00', 1, '2022-04-14 09:19:48.04609', '2022-04-14 09:19:48.04609', NULL, NULL, 'NXB Trẻ', NULL, NULL, NULL);
INSERT INTO public.topics VALUES (189, 101, NULL, 'Ngày Xưa Có Một Chuyện Tình', NULL, 'Nguyễn Nhật Ánh', 'Nguyễn Nhật Ánh', NULL, 12, NULL, NULL, NULL, 'Vip', '15-04/2021', '3 năm ', 125000, NULL, '25', '300000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-14 09:23:00.996775+00', '2022-04-14 09:23:00.996775+00', '2022-04-14 09:23:47.232+00', NULL, '2022-04-14 09:23:47.232+00', 1, '2022-04-14 09:23:00.996775', '2022-04-14 09:23:00.996775', NULL, NULL, 'NXB Trẻ', NULL, NULL, NULL);
INSERT INTO public.topics VALUES (191, 102, NULL, 'Kính Vạn Hoa Tập 10', NULL, 'Nguyễn Nhật Ánh', 'Nguyễn Nhật Ánh', NULL, 12, NULL, NULL, NULL, 'Vip', '15-04/2021', '3 năm ', 110000, NULL, '25', '250000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-14 09:29:24.288478+00', '2022-04-14 09:29:24.288478+00', '2022-04-14 09:30:02.506+00', NULL, '2022-04-14 09:30:02.506+00', 1, '2022-04-14 09:29:24.288478', '2022-04-14 09:29:24.288478', NULL, NULL, 'NXB Trẻ', NULL, NULL, NULL);
INSERT INTO public.topics VALUES (193, 103, NULL, 'Kính Vạn Hoa Tập 39', NULL, 'Nguyễn Nhật Ánh', 'Nguyễn Nhật Ánh', NULL, 12, NULL, NULL, NULL, 'Vip', '15-04/2021', '3 năm ', 110000, NULL, '25', '250000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-14 09:31:07.797319+00', '2022-04-14 09:31:07.797319+00', '2022-04-14 09:31:41.385+00', NULL, '2022-04-14 09:31:41.385+00', 1, '2022-04-14 09:31:07.797319', '2022-04-14 09:31:07.797319', NULL, NULL, 'NXB Trẻ', NULL, NULL, NULL);
INSERT INTO public.topics VALUES (195, 104, NULL, 'Kính Vạn Hoa Tập 40', NULL, 'Nguyễn Nhật Ánh ', 'Nguyễn Nhật Ánh ', NULL, 12, NULL, NULL, NULL, 'Vip', '15-04/2021', '3 năm ', 110000, NULL, '25', '250000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-14 09:32:14.536719+00', '2022-04-14 09:32:14.536719+00', '2022-04-14 09:32:42.066+00', NULL, '2022-04-14 09:32:42.066+00', 1, '2022-04-14 09:32:14.536719', '2022-04-14 09:32:14.536719', NULL, NULL, 'NXB Trẻ', NULL, NULL, NULL);
INSERT INTO public.topics VALUES (197, 105, NULL, 'Buổi Chiều Windows', NULL, 'Nguyễn Nhật Ánh ', 'Nguyễn Nhật Ánh ', NULL, 12, NULL, NULL, NULL, 'Vip', '15-04/2021', '3 năm ', 70, NULL, '25', '300000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-14 09:33:15.318879+00', '2022-04-14 09:33:15.318879+00', '2022-04-14 09:33:46.64+00', NULL, '2022-04-14 09:33:46.64+00', 1, '2022-04-14 09:33:15.318879', '2022-04-14 09:33:15.318879', NULL, NULL, 'NXB Trẻ', NULL, NULL, NULL);
INSERT INTO public.topics VALUES (199, 106, NULL, 'Kính Vạn Hoa - Tập 49 - Bạn Gái', NULL, 'Nguyễn Nhật Ánh ', 'Nguyễn Nhật Ánh ', NULL, 12, NULL, NULL, NULL, 'Vip', '15-04/2021', '3 năm ', 110000, NULL, '25', '250000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-14 09:34:18.787395+00', '2022-04-14 09:34:18.787395+00', '2022-04-14 09:34:50.858+00', NULL, '2022-04-14 09:34:50.858+00', 1, '2022-04-14 09:34:18.787395', '2022-04-14 09:34:18.787395', NULL, NULL, 'NXB Trẻ', NULL, NULL, NULL);
INSERT INTO public.topics VALUES (201, 107, NULL, 'Kính Vạn Hoa - Tập 50 - Cửa Hàng Bánh Kẹo', NULL, 'Nguyễn Nhật Ánh ', 'Nguyễn Nhật Ánh ', NULL, 12, NULL, NULL, NULL, 'Vip', '15-04/2021', '3 năm ', 110000, NULL, '25', '250000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-14 09:35:36.535646+00', '2022-04-14 09:35:36.535646+00', '2022-04-14 09:36:04.043+00', NULL, '2022-04-14 09:36:04.043+00', 1, '2022-04-14 09:35:36.535646', '2022-04-14 09:35:36.535646', NULL, NULL, 'NXB Trẻ', NULL, NULL, NULL);
INSERT INTO public.topics VALUES (203, 108, NULL, 'Kính Vạn Hoa - Tập 51 - Một Ngày Kỳ Lạ', NULL, 'Nguyễn Nhật Ánh ', 'Nguyễn Nhật Ánh ', NULL, 12, NULL, NULL, NULL, 'Vip', '15-04/2021', '3 năm ', 110000, NULL, '25', '250000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-14 09:36:35.071672+00', '2022-04-14 09:36:35.071672+00', '2022-04-14 09:37:04.121+00', NULL, '2022-04-14 09:37:04.121+00', 1, '2022-04-14 09:36:35.071672', '2022-04-14 09:36:35.071672', NULL, NULL, 'NXB Trẻ', NULL, NULL, NULL);
INSERT INTO public.topics VALUES (178, 95, NULL, 'Châu Nhuận Phát - Đại Hiệp Hồng Kông', NULL, 'Lin Feng Ph.D', 'First News', NULL, 20, NULL, NULL, NULL, 'Vip', NULL, '3 năm ', 168000, NULL, '50', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-14 09:06:30.536+00', '2022-04-20 08:24:13.088+00', '2022-04-20 08:24:13.088+00', NULL, '2022-04-14 09:07:17.46+00', 2, '2022-04-14 09:07:17.664', '2022-04-14 09:06:30.536', '2022-04-20 08:24:13.088', NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.topics VALUES (180, 96, NULL, 'Tây Du Ký 3 ', NULL, 'Ngô Thừa Ân', 'NXB Văn Học', NULL, 15, NULL, NULL, NULL, 'Vip', '06-05/2020', '3 năm ', 140000, NULL, '30', '2000000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-14 09:08:00.061+00', '2022-04-15 03:57:23.947+00', '2022-04-20 08:24:18.246+00', '2022-05-04 09:10:42.026+00', '2022-04-14 09:10:42.026+00', 2, '2022-04-14 09:10:42.313', '2022-04-14 09:08:00.061', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.topics VALUES (182, 97, NULL, 'Kính Vạn Hoa - Tập 8 - Bắt Đền Hoa Sứ', NULL, 'Nguyễn Nhật Ánh', 'Nguyễn Nhật Ánh ', NULL, 15, NULL, NULL, NULL, 'Vip', '15-04/2021', '3 năm ', 110000, NULL, '25', '250000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-14 09:13:26.29+00', '2022-04-15 03:58:18.46+00', '2022-04-20 08:26:05.052+00', '2022-05-04 09:15:35.663+00', '2022-04-14 09:15:35.663+00', 2, '2022-04-14 09:15:35.923', '2022-04-14 09:13:26.29', NULL, NULL, 'NXB Trẻ', NULL, NULL, NULL);
INSERT INTO public.topics VALUES (184, 98, NULL, 'Kính Vạn Hoa - Tập 14 - Thủ Môn Bị Từ Chối', NULL, 'Nguyễn Nhật Ánh', 'Nguyễn Nhật Ánh', NULL, 15, NULL, NULL, NULL, 'Vip', '15-04/2021', '3 năm ', 110000, NULL, '25', '250000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-14 09:16:24.287+00', '2022-04-15 03:58:32.226+00', '2022-04-20 08:26:24.535+00', '2022-05-04 09:17:11.88+00', '2022-04-14 09:17:11.88+00', 2, '2022-04-14 09:17:12.168', '2022-04-14 09:16:24.287', NULL, NULL, 'NXB Trẻ', NULL, NULL, NULL);
INSERT INTO public.topics VALUES (190, 101, NULL, 'Ngày Xưa Có Một Chuyện Tình', NULL, 'Nguyễn Nhật Ánh', 'Nguyễn Nhật Ánh', NULL, 18, NULL, NULL, NULL, 'Vip', '15-04/2021', '3 năm ', 125000, NULL, '25', '300000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-14 09:23:00.996+00', '2022-04-15 04:01:13.651+00', '2022-04-20 08:27:00.085+00', '2022-05-04 09:23:47.232+00', '2022-04-14 09:23:47.232+00', 2, '2022-04-14 09:23:47.397', '2022-04-14 09:23:00.996', NULL, NULL, 'NXB Trẻ', NULL, NULL, NULL);
INSERT INTO public.topics VALUES (172, 92, NULL, 'Hồng Nhan Đa Truân ', NULL, 'Bà Tùng Long', 'Bà Tùng Long', NULL, 16, NULL, NULL, NULL, 'Vip', '07-03/2022', '5 năm ', 150000, NULL, '25', '2000000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-14 08:59:46.031+00', '2022-04-14 09:04:54.234+00', '2022-04-20 08:31:08.312+00', '2022-04-18 09:01:01.774+00', '2022-04-14 09:01:01.774+00', 2, '2022-04-14 09:01:02.345', '2022-04-14 08:59:46.031', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.topics VALUES (188, 100, NULL, 'Kính Vạn Hoa - Tập 18 - Cuộc So Tài Vất Vả', NULL, 'Nguyễn Nhật Ánh', 'Nguyễn Nhật Ánh', NULL, 15, NULL, NULL, NULL, 'Vip', '15-04/2021', '3 năm ', 110000, NULL, '25', '250000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-14 09:19:48.046+00', '2022-04-15 03:59:06.431+00', '2022-04-20 08:28:02.19+00', '2022-05-04 09:20:20.382+00', '2022-04-14 09:20:20.382+00', 2, '2022-04-14 09:20:20.669', '2022-04-14 09:19:48.046', NULL, NULL, 'NXB Trẻ', NULL, NULL, NULL);
INSERT INTO public.topics VALUES (170, 91, NULL, 'Bóng người xưa', NULL, 'Bà Tùng Long', 'Bà Tùng Long', NULL, 14, NULL, NULL, NULL, 'Vip', '07-03/2022', '5 năm ', 92000, NULL, '25', '2000000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-14 08:57:04.736+00', '2022-04-15 03:42:22.993+00', '2022-04-20 08:24:09.74+00', '2022-04-28 08:58:52.256+00', '2022-04-14 08:58:52.256+00', 2, '2022-04-14 08:58:52.493', '2022-04-14 08:57:04.736', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.topics VALUES (174, 93, NULL, 'Ngọc trong đá', NULL, 'Nguyễn Đông Thức', 'Bà Tùng Long', NULL, 15, NULL, NULL, NULL, 'Vip', '07-03/2022', '5 năm ', 185000, NULL, '25', '2000000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-14 09:01:49.831+00', '2022-04-14 09:04:44.728+00', '2022-04-20 08:31:14.545+00', '2022-04-28 09:02:41.302+00', '2022-04-14 09:02:41.302+00', 2, '2022-04-14 09:02:41.628', '2022-04-14 09:01:49.831', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.topics VALUES (192, 102, NULL, 'Kính Vạn Hoa Tập 10', NULL, 'Nguyễn Nhật Ánh', 'Nguyễn Nhật Ánh', NULL, 18, NULL, NULL, NULL, 'Vip', '15-04/2021', '3 năm ', 110000, NULL, '25', '250000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-14 09:29:24.288+00', '2022-04-14 09:29:24.288+00', '2022-04-20 08:31:44.277+00', '2022-04-28 09:30:02.506+00', '2022-04-14 09:30:02.506+00', 2, '2022-04-14 09:30:02.805', '2022-04-14 09:29:24.288', NULL, NULL, 'NXB Trẻ', NULL, NULL, NULL);
INSERT INTO public.topics VALUES (194, 103, NULL, 'Kính Vạn Hoa Tập 39', NULL, 'Nguyễn Nhật Ánh', 'Nguyễn Nhật Ánh', NULL, 18, NULL, NULL, NULL, 'Vip', '15-04/2021', '3 năm ', 110000, NULL, '25', '250000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-14 09:31:07.797+00', '2022-04-14 09:31:07.797+00', '2022-04-20 08:31:46.887+00', '2022-04-28 09:31:41.385+00', '2022-04-14 09:31:41.385+00', 2, '2022-04-14 09:31:41.86', '2022-04-14 09:31:07.797', NULL, NULL, 'NXB Trẻ', NULL, NULL, NULL);
INSERT INTO public.topics VALUES (186, 99, NULL, 'Kính Vạn Hoa - Tập 15 - Thi Sĩ Hạng Ruồi', NULL, 'Nguyễn Nhật Ánh', 'Nguyễn Nhật Ánh', NULL, 16, NULL, NULL, NULL, 'Vip', '15-04/2021', '3 năm ', 110000, NULL, '25', '250000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-14 09:18:21.292+00', '2022-04-14 09:18:21.292+00', '2022-04-20 08:32:17.45+00', '2022-04-28 09:18:50.119+00', '2022-04-14 09:18:50.119+00', 2, '2022-04-14 09:18:50.363', '2022-04-14 09:18:21.292', NULL, NULL, 'NXB Trẻ', NULL, NULL, NULL);
INSERT INTO public.topics VALUES (198, 105, NULL, 'Buổi Chiều Windows', NULL, 'Nguyễn Nhật Ánh ', 'Nguyễn Nhật Ánh ', NULL, 18, NULL, NULL, NULL, 'Vip', '15-04/2021', '3 năm ', 70, NULL, '25', '300000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-14 09:33:15.318+00', '2022-04-14 09:33:15.318+00', '2022-04-20 08:32:38.21+00', '2022-04-28 09:33:46.64+00', '2022-04-14 09:33:46.64+00', 2, '2022-04-14 09:33:46.884', '2022-04-14 09:33:15.318', NULL, NULL, 'NXB Trẻ', NULL, NULL, NULL);
INSERT INTO public.topics VALUES (202, 107, NULL, 'Kính Vạn Hoa - Tập 50 - Cửa Hàng Bánh Kẹo', NULL, 'Nguyễn Nhật Ánh ', 'Nguyễn Nhật Ánh ', NULL, 17, NULL, NULL, NULL, 'Vip', '15-04/2021', '3 năm ', 110000, NULL, '25', '250000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-14 09:35:36.535+00', '2022-04-14 09:35:36.535+00', '2022-04-20 08:33:23.66+00', '2022-05-10 08:33:02.616+00', '2022-04-14 09:36:04.043+00', 2, '2022-04-14 09:36:04.344', '2022-04-14 09:35:36.535', NULL, NULL, 'NXB Trẻ', NULL, NULL, NULL);
INSERT INTO public.topics VALUES (204, 108, NULL, 'Kính Vạn Hoa - Tập 51 - Một Ngày Kỳ Lạ', NULL, 'Nguyễn Nhật Ánh ', 'Nguyễn Nhật Ánh ', NULL, 17, NULL, NULL, NULL, 'Vip', '15-04/2021', '3 năm ', 110000, NULL, '25', '250000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-14 09:36:35.071+00', '2022-04-14 09:36:35.071+00', '2022-04-20 08:33:27.528+00', '2022-05-10 08:33:07.078+00', '2022-04-14 09:37:04.121+00', 2, '2022-04-14 09:37:04.399', '2022-04-14 09:36:35.071', NULL, NULL, 'NXB Trẻ', NULL, NULL, NULL);
INSERT INTO public.topics VALUES (176, 94, NULL, 'Vĩnh biệt mùa hè', NULL, 'Nguyễn Đông Thức', 'Bà Tùng Long', NULL, 16, NULL, NULL, NULL, 'Vip', '07-03/2022', '5 năm ', 68000, NULL, '25', '2000000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-14 09:03:16.55+00', '2022-04-14 09:04:24.814+00', '2022-04-20 08:34:14.573+00', '2022-04-26 09:04:13.736+00', '2022-04-14 09:04:13.736+00', 2, '2022-04-14 09:04:13.94', '2022-04-14 09:03:16.55', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.topics VALUES (200, 106, NULL, 'Kính Vạn Hoa - Tập 49 - Bạn Gái', NULL, 'Nguyễn Nhật Ánh ', 'Nguyễn Nhật Ánh ', NULL, 17, NULL, NULL, NULL, 'Vip', '15-04/2021', '3 năm ', 110000, NULL, '25', '250000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-14 09:34:18.787+00', '2022-04-14 09:34:18.787+00', '2022-04-20 08:33:19.667+00', '2022-05-10 08:32:59.906+00', '2022-04-14 09:34:50.858+00', 2, '2022-04-14 09:34:51.145', '2022-04-14 09:34:18.787', NULL, NULL, 'NXB Trẻ', NULL, NULL, NULL);
INSERT INTO public.topics VALUES (205, 109, NULL, 'Kính Vạn Hoa - Tập 52 - Tóc Ngắn Tóc Dài', NULL, 'Nguyễn Nhật Ánh ', 'Nguyễn Nhật Ánh ', NULL, 12, NULL, NULL, NULL, 'Vip', '15-04/2021', '3 năm ', 110000, NULL, '25', '250000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-14 09:37:31.533575+00', '2022-04-14 09:37:31.533575+00', '2022-04-14 09:37:59.215+00', NULL, '2022-04-14 09:37:59.215+00', 1, '2022-04-14 09:37:31.533575', '2022-04-14 09:37:31.533575', NULL, NULL, 'NXB Trẻ', NULL, NULL, NULL);
INSERT INTO public.topics VALUES (207, 110, NULL, 'Kính Vạn Hoa - Tập 53 - Má Lúm Đồng Tiền', NULL, 'Nguyễn Nhật Ánh ', 'Nguyễn Nhật Ánh ', NULL, 12, NULL, NULL, NULL, 'Vip', '15-04/2021', '3 năm ', 110000, NULL, '25', '250000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-14 09:38:33.053024+00', '2022-04-14 09:38:33.053024+00', '2022-04-14 09:38:58.825+00', NULL, '2022-04-14 09:38:58.826+00', 1, '2022-04-14 09:38:33.053024', '2022-04-14 09:38:33.053024', NULL, NULL, 'NXB Trẻ', NULL, NULL, NULL);
INSERT INTO public.topics VALUES (209, 111, NULL, 'Kính Vạn Hoa - Tập 54 - Cà Phê Áo Tím', NULL, 'Nguyễn Nhật Ánh ', 'Nguyễn Nhật Ánh ', NULL, 12, NULL, NULL, NULL, 'Vip', '15-04/2021', '3 năm ', 110000, NULL, '25', '250000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-14 09:39:32.570996+00', '2022-04-14 09:39:32.570996+00', '2022-04-14 09:39:56.341+00', NULL, '2022-04-14 09:39:56.341+00', 1, '2022-04-14 09:39:32.570996', '2022-04-14 09:39:32.570996', NULL, NULL, 'NXB Trẻ', NULL, NULL, NULL);
INSERT INTO public.topics VALUES (211, 112, NULL, 'Kính Vạn Hoa - Tập 46 - Người Giúp Việc Khác Thường', NULL, 'Nguyễn Nhật Ánh ', 'Nguyễn Nhật Ánh ', NULL, 12, NULL, NULL, NULL, 'Vip', '15-04/2021', '3 năm ', 110000, NULL, '25', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-14 09:40:33.284974+00', '2022-04-14 09:40:33.284974+00', '2022-04-14 09:40:56.606+00', NULL, '2022-04-14 09:40:56.606+00', 1, '2022-04-14 09:40:33.284974', '2022-04-14 09:40:33.284974', NULL, NULL, 'NXB Trẻ', NULL, NULL, NULL);
INSERT INTO public.topics VALUES (213, 113, NULL, 'Kính Vạn Hoa - Tập 46 - Người Giúp Việc Khác Thường', NULL, 'Nguyễn Nhật Ánh ', 'Nguyễn Nhật Ánh ', NULL, 12, NULL, NULL, NULL, 'Vip', '15-04/2021', '3 năm ', 110000, NULL, '25', '250000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-14 09:41:44.591906+00', '2022-04-14 09:41:44.591906+00', '2022-04-14 09:42:14.3+00', NULL, '2022-04-14 09:42:14.3+00', 1, '2022-04-14 09:41:44.591906', '2022-04-14 09:41:44.591906', NULL, NULL, 'NXB Trẻ', NULL, NULL, NULL);
INSERT INTO public.topics VALUES (215, 114, NULL, 'Kính Vạn Hoa - Tập 47 - Ngủ Quên Trên Đồi', NULL, 'Nguyễn Nhật Ánh ', 'Nguyễn Nhật Ánh ', NULL, 12, NULL, NULL, NULL, 'Vip', '15-04/2021', '3 năm ', 110000, NULL, '25', '250000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-14 09:43:17.499162+00', '2022-04-14 09:43:17.499162+00', '2022-04-14 09:43:40.214+00', NULL, '2022-04-14 09:43:40.214+00', 1, '2022-04-14 09:43:17.499162', '2022-04-14 09:43:17.499162', NULL, NULL, 'NXB Trẻ', NULL, NULL, NULL);
INSERT INTO public.topics VALUES (217, 115, NULL, 'Kính Vạn Hoa - Chuyện Nhỏ 31 - Thằng Thỏ Đế', NULL, 'Nguyễn Nhật Ánh ', 'Nguyễn Nhật Ánh ', NULL, 12, NULL, NULL, NULL, 'Vip', '15-04/2021', '3 năm ', 110000, NULL, '25', '250000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-14 09:44:03.991128+00', '2022-04-14 09:44:03.991128+00', '2022-04-14 09:44:29.26+00', NULL, '2022-04-14 09:44:29.26+00', 1, '2022-04-14 09:44:03.991128', '2022-04-14 09:44:03.991128', NULL, NULL, 'NXB Trẻ', NULL, NULL, NULL);
INSERT INTO public.topics VALUES (219, 116, NULL, 'Kính Vạn Hoa - Chuyện Nhỏ 37 - Lớp Phó Trật Tự', NULL, 'Nguyễn Nhật Ánh ', 'Nguyễn Nhật Ánh ', NULL, 12, NULL, NULL, NULL, 'Vip', '15-04/2021', '3 năm ', 110000, NULL, '25', '250000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-14 09:44:52.269668+00', '2022-04-14 09:44:52.269668+00', '2022-04-14 09:45:24.386+00', NULL, '2022-04-14 09:45:24.386+00', 1, '2022-04-14 09:44:52.269668', '2022-04-14 09:44:52.269668', NULL, NULL, 'NXB Trẻ', NULL, NULL, NULL);
INSERT INTO public.topics VALUES (221, 117, NULL, 'Chuyện xứ Langbiang Tập 2', NULL, 'Nguyễn Nhật Ánh ', 'Nguyễn Nhật Ánh ', NULL, 12, NULL, NULL, NULL, 'Vip', '15-04/2021', '3 năm ', 180, NULL, '25', '300000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-14 09:45:52.792771+00', '2022-04-14 09:45:52.792771+00', '2022-04-14 09:46:51.281+00', NULL, '2022-04-14 09:46:51.281+00', 1, '2022-04-14 09:45:52.792771', '2022-04-14 09:45:52.792771', NULL, NULL, 'NXB Trẻ', NULL, NULL, NULL);
INSERT INTO public.topics VALUES (223, 118, NULL, 'Bàn Có Năm Chỗ Ngồi', NULL, 'Nguyễn Nhật Ánh', 'Nguyễn Nhật Ánh', NULL, 12, NULL, NULL, NULL, 'Vip', '15-04/2021', '3 năm ', 55000, NULL, '25', '250000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-14 09:48:13.546984+00', '2022-04-14 09:48:13.546984+00', '2022-04-14 09:48:48.773+00', NULL, '2022-04-14 09:48:48.773+00', 1, '2022-04-14 09:48:13.546984', '2022-04-14 09:48:13.546984', NULL, NULL, 'NXB Trẻ', NULL, NULL, NULL);
INSERT INTO public.topics VALUES (225, 119, NULL, 'Thằng quỷ nhỏ', NULL, 'Nguyễn Nhật Ánh', 'Nguyễn Nhật Ánh', NULL, 12, NULL, NULL, NULL, 'Vip', '15-04/2021', '3 năm ', 70000, NULL, '25', '300000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-14 09:50:09.537317+00', '2022-04-14 09:50:09.537317+00', '2022-04-14 09:50:41.308+00', NULL, '2022-04-14 09:50:41.308+00', 1, '2022-04-14 09:50:09.537317', '2022-04-14 09:50:09.537317', NULL, NULL, 'NXB Trẻ', NULL, NULL, NULL);
INSERT INTO public.topics VALUES (227, 120, NULL, 'Chuyện Xứ Lang Biang - Tập 4. Báu Vật Ở Lâu Đài K''rahlan)', NULL, 'Nguyễn Nhật Ánh', 'Nguyễn Nhật Ánh', NULL, 12, NULL, NULL, NULL, 'Vip', '15-04/2021', '3 năm ', 200000, NULL, '25', '300000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-14 09:51:12.792381+00', '2022-04-14 09:51:12.792381+00', '2022-04-14 09:52:02.186+00', NULL, '2022-04-14 09:52:02.186+00', 1, '2022-04-14 09:51:12.792381', '2022-04-14 09:51:12.792381', NULL, NULL, 'NXB Trẻ', NULL, NULL, NULL);
INSERT INTO public.topics VALUES (228, 120, NULL, 'Chuyện Xứ Lang Biang - Tập 4. Báu Vật Ở Lâu Đài K''rahlan)', NULL, 'Nguyễn Nhật Ánh', 'Nguyễn Nhật Ánh', NULL, 13, NULL, NULL, NULL, 'Vip', '15-04/2021', '3 năm ', 200000, NULL, '25', '300000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-14 09:51:12.792+00', '2022-04-14 09:51:12.792+00', '2022-04-14 09:52:02.186+00', NULL, '2022-04-14 09:52:02.186+00', 2, '2022-04-14 09:52:02.367', '2022-04-14 09:51:12.792', NULL, NULL, 'NXB Trẻ', NULL, NULL, NULL);
INSERT INTO public.topics VALUES (229, 121, NULL, 'Làm Bạn Với Bầu Trời', NULL, 'Nguyễn Nhật Ánh ', 'Nguyễn Nhật Ánh ', NULL, 12, NULL, NULL, NULL, 'Vip', '15-04/2021', '3 năm ', 220000, NULL, '25', '300000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-14 09:52:40.312921+00', '2022-04-14 09:52:40.312921+00', '2022-04-14 09:53:15.903+00', NULL, '2022-04-14 09:53:15.903+00', 1, '2022-04-14 09:52:40.312921', '2022-04-14 09:52:40.312921', NULL, NULL, 'NXB Trẻ', NULL, NULL, NULL);
INSERT INTO public.topics VALUES (231, 122, NULL, 'Trại Hoa Vàng', NULL, 'Nguyễn Nhật Ánh', 'Nguyễn Nhật Ánh', NULL, 12, NULL, NULL, NULL, 'Vip', '15-04/2021', '3 năm ', 82000, NULL, '25', '250000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-14 09:59:28.838226+00', '2022-04-14 09:59:28.838226+00', '2022-04-14 10:00:02.031+00', NULL, '2022-04-14 10:00:02.031+00', 1, '2022-04-14 09:59:28.838226', '2022-04-14 09:59:28.838226', NULL, NULL, 'NXB Trẻ', NULL, NULL, NULL);
INSERT INTO public.topics VALUES (233, 123, NULL, 'Kính Vạn Hoa - Tập 23 - Cỗ Xe Ngựa Kỳ Bí', NULL, 'Nguyễn Nhật Ánh', 'Nguyễn Nhật Ánh', NULL, 12, NULL, NULL, NULL, 'Vip', '15-04/2021', '3 năm ', 110000, NULL, '25', '250000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-14 10:00:42.531506+00', '2022-04-14 10:00:42.531506+00', '2022-04-14 10:01:16.18+00', NULL, '2022-04-14 10:01:16.18+00', 1, '2022-04-14 10:00:42.531506', '2022-04-14 10:00:42.531506', NULL, NULL, 'NXB Trẻ', NULL, NULL, NULL);
INSERT INTO public.topics VALUES (235, 124, NULL, 'Ngày mai tôi biến mất, cậu sẽ hồi sinh - Tập 1', NULL, 'Fujimaru', 'Thái Hà Books', NULL, 12, NULL, NULL, NULL, 'Vip', '10-12/2021', '3 năm ', 109000, NULL, '24', 'NaN', 3000000, NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-14 10:03:33.993972+00', '2022-04-14 10:03:33.993972+00', '2022-04-14 10:05:05.603+00', NULL, '2022-04-14 10:05:05.603+00', 1, '2022-04-14 10:03:33.993972', '2022-04-14 10:03:33.993972', NULL, NULL, 'Squirrel Communication and Culture', NULL, NULL, NULL);
INSERT INTO public.topics VALUES (224, 118, NULL, 'Bàn Có Năm Chỗ Ngồi', NULL, 'Nguyễn Nhật Ánh', 'Nguyễn Nhật Ánh', NULL, 15, NULL, NULL, NULL, 'Vip', '15-04/2021', '3 năm ', 55000, NULL, '25', '250000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-14 09:48:13.546+00', '2022-04-14 09:48:13.546+00', '2022-04-20 08:17:45.056+00', '2022-05-09 09:48:48.773+00', '2022-04-14 09:48:48.773+00', 2, '2022-04-14 09:48:49.055', '2022-04-14 09:48:13.546', NULL, NULL, 'NXB Trẻ', NULL, NULL, NULL);
INSERT INTO public.topics VALUES (232, 122, NULL, 'Trại Hoa Vàng', NULL, 'Nguyễn Nhật Ánh', 'Nguyễn Nhật Ánh', NULL, 20, NULL, NULL, NULL, 'Vip', '15-04/2021', '3 năm ', 82000, NULL, '25', '250000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-14 09:59:28.838+00', '2022-04-20 08:17:32.225+00', '2022-04-20 08:17:32.225+00', NULL, '2022-04-14 10:00:02.031+00', 2, '2022-04-14 10:00:02.308', '2022-04-14 09:59:28.838', '2022-04-20 08:17:32.225', NULL, 'NXB Trẻ', NULL, NULL, NULL);
INSERT INTO public.topics VALUES (230, 121, NULL, 'Làm Bạn Với Bầu Trời', NULL, 'Nguyễn Nhật Ánh ', 'Nguyễn Nhật Ánh ', NULL, 20, NULL, NULL, NULL, 'Vip', '15-04/2021', '3 năm ', 220000, NULL, '25', '300000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-14 09:52:40.312+00', '2022-04-20 08:18:18.802+00', '2022-04-20 08:18:18.802+00', NULL, '2022-04-14 09:53:15.903+00', 2, '2022-04-14 09:53:16.118', '2022-04-14 09:52:40.312', '2022-04-20 08:18:18.802', NULL, 'NXB Trẻ', NULL, NULL, NULL);
INSERT INTO public.topics VALUES (226, 119, NULL, 'Thằng quỷ nhỏ', NULL, 'Nguyễn Nhật Ánh', 'Nguyễn Nhật Ánh', NULL, 20, NULL, NULL, NULL, 'Vip', '15-04/2021', '3 năm ', 70000, NULL, '25', '300000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-14 09:50:09.537+00', '2022-04-20 08:18:46.828+00', '2022-04-20 08:18:46.828+00', NULL, '2022-04-14 09:50:41.308+00', 2, '2022-04-14 09:50:41.589', '2022-04-14 09:50:09.537', '2022-04-20 08:18:46.828', NULL, 'NXB Trẻ', NULL, NULL, NULL);
INSERT INTO public.topics VALUES (220, 116, NULL, 'Kính Vạn Hoa - Chuyện Nhỏ 37 - Lớp Phó Trật Tự', NULL, 'Nguyễn Nhật Ánh ', 'Nguyễn Nhật Ánh ', NULL, 17, NULL, NULL, NULL, 'Vip', '15-04/2021', '3 năm ', 110000, NULL, '25', '250000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-14 09:44:52.269+00', '2022-04-14 09:44:52.269+00', '2022-04-20 08:19:51.372+00', '2022-05-09 09:45:24.386+00', '2022-04-14 09:45:24.386+00', 2, '2022-04-14 09:45:24.627', '2022-04-14 09:44:52.269', NULL, NULL, 'NXB Trẻ', NULL, NULL, NULL);
INSERT INTO public.topics VALUES (218, 115, NULL, 'Kính Vạn Hoa - Chuyện Nhỏ 31 - Thằng Thỏ Đế', NULL, 'Nguyễn Nhật Ánh ', 'Nguyễn Nhật Ánh ', NULL, 17, NULL, NULL, NULL, 'Vip', '15-04/2021', '3 năm ', 110000, NULL, '25', '250000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-14 09:44:03.991+00', '2022-04-14 09:44:03.991+00', '2022-04-20 08:20:08.557+00', '2022-05-09 09:44:29.26+00', '2022-04-14 09:44:29.26+00', 2, '2022-04-14 09:44:29.541', '2022-04-14 09:44:03.991', NULL, NULL, 'NXB Trẻ', NULL, NULL, NULL);
INSERT INTO public.topics VALUES (216, 114, NULL, 'Kính Vạn Hoa - Tập 47 - Ngủ Quên Trên Đồi', NULL, 'Nguyễn Nhật Ánh ', 'Nguyễn Nhật Ánh ', NULL, 15, NULL, NULL, NULL, 'Vip', '15-04/2021', '3 năm ', 110000, NULL, '25', '250000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-14 09:43:17.499+00', '2022-04-14 09:43:17.499+00', '2022-04-20 08:20:52.889+00', '2022-05-09 09:43:40.214+00', '2022-04-14 09:43:40.214+00', 2, '2022-04-14 09:43:40.374', '2022-04-14 09:43:17.499', NULL, NULL, 'NXB Trẻ', NULL, NULL, NULL);
INSERT INTO public.topics VALUES (214, 113, NULL, 'Kính Vạn Hoa - Tập 46 - Người Giúp Việc Khác Thường', NULL, 'Nguyễn Nhật Ánh ', 'Nguyễn Nhật Ánh ', NULL, 15, NULL, NULL, NULL, 'Vip', '15-04/2021', '3 năm ', 110000, NULL, '25', '250000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-14 09:41:44.591+00', '2022-04-14 09:41:44.591+00', '2022-04-20 08:21:20.595+00', '2022-05-09 09:42:14.3+00', '2022-04-14 09:42:14.3+00', 2, '2022-04-14 09:42:14.571', '2022-04-14 09:41:44.591', NULL, NULL, 'NXB Trẻ', NULL, NULL, NULL);
INSERT INTO public.topics VALUES (212, 112, NULL, 'Kính Vạn Hoa - Tập 46 - Người Giúp Việc Khác Thường', NULL, 'Nguyễn Nhật Ánh ', 'Nguyễn Nhật Ánh ', NULL, 15, NULL, NULL, NULL, 'Vip', '15-04/2021', '3 năm ', 110000, NULL, '25', '250000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-14 09:40:33.284+00', '2022-04-14 09:41:13.052+00', '2022-04-20 08:21:29.454+00', '2022-05-09 09:40:56.606+00', '2022-04-14 09:40:56.606+00', 2, '2022-04-14 09:40:56.883', '2022-04-14 09:40:33.284', NULL, NULL, 'NXB Trẻ', NULL, NULL, NULL);
INSERT INTO public.topics VALUES (206, 109, NULL, 'Kính Vạn Hoa - Tập 52 - Tóc Ngắn Tóc Dài', NULL, 'Nguyễn Nhật Ánh ', 'Nguyễn Nhật Ánh ', NULL, 14, NULL, NULL, NULL, 'Vip', '15-04/2021', '3 năm ', 110000, NULL, '25', '250000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-14 09:37:31.533+00', '2022-04-14 09:37:31.533+00', '2022-04-20 08:29:42.452+00', '2022-05-04 09:37:59.215+00', '2022-04-14 09:37:59.215+00', 2, '2022-04-14 09:37:59.899', '2022-04-14 09:37:31.533', NULL, NULL, 'NXB Trẻ', NULL, NULL, NULL);
INSERT INTO public.topics VALUES (208, 110, NULL, 'Kính Vạn Hoa - Tập 53 - Má Lúm Đồng Tiền', NULL, 'Nguyễn Nhật Ánh ', 'Nguyễn Nhật Ánh ', NULL, 18, NULL, NULL, NULL, 'Vip', '15-04/2021', '3 năm ', 110000, NULL, '25', '250000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-14 09:38:33.053+00', '2022-04-14 09:38:33.053+00', '2022-04-20 08:30:27.293+00', '2022-05-04 09:38:58.825+00', '2022-04-14 09:38:58.826+00', 2, '2022-04-14 09:38:59.338', '2022-04-14 09:38:33.053', NULL, NULL, 'NXB Trẻ', NULL, NULL, NULL);
INSERT INTO public.topics VALUES (210, 111, NULL, 'Kính Vạn Hoa - Tập 54 - Cà Phê Áo Tím', NULL, 'Nguyễn Nhật Ánh ', 'Nguyễn Nhật Ánh ', NULL, 15, NULL, NULL, NULL, 'Vip', '15-04/2021', '3 năm ', 110000, NULL, '25', '250000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-14 09:39:32.57+00', '2022-04-14 09:39:32.57+00', '2022-04-20 08:30:52.032+00', '2022-05-04 09:39:56.341+00', '2022-04-14 09:39:56.341+00', 2, '2022-04-14 09:39:56.588', '2022-04-14 09:39:32.57', NULL, NULL, 'NXB Trẻ', NULL, NULL, NULL);
INSERT INTO public.topics VALUES (245, 129, NULL, 'Tôi Là Bê Tô', NULL, 'Nguyễn Nhật Ánh ', 'Nguyễn Nhật Ánh ', NULL, 12, NULL, NULL, NULL, 'Vip', '15-04/2021', '3 năm ', 85000, NULL, '25', '300000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-15 05:55:33.078281+00', '2022-04-15 05:55:33.078281+00', '2022-04-15 05:56:07.88+00', NULL, '2022-04-15 05:56:07.88+00', 1, '2022-04-15 05:55:33.078281', '2022-04-15 05:55:33.078281', NULL, NULL, 'NXB Trẻ', NULL, NULL, NULL);
INSERT INTO public.topics VALUES (81, 53, 'Winning the 21st the century games', 'Chiến thắng Cuộc chơi Thế kỉ 21', NULL, 'Adam Khoo, Jeremy Han', 'AKLTG', 'Adam Khoo', 18, 1, '70', 'Dropbox
https://www.dropbox.com/scl/fi/p7g9l74a5j1721ub5ilw8/Gi-i-thi-u-s-ch-Chi-n-th-ng-cu-c-ch-i-th-k-21.docx?dl=0&rlkey=cmgiervj1nfuey32h8gaplzjj', NULL, '06-04/2021', '5', 95000, NULL, '37.5', '300 $', 0, NULL, '12,5', NULL, NULL, NULL, true, '2022-04-05 08:54:41.671+00', '2022-04-15 02:21:23.132+00', '2022-04-13 08:28:09.068+00', '2022-04-18 08:39:58.083+00', '2022-04-05 08:59:32.797+00', 2, '2022-04-05 08:59:33.119', '2022-04-05 08:54:41.671', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.topics VALUES (132, 72, ' Secrets of building multi- million dollar bussiness', 'Bí quyết gây dựng cơ nghiệp bạc tỷ', NULL, 'Adam Khoo', 'AKLTG', NULL, 20, NULL, NULL, NULL, 'Vip', '06-04/2021', '5 năm', 129000, NULL, '37.5', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-13 10:01:26.627+00', '2022-04-20 08:16:36.904+00', '2022-04-20 08:16:36.904+00', NULL, '2022-04-13 10:10:14.754+00', 2, '2022-04-13 10:10:14.966', '2022-04-13 10:01:26.627', '2022-04-20 08:16:36.904', NULL, '', NULL, NULL, NULL);
INSERT INTO public.topics VALUES (111, 57, NULL, 'Khởi Nghiệp Từ Tiệm Nhỏ', NULL, 'Donnie Luân', 'Nhân Sinh Cửu Bảo ', 'Nhân sinh cửu bảo, thương tâm bích, kỹ năng ', 21, 1, '44,70', 'Dropbox https://www.dropbox.com/scl/fi/duze64e3gnssqioxfsdl3/Gi-i-thi-u-s-ch-Kh-i-Nghi-p-T-Ti-m-Nh.docx?dl=0&rlkey=t26zdbz2p7dfx34euvf7hr8dw', NULL, '21-10/2021', '5', 85000, NULL, '25', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-05 09:32:31.422+00', '2022-04-15 02:52:08.766+00', '2022-04-08 09:15:59.329+00', '2022-04-20 09:35:53.842+00', '2022-04-05 09:35:53.842+00', 3, '2022-04-05 09:35:54.131', '2022-04-08 09:18:03.541', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.topics VALUES (140, 76, NULL, 'Năm Người Đàn Bà Si Tình', NULL, 'Ihara Saikaru', 'Phương Nam Books', NULL, 14, NULL, NULL, NULL, 'Vip', '27-09/2021', '5 năm ', 49000, NULL, '35', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-13 14:13:11.828+00', '2022-04-15 03:26:26.993+00', '2022-04-20 08:12:21.078+00', '2022-04-28 14:14:09.932+00', '2022-04-13 14:14:09.932+00', 2, '2022-04-13 14:14:10.193', '2022-04-13 14:13:11.828', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.topics VALUES (168, 90, NULL, 'Mẹ Chồng Nàng Dâu ', NULL, 'Bà Tùng Long', 'Bà Tùng Long', NULL, 20, NULL, NULL, NULL, 'Vip', '07-03/2022', '5 năm', 67000, NULL, '25', '2000000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-14 08:55:05.996+00', '2022-04-20 08:11:44.305+00', '2022-04-20 08:11:44.305+00', NULL, '2022-04-14 08:56:19.128+00', 2, '2022-04-14 08:56:19.406', '2022-04-14 08:55:05.996', '2022-04-20 08:11:44.305', NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.topics VALUES (237, 125, NULL, 'Người Quảng đi ăn mì quảng', NULL, 'Nguyễn Nhật Ánh', 'Nguyễn Nhật Ánh', NULL, 12, NULL, NULL, NULL, 'Vip', '15-04/2021', '3 năm ', 75000, NULL, '25', '300000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-15 05:47:19.593064+00', '2022-04-15 05:47:19.593064+00', '2022-04-15 05:49:50.214+00', NULL, '2022-04-15 05:49:50.214+00', 1, '2022-04-15 05:47:19.593064', '2022-04-15 05:47:19.593064', NULL, NULL, 'NXB Trẻ', NULL, NULL, NULL);
INSERT INTO public.topics VALUES (239, 126, NULL, 'Chuyện Xứ Lang Biang - Tập 3', NULL, 'Nguyễn Nhật Ánh ', 'Nguyễn Nhật Ánh ', NULL, 12, NULL, NULL, NULL, 'Vip', '15-04/2021', '3 năm ', 195000, NULL, '25', '300000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-15 05:51:10.315472+00', '2022-04-15 05:51:10.315472+00', '2022-04-15 05:52:18.801+00', NULL, '2022-04-15 05:52:18.801+00', 1, '2022-04-15 05:51:10.315472', '2022-04-15 05:51:10.315472', NULL, NULL, 'NXB Trẻ', NULL, NULL, NULL);
INSERT INTO public.topics VALUES (241, 127, NULL, 'Chú bé rắc rối ', NULL, 'Nguyễn Nhật Ánh ', 'Nguyễn Nhật Ánh ', NULL, 12, NULL, NULL, NULL, 'Vip', '15-04/2021', '3 năm ', 60000, NULL, '25', '300000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-15 05:52:55.308314+00', '2022-04-15 05:52:55.308314+00', '2022-04-15 05:53:36.097+00', NULL, '2022-04-15 05:53:36.097+00', 1, '2022-04-15 05:52:55.308314', '2022-04-15 05:52:55.308314', NULL, NULL, 'NXB Trẻ', NULL, NULL, NULL);
INSERT INTO public.topics VALUES (243, 128, NULL, 'Những Cô Em Gái ', NULL, 'Nguyễn Nhật Ánh ', 'Nguyễn Nhật Ánh ', NULL, 12, NULL, NULL, NULL, 'Vip', '15-04/2021', '3 năm ', 63000, NULL, '25', '300000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-15 05:54:05.822695+00', '2022-04-15 05:54:05.822695+00', '2022-04-15 05:55:00.219+00', NULL, '2022-04-15 05:55:00.219+00', 1, '2022-04-15 05:54:05.822695', '2022-04-15 05:54:05.822695', NULL, NULL, 'NXB Trẻ', NULL, NULL, NULL);
INSERT INTO public.topics VALUES (247, 130, NULL, 'Lá Nằm Trong Lá', NULL, 'Nguyễn Nhật Ánh ', 'Nguyễn Nhật Ánh ', NULL, 12, NULL, NULL, NULL, 'Vip', '15-04/2021', '3 năm ', 80000, NULL, '25', '300000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-15 05:56:40.074715+00', '2022-04-15 05:56:40.074715+00', '2022-04-15 05:57:18.663+00', NULL, '2022-04-15 05:57:18.663+00', 1, '2022-04-15 05:56:40.074715', '2022-04-15 05:56:40.074715', NULL, NULL, 'NXB Trẻ', NULL, NULL, NULL);
INSERT INTO public.topics VALUES (249, 131, NULL, 'Bồ câu không đưa thư', NULL, 'Nguyễn Nhật Ánh ', 'Nguyễn Nhật Ánh ', NULL, 12, NULL, NULL, NULL, 'Vip', '15-04/2021', '3 năm ', 58000, NULL, '25', '300000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-15 05:58:03.319013+00', '2022-04-15 05:58:03.319013+00', '2022-04-15 05:58:34.847+00', NULL, '2022-04-15 05:58:34.847+00', 1, '2022-04-15 05:58:03.319013', '2022-04-15 05:58:03.319013', NULL, NULL, 'NXB Trẻ', NULL, NULL, NULL);
INSERT INTO public.topics VALUES (251, 132, NULL, 'Cảm ơn người lớn', NULL, 'Nguyễn Nhật Ánh ', 'Nguyễn Nhật Ánh ', NULL, 12, NULL, NULL, NULL, 'Vip', '15-04/2021', '3 năm ', 110000, NULL, '25', '300000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-15 05:59:09.609954+00', '2022-04-15 05:59:09.609954+00', '2022-04-15 05:59:46.617+00', NULL, '2022-04-15 05:59:46.617+00', 1, '2022-04-15 05:59:09.609954', '2022-04-15 05:59:09.609954', NULL, NULL, 'NXB Trẻ', NULL, NULL, NULL);
INSERT INTO public.topics VALUES (253, 133, NULL, 'Còn Chút Gì Để Nhớ', NULL, 'Nguyễn Nhật Ánh ', 'Nguyễn Nhật Ánh ', NULL, 12, NULL, NULL, NULL, 'Vip', '15-04/2021', '3 năm ', 65000, NULL, '25', '300000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-15 06:00:10.133408+00', '2022-04-15 06:00:10.133408+00', '2022-04-15 06:00:45.829+00', NULL, '2022-04-15 06:00:45.829+00', 1, '2022-04-15 06:00:10.133408', '2022-04-15 06:00:10.133408', NULL, NULL, 'NXB Trẻ', NULL, NULL, NULL);
INSERT INTO public.topics VALUES (255, 134, NULL, 'Hạ Đỏ', NULL, 'Nguyễn Nhật Ánh ', 'Nguyễn Nhật Ánh ', NULL, 12, NULL, NULL, NULL, 'Vip', '15-04/2021', '3 năm ', 60000, NULL, '25', '300000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-15 06:04:15.639944+00', '2022-04-15 06:04:15.639944+00', '2022-04-15 06:05:38.796+00', NULL, '2022-04-15 06:05:38.796+00', 1, '2022-04-15 06:04:15.639944', '2022-04-15 06:04:15.639944', NULL, NULL, 'NXB Trẻ', NULL, NULL, NULL);
INSERT INTO public.topics VALUES (257, 135, NULL, 'Thiên Thần Nhỏ Của Tôi', NULL, 'Nguyễn Nhật Ánh', 'Nguyễn Nhật Ánh', NULL, 12, NULL, NULL, NULL, 'Vip', '15-04/2021', '3 năm ', 48000, NULL, '25', '300000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-15 06:06:40.366006+00', '2022-04-15 06:06:40.366006+00', '2022-04-15 06:07:46.277+00', NULL, '2022-04-15 06:07:46.277+00', 1, '2022-04-15 06:06:40.366006', '2022-04-15 06:06:40.366006', NULL, NULL, 'NXB Trẻ', NULL, NULL, NULL);
INSERT INTO public.topics VALUES (258, 135, NULL, 'Thiên Thần Nhỏ Của Tôi', NULL, 'Nguyễn Nhật Ánh', 'Nguyễn Nhật Ánh', NULL, 18, NULL, NULL, NULL, 'Vip', '15-04/2021', '3 năm ', 48000, NULL, '25', '300000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-15 06:06:40.366+00', '2022-04-15 06:06:40.366+00', '2022-04-20 08:06:22.963+00', '2022-05-05 06:07:46.277+00', '2022-04-15 06:07:46.277+00', 2, '2022-04-15 06:07:46.532', '2022-04-15 06:06:40.366', NULL, NULL, 'NXB Trẻ', NULL, NULL, NULL);
INSERT INTO public.topics VALUES (254, 133, NULL, 'Còn Chút Gì Để Nhớ', NULL, 'Nguyễn Nhật Ánh ', 'Nguyễn Nhật Ánh ', NULL, 18, NULL, NULL, NULL, 'Vip', '15-04/2021', '3 năm ', 65000, NULL, '25', '300000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-15 06:00:10.133+00', '2022-04-15 06:00:10.133+00', '2022-04-20 08:06:39.185+00', '2022-04-27 06:00:45.829+00', '2022-04-15 06:00:45.829+00', 2, '2022-04-15 06:00:45.967', '2022-04-15 06:00:10.133', NULL, NULL, 'NXB Trẻ', NULL, NULL, NULL);
INSERT INTO public.topics VALUES (252, 132, NULL, 'Cảm ơn người lớn', NULL, 'Nguyễn Nhật Ánh ', 'Nguyễn Nhật Ánh ', NULL, 18, NULL, NULL, NULL, 'Vip', '15-04/2021', '3 năm ', 110000, NULL, '25', '300000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-15 05:59:09.609+00', '2022-04-15 05:59:09.609+00', '2022-04-20 08:06:44.123+00', '2022-04-27 05:59:46.617+00', '2022-04-15 05:59:46.617+00', 2, '2022-04-15 05:59:46.738', '2022-04-15 05:59:09.609', NULL, NULL, 'NXB Trẻ', NULL, NULL, NULL);
INSERT INTO public.topics VALUES (250, 131, NULL, 'Bồ câu không đưa thư', NULL, 'Nguyễn Nhật Ánh ', 'Nguyễn Nhật Ánh ', NULL, 20, NULL, NULL, NULL, 'Vip', '15-04/2021', '3 năm ', 58000, NULL, '25', '300000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-15 05:58:03.319+00', '2022-04-20 08:07:16.388+00', '2022-04-20 08:07:16.388+00', NULL, '2022-04-15 05:58:34.847+00', 2, '2022-04-15 05:58:35.198', '2022-04-15 05:58:03.319', '2022-04-20 08:07:16.388', NULL, 'NXB Trẻ', NULL, NULL, NULL);
INSERT INTO public.topics VALUES (248, 130, NULL, 'Lá Nằm Trong Lá', NULL, 'Nguyễn Nhật Ánh ', 'Nguyễn Nhật Ánh ', NULL, 18, NULL, NULL, NULL, 'Vip', '15-04/2021', '3 năm ', 80000, NULL, '25', '300000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-15 05:56:40.074+00', '2022-04-15 05:56:40.074+00', '2022-04-20 08:10:25.267+00', '2022-04-30 05:57:18.663+00', '2022-04-15 05:57:18.663+00', 2, '2022-04-15 05:57:18.91', '2022-04-15 05:56:40.074', NULL, NULL, 'NXB Trẻ', NULL, NULL, NULL);
INSERT INTO public.topics VALUES (246, 129, NULL, 'Tôi Là Bê Tô', NULL, 'Nguyễn Nhật Ánh ', 'Nguyễn Nhật Ánh ', NULL, 18, NULL, NULL, NULL, 'Vip', '15-04/2021', '3 năm ', 85000, NULL, '25', '300000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-15 05:55:33.078+00', '2022-04-15 05:55:33.078+00', '2022-04-20 08:10:48.385+00', '2022-04-30 05:56:07.88+00', '2022-04-15 05:56:07.88+00', 2, '2022-04-15 05:56:08.014', '2022-04-15 05:55:33.078', NULL, NULL, 'NXB Trẻ', NULL, NULL, NULL);
INSERT INTO public.topics VALUES (244, 128, NULL, 'Những Cô Em Gái ', NULL, 'Nguyễn Nhật Ánh ', 'Nguyễn Nhật Ánh ', NULL, 18, NULL, NULL, NULL, 'Vip', '15-04/2021', '3 năm ', 63000, NULL, '25', '300000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-15 05:54:05.822+00', '2022-04-15 05:54:05.822+00', '2022-04-20 08:11:04.82+00', '2022-05-10 05:55:00.219+00', '2022-04-15 05:55:00.219+00', 2, '2022-04-15 05:55:00.466', '2022-04-15 05:54:05.822', NULL, NULL, 'NXB Trẻ', NULL, NULL, NULL);
INSERT INTO public.topics VALUES (242, 127, NULL, 'Chú bé rắc rối ', NULL, 'Nguyễn Nhật Ánh ', 'Nguyễn Nhật Ánh ', NULL, 18, NULL, NULL, NULL, 'Vip', '15-04/2021', '3 năm ', 60000, NULL, '25', '300000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-15 05:52:55.308+00', '2022-04-15 05:52:55.308+00', '2022-04-20 08:11:23.05+00', '2022-05-10 05:53:36.097+00', '2022-04-15 05:53:36.097+00', 2, '2022-04-15 05:53:36.225', '2022-04-15 05:52:55.308', NULL, NULL, 'NXB Trẻ', NULL, NULL, NULL);
INSERT INTO public.topics VALUES (240, 126, NULL, 'Chuyện Xứ Lang Biang - Tập 3', NULL, 'Nguyễn Nhật Ánh ', 'Nguyễn Nhật Ánh ', NULL, 18, NULL, NULL, NULL, 'Vip', '15-04/2021', '3 năm ', 195000, NULL, '25', '300000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-15 05:51:10.315+00', '2022-04-15 05:51:10.315+00', '2022-04-20 08:11:26.104+00', '2022-05-10 05:52:18.801+00', '2022-04-15 05:52:18.801+00', 2, '2022-04-15 05:52:18.986', '2022-04-15 05:51:10.315', NULL, NULL, 'NXB Trẻ', NULL, NULL, NULL);
INSERT INTO public.topics VALUES (238, 125, NULL, 'Người Quảng đi ăn mì quảng', NULL, 'Nguyễn Nhật Ánh', 'Nguyễn Nhật Ánh', NULL, 18, NULL, NULL, NULL, 'Vip', '15-04/2021', '3 năm ', 75000, NULL, '25', '300000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-15 05:47:19.593+00', '2022-04-15 05:47:19.593+00', '2022-04-20 08:11:39.406+00', '2022-05-10 05:49:50.214+00', '2022-04-15 05:49:50.214+00', 2, '2022-04-15 05:49:50.48', '2022-04-15 05:47:19.593', NULL, NULL, 'NXB Trẻ', NULL, NULL, NULL);
INSERT INTO public.topics VALUES (236, 124, NULL, 'Ngày mai tôi biến mất, cậu sẽ hồi sinh - Tập 1', NULL, 'Fujimaru', 'Thái Hà Books', NULL, 20, NULL, NULL, NULL, 'Vip', '10-12/2021', '3 năm ', 109000, NULL, '24', 'USD 150', 3000000, NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-14 10:03:33.993+00', '2022-04-20 08:11:42.333+00', '2022-04-20 08:11:42.332+00', NULL, '2022-04-14 10:05:05.603+00', 2, '2022-04-14 10:05:06.025', '2022-04-14 10:03:33.993', '2022-04-20 08:11:42.333', NULL, 'Squirrel Communication and Culture', NULL, NULL, NULL);
INSERT INTO public.topics VALUES (85, 55, ' Winning the Game of Stock', 'Chiến thắng trò chơi chứng khoán', NULL, 'Adam Khoo', 'AKLTG', NULL, 20, NULL, NULL, 'Dropbox https://www.dropbox.com/scl/fi/fhcsbiywh5y5ac5e6u89n/Gi-i-thi-u-s-ch-Chi-n-th-ng-tr-ch-i-ch-ng-kho-n.docx?dl=0&rlkey=qte7lmukpz7n34t1yigbtyadc', 'Vip', '06-04/2021', '5', 240000, NULL, '37,5', '300 $', 0, NULL, '12,5', NULL, NULL, NULL, true, '2022-04-05 09:13:52.877+00', '2022-04-20 08:12:43.795+00', '2022-04-20 08:12:43.795+00', '2022-04-20 09:17:24.238+00', '2022-04-05 09:17:24.239+00', 2, '2022-04-05 09:17:24.651', '2022-04-05 09:13:52.877', '2022-04-20 08:12:43.795', NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.topics VALUES (259, 136, NULL, 'Kính Vạn Hoa - Chuyện Nhỏ 1 - Nhà Ảo Thuật', NULL, 'Nguyễn Nhật Ánh ', 'Nguyễn Nhật Ánh ', NULL, 12, NULL, NULL, NULL, 'Vip', '15-04/2021', '3 năm ', 110000, NULL, '25', '250000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-15 06:08:19.848318+00', '2022-04-15 06:08:19.848318+00', '2022-04-15 06:08:50.267+00', NULL, '2022-04-15 06:08:50.267+00', 1, '2022-04-15 06:08:19.848318', '2022-04-15 06:08:19.848318', NULL, NULL, 'NXB Trẻ', NULL, NULL, NULL);
INSERT INTO public.topics VALUES (261, 137, NULL, 'Kính Vạn Hoa - Chuyện Nhỏ 2 - Những Con Gấu Bông', NULL, 'Nguyễn Nhật Ánh ', 'Nguyễn Nhật Ánh ', NULL, 12, NULL, NULL, NULL, 'Vip', '15-04/2021', '3 năm ', 110000, NULL, '25', '250000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-15 06:09:22.11649+00', '2022-04-15 06:09:22.11649+00', '2022-04-15 06:10:03.145+00', NULL, '2022-04-15 06:10:03.145+00', 1, '2022-04-15 06:09:22.11649', '2022-04-15 06:09:22.11649', NULL, NULL, 'NXB Trẻ', NULL, NULL, NULL);
INSERT INTO public.topics VALUES (263, 138, NULL, 'Kính Vạn Hoa - Chuyện Nhỏ 3 - Thám Tử Nghiệp Dư', NULL, 'Nguyễn Nhật Ánh ', 'Nguyễn Nhật Ánh ', NULL, 12, NULL, NULL, NULL, 'Vip', '15-04/2021', '3 năm ', 110000, NULL, '25', '250000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-15 06:10:54.577217+00', '2022-04-15 06:10:54.577217+00', '2022-04-15 06:11:19.501+00', NULL, '2022-04-15 06:11:19.501+00', 1, '2022-04-15 06:10:54.577217', '2022-04-15 06:10:54.577217', NULL, NULL, 'NXB Trẻ', NULL, NULL, NULL);
INSERT INTO public.topics VALUES (265, 139, NULL, 'Kính Vạn Hoa - Chuyện Nhỏ 4 - Ông Thầy Nóng Tính', NULL, 'Nguyễn Nhật Ánh ', 'Nguyễn Nhật Ánh ', NULL, 12, NULL, NULL, NULL, 'Vip', '15-04/2021', '3 năm ', 110000, NULL, '25', '250000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-15 06:11:48.823932+00', '2022-04-15 06:11:48.823932+00', '2022-04-15 06:12:12.064+00', NULL, '2022-04-15 06:12:12.064+00', 1, '2022-04-15 06:11:48.823932', '2022-04-15 06:11:48.823932', NULL, NULL, 'NXB Trẻ', NULL, NULL, NULL);
INSERT INTO public.topics VALUES (267, 140, NULL, 'Kính Vạn Hoa - Chuyện Nhỏ 5 - Xin Lỗi Mày, Tai To!', NULL, 'Nguyễn Nhật Ánh ', 'Nguyễn Nhật Ánh ', NULL, 12, NULL, NULL, NULL, 'Vip', '15-04/2021', '3 năm ', 110000, NULL, '25', '250000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-15 06:12:38.911422+00', '2022-04-15 06:12:38.911422+00', '2022-04-15 06:13:09.528+00', NULL, '2022-04-15 06:13:09.528+00', 1, '2022-04-15 06:12:38.911422', '2022-04-15 06:12:38.911422', NULL, NULL, 'NXB Trẻ', NULL, NULL, NULL);
INSERT INTO public.topics VALUES (269, 141, NULL, 'Kính Vạn Hoa - Chuyện Nhỏ 6 - Người Bạn Lạ Lùng', NULL, 'Nguyễn Nhật Ánh ', 'Nguyễn Nhật Ánh ', NULL, 12, NULL, NULL, NULL, 'Vip', '15-04/2021', '3 năm ', 110000, NULL, '25', '250000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-15 06:13:44.644617+00', '2022-04-15 06:13:44.644617+00', '2022-04-15 06:14:10.431+00', NULL, '2022-04-15 06:14:10.431+00', 1, '2022-04-15 06:13:44.644617', '2022-04-15 06:13:44.644617', NULL, NULL, 'NXB Trẻ', NULL, NULL, NULL);
INSERT INTO public.topics VALUES (271, 142, NULL, 'Tam Sinh Tam Thế Chẩm Thượng Thư - Tập 1', NULL, 'Đường Thất Công Tử ', 'Quảng Văn', NULL, 12, NULL, NULL, NULL, 'Vip', NULL, '3 năm ', NULL, NULL, '30', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-15 06:19:31.374192+00', '2022-04-15 06:19:31.374192+00', '2022-04-15 06:19:55.812+00', NULL, '2022-04-15 06:19:55.812+00', 1, '2022-04-15 06:19:31.374192', '2022-04-15 06:19:31.374192', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.topics VALUES (273, 143, NULL, 'Thiên tài và sự giáo dục từ sớm', NULL, 'Kimura Kyuichi', 'First News', NULL, 12, NULL, NULL, NULL, 'Vip', NULL, '3 năm ', 88000, NULL, '50', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-15 06:22:08.638041+00', '2022-04-15 06:22:08.638041+00', '2022-04-15 06:22:36.046+00', NULL, '2022-04-15 06:22:36.046+00', 1, '2022-04-15 06:22:08.638041', '2022-04-15 06:22:08.638041', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.topics VALUES (275, 144, NULL, 'Thương nhau để đó', NULL, 'Hamlet Trương and Iris Cao', 'Hamlet Trương & Iris Cao', NULL, 12, NULL, NULL, NULL, 'Vip', NULL, '3 năm ', 78000, NULL, '35', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-15 06:27:37.382892+00', '2022-04-15 06:27:37.382892+00', '2022-04-15 06:31:30.353+00', NULL, '2022-04-15 06:31:30.353+00', 1, '2022-04-15 06:27:37.382892', '2022-04-15 06:27:37.382892', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.topics VALUES (277, 145, NULL, 'Hãy Yêu Cuộc Sống Bạn Chọn -> Yêu Mình Trước Đã', NULL, 'Jack Canfield & Mark Victor Hansen', 'First News', NULL, 12, NULL, NULL, NULL, 'Vip', NULL, '3 năm ', 54000, NULL, '50', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-15 06:41:01.397479+00', '2022-04-15 06:41:01.397479+00', '2022-04-15 06:41:26.28+00', NULL, '2022-04-15 06:41:26.28+00', 1, '2022-04-15 06:41:01.397479', '2022-04-15 06:41:01.397479', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.topics VALUES (279, 146, NULL, 'Ăn Uống Thông Minh', NULL, 'Dr. Darwin Deen, Lisa Hark-Ph.D', 'First News', NULL, 12, NULL, NULL, NULL, 'Vip', NULL, '3 năm ', 78000, NULL, '50', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-15 06:42:33.602041+00', '2022-04-15 06:42:33.602041+00', '2022-04-15 06:43:11.572+00', NULL, '2022-04-15 06:43:11.572+00', 1, '2022-04-15 06:42:33.602041', '2022-04-15 06:42:33.602041', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.topics VALUES (281, 147, NULL, 'Chu Du Vào Tâm Trí Khách Hàng', NULL, 'Harry Dexter Kitson', 'Ecoblader', NULL, 12, NULL, NULL, NULL, 'Vip', '10-10/2020', '3 năm ', 90000, NULL, '30', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-15 06:43:55.119115+00', '2022-04-15 06:43:55.119115+00', '2022-04-15 06:45:25.253+00', NULL, '2022-04-15 06:45:25.253+00', 1, '2022-04-15 06:43:55.119115', '2022-04-15 06:43:55.119115', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.topics VALUES (283, 148, NULL, '14 nguyên tắc tăng trưởng thần tốc như Amazon', NULL, 'Steve Anderson', 'First News', NULL, 12, NULL, NULL, NULL, 'Vip', NULL, '3 năm ', 188000, NULL, '50', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-15 06:46:12.928294+00', '2022-04-15 06:46:12.928294+00', '2022-04-15 06:46:46.323+00', NULL, '2022-04-15 06:46:46.323+00', 1, '2022-04-15 06:46:12.928294', '2022-04-15 06:46:12.928294', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.topics VALUES (285, 149, NULL, 'Mùa Hoa Nắng (Tập Truyện)', NULL, 'Trần Bảo Định', 'NXB Tổng Hợp', NULL, 12, NULL, NULL, NULL, 'Vip', '10-03/2021', '5 năm ', 110000, NULL, '50', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-15 06:47:16.327113+00', '2022-04-15 06:47:16.327113+00', '2022-04-15 07:50:30.211+00', NULL, '2022-04-15 07:50:30.211+00', 1, '2022-04-15 06:47:16.327113', '2022-04-15 06:47:16.327113', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.topics VALUES (287, 150, NULL, '7 Thói Quen Để Trẻ Hạnh Phúc ', NULL, 'Sean Covey', 'First News', NULL, 12, NULL, NULL, NULL, 'Vip', NULL, '3 năm ', 108000, NULL, '50', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-15 07:54:02.320321+00', '2022-04-15 07:54:02.320321+00', '2022-04-15 07:54:32.583+00', NULL, '2022-04-15 07:54:32.584+00', 1, '2022-04-15 07:54:02.320321', '2022-04-15 07:54:02.320321', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.topics VALUES (79, 52, NULL, 'Nhạn', NULL, 'Mori Ogai', 'Phương Nam Books', 'tiểu thuyết, văn học Nhật Bản ', 20, 4, '74', 'Dropbox https://www.dropbox.com/scl/fi/6nag3cs773hb6q7ljk0gx/Gi-i-thi-u-s-ch-Nh-n.docx?dl=0&rlkey=ksmaftvc4f8ek0cfrkz2tcy90', 'Vip', 'Invalid date', '5', 68000, NULL, '35', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-05 08:41:14.421+00', '2022-04-20 07:59:53.578+00', '2022-04-20 07:59:53.578+00', '2022-04-18 08:39:36.637+00', '2022-04-05 08:52:54.651+00', 2, '2022-04-05 08:52:54.938', '2022-04-05 08:41:14.421', '2022-04-20 07:59:53.578', NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.topics VALUES (289, 151, NULL, NULL, NULL, NULL, NULL, NULL, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-20 07:59:54.185488+00', '2022-04-20 07:59:54.185488+00', '2022-04-20 07:59:54.185488+00', NULL, NULL, 3, '2022-04-20 07:59:54.185488', '2022-04-20 07:59:54.055', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.topics VALUES (284, 148, NULL, '14 nguyên tắc tăng trưởng thần tốc như Amazon', NULL, 'Steve Anderson', 'First News', NULL, 17, NULL, NULL, NULL, 'Vip', NULL, '3 năm ', 188000, NULL, '50', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-15 06:46:12.928+00', '2022-04-15 06:46:12.928+00', '2022-04-20 08:00:15.018+00', '2022-04-30 06:46:46.323+00', '2022-04-15 06:46:46.323+00', 2, '2022-04-15 06:46:46.442', '2022-04-15 06:46:12.928', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.topics VALUES (282, 147, NULL, 'Chu Du Vào Tâm Trí Khách Hàng', NULL, 'Harry Dexter Kitson', 'Ecoblader', NULL, 17, NULL, NULL, NULL, 'Vip', '10-10/2020', '3 năm ', 90000, NULL, '30', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-15 06:43:55.119+00', '2022-04-15 06:43:55.119+00', '2022-04-20 08:00:28.917+00', '2022-04-30 06:45:25.253+00', '2022-04-15 06:45:25.253+00', 2, '2022-04-15 06:45:25.48', '2022-04-15 06:43:55.119', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.topics VALUES (286, 149, NULL, 'Mùa Hoa Nắng (Tập Truyện)', NULL, 'Trần Bảo Định', 'NXB Tổng Hợp', NULL, 14, NULL, NULL, NULL, 'Vip', '10-03/2021', '5 năm ', 110000, NULL, '50', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-15 06:47:16.327+00', '2022-04-15 06:47:16.327+00', '2022-04-20 08:01:53.862+00', '2022-05-05 07:50:30.211+00', '2022-04-15 07:50:30.211+00', 2, '2022-04-15 07:50:30.385', '2022-04-15 06:47:16.327', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.topics VALUES (288, 150, NULL, '7 Thói Quen Để Trẻ Hạnh Phúc ', NULL, 'Sean Covey', 'First News', NULL, 14, NULL, NULL, NULL, 'Vip', NULL, '3 năm ', 108000, NULL, '50', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-15 07:54:02.32+00', '2022-04-15 07:54:02.32+00', '2022-04-20 08:02:39.962+00', '2022-04-25 07:54:32.583+00', '2022-04-15 07:54:32.584+00', 2, '2022-04-15 07:54:32.813', '2022-04-15 07:54:02.32', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.topics VALUES (280, 146, NULL, 'Ăn Uống Thông Minh', NULL, 'Dr. Darwin Deen, Lisa Hark-Ph.D', 'First News', NULL, 15, NULL, NULL, NULL, 'Vip', NULL, '3 năm ', 78000, NULL, '50', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-15 06:42:33.602+00', '2022-04-15 06:42:33.602+00', '2022-04-20 08:03:28.878+00', '2022-04-30 06:43:11.572+00', '2022-04-15 06:43:11.572+00', 2, '2022-04-15 06:43:11.689', '2022-04-15 06:42:33.602', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.topics VALUES (278, 145, NULL, 'Hãy Yêu Cuộc Sống Bạn Chọn -> Yêu Mình Trước Đã', NULL, 'Jack Canfield & Mark Victor Hansen', 'First News', NULL, 17, NULL, NULL, NULL, 'Vip', NULL, '3 năm ', 54000, NULL, '50', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-15 06:41:01.397+00', '2022-04-15 06:41:01.397+00', '2022-04-20 08:03:45.732+00', '2022-04-30 06:41:26.28+00', '2022-04-15 06:41:26.28+00', 2, '2022-04-15 06:41:26.396', '2022-04-15 06:41:01.397', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.topics VALUES (276, 144, NULL, 'Thương nhau để đó', NULL, 'Hamlet Trương and Iris Cao', 'Hamlet Trương & Iris Cao', NULL, 17, NULL, NULL, NULL, 'Vip', NULL, '3 năm ', 78000, NULL, '35', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-15 06:27:37.382+00', '2022-04-15 06:27:37.382+00', '2022-04-20 08:04:15.545+00', '2022-04-30 06:31:30.353+00', '2022-04-15 06:31:30.353+00', 2, '2022-04-15 06:31:30.663', '2022-04-15 06:27:37.382', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.topics VALUES (274, 143, NULL, 'Thiên tài và sự giáo dục từ sớm', NULL, 'Kimura Kyuichi', 'First News', NULL, 15, NULL, NULL, NULL, 'Vip', NULL, '3 năm ', 88000, NULL, '50', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-15 06:22:08.638+00', '2022-04-15 06:22:08.638+00', '2022-04-20 08:04:49.971+00', '2022-04-30 06:22:36.046+00', '2022-04-15 06:22:36.046+00', 2, '2022-04-15 06:22:36.182', '2022-04-15 06:22:08.638', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.topics VALUES (272, 142, NULL, 'Tam Sinh Tam Thế Chẩm Thượng Thư - Tập 1', NULL, 'Đường Thất Công Tử ', 'Quảng Văn', NULL, 17, NULL, NULL, NULL, 'Vip', NULL, '3 năm ', NULL, NULL, '30', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-15 06:19:31.374+00', '2022-04-15 06:19:31.374+00', '2022-04-20 08:04:55.751+00', '2022-04-30 06:19:55.812+00', '2022-04-15 06:19:55.812+00', 2, '2022-04-15 06:19:55.981', '2022-04-15 06:19:31.374', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.topics VALUES (270, 141, NULL, 'Kính Vạn Hoa - Chuyện Nhỏ 6 - Người Bạn Lạ Lùng', NULL, 'Nguyễn Nhật Ánh ', 'Nguyễn Nhật Ánh ', NULL, 18, NULL, NULL, NULL, 'Vip', '15-04/2021', '3 năm ', 110000, NULL, '25', '250000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-15 06:13:44.644+00', '2022-04-15 06:13:44.644+00', '2022-04-20 08:05:02.817+00', '2022-04-25 06:14:10.431+00', '2022-04-15 06:14:10.431+00', 2, '2022-04-15 06:14:10.679', '2022-04-15 06:13:44.644', NULL, NULL, 'NXB Trẻ', NULL, NULL, NULL);
INSERT INTO public.topics VALUES (264, 138, NULL, 'Kính Vạn Hoa - Chuyện Nhỏ 3 - Thám Tử Nghiệp Dư', NULL, 'Nguyễn Nhật Ánh ', 'Nguyễn Nhật Ánh ', NULL, 19, NULL, NULL, NULL, 'Vip', '15-04/2021', '3 năm ', 110000, NULL, '25', '250000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-15 06:10:54.577+00', '2022-04-15 06:10:54.577+00', '2022-04-20 08:27:27.559+00', '2022-04-30 08:05:18.188+00', '2022-04-15 06:11:19.501+00', 2, '2022-04-15 06:11:19.702', '2022-04-15 06:10:54.577', NULL, NULL, 'NXB Trẻ', NULL, NULL, NULL);
INSERT INTO public.topics VALUES (268, 140, NULL, 'Kính Vạn Hoa - Chuyện Nhỏ 5 - Xin Lỗi Mày, Tai To!', NULL, 'Nguyễn Nhật Ánh ', 'Nguyễn Nhật Ánh ', NULL, 19, NULL, NULL, NULL, 'Vip', '15-04/2021', '3 năm ', 110000, NULL, '25', '250000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-15 06:12:38.911+00', '2022-04-15 06:12:38.911+00', '2022-04-20 08:27:17.745+00', '2022-04-30 08:05:09.546+00', '2022-04-15 06:13:09.528+00', 2, '2022-04-15 06:13:09.724', '2022-04-15 06:12:38.911', NULL, NULL, 'NXB Trẻ', NULL, NULL, NULL);
INSERT INTO public.topics VALUES (262, 137, NULL, 'Kính Vạn Hoa - Chuyện Nhỏ 2 - Những Con Gấu Bông', NULL, 'Nguyễn Nhật Ánh ', 'Nguyễn Nhật Ánh ', NULL, 17, NULL, NULL, NULL, 'Vip', '15-04/2021', '3 năm ', 110000, NULL, '25', '250000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-15 06:09:22.116+00', '2022-04-15 06:09:22.116+00', '2022-04-20 08:05:38.21+00', '2022-05-05 06:10:03.145+00', '2022-04-15 06:10:03.145+00', 2, '2022-04-15 06:10:03.413', '2022-04-15 06:09:22.116', NULL, NULL, 'NXB Trẻ', NULL, NULL, NULL);
INSERT INTO public.topics VALUES (260, 136, NULL, 'Kính Vạn Hoa - Chuyện Nhỏ 1 - Nhà Ảo Thuật', NULL, 'Nguyễn Nhật Ánh ', 'Nguyễn Nhật Ánh ', NULL, 17, NULL, NULL, NULL, 'Vip', '15-04/2021', '3 năm ', 110000, NULL, '25', '250000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-15 06:08:19.848+00', '2022-04-15 06:08:19.848+00', '2022-04-20 08:05:51.939+00', '2022-05-05 06:08:50.267+00', '2022-04-15 06:08:50.267+00', 2, '2022-04-15 06:08:50.47', '2022-04-15 06:08:19.848', NULL, NULL, 'NXB Trẻ', NULL, NULL, NULL);
INSERT INTO public.topics VALUES (256, 134, NULL, 'Hạ Đỏ', NULL, 'Nguyễn Nhật Ánh ', 'Nguyễn Nhật Ánh ', NULL, 20, NULL, NULL, NULL, 'Vip', '15-04/2021', '3 năm ', 60000, NULL, '25', '300000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-15 06:04:15.639+00', '2022-04-20 08:06:02.032+00', '2022-04-20 08:06:02.032+00', NULL, '2022-04-15 06:05:38.796+00', 2, '2022-04-15 06:05:39.145', '2022-04-15 06:04:15.639', '2022-04-20 08:06:02.032', NULL, 'NXB Trẻ', NULL, NULL, NULL);
INSERT INTO public.topics VALUES (290, 136, NULL, 'Kính Vạn Hoa - Chuyện Nhỏ 1 - Nhà Ảo Thuật', NULL, 'Nguyễn Nhật Ánh ', 'Nguyễn Nhật Ánh ', NULL, 21, NULL, NULL, NULL, 'Vip', '15-04/2021', '3 năm ', 110000, NULL, '25', '250000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-15 06:08:19.848+00', '2022-04-15 06:08:19.848+00', '2022-04-20 08:05:51.939+00', '2022-05-05 06:08:50.267+00', '2022-04-15 06:08:50.267+00', 3, '2022-04-15 06:08:50.47', '2022-04-20 08:06:02.321', NULL, NULL, 'NXB Trẻ', NULL, NULL, NULL);
INSERT INTO public.topics VALUES (291, 132, NULL, 'Cảm ơn người lớn', NULL, 'Nguyễn Nhật Ánh ', 'Nguyễn Nhật Ánh ', NULL, 21, NULL, NULL, NULL, 'Vip', '15-04/2021', '3 năm ', 110000, NULL, '25', '300000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-15 05:59:09.609+00', '2022-04-15 05:59:09.609+00', '2022-04-20 08:06:44.123+00', '2022-04-27 05:59:46.617+00', '2022-04-15 05:59:46.617+00', 3, '2022-04-15 05:59:46.738', '2022-04-20 08:07:16.614', NULL, NULL, 'NXB Trẻ', NULL, NULL, NULL);
INSERT INTO public.topics VALUES (292, 125, NULL, 'Người Quảng đi ăn mì quảng', NULL, 'Nguyễn Nhật Ánh', 'Nguyễn Nhật Ánh', NULL, 21, NULL, NULL, NULL, 'Vip', '15-04/2021', '3 năm ', 75000, NULL, '25', '300000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-15 05:47:19.593+00', '2022-04-15 05:47:19.593+00', '2022-04-20 08:11:39.406+00', '2022-05-10 05:49:50.214+00', '2022-04-15 05:49:50.214+00', 3, '2022-04-15 05:49:50.48', '2022-04-20 08:11:42.552', NULL, NULL, 'NXB Trẻ', NULL, NULL, NULL);
INSERT INTO public.topics VALUES (293, 124, NULL, 'Ngày mai tôi biến mất, cậu sẽ hồi sinh - Tập 1', NULL, 'Fujimaru', 'Thái Hà Books', NULL, 21, NULL, NULL, NULL, 'Vip', '10-12/2021', '3 năm ', 109000, NULL, '24', 'USD 150', 3000000, NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-14 10:03:33.993+00', '2022-04-20 08:11:42.333+00', '2022-04-20 08:11:42.332+00', NULL, '2022-04-14 10:05:05.603+00', 3, '2022-04-14 10:05:06.025', '2022-04-20 08:11:44.554', '2022-04-20 08:11:42.333', NULL, 'Squirrel Communication and Culture', NULL, NULL, NULL);
INSERT INTO public.topics VALUES (142, 77, NULL, 'Lãnh đạo bằng trí óc trái tim và khí phách', NULL, 'David L. Dotlich, Peter C. Cairo, Stephen H. Rhinesmith', 'Thái Hà Books', NULL, 15, NULL, NULL, NULL, 'Vip', '10-12/2021', '3 năm ', 82000, NULL, '24', 'USD 150', 2000000, NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-13 14:14:59.084+00', '2022-04-15 03:27:55.726+00', '2022-04-20 08:12:09.646+00', '2022-04-28 14:16:34.882+00', '2022-04-13 14:16:34.882+00', 2, '2022-04-13 14:16:35.211', '2022-04-13 14:14:59.084', NULL, NULL, 'Squirrel Communication and Culture', NULL, NULL, NULL);
INSERT INTO public.topics VALUES (294, 76, NULL, 'Năm Người Đàn Bà Si Tình', NULL, 'Ihara Saikaru', 'Phương Nam Books', NULL, 21, NULL, NULL, NULL, 'Vip', '27-09/2021', '5 năm ', 49000, NULL, '35', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-13 14:13:11.828+00', '2022-04-15 03:26:26.993+00', '2022-04-20 08:12:21.078+00', '2022-04-28 14:14:09.932+00', '2022-04-13 14:14:09.932+00', 3, '2022-04-13 14:14:10.193', '2022-04-20 08:12:44.042', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.topics VALUES (295, 152, NULL, NULL, NULL, NULL, NULL, NULL, 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-20 08:13:02.794738+00', '2022-04-20 08:13:02.794738+00', '2022-04-20 08:13:02.794738+00', NULL, NULL, 3, '2022-04-20 08:13:02.794738', '2022-04-20 08:13:04.159', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.topics VALUES (296, 55, ' Winning the Game of Stock', 'Chiến thắng trò chơi chứng khoán', NULL, 'Adam Khoo', 'AKLTG', NULL, 21, NULL, NULL, 'Dropbox https://www.dropbox.com/scl/fi/fhcsbiywh5y5ac5e6u89n/Gi-i-thi-u-s-ch-Chi-n-th-ng-tr-ch-i-ch-ng-kho-n.docx?dl=0&rlkey=qte7lmukpz7n34t1yigbtyadc', 'Vip', '06-04/2021', '5', 240000, NULL, '37,5', '300 $', 0, NULL, '12,5', NULL, NULL, NULL, true, '2022-04-05 09:13:52.877+00', '2022-04-20 08:12:43.795+00', '2022-04-20 08:12:43.795+00', '2022-04-20 09:17:24.238+00', '2022-04-05 09:17:24.239+00', 3, '2022-04-05 09:17:24.651', '2022-04-20 08:16:38.106', '2022-04-20 08:12:43.795', NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.topics VALUES (234, 123, NULL, 'Kính Vạn Hoa - Tập 23 - Cỗ Xe Ngựa Kỳ Bí', NULL, 'Nguyễn Nhật Ánh', 'Nguyễn Nhật Ánh', NULL, 17, NULL, NULL, NULL, 'Vip', '15-04/2021', '3 năm ', 110000, NULL, '25', '250000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-14 10:00:42.531+00', '2022-04-14 10:00:42.531+00', '2022-04-20 08:16:57.446+00', '2022-05-09 10:01:16.18+00', '2022-04-14 10:01:16.18+00', 2, '2022-04-14 10:01:16.496', '2022-04-14 10:00:42.531', NULL, NULL, 'NXB Trẻ', NULL, NULL, NULL);
INSERT INTO public.topics VALUES (297, 123, NULL, 'Kính Vạn Hoa - Tập 23 - Cỗ Xe Ngựa Kỳ Bí', NULL, 'Nguyễn Nhật Ánh', 'Nguyễn Nhật Ánh', NULL, 21, NULL, NULL, NULL, 'Vip', '15-04/2021', '3 năm ', 110000, NULL, '25', '250000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-14 10:00:42.531+00', '2022-04-14 10:00:42.531+00', '2022-04-20 08:16:57.446+00', '2022-05-09 10:01:16.18+00', '2022-04-14 10:01:16.18+00', 3, '2022-04-14 10:01:16.496', '2022-04-20 08:17:32.292', NULL, NULL, 'NXB Trẻ', NULL, NULL, NULL);
INSERT INTO public.topics VALUES (298, 122, NULL, 'Trại Hoa Vàng', NULL, 'Nguyễn Nhật Ánh', 'Nguyễn Nhật Ánh', NULL, 21, NULL, NULL, NULL, 'Vip', '15-04/2021', '3 năm ', 82000, NULL, '25', '250000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-14 09:59:28.838+00', '2022-04-14 09:59:28.838+00', '2022-04-14 10:00:02.031+00', NULL, '2022-04-14 10:00:02.031+00', 3, '2022-04-14 10:00:02.308', '2022-04-20 08:17:36.395', NULL, NULL, 'NXB Trẻ', NULL, NULL, NULL);
INSERT INTO public.topics VALUES (299, 118, NULL, 'Bàn Có Năm Chỗ Ngồi', NULL, 'Nguyễn Nhật Ánh', 'Nguyễn Nhật Ánh', NULL, 21, NULL, NULL, NULL, 'Vip', '15-04/2021', '3 năm ', 55000, NULL, '25', '250000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-14 09:48:13.546+00', '2022-04-14 09:48:13.546+00', '2022-04-20 08:17:45.056+00', '2022-05-09 09:48:48.773+00', '2022-04-14 09:48:48.773+00', 3, '2022-04-14 09:48:49.055', '2022-04-20 08:18:19.16', NULL, NULL, 'NXB Trẻ', NULL, NULL, NULL);
INSERT INTO public.topics VALUES (300, 121, NULL, 'Làm Bạn Với Bầu Trời', NULL, 'Nguyễn Nhật Ánh ', 'Nguyễn Nhật Ánh ', NULL, 21, NULL, NULL, NULL, 'Vip', '15-04/2021', '3 năm ', 220000, NULL, '25', '300000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-14 09:52:40.312+00', '2022-04-20 08:18:18.802+00', '2022-04-20 08:18:18.802+00', NULL, '2022-04-14 09:53:15.903+00', 3, '2022-04-14 09:53:16.118', '2022-04-20 08:18:47.331', '2022-04-20 08:18:18.802', NULL, 'NXB Trẻ', NULL, NULL, NULL);
INSERT INTO public.topics VALUES (222, 117, NULL, 'Chuyện xứ Langbiang Tập 2', NULL, 'Nguyễn Nhật Ánh ', 'Nguyễn Nhật Ánh ', NULL, 18, NULL, NULL, NULL, 'Vip', '15-04/2021', '3 năm ', 180000, NULL, '25', '300000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-14 09:45:52.792+00', '2022-04-14 09:47:16.351+00', '2022-04-20 08:19:33.103+00', '2022-05-09 09:46:51.281+00', '2022-04-14 09:46:51.281+00', 2, '2022-04-14 09:46:51.563', '2022-04-14 09:45:52.792', NULL, NULL, 'NXB Trẻ', NULL, NULL, NULL);
INSERT INTO public.topics VALUES (301, 91, NULL, 'Bóng người xưa', NULL, 'Bà Tùng Long', 'Bà Tùng Long', NULL, 21, NULL, NULL, NULL, 'Vip', '07-03/2022', '5 năm ', 92000, NULL, '25', '2000000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-14 08:57:04.736+00', '2022-04-15 03:42:22.993+00', '2022-04-20 08:24:09.74+00', '2022-04-28 08:58:52.256+00', '2022-04-14 08:58:52.256+00', 3, '2022-04-14 08:58:52.493', '2022-04-20 08:24:13.39', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.topics VALUES (266, 139, NULL, 'Kính Vạn Hoa - Chuyện Nhỏ 4 - Ông Thầy Nóng Tính', NULL, 'Nguyễn Nhật Ánh ', 'Nguyễn Nhật Ánh ', NULL, 19, NULL, NULL, NULL, 'Vip', '15-04/2021', '3 năm ', 110000, NULL, '25', '250000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-15 06:11:48.823+00', '2022-04-15 06:11:48.823+00', '2022-04-20 08:27:13.5+00', '2022-04-30 08:05:14.213+00', '2022-04-15 06:12:12.064+00', 2, '2022-04-15 06:12:12.177', '2022-04-15 06:11:48.823', NULL, NULL, 'NXB Trẻ', NULL, NULL, NULL);
INSERT INTO public.topics VALUES (196, 104, NULL, 'Kính Vạn Hoa Tập 40', NULL, 'Nguyễn Nhật Ánh ', 'Nguyễn Nhật Ánh ', NULL, 18, NULL, NULL, NULL, 'Vip', '15-04/2021', '3 năm ', 110000, NULL, '25', '250000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-14 09:32:14.536+00', '2022-04-14 09:32:14.536+00', '2022-04-20 08:31:54.822+00', '2022-04-28 09:32:42.066+00', '2022-04-14 09:32:42.066+00', 2, '2022-04-14 09:32:42.331', '2022-04-14 09:32:14.536', NULL, NULL, 'NXB Trẻ', NULL, NULL, NULL);
INSERT INTO public.topics VALUES (302, 86, NULL, 'Truyện Ngắn A.P.Chekhov', NULL, 'Anton Chekhov', 'Phương Nam ', NULL, 21, NULL, NULL, NULL, 'Vip', '27-09/2021', '5 năm', 105000, NULL, '35', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-14 08:30:41.75+00', '2022-04-15 03:38:08.699+00', '2022-04-20 08:33:34.99+00', '2022-04-17 08:42:51.256+00', '2022-04-14 08:42:51.256+00', 3, '2022-04-14 08:42:51.463', '2022-04-20 08:33:39.823', NULL, NULL, '                                                                  QQQQQQQQQQQQQQQQ                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         ', NULL, NULL, NULL);
INSERT INTO public.topics VALUES (304, 84, NULL, 'Làm chủ cuộc đời ', NULL, 'Khangser Rinpoche', 'First News', 'phật giáo, tâm linh, phật pháp ứng dụng ', 21, 1, '0,16', NULL, 'Vip', NULL, '3 năm ', 60000, NULL, '50', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-14 07:59:58.585+00', '2022-04-15 03:34:12.948+00', '2022-04-20 08:35:48.724+00', '2022-04-28 08:13:52.341+00', '2022-04-14 08:13:52.341+00', 3, '2022-04-14 08:13:52.652', '2022-04-20 08:36:04.632', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.topics VALUES (305, 83, 'Master Your Mind, Design Your Destiny', 'Làm Chủ Tư Duy, Thay Đổi Vận Mệnh', NULL, 'Adam Khoo', 'AKLTG', NULL, 21, NULL, NULL, NULL, 'Vip', '06-04/2021', '5 năm ', 129000, NULL, '37,5', '300 $', NULL, NULL, '12,5', NULL, NULL, NULL, NULL, '2022-04-13 14:37:43.836+00', '2022-04-20 08:36:04.371+00', '2022-04-20 08:36:04.371+00', NULL, '2022-04-13 14:41:11.009+00', 3, '2022-04-13 14:41:11.206', '2022-04-20 08:36:27.357', '2022-04-20 08:36:04.371', NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.topics VALUES (306, 75, NULL, 'Độc Chiếm Hoa Khôi', NULL, 'Nhiều Tác Giả', 'Phương Nam Books', NULL, 21, NULL, NULL, NULL, 'Vip', '27- 09/ 2021', '5 năm ', 78000, NULL, '35', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-13 10:48:58.597+00', '2022-04-15 03:24:59.92+00', '2022-04-20 08:37:39.184+00', '2022-04-26 14:12:29.281+00', '2022-04-13 14:12:29.281+00', 3, '2022-04-13 14:12:29.675', '2022-04-20 08:38:04.801', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.topics VALUES (307, 80, NULL, 'Đảo Mộng Mơ', NULL, 'Nguyễn Nhật Ánh', 'Nguyễn Nhật Ánh', NULL, 21, NULL, NULL, NULL, 'Vip', '15-04/2021', '3 năm ', 75000, NULL, '25', '300000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-13 14:29:15.187+00', '2022-04-20 08:38:04.373+00', '2022-04-20 08:38:04.373+00', NULL, '2022-04-13 14:30:12.382+00', 3, '2022-04-13 14:30:12.648', '2022-04-20 08:38:44.561', '2022-04-20 08:38:04.373', NULL, 'NXB Trẻ', NULL, NULL, NULL);
INSERT INTO public.topics VALUES (113, 18, 'Bên Hồ Thanh Thủy', 'Bên Hồ Thanh Thủy', NULL, 'Bà Tùng Long', 'Nguyễn Đông Thức', 'tiểu thuyết, tình yêu, phụ nữ, thân phận đàn bà, hôn nhân, gia đình', 14, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, '2022-03-16 09:29:26.394+00', '2022-03-16 09:29:26.394+00', '2022-04-20 08:42:57.032+00', '2022-04-28 08:11:35.15+00', '2022-04-13 08:11:35.15+00', 2, '2022-04-13 08:11:35.354', '2022-03-16 09:29:26.394', NULL, NULL, 'Không', NULL, NULL, NULL);
INSERT INTO public.topics VALUES (308, 32, 'Nghĩa Tình Ràng Buộc', 'Nghĩa Tình Ràng Buộc', NULL, 'Bà Tùng Long', 'Nguyễn Đông Thức', 'tiểu thuyết, tình yêu, phụ nữ, thân phận đàn bà, hôn nhân, gia đình', 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, '2022-03-16 09:59:37.459+00', '2022-03-16 09:59:37.459+00', '2022-04-20 08:43:46.794+00', '2022-04-28 08:12:30.25+00', '2022-04-13 08:12:30.25+00', 3, '2022-04-13 08:12:30.404', '2022-04-20 08:43:51.794', NULL, NULL, 'Không', NULL, NULL, NULL);
INSERT INTO public.topics VALUES (309, 64, NULL, 'Linh Ứng (tựa cũ Gọi Hồn)', NULL, 'Nguyễn Mạnh Tuấn', 'First News', 'tiểu thuyết, văn học việt nam, nhân quả báo ứng, tiền kiếp  ', 21, 4, NULL, NULL, 'Vip', NULL, '3 năm ', 268000, NULL, '50', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-05 10:35:37.176+00', '2022-04-20 08:43:51.549+00', '2022-04-20 08:43:51.549+00', '2022-04-20 10:40:11.269+00', '2022-04-05 10:40:11.269+00', 3, '2022-04-05 10:40:11.542', '2022-04-20 08:44:28.315', '2022-04-20 08:43:51.549', NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.topics VALUES (310, 16, 'Bóng Người Xưa ', 'Bóng Người Xưa ', NULL, 'Bà Tùng Long', 'Nguyễn Đông Thức', 'tiểu thuyết, phụ nữ, thân phận đàn bà, tình yêu, hôn nhân, gia đình', 21, 4, '75', 'Nếu người đàn bà sinh ra chỉ để làm bạn với bếp núc, thì cái câu “Giặc đến nhà đàn bà phải đánh” chẳng là vô nghĩa lắm?
Không, giang san đôi gánh nặng, trách nhiệm gái trai chung, nếu tài lực và tâm đức cho phép thì đối với xã hội, ngưài đàn bà cũng phải có một phần nhiệm vụ như người đàn ông vậy.
Và nếu quốc gia, xã hội mà đòi hỏi, thì người đàn bà cũng phải vứt chỉ kim mà đứng dậy, đạp gai góc để lên đường.
Trong lịch sử nước nhà, hai bà Trưng, một bà Triệu, há không là tấm gương sáng nghìn thu cho nữ nhi ta đấy ư?
Lệ Hằng, nhân vật chính của Bóng người xưa, là điển hình của loại nhân vật cao thượng ấy trong thời Pháp thuộc. Là một cô gái có sắc, có tài, lại có lòng yêu nước, cô phải làm thế nào để thực hiện chí nguyện của cô?    .
Lệ Hằng tham gia một đảng chống Pháp và lãnh nhiệm vụ cung cấp tài chính. Cô lấy chồng là Anh Kiệt, một nhà tư sản giàu có theo sự phân công của tổ chức đảng, và lấy tiền của Anh Kiệt trao cho tổ chức.
Sự hy sinh của cô đáng quý mến, mà cách hành động của cô cũng đáng ghi chép. Nhưng Anh Kiệt không phải là người chỉ biết tiền. Với cô, anh còn là người chồng chung thủy. Bên tình, bên nghĩa, cô phải làm sao? Và làm sao trong tình thế ấy, cô phải xử trí như thế nào để người bạn trăm năm của cô khỏi phải vì cô mà mang họa? Lệ Hằng đã dùng đến chước “kim thiền thoát xác” để trọn vẹn một gánh nghĩa tình.
Nhưng cốt truyện không phải đến đây là dứt. Ta thấy cái cao quý của người đàn bà Việt Nam ở nhân cách cô Thúy Ái, một nhân vật chính khác.
Về sống bên chồng giữa một không khí không chút thuận lợi, thế mà ngày một ngày hai, với cử chỉ đoan trang mà điềm đạm, với đức độ bao dung mà khiêm tốn, cô đã chinh phục được tất cả những người quanh cô.
Và cái đáng quý nhất là một khi biết được hành tung và tâm chí của Lệ Hằng, Thúy Ái đã tình nguyện nhận nhiệm vụ tiếp tế mà không một chút ghen tuông, ganh tị.
Hơn thế nữa, cô còn tự vận dụng tài sức của mình để làm ra của cải, chứ không khoanh tay ngồi dùng sẵn của chồng. Một tấm gương hoạt động cho các bà chủ gia đình ở chốn gác tía lầu son.
Trong công cuộc kiến thiết nước nhà, người như cô Lệ Hằng cần phải ra mặt góp sức với nhân dân, và người như Thúy Ái phải trở thành một gương mẫu chung cho cả thế hệ.
Đó là điều tác giả hằng mong mỏi.', 'Vip', '2022-07-03', '5', 92000, NULL, '25', '2000000', NULL, 'audio', 'undefined', 'Giọng Sài Gòn: giọng miền Nam chuẩn, không ngọng, không tiếng địa phương (ví dụ: "r" với "g", "tr" với "t")', 'undefined', NULL, false, '2022-03-16 09:27:11.896+00', '2022-04-20 08:45:06.977+00', '2022-04-20 08:45:10.448+00', '2022-05-05 08:45:06.977+00', '2022-03-16 23:48:41.478+00', 3, '2022-03-16 23:48:41.903', '2022-04-20 08:45:21.588', NULL, NULL, 'Không', '07/09/2022', NULL, NULL);
INSERT INTO public.topics VALUES (311, 71, NULL, 'Tư duy sáng tạo - Cưỡi thuyền ngược gió', NULL, 'Nobuyuki Takahashi', 'Thái Hà books', NULL, 21, NULL, NULL, NULL, 'Vip', '10- 12/2021', '3 năm ', 53000, NULL, '24', '150 $', 2000000, NULL, '', NULL, NULL, NULL, NULL, '2022-04-13 09:54:51.391+00', '2022-04-20 08:45:21.189+00', '2022-04-20 08:45:21.189+00', NULL, '2022-04-13 09:56:33.321+00', 3, '2022-04-13 09:56:33.677', '2022-04-20 08:45:25.809', '2022-04-20 08:45:21.189', NULL, 'Squirrel Communication and Culture', NULL, NULL, NULL);
INSERT INTO public.topics VALUES (303, 88, 'On earth we''re briefly goreous', 'Một Thoáng Ta Rực Rỡ Ở Nhân Gian', NULL, 'Ocean Vương ', 'Nhã Nam ', NULL, 25, NULL, NULL, NULL, 'Vip', '25-02/2022', '5 năm ', 135000, 'NaN', '42,5', 'USD 500', 2000000, NULL, NULL, NULL, NULL, NULL, NULL, '2022-04-14 08:47:48.244+00', '2022-04-20 08:33:39.724+00', '2022-04-20 11:18:17.654+00', NULL, '2022-04-14 08:51:43.804+00', 3, '2022-04-14 08:51:44.115', '2022-04-20 08:33:45.054', '2022-04-20 08:33:39.724', '2022-04-20 11:18:17.654', NULL, NULL, 0, 0);


--
-- TOC entry 2977 (class 0 OID 107624)
-- Dependencies: 209
-- Data for Name: topics_backup; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.topics_backup VALUES (24, 10, 'Đừng Sợ Lỡ Cuộc Chơi (không tên gốc)', 'Đừng Sợ Lỡ Cuộc Chơi', 'FOMO', 'Patrick MCGinnis', 'First News', 'fomo, ', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, 1, NULL, NULL, NULL, NULL, '2022-03-11 07:32:15.284', '2022-03-11 07:32:15.284', '2022-03-11 07:32:15.284', '2022-03-11 07:32:15.284', '2022-03-11 07:32:15.284');
INSERT INTO public.topics_backup VALUES (26, 12, 'On Eearth We''re Briefly Gorgeous ', 'Một thoáng ta rực rỡ ở nhân gian ', NULL, 'Ocean Vuong', 'Ocean Vuong c/o BAA', 'Ocean Vuong', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, 1, NULL, NULL, NULL, NULL, '2022-03-11 07:53:25.053', '2022-03-11 07:39:35.064', '2022-03-11 07:39:35.064', '2022-03-11 07:39:35.064', '2022-03-11 07:53:25.053');
INSERT INTO public.topics_backup VALUES (27, 13, 'Đắc Nhân', 'Đắc Nhân', 'Thành công', 'Dale Car', 'First News', 'thành công', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, 1, NULL, NULL, NULL, NULL, '2022-03-11 08:12:17.309', '2022-03-11 08:12:17.309', '2022-03-11 08:12:17.309', '2022-03-11 08:12:17.309', '2022-03-11 08:12:17.309');
INSERT INTO public.topics_backup VALUES (55, 41, 'Thần hổ', 'Thần hổ', 'Thần hổ', 'Thần hổ', 'Thần hổ', 'Thần hổ', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, false, 1, NULL, NULL, NULL, NULL, '2022-03-16 15:33:12.976', '2022-03-16 15:33:12.976', '2022-03-16 15:33:12.976', '2022-03-16 15:33:12.976', '2022-03-16 15:33:12.976');
INSERT INTO public.topics_backup VALUES (56, 42, 'Thần hổ', 'Thần hổ', 'Thần hổ', 'Thần hổ', 'Thần hổ', 'Thần hổ', 12, 3, '80', 'Thần hổ', 'Free', '2022-02-03 00:00:00+00', 1, 1, 1, 1, 1, NULL, '1', '1', '1', 'undefined', NULL, false, 1, NULL, '2022-03-16 15:35:24.193', NULL, NULL, '2022-03-16 15:35:24.193', '2022-03-16 15:34:21.651', '2022-03-16 15:34:21.651', '2022-03-16 15:34:21.651', '2022-03-16 15:34:21.651');
INSERT INTO public.topics_backup VALUES (60, 43, NULL, 'Vĩnh Biệt Mùa Hè', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, '2022-04-04 03:08:26.752', '2022-04-04 03:08:26.752', '2022-04-04 03:08:26.752', '2022-04-04 03:08:26.752', '2022-04-04 03:08:26.752');


--
-- TOC entry 2981 (class 0 OID 107639)
-- Dependencies: 213
-- Data for Name: user_role; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.user_role VALUES (9, 1, 1);
INSERT INTO public.user_role VALUES (10, 1, 2);
INSERT INTO public.user_role VALUES (11, 1, 3);
INSERT INTO public.user_role VALUES (13, 3, 4);
INSERT INTO public.user_role VALUES (14, 4, 5);
INSERT INTO public.user_role VALUES (14, 3, 6);
INSERT INTO public.user_role VALUES (15, 2, 7);


--
-- TOC entry 2983 (class 0 OID 107644)
-- Dependencies: 215
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.users VALUES (9, 'thach.le', '$2a$10$afZ6/xU9XuTNIkam2KTWle1q852GAknIbpkOgdCIvF3oPlszTkMu6', '2022-03-08');
INSERT INTO public.users VALUES (10, 'thao.nguyen', '$2a$10$CeVoVvbMd1DwpvUNynMOLe4gM81cxFah1Cw6Dyl8LtNDD5nXoZzbq', '2022-03-08');
INSERT INTO public.users VALUES (11, 'hang.nguyen', '$2a$10$IEf5mdYsPMmzGRSknk/nHOBGRTs3VwV7GpVYQosPCrP7Y01Tswh9W', '2022-03-08');
INSERT INTO public.users VALUES (13, 'theanh.nguyen', '$2a$10$MvfAEhjJW0hV2TlGKWBHy.UzjZLDFEkZ.Z0APp2RIFfeSPVOVju8O', '2022-03-08');
INSERT INTO public.users VALUES (14, 'tuyen.le', '$2a$10$5Vv.Zy7lLRdHZN6Qi3l1YelB0bG5T.dq6ZujA3ss1CCXs8U329Yv2', '2022-03-08');
INSERT INTO public.users VALUES (15, 'luan.nguyen', '$2a$10$70jN13Ajr2cc1EuetocsSuU/h6EvCBSgdi9T76x.WjaI1TAiGsFbO', '2022-03-08');


--
-- TOC entry 3001 (class 0 OID 0)
-- Dependencies: 199
-- Name: categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.categories_id_seq', 1, false);


--
-- TOC entry 3002 (class 0 OID 0)
-- Dependencies: 201
-- Name: logs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.logs_id_seq', 1246, true);


--
-- TOC entry 3003 (class 0 OID 0)
-- Dependencies: 203
-- Name: role_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.role_id_seq', 1, false);


--
-- TOC entry 3004 (class 0 OID 0)
-- Dependencies: 205
-- Name: status_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.status_id_seq', 25, true);


--
-- TOC entry 3005 (class 0 OID 0)
-- Dependencies: 207
-- Name: topic_canceled_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.topic_canceled_id_seq', 3, true);


--
-- TOC entry 3006 (class 0 OID 0)
-- Dependencies: 210
-- Name: topics_backup_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.topics_backup_id_seq', 2, true);


--
-- TOC entry 3007 (class 0 OID 0)
-- Dependencies: 211
-- Name: topics_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.topics_id_seq', 311, true);


--
-- TOC entry 3008 (class 0 OID 0)
-- Dependencies: 212
-- Name: topics_topic_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.topics_topic_id_seq', 152, true);


--
-- TOC entry 3009 (class 0 OID 0)
-- Dependencies: 214
-- Name: user_role_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.user_role_id_seq', 7, true);


--
-- TOC entry 3010 (class 0 OID 0)
-- Dependencies: 216
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.users_id_seq', 15, true);


--
-- TOC entry 2820 (class 2606 OID 107666)
-- Name: categories categories_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (id);


--
-- TOC entry 2824 (class 2606 OID 107668)
-- Name: logs logs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.logs
    ADD CONSTRAINT logs_pkey PRIMARY KEY (id);


--
-- TOC entry 2826 (class 2606 OID 107670)
-- Name: roles role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2828 (class 2606 OID 107672)
-- Name: statuses status_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.statuses
    ADD CONSTRAINT status_pkey PRIMARY KEY (id);


--
-- TOC entry 2830 (class 2606 OID 107674)
-- Name: topic_canceled topic_canceled_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.topic_canceled
    ADD CONSTRAINT topic_canceled_pkey PRIMARY KEY (id);


--
-- TOC entry 2832 (class 2606 OID 107676)
-- Name: topics topic_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.topics
    ADD CONSTRAINT topic_pkey PRIMARY KEY (id);


--
-- TOC entry 2834 (class 2606 OID 107678)
-- Name: topics_backup topics_backup_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.topics_backup
    ADD CONSTRAINT topics_backup_pkey PRIMARY KEY (id);


--
-- TOC entry 2836 (class 2606 OID 107680)
-- Name: user_role user_role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_role
    ADD CONSTRAINT user_role_pkey PRIMARY KEY (id);


--
-- TOC entry 2838 (class 2606 OID 107682)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 2821 (class 1259 OID 107683)
-- Name: index_categories_on_code; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_categories_on_code ON public.categories USING btree (code) WHERE (deleted_at IS NULL);


--
-- TOC entry 2822 (class 1259 OID 107684)
-- Name: index_categories_on_position; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_categories_on_position ON public.categories USING btree ("position");


--
-- TOC entry 2839 (class 2606 OID 107685)
-- Name: logs logs_user_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.logs
    ADD CONSTRAINT logs_user_fk FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- TOC entry 2840 (class 2606 OID 107690)
-- Name: topic_canceled topic_canceled_topic_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.topic_canceled
    ADD CONSTRAINT topic_canceled_topic_fk FOREIGN KEY (id_topic) REFERENCES public.topics(id);


--
-- TOC entry 2841 (class 2606 OID 107695)
-- Name: topics topic_category_level_1_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.topics
    ADD CONSTRAINT topic_category_level_1_fk FOREIGN KEY (category_level_1) REFERENCES public.categories(id);


--
-- TOC entry 2842 (class 2606 OID 107700)
-- Name: topics topic_status_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.topics
    ADD CONSTRAINT topic_status_fk FOREIGN KEY (status_id) REFERENCES public.statuses(id);


--
-- TOC entry 2843 (class 2606 OID 107705)
-- Name: user_role user_role_role_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_role
    ADD CONSTRAINT user_role_role_fk FOREIGN KEY (role_id) REFERENCES public.roles(id);


--
-- TOC entry 2844 (class 2606 OID 107710)
-- Name: user_role user_role_user_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_role
    ADD CONSTRAINT user_role_user_fk FOREIGN KEY (user_id) REFERENCES public.users(id);


-- Completed on 2022-04-23 11:48:49

--
-- PostgreSQL database dump complete
--

