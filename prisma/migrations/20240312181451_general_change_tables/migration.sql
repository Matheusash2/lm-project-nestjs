/*
  Warnings:

  - You are about to drop the column `rg` on the `clients` table. All the data in the column will be lost.
  - You are about to drop the column `name` on the `registers` table. All the data in the column will be lost.
  - A unique constraint covering the columns `[email]` on the table `registers` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[cpf]` on the table `registers` will be added. If there are existing duplicate values, this will fail.

*/
-- DropIndex
DROP INDEX "clients_rg_key";

-- AlterTable
ALTER TABLE "clients" DROP COLUMN "rg",
ADD COLUMN     "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN     "inssPassword" TEXT,
ALTER COLUMN "lastName" DROP NOT NULL,
ALTER COLUMN "dateOfBirth" DROP NOT NULL,
ALTER COLUMN "cpf" DROP NOT NULL;

-- AlterTable
ALTER TABLE "registers" DROP COLUMN "name",
ADD COLUMN     "cpf" TEXT,
ADD COLUMN     "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN     "dateOfBirth" TEXT,
ADD COLUMN     "email" TEXT,
ADD COLUMN     "lastName" TEXT;

-- CreateTable
CREATE TABLE "identifications" (
    "id" TEXT NOT NULL,
    "fatherName" TEXT NOT NULL,
    "motherName" TEXT NOT NULL,
    "sex" TEXT NOT NULL,
    "maritalStatus" TEXT NOT NULL,
    "nationality" TEXT NOT NULL,
    "countryOfBirth" TEXT NOT NULL,
    "stateOfBirth" TEXT NOT NULL,
    "cityOfBirth" TEXT NOT NULL,
    "registerId" TEXT NOT NULL,

    CONSTRAINT "identifications_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "RGs" (
    "id" TEXT NOT NULL,
    "number" TEXT NOT NULL,
    "emissionDate" TEXT NOT NULL,
    "issuingAuthority" TEXT NOT NULL,
    "issuingState" TEXT NOT NULL,
    "registerId" TEXT NOT NULL,

    CONSTRAINT "RGs_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "contacts" (
    "id" TEXT NOT NULL,
    "telephone" TEXT NOT NULL,
    "ddd" TEXT NOT NULL,
    "registerId" TEXT NOT NULL,

    CONSTRAINT "contacts_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "address" (
    "id" TEXT NOT NULL,
    "street" TEXT NOT NULL,
    "number" TEXT NOT NULL,
    "complement" TEXT,
    "neighborhood" TEXT NOT NULL,
    "cep" TEXT NOT NULL,
    "city" TEXT NOT NULL,
    "state" TEXT NOT NULL,
    "registerId" TEXT NOT NULL,

    CONSTRAINT "address_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Contract" (
    "id" TEXT NOT NULL,
    "proposalNumber" TEXT NOT NULL,
    "bank" TEXT NOT NULL,
    "contractDate" TEXT NOT NULL,
    "valuePaid" DOUBLE PRECISION NOT NULL,
    "interest" DOUBLE PRECISION NOT NULL,
    "installments" INTEGER NOT NULL,
    "totalPaid" DOUBLE PRECISION NOT NULL,
    "commission" DOUBLE PRECISION NOT NULL,
    "currentCode" TEXT NOT NULL,
    "clientId" TEXT NOT NULL,

    CONSTRAINT "Contract_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "identificationsClients" (
    "id" TEXT NOT NULL,
    "fatherName" TEXT NOT NULL,
    "motherName" TEXT NOT NULL,
    "sex" TEXT NOT NULL,
    "maritalStatus" TEXT NOT NULL,
    "nationality" TEXT NOT NULL,
    "countryOfBirth" TEXT NOT NULL,
    "stateOfBirth" TEXT NOT NULL,
    "cityOfBirth" TEXT NOT NULL,
    "clientId" TEXT NOT NULL,

    CONSTRAINT "identificationsClients_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "RGsClients" (
    "id" TEXT NOT NULL,
    "number" TEXT NOT NULL,
    "emissionDate" TEXT NOT NULL,
    "issuingAuthority" TEXT NOT NULL,
    "issuingState" TEXT NOT NULL,
    "clientId" TEXT NOT NULL,

    CONSTRAINT "RGsClients_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "contactsClients" (
    "id" TEXT NOT NULL,
    "telephone" TEXT NOT NULL,
    "ddd" TEXT NOT NULL,
    "clientId" TEXT NOT NULL,

    CONSTRAINT "contactsClients_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "addressClients" (
    "id" TEXT NOT NULL,
    "street" TEXT NOT NULL,
    "number" TEXT NOT NULL,
    "complement" TEXT,
    "neighborhood" TEXT NOT NULL,
    "cep" TEXT NOT NULL,
    "city" TEXT NOT NULL,
    "state" TEXT NOT NULL,
    "clientId" TEXT NOT NULL,

    CONSTRAINT "addressClients_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "identifications_registerId_key" ON "identifications"("registerId");

-- CreateIndex
CREATE UNIQUE INDEX "RGs_registerId_key" ON "RGs"("registerId");

-- CreateIndex
CREATE UNIQUE INDEX "identificationsClients_clientId_key" ON "identificationsClients"("clientId");

-- CreateIndex
CREATE UNIQUE INDEX "RGsClients_clientId_key" ON "RGsClients"("clientId");

-- CreateIndex
CREATE UNIQUE INDEX "registers_email_key" ON "registers"("email");

-- CreateIndex
CREATE UNIQUE INDEX "registers_cpf_key" ON "registers"("cpf");

-- AddForeignKey
ALTER TABLE "identifications" ADD CONSTRAINT "identifications_registerId_fkey" FOREIGN KEY ("registerId") REFERENCES "registers"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "RGs" ADD CONSTRAINT "RGs_registerId_fkey" FOREIGN KEY ("registerId") REFERENCES "registers"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "contacts" ADD CONSTRAINT "contacts_registerId_fkey" FOREIGN KEY ("registerId") REFERENCES "registers"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "address" ADD CONSTRAINT "address_registerId_fkey" FOREIGN KEY ("registerId") REFERENCES "registers"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Contract" ADD CONSTRAINT "Contract_clientId_fkey" FOREIGN KEY ("clientId") REFERENCES "clients"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "identificationsClients" ADD CONSTRAINT "identificationsClients_clientId_fkey" FOREIGN KEY ("clientId") REFERENCES "clients"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "RGsClients" ADD CONSTRAINT "RGsClients_clientId_fkey" FOREIGN KEY ("clientId") REFERENCES "clients"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "contactsClients" ADD CONSTRAINT "contactsClients_clientId_fkey" FOREIGN KEY ("clientId") REFERENCES "clients"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "addressClients" ADD CONSTRAINT "addressClients_clientId_fkey" FOREIGN KEY ("clientId") REFERENCES "clients"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
