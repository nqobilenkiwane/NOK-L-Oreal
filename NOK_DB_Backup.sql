PGDMP  !                    |            NOK    16.3    16.3 M    O           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            P           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            Q           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            R           1262    17583    NOK    DATABASE     �   CREATE DATABASE "NOK" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_United States.1252';
    DROP DATABASE "NOK";
                postgres    false            o           1247    17696    order_status    TYPE     ]   CREATE TYPE public.order_status AS ENUM (
    'Pending',
    'Completed',
    'Cancelled'
);
    DROP TYPE public.order_status;
       public          postgres    false            u           1247    17719    payment_method_enum    TYPE     r   CREATE TYPE public.payment_method_enum AS ENUM (
    'Credit Card',
    'Debit Card',
    'PayPal',
    'Cash'
);
 &   DROP TYPE public.payment_method_enum;
       public          postgres    false            ]           1247    17599    skin_type_enum    TYPE     f   CREATE TYPE public.skin_type_enum AS ENUM (
    'Oily',
    'Dry',
    'Combination',
    'Normal'
);
 !   DROP TYPE public.skin_type_enum;
       public          postgres    false            �            1255    17676    update_product_updated_at()    FUNCTION     �   CREATE FUNCTION public.update_product_updated_at() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    NEW.updated_at = CURRENT_TIMESTAMP;
    RETURN NEW;
END;
$$;
 2   DROP FUNCTION public.update_product_updated_at();
       public          postgres    false            �            1255    17596    update_timestamp()    FUNCTION     �   CREATE FUNCTION public.update_timestamp() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    NEW.updated_at = CURRENT_TIMESTAMP;
    RETURN NEW;
END;
$$;
 )   DROP FUNCTION public.update_timestamp();
       public          postgres    false            �            1255    17638    update_updated_at()    FUNCTION     �   CREATE FUNCTION public.update_updated_at() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    NEW.updated_at = CURRENT_TIMESTAMP;
    RETURN NEW;
END;
$$;
 *   DROP FUNCTION public.update_updated_at();
       public          postgres    false            �            1259    17608    ai_analysis    TABLE       CREATE TABLE public.ai_analysis (
    analysis_id integer NOT NULL,
    user_id integer NOT NULL,
    skin_type public.skin_type_enum,
    recommendations character(500),
    image_url character(100),
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);
    DROP TABLE public.ai_analysis;
       public         heap    postgres    false    861            �            1259    17607    ai_analysis_analysis_id_seq    SEQUENCE     �   CREATE SEQUENCE public.ai_analysis_analysis_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE public.ai_analysis_analysis_id_seq;
       public          postgres    false    218            S           0    0    ai_analysis_analysis_id_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE public.ai_analysis_analysis_id_seq OWNED BY public.ai_analysis.analysis_id;
          public          postgres    false    217            �            1259    17623    article    TABLE     !  CREATE TABLE public.article (
    article_id integer NOT NULL,
    user_id integer NOT NULL,
    title character(100),
    content character(500),
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);
    DROP TABLE public.article;
       public         heap    postgres    false            �            1259    17622    article_article_id_seq    SEQUENCE     �   CREATE SEQUENCE public.article_article_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.article_article_id_seq;
       public          postgres    false    220            T           0    0    article_article_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.article_article_id_seq OWNED BY public.article.article_id;
          public          postgres    false    219            �            1259    17641    cart    TABLE     �   CREATE TABLE public.cart (
    cart_id integer NOT NULL,
    user_id integer NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);
    DROP TABLE public.cart;
       public         heap    postgres    false            �            1259    17640    cart_cart_id_seq    SEQUENCE     �   CREATE SEQUENCE public.cart_cart_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.cart_cart_id_seq;
       public          postgres    false    222            U           0    0    cart_cart_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.cart_cart_id_seq OWNED BY public.cart.cart_id;
          public          postgres    false    221            �            1259    17679 	   cart_item    TABLE     �   CREATE TABLE public.cart_item (
    cart_item_id integer NOT NULL,
    cart_id integer NOT NULL,
    product_id integer NOT NULL,
    quantity integer
);
    DROP TABLE public.cart_item;
       public         heap    postgres    false            �            1259    17678    cart_item_cart_item_id_seq    SEQUENCE     �   CREATE SEQUENCE public.cart_item_cart_item_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.cart_item_cart_item_id_seq;
       public          postgres    false    226            V           0    0    cart_item_cart_item_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.cart_item_cart_item_id_seq OWNED BY public.cart_item.cart_item_id;
          public          postgres    false    225            �            1259    17704    order    TABLE     �   CREATE TABLE public."order" (
    order_id integer NOT NULL,
    user_id integer NOT NULL,
    order_date timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    total_price numeric,
    status public.order_status
);
    DROP TABLE public."order";
       public         heap    postgres    false    879            �            1259    17703    order_order_id_seq    SEQUENCE     �   CREATE SEQUENCE public.order_order_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.order_order_id_seq;
       public          postgres    false    228            W           0    0    order_order_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.order_order_id_seq OWNED BY public."order".order_id;
          public          postgres    false    227            �            1259    17728    payment    TABLE     �   CREATE TABLE public.payment (
    payment_id integer NOT NULL,
    order_id integer NOT NULL,
    payment_method public.payment_method_enum,
    amount numeric NOT NULL,
    payment_date timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);
    DROP TABLE public.payment;
       public         heap    postgres    false    885            �            1259    17727    payment_payment_id_seq    SEQUENCE     �   CREATE SEQUENCE public.payment_payment_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.payment_payment_id_seq;
       public          postgres    false    230            X           0    0    payment_payment_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.payment_payment_id_seq OWNED BY public.payment.payment_id;
          public          postgres    false    229            �            1259    17666    product    TABLE     �  CREATE TABLE public.product (
    product_id integer NOT NULL,
    product_name character(50),
    product_description character(200),
    price numeric NOT NULL,
    category character(50),
    stock_quantity integer,
    brand character(50),
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);
    DROP TABLE public.product;
       public         heap    postgres    false            �            1259    17665    product_product_id_seq    SEQUENCE     �   CREATE SEQUENCE public.product_product_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.product_product_id_seq;
       public          postgres    false    224            Y           0    0    product_product_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.product_product_id_seq OWNED BY public.product.product_id;
          public          postgres    false    223            �            1259    17585    user    TABLE       CREATE TABLE public."user" (
    user_id integer NOT NULL,
    first_name character(50),
    last_name character(50),
    email character(100) NOT NULL,
    password character(150) NOT NULL,
    phone_number character(15),
    date_of_birth date,
    gender character(10),
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT user_gender_check CHECK ((gender = ANY (ARRAY['Male'::bpchar, 'Female'::bpchar, 'Other'::bpchar])))
);
    DROP TABLE public."user";
       public         heap    postgres    false            �            1259    17584    user_user_id_seq    SEQUENCE     �   CREATE SEQUENCE public.user_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.user_user_id_seq;
       public          postgres    false    216            Z           0    0    user_user_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.user_user_id_seq OWNED BY public."user".user_id;
          public          postgres    false    215            �           2604    17611    ai_analysis analysis_id    DEFAULT     �   ALTER TABLE ONLY public.ai_analysis ALTER COLUMN analysis_id SET DEFAULT nextval('public.ai_analysis_analysis_id_seq'::regclass);
 F   ALTER TABLE public.ai_analysis ALTER COLUMN analysis_id DROP DEFAULT;
       public          postgres    false    217    218    218            �           2604    17626    article article_id    DEFAULT     x   ALTER TABLE ONLY public.article ALTER COLUMN article_id SET DEFAULT nextval('public.article_article_id_seq'::regclass);
 A   ALTER TABLE public.article ALTER COLUMN article_id DROP DEFAULT;
       public          postgres    false    220    219    220            �           2604    17644    cart cart_id    DEFAULT     l   ALTER TABLE ONLY public.cart ALTER COLUMN cart_id SET DEFAULT nextval('public.cart_cart_id_seq'::regclass);
 ;   ALTER TABLE public.cart ALTER COLUMN cart_id DROP DEFAULT;
       public          postgres    false    222    221    222            �           2604    17682    cart_item cart_item_id    DEFAULT     �   ALTER TABLE ONLY public.cart_item ALTER COLUMN cart_item_id SET DEFAULT nextval('public.cart_item_cart_item_id_seq'::regclass);
 E   ALTER TABLE public.cart_item ALTER COLUMN cart_item_id DROP DEFAULT;
       public          postgres    false    225    226    226            �           2604    17707    order order_id    DEFAULT     r   ALTER TABLE ONLY public."order" ALTER COLUMN order_id SET DEFAULT nextval('public.order_order_id_seq'::regclass);
 ?   ALTER TABLE public."order" ALTER COLUMN order_id DROP DEFAULT;
       public          postgres    false    228    227    228            �           2604    17731    payment payment_id    DEFAULT     x   ALTER TABLE ONLY public.payment ALTER COLUMN payment_id SET DEFAULT nextval('public.payment_payment_id_seq'::regclass);
 A   ALTER TABLE public.payment ALTER COLUMN payment_id DROP DEFAULT;
       public          postgres    false    230    229    230            �           2604    17669    product product_id    DEFAULT     x   ALTER TABLE ONLY public.product ALTER COLUMN product_id SET DEFAULT nextval('public.product_product_id_seq'::regclass);
 A   ALTER TABLE public.product ALTER COLUMN product_id DROP DEFAULT;
       public          postgres    false    224    223    224                       2604    17588    user user_id    DEFAULT     n   ALTER TABLE ONLY public."user" ALTER COLUMN user_id SET DEFAULT nextval('public.user_user_id_seq'::regclass);
 =   ALTER TABLE public."user" ALTER COLUMN user_id DROP DEFAULT;
       public          postgres    false    216    215    216            @          0    17608    ai_analysis 
   TABLE DATA           n   COPY public.ai_analysis (analysis_id, user_id, skin_type, recommendations, image_url, created_at) FROM stdin;
    public          postgres    false    218   �\       B          0    17623    article 
   TABLE DATA           ^   COPY public.article (article_id, user_id, title, content, created_at, updated_at) FROM stdin;
    public          postgres    false    220   ]       D          0    17641    cart 
   TABLE DATA           <   COPY public.cart (cart_id, user_id, created_at) FROM stdin;
    public          postgres    false    222   .]       H          0    17679 	   cart_item 
   TABLE DATA           P   COPY public.cart_item (cart_item_id, cart_id, product_id, quantity) FROM stdin;
    public          postgres    false    226   K]       J          0    17704    order 
   TABLE DATA           U   COPY public."order" (order_id, user_id, order_date, total_price, status) FROM stdin;
    public          postgres    false    228   h]       L          0    17728    payment 
   TABLE DATA           ]   COPY public.payment (payment_id, order_id, payment_method, amount, payment_date) FROM stdin;
    public          postgres    false    230   �]       F          0    17666    product 
   TABLE DATA           �   COPY public.product (product_id, product_name, product_description, price, category, stock_quantity, brand, created_at, updated_at) FROM stdin;
    public          postgres    false    224   �]       >          0    17585    user 
   TABLE DATA           �   COPY public."user" (user_id, first_name, last_name, email, password, phone_number, date_of_birth, gender, created_at, updated_at) FROM stdin;
    public          postgres    false    216   �]       [           0    0    ai_analysis_analysis_id_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public.ai_analysis_analysis_id_seq', 1, false);
          public          postgres    false    217            \           0    0    article_article_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.article_article_id_seq', 1, false);
          public          postgres    false    219            ]           0    0    cart_cart_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.cart_cart_id_seq', 1, false);
          public          postgres    false    221            ^           0    0    cart_item_cart_item_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.cart_item_cart_item_id_seq', 1, false);
          public          postgres    false    225            _           0    0    order_order_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.order_order_id_seq', 1, false);
          public          postgres    false    227            `           0    0    payment_payment_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.payment_payment_id_seq', 1, false);
          public          postgres    false    229            a           0    0    product_product_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.product_product_id_seq', 1, false);
          public          postgres    false    223            b           0    0    user_user_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.user_user_id_seq', 1, false);
          public          postgres    false    215            �           2606    17616    ai_analysis ai_analysis_pkey 
   CONSTRAINT     c   ALTER TABLE ONLY public.ai_analysis
    ADD CONSTRAINT ai_analysis_pkey PRIMARY KEY (analysis_id);
 F   ALTER TABLE ONLY public.ai_analysis DROP CONSTRAINT ai_analysis_pkey;
       public            postgres    false    218            �           2606    17632    article article_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.article
    ADD CONSTRAINT article_pkey PRIMARY KEY (article_id);
 >   ALTER TABLE ONLY public.article DROP CONSTRAINT article_pkey;
       public            postgres    false    220            �           2606    17684    cart_item cart_item_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.cart_item
    ADD CONSTRAINT cart_item_pkey PRIMARY KEY (cart_item_id);
 B   ALTER TABLE ONLY public.cart_item DROP CONSTRAINT cart_item_pkey;
       public            postgres    false    226            �           2606    17647    cart cart_pkey 
   CONSTRAINT     Q   ALTER TABLE ONLY public.cart
    ADD CONSTRAINT cart_pkey PRIMARY KEY (cart_id);
 8   ALTER TABLE ONLY public.cart DROP CONSTRAINT cart_pkey;
       public            postgres    false    222            �           2606    17712    order order_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public."order"
    ADD CONSTRAINT order_pkey PRIMARY KEY (order_id);
 <   ALTER TABLE ONLY public."order" DROP CONSTRAINT order_pkey;
       public            postgres    false    228            �           2606    17736    payment payment_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.payment
    ADD CONSTRAINT payment_pkey PRIMARY KEY (payment_id);
 >   ALTER TABLE ONLY public.payment DROP CONSTRAINT payment_pkey;
       public            postgres    false    230            �           2606    17675    product product_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.product
    ADD CONSTRAINT product_pkey PRIMARY KEY (product_id);
 >   ALTER TABLE ONLY public.product DROP CONSTRAINT product_pkey;
       public            postgres    false    224            �           2606    17595    user user_email_key 
   CONSTRAINT     Q   ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key UNIQUE (email);
 ?   ALTER TABLE ONLY public."user" DROP CONSTRAINT user_email_key;
       public            postgres    false    216            �           2606    17593    user user_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_pkey PRIMARY KEY (user_id);
 :   ALTER TABLE ONLY public."user" DROP CONSTRAINT user_pkey;
       public            postgres    false    216            �           2620    17677    product set_product_updated_at    TRIGGER     �   CREATE TRIGGER set_product_updated_at BEFORE UPDATE ON public.product FOR EACH ROW EXECUTE FUNCTION public.update_product_updated_at();
 7   DROP TRIGGER set_product_updated_at ON public.product;
       public          postgres    false    224    233            �           2620    17639    article set_updated_at    TRIGGER     x   CREATE TRIGGER set_updated_at BEFORE UPDATE ON public.article FOR EACH ROW EXECUTE FUNCTION public.update_updated_at();
 /   DROP TRIGGER set_updated_at ON public.article;
       public          postgres    false    220    232            �           2620    17597    user set_updated_at    TRIGGER     v   CREATE TRIGGER set_updated_at BEFORE UPDATE ON public."user" FOR EACH ROW EXECUTE FUNCTION public.update_timestamp();
 .   DROP TRIGGER set_updated_at ON public."user";
       public          postgres    false    231    216            �           2606    17617 $   ai_analysis ai_analysis_user_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.ai_analysis
    ADD CONSTRAINT ai_analysis_user_id_fkey FOREIGN KEY (user_id) REFERENCES public."user"(user_id);
 N   ALTER TABLE ONLY public.ai_analysis DROP CONSTRAINT ai_analysis_user_id_fkey;
       public          postgres    false    216    4757    218            �           2606    17633    article article_user_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.article
    ADD CONSTRAINT article_user_id_fkey FOREIGN KEY (user_id) REFERENCES public."user"(user_id);
 F   ALTER TABLE ONLY public.article DROP CONSTRAINT article_user_id_fkey;
       public          postgres    false    4757    216    220            �           2606    17685     cart_item cart_item_cart_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.cart_item
    ADD CONSTRAINT cart_item_cart_id_fkey FOREIGN KEY (cart_id) REFERENCES public.cart(cart_id);
 J   ALTER TABLE ONLY public.cart_item DROP CONSTRAINT cart_item_cart_id_fkey;
       public          postgres    false    222    226    4763            �           2606    17690 #   cart_item cart_item_product_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.cart_item
    ADD CONSTRAINT cart_item_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.product(product_id);
 M   ALTER TABLE ONLY public.cart_item DROP CONSTRAINT cart_item_product_id_fkey;
       public          postgres    false    226    4765    224            �           2606    17648    cart cart_user_id_fkey    FK CONSTRAINT     {   ALTER TABLE ONLY public.cart
    ADD CONSTRAINT cart_user_id_fkey FOREIGN KEY (user_id) REFERENCES public."user"(user_id);
 @   ALTER TABLE ONLY public.cart DROP CONSTRAINT cart_user_id_fkey;
       public          postgres    false    216    4757    222            �           2606    17713    order order_user_id_fkey    FK CONSTRAINT        ALTER TABLE ONLY public."order"
    ADD CONSTRAINT order_user_id_fkey FOREIGN KEY (user_id) REFERENCES public."user"(user_id);
 D   ALTER TABLE ONLY public."order" DROP CONSTRAINT order_user_id_fkey;
       public          postgres    false    228    216    4757            �           2606    17737    payment payment_order_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.payment
    ADD CONSTRAINT payment_order_id_fkey FOREIGN KEY (order_id) REFERENCES public."order"(order_id);
 G   ALTER TABLE ONLY public.payment DROP CONSTRAINT payment_order_id_fkey;
       public          postgres    false    230    4769    228            @      x������ � �      B      x������ � �      D      x������ � �      H      x������ � �      J      x������ � �      L      x������ � �      F      x������ � �      >      x������ � �     