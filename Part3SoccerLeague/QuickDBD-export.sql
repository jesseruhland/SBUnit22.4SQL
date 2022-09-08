-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "team" (
    "id" Serial   NOT NULL,
    "name" text   NOT NULL,
    "location" text   NOT NULL,
    CONSTRAINT "pk_team" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "player" (
    "id" Serial   NOT NULL,
    "name" text   NOT NULL,
    "dob" date   NOT NULL,
    "team_id" int   NOT NULL,
    CONSTRAINT "pk_player" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "goal" (
    "id" Serial   NOT NULL,
    "match_id" int   NOT NULL,
    "player_id" int   NOT NULL,
    CONSTRAINT "pk_goal" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "match" (
    "id" Serial   NOT NULL,
    "date" date   NOT NULL,
    "team1" int   NOT NULL,
    "team2" int   NOT NULL,
    "season_id" int   NOT NULL,
    CONSTRAINT "pk_match" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "match_referee" (
    "id" Serial   NOT NULL,
    "match_id" int   NOT NULL,
    "referee_id" int   NOT NULL,
    CONSTRAINT "pk_match_referee" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "referee" (
    "id" Serial   NOT NULL,
    "name" text   NOT NULL,
    CONSTRAINT "pk_referee" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "season" (
    "id" Serial   NOT NULL,
    "start" date   NOT NULL,
    "end" date   NOT NULL,
    CONSTRAINT "pk_season" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "results" (
    "id" Serial   NOT NULL,
    "match_id" int   NOT NULL,
    "team_id" int   NOT NULL,
    "result" text   NOT NULL,
    CONSTRAINT "pk_results" PRIMARY KEY (
        "id"
     )
);

ALTER TABLE "player" ADD CONSTRAINT "fk_player_team_id" FOREIGN KEY("team_id")
REFERENCES "team" ("id");

ALTER TABLE "goal" ADD CONSTRAINT "fk_goal_match_id" FOREIGN KEY("match_id")
REFERENCES "match" ("id");

ALTER TABLE "goal" ADD CONSTRAINT "fk_goal_player_id" FOREIGN KEY("player_id")
REFERENCES "player" ("id");

ALTER TABLE "match" ADD CONSTRAINT "fk_match_team1" FOREIGN KEY("team1")
REFERENCES "team" ("id");

ALTER TABLE "match" ADD CONSTRAINT "fk_match_team2" FOREIGN KEY("team2")
REFERENCES "team" ("id");

ALTER TABLE "match" ADD CONSTRAINT "fk_match_season_id" FOREIGN KEY("season_id")
REFERENCES "season" ("id");

ALTER TABLE "match_referee" ADD CONSTRAINT "fk_match_referee_match_id" FOREIGN KEY("match_id")
REFERENCES "match" ("id");

ALTER TABLE "match_referee" ADD CONSTRAINT "fk_match_referee_referee_id" FOREIGN KEY("referee_id")
REFERENCES "referee" ("id");

ALTER TABLE "results" ADD CONSTRAINT "fk_results_match_id" FOREIGN KEY("match_id")
REFERENCES "match" ("id");

ALTER TABLE "results" ADD CONSTRAINT "fk_results_team_id" FOREIGN KEY("team_id")
REFERENCES "team" ("id");

