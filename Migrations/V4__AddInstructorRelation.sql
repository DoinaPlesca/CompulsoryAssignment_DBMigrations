﻿START TRANSACTION;
ALTER TABLE "Courses" ADD "InstructorId" integer NOT NULL DEFAULT 0;

CREATE TABLE "Instructors" (
    "Id" integer GENERATED BY DEFAULT AS IDENTITY,
    "FirstName" text NOT NULL,
    "LastName" text NOT NULL,
    "Email" text NOT NULL,
    "HireDate" timestamp with time zone NOT NULL,
    CONSTRAINT "PK_Instructors" PRIMARY KEY ("Id")
);

CREATE INDEX "IX_Courses_InstructorId" ON "Courses" ("InstructorId");

ALTER TABLE "Courses" ADD CONSTRAINT "FK_Courses_Instructors_InstructorId" FOREIGN KEY ("InstructorId") REFERENCES "Instructors" ("Id") ON DELETE CASCADE;

INSERT INTO "__EFMigrationsHistory" ("MigrationId", "ProductVersion")
VALUES ('20250225095237_AddInstructorRelation', '9.0.2');

COMMIT;

