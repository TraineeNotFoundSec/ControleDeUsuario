PGDMP     &                 
    |            learningDelphi    11.22    11.22                0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                       false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                       false                       1262    16393    learningDelphi    DATABASE     n   CREATE DATABASE "learningDelphi" WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C' LC_CTYPE = 'C';
     DROP DATABASE "learningDelphi";
             postgres    false            �            1259    16412    groups    TABLE     n   CREATE TABLE public.groups (
    id_group bigint NOT NULL,
    description character varying(120) NOT NULL
);
    DROP TABLE public.groups;
       public         postgres    false            �            1259    16410    id_group_seq    SEQUENCE     �   CREATE SEQUENCE public.id_group_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 99999999999999
    CACHE 1;
 #   DROP SEQUENCE public.id_group_seq;
       public       postgres    false    197                       0    0    id_group_seq    SEQUENCE OWNED BY     D   ALTER SEQUENCE public.id_group_seq OWNED BY public.groups.id_group;
            public       postgres    false    196            �            1259    16420    users    TABLE     �   CREATE TABLE public.users (
    id_user bigint NOT NULL,
    name character varying(30) NOT NULL,
    email character varying(30),
    "user" character varying(10) NOT NULL,
    password character varying(10) NOT NULL
);
    DROP TABLE public.users;
       public         postgres    false            �            1259    16418    id_user_seq    SEQUENCE     �   CREATE SEQUENCE public.id_user_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 99999999999999
    CACHE 1;
 "   DROP SEQUENCE public.id_user_seq;
       public       postgres    false    199                       0    0    id_user_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.id_user_seq OWNED BY public.users.id_user;
            public       postgres    false    198            �            1259    16442    users_groups    TABLE     `   CREATE TABLE public.users_groups (
    id_user bigint NOT NULL,
    id_group bigint NOT NULL
);
     DROP TABLE public.users_groups;
       public         postgres    false            �
           2604    16415    groups id_group    DEFAULT     k   ALTER TABLE ONLY public.groups ALTER COLUMN id_group SET DEFAULT nextval('public.id_group_seq'::regclass);
 >   ALTER TABLE public.groups ALTER COLUMN id_group DROP DEFAULT;
       public       postgres    false    196    197    197            �
           2604    16455    users id_user    DEFAULT     h   ALTER TABLE ONLY public.users ALTER COLUMN id_user SET DEFAULT nextval('public.id_user_seq'::regclass);
 <   ALTER TABLE public.users ALTER COLUMN id_user DROP DEFAULT;
       public       postgres    false    198    199    199            	          0    16412    groups 
   TABLE DATA               7   COPY public.groups (id_group, description) FROM stdin;
    public       postgres    false    197                    0    16420    users 
   TABLE DATA               G   COPY public.users (id_user, name, email, "user", password) FROM stdin;
    public       postgres    false    199   N                 0    16442    users_groups 
   TABLE DATA               9   COPY public.users_groups (id_user, id_group) FROM stdin;
    public       postgres    false    200   �                  0    0    id_group_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.id_group_seq', 3, true);
            public       postgres    false    196                       0    0    id_user_seq    SEQUENCE SET     9   SELECT pg_catalog.setval('public.id_user_seq', 7, true);
            public       postgres    false    198            �
           2606    16417    groups group_pkey 
   CONSTRAINT     U   ALTER TABLE ONLY public.groups
    ADD CONSTRAINT group_pkey PRIMARY KEY (id_group);
 ;   ALTER TABLE ONLY public.groups DROP CONSTRAINT group_pkey;
       public         postgres    false    197            �
           2606    16425    users user_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.users
    ADD CONSTRAINT user_pkey PRIMARY KEY (id_user);
 9   ALTER TABLE ONLY public.users DROP CONSTRAINT user_pkey;
       public         postgres    false    199            �
           2606    16450    users_groups fkey_groups    FK CONSTRAINT        ALTER TABLE ONLY public.users_groups
    ADD CONSTRAINT fkey_groups FOREIGN KEY (id_group) REFERENCES public.groups(id_group);
 B   ALTER TABLE ONLY public.users_groups DROP CONSTRAINT fkey_groups;
       public       postgres    false    2698    200    197            �
           2606    16445    users_groups fkey_users    FK CONSTRAINT     {   ALTER TABLE ONLY public.users_groups
    ADD CONSTRAINT fkey_users FOREIGN KEY (id_user) REFERENCES public.users(id_user);
 A   ALTER TABLE ONLY public.users_groups DROP CONSTRAINT fkey_users;
       public       postgres    false    199    200    2700            	   ,   x�3�tL����,.)J,�/�2�.ILK�2�-N-����� ��
l         2   x�3��M,.I-�H,�O�L�L�12rH�M���K���̅�r��qqq oap            x�3�4����� ]     