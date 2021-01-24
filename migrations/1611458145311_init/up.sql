CREATE TABLE public.us_cities (
    id integer NOT NULL,
    state_id integer NOT NULL,
    city text NOT NULL,
    county text NOT NULL,
    latitude numeric NOT NULL,
    longitude numeric NOT NULL,
    uuid uuid DEFAULT public.gen_random_uuid() NOT NULL
);
CREATE TABLE public.us_states (
    id integer NOT NULL,
    state_code text NOT NULL,
    state_name text NOT NULL,
    uuid uuid DEFAULT public.gen_random_uuid()
);
ALTER TABLE ONLY public.us_cities
    ADD CONSTRAINT us_cities_pkey PRIMARY KEY (id);
ALTER TABLE ONLY public.us_states
    ADD CONSTRAINT us_states_pkey PRIMARY KEY (id);
ALTER TABLE ONLY public.us_cities
    ADD CONSTRAINT us_cities_state_id_fkey FOREIGN KEY (state_id) REFERENCES public.us_states(id) ON UPDATE RESTRICT ON DELETE RESTRICT;
