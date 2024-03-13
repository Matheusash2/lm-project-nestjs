/*
  Warnings:

  - You are about to drop the column `lastName` on the `employees` table. All the data in the column will be lost.

*/
-- AlterTable
ALTER TABLE "employees" DROP COLUMN "lastName";

-- AlterTable
ALTER TABLE "users" ADD COLUMN     "lastName" TEXT;
