/*
  Warnings:

  - You are about to drop the `contrants` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "contrants" DROP CONSTRAINT "contrants_clientId_fkey";

-- DropTable
DROP TABLE "contrants";

-- CreateTable
CREATE TABLE "contracts" (
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

    CONSTRAINT "contracts_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "contracts" ADD CONSTRAINT "contracts_clientId_fkey" FOREIGN KEY ("clientId") REFERENCES "clients"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
