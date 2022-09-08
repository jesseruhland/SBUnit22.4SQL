-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "region" (
    "id" Serial   NOT NULL,
    "name" text   NOT NULL,
    CONSTRAINT "pk_region" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "user" (
    "id" Serial   NOT NULL,
    "username" varchar(15)   NOT NULL,
    "name" text   NOT NULL,
    "pref_reg_id" int   NOT NULL,
    "phone" text   NOT NULL,
    "email" text   NOT NULL,
    CONSTRAINT "pk_user" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "post" (
    "id" Serial   NOT NULL,
    "user_id" int   NOT NULL,
    "title" text   NOT NULL,
    "text" text   NOT NULL,
    "location" text   NOT NULL,
    "region_id" int   NOT NULL,
    "category_id" int   NOT NULL,
    CONSTRAINT "pk_post" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "category" (
    "id" Serial   NOT NULL,
    "name" text   NOT NULL,
    CONSTRAINT "pk_category" PRIMARY KEY (
        "id"
     )
);

ALTER TABLE "user" ADD CONSTRAINT "fk_user_pref_reg_id" FOREIGN KEY("pref_reg_id")
REFERENCES "region" ("id");

ALTER TABLE "post" ADD CONSTRAINT "fk_post_user_id" FOREIGN KEY("user_id")
REFERENCES "user" ("id");

ALTER TABLE "post" ADD CONSTRAINT "fk_post_region_id" FOREIGN KEY("region_id")
REFERENCES "region" ("id");

ALTER TABLE "post" ADD CONSTRAINT "fk_post_category_id" FOREIGN KEY("category_id")
REFERENCES "category" ("id");

