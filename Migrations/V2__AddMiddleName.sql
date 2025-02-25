START TRANSACTION;
ALTER TABLE "Students" ADD "MiddleName" text NOT NULL DEFAULT '';

INSERT INTO "__EFMigrationsHistory" ("MigrationId", "ProductVersion")
VALUES ('20250225090830_AddMiddleNameToStudent', '9.0.2');

COMMIT;

