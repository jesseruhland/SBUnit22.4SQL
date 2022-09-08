-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "physician" (
    "id" Serial   NOT NULL,
    "name" text   NOT NULL,
    "specialty" text   NOT NULL,
    "phone_num" text   NOT NULL,
    CONSTRAINT "pk_physician" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "patient" (
    "id" Serial   NOT NULL,
    "name" text   NOT NULL,
    "date_of_birth" date   NOT NULL,
    "phone_num" text   NOT NULL,
    CONSTRAINT "pk_patient" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "visit" (
    "id" Serial   NOT NULL,
    "physician_id" int   NOT NULL,
    "patient_id" int   NOT NULL,
    CONSTRAINT "pk_visit" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "visit_finding" (
    "id" Serial   NOT NULL,
    "visit_id" int   NOT NULL,
    "diagnosis_code" text   NOT NULL,
    "treatment_code" text   NOT NULL,
    CONSTRAINT "pk_visit_finding" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "disorder_disease" (
    "id" Serial   NOT NULL,
    "code" text   NOT NULL,
    "name" text   NOT NULL,
    CONSTRAINT "pk_disorder_disease" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "treatment" (
    "id" Serial   NOT NULL,
    "code" text   NOT NULL,
    "name" text   NOT NULL,
    CONSTRAINT "pk_treatment" PRIMARY KEY (
        "id"
     )
);

ALTER TABLE "visit" ADD CONSTRAINT "fk_visit_physician_id" FOREIGN KEY("physician_id")
REFERENCES "physician" ("id");

ALTER TABLE "visit" ADD CONSTRAINT "fk_visit_patient_id" FOREIGN KEY("patient_id")
REFERENCES "patient" ("id");

ALTER TABLE "visit_finding" ADD CONSTRAINT "fk_visit_finding_visit_id" FOREIGN KEY("visit_id")
REFERENCES "visit" ("id");

ALTER TABLE "visit_finding" ADD CONSTRAINT "fk_visit_finding_diagnosis_code" FOREIGN KEY("diagnosis_code")
REFERENCES "disorder_disease" ("code");

ALTER TABLE "visit_finding" ADD CONSTRAINT "fk_visit_finding_treatment_code" FOREIGN KEY("treatment_code")
REFERENCES "treatment" ("code");

