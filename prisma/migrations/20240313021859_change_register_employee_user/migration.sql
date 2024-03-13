/*
  Warnings:

  - You are about to drop the column `registerId` on the `RGs` table. All the data in the column will be lost.
  - You are about to drop the column `registerId` on the `contacts` table. All the data in the column will be lost.
  - You are about to drop the column `registerId` on the `identifications` table. All the data in the column will be lost.
  - You are about to drop the `address` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `addressClients` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `registers` table. If the table is not empty, all the data it contains will be lost.
  - A unique constraint covering the columns `[employeeId]` on the table `RGs` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[employeeId]` on the table `identifications` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `employeeId` to the `RGs` table without a default value. This is not possible if the table is not empty.
  - Added the required column `employeeId` to the `contacts` table without a default value. This is not possible if the table is not empty.
  - Added the required column `employeeId` to the `identifications` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "RGs" DROP CONSTRAINT "RGs_registerId_fkey";

-- DropForeignKey
ALTER TABLE "address" DROP CONSTRAINT "address_registerId_fkey";

-- DropForeignKey
ALTER TABLE "addressClients" DROP CONSTRAINT "addressClients_clientId_fkey";

-- DropForeignKey
ALTER TABLE "contacts" DROP CONSTRAINT "contacts_registerId_fkey";

-- DropForeignKey
ALTER TABLE "identifications" DROP CONSTRAINT "identifications_registerId_fkey";

-- DropIndex
DROP INDEX "RGs_registerId_key";

-- DropIndex
DROP INDEX "identifications_registerId_key";

-- AlterTable
ALTER TABLE "RGs" DROP COLUMN "registerId",
ADD COLUMN     "employeeId" TEXT NOT NULL;

-- AlterTable
ALTER TABLE "contacts" DROP COLUMN "registerId",
ADD COLUMN     "employeeId" TEXT NOT NULL;

-- AlterTable
ALTER TABLE "identifications" DROP COLUMN "registerId",
ADD COLUMN     "employeeId" TEXT NOT NULL;

-- DropTable
DROP TABLE "address";

-- DropTable
DROP TABLE "addressClients";

-- DropTable
DROP TABLE "registers";

-- CreateTable
CREATE TABLE "users" (
    "id" TEXT NOT NULL,
    "userName" TEXT NOT NULL,
    "password" TEXT NOT NULL,
    "name" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "users_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "employees" (
    "id" TEXT NOT NULL,
    "email" TEXT,
    "lastName" TEXT,
    "dateOfBirth" TEXT,
    "cpf" TEXT,
    "userId" TEXT NOT NULL,

    CONSTRAINT "employees_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "addresses" (
    "id" TEXT NOT NULL,
    "street" TEXT NOT NULL,
    "number" TEXT NOT NULL,
    "complement" TEXT,
    "neighborhood" TEXT NOT NULL,
    "cep" TEXT NOT NULL,
    "city" TEXT NOT NULL,
    "state" TEXT NOT NULL,
    "employeeId" TEXT NOT NULL,

    CONSTRAINT "addresses_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "addressesClients" (
    "id" TEXT NOT NULL,
    "street" TEXT NOT NULL,
    "number" TEXT NOT NULL,
    "complement" TEXT,
    "neighborhood" TEXT NOT NULL,
    "cep" TEXT NOT NULL,
    "city" TEXT NOT NULL,
    "state" TEXT NOT NULL,
    "clientId" TEXT NOT NULL,

    CONSTRAINT "addressesClients_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "users_userName_key" ON "users"("userName");

-- CreateIndex
CREATE UNIQUE INDEX "employees_email_key" ON "employees"("email");

-- CreateIndex
CREATE UNIQUE INDEX "employees_cpf_key" ON "employees"("cpf");

-- CreateIndex
CREATE UNIQUE INDEX "employees_userId_key" ON "employees"("userId");

-- CreateIndex
CREATE UNIQUE INDEX "RGs_employeeId_key" ON "RGs"("employeeId");

-- CreateIndex
CREATE UNIQUE INDEX "identifications_employeeId_key" ON "identifications"("employeeId");

-- AddForeignKey
ALTER TABLE "employees" ADD CONSTRAINT "employees_userId_fkey" FOREIGN KEY ("userId") REFERENCES "users"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "identifications" ADD CONSTRAINT "identifications_employeeId_fkey" FOREIGN KEY ("employeeId") REFERENCES "employees"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "RGs" ADD CONSTRAINT "RGs_employeeId_fkey" FOREIGN KEY ("employeeId") REFERENCES "employees"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "contacts" ADD CONSTRAINT "contacts_employeeId_fkey" FOREIGN KEY ("employeeId") REFERENCES "employees"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "addresses" ADD CONSTRAINT "addresses_employeeId_fkey" FOREIGN KEY ("employeeId") REFERENCES "employees"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "addressesClients" ADD CONSTRAINT "addressesClients_clientId_fkey" FOREIGN KEY ("clientId") REFERENCES "clients"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
