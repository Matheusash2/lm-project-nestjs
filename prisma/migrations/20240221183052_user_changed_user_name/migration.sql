/*
  Warnings:

  - You are about to drop the column `user` on the `registers` table. All the data in the column will be lost.
  - Added the required column `userName` to the `registers` table without a default value. This is not possible if the table is not empty.

*/
-- RedefineTables
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_registers" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "userName" TEXT NOT NULL,
    "password" TEXT NOT NULL,
    "name" TEXT NOT NULL
);
INSERT INTO "new_registers" ("id", "name", "password") SELECT "id", "name", "password" FROM "registers";
DROP TABLE "registers";
ALTER TABLE "new_registers" RENAME TO "registers";
CREATE UNIQUE INDEX "registers_userName_key" ON "registers"("userName");
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;
