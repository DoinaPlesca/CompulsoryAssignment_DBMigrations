START TRANSACTION;
ALTER TABLE "Enrollments" RENAME COLUMN "Grade" TO "FinalGrade";

INSERT INTO "__EFMigrationsHistory" ("MigrationId", "ProductVersion")
VALUES ('20250225103031_RenameGradeToFinalGrade', '9.0.2');

COMMIT;

