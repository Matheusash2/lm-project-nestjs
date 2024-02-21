/*
  Warnings:

  - The primary key for the `registers` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - Added the required column `name` to the `registers` table without a default value. This is not possible if the table is not empty.

*/
-- RedefineTables
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_registers" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "user" TEXT NOT NULL,
    "password" TEXT NOT NULL,
    "name" TEXT NOT NULL
);
INSERT INTO "new_registers" ("id", "password", "user") SELECT "id", "password", "user" FROM "registers";
DROP TABLE "registers";
ALTER TABLE "new_registers" RENAME TO "registers";
CREATE UNIQUE INDEX "registers_user_key" ON "registers"("user");
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;
