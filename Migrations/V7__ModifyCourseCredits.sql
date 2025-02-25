START TRANSACTION;
ALTER TABLE "Courses" ALTER COLUMN "Credits" TYPE numeric;

INSERT INTO "__EFMigrationsHistory" ("MigrationId", "ProductVersion")
VALUES ('20250225131706_ModifyCourseCredits', '9.0.2');

COMMIT;

