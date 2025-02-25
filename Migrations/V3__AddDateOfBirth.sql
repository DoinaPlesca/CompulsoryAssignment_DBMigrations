START TRANSACTION;
ALTER TABLE "Students" ADD "DateOfBirth" timestamp with time zone NOT NULL DEFAULT TIMESTAMPTZ '-infinity';

INSERT INTO "__EFMigrationsHistory" ("MigrationId", "ProductVersion")
VALUES ('20250225093133_AddDateOfBirthToStudent', '9.0.2');

COMMIT;

