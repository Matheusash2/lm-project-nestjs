/*
  Warnings:

  - You are about to drop the `Contract` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "Contract" DROP CONSTRAINT "Contract_clientId_fkey";

-- DropTable
DROP TABLE "Contract";

-- CreateTable
CREATE TABLE "contrants" (
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

    CONSTRAINT "contrants_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "contrants" ADD CONSTRAINT "contrants_clientId_fkey" FOREIGN KEY ("clientId") REFERENCES "clients"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
