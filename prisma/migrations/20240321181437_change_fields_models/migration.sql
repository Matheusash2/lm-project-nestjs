-- AlterTable
ALTER TABLE "RGs" ALTER COLUMN "number" DROP NOT NULL,
ALTER COLUMN "emissionDate" DROP NOT NULL,
ALTER COLUMN "issuingAuthority" DROP NOT NULL,
ALTER COLUMN "issuingState" DROP NOT NULL;

-- AlterTable
ALTER TABLE "RGsClients" ALTER COLUMN "number" DROP NOT NULL,
ALTER COLUMN "emissionDate" DROP NOT NULL,
ALTER COLUMN "issuingAuthority" DROP NOT NULL,
ALTER COLUMN "issuingState" DROP NOT NULL;

-- AlterTable
ALTER TABLE "addresses" ALTER COLUMN "street" DROP NOT NULL,
ALTER COLUMN "number" DROP NOT NULL,
ALTER COLUMN "neighborhood" DROP NOT NULL,
ALTER COLUMN "cep" DROP NOT NULL,
ALTER COLUMN "city" DROP NOT NULL,
ALTER COLUMN "state" DROP NOT NULL;

-- AlterTable
ALTER TABLE "addressesClients" ALTER COLUMN "street" DROP NOT NULL,
ALTER COLUMN "number" DROP NOT NULL,
ALTER COLUMN "neighborhood" DROP NOT NULL,
ALTER COLUMN "cep" DROP NOT NULL,
ALTER COLUMN "city" DROP NOT NULL,
ALTER COLUMN "state" DROP NOT NULL;

-- AlterTable
ALTER TABLE "contacts" ALTER COLUMN "telephone" DROP NOT NULL,
ALTER COLUMN "ddd" DROP NOT NULL;

-- AlterTable
ALTER TABLE "contactsClients" ALTER COLUMN "telephone" DROP NOT NULL,
ALTER COLUMN "ddd" DROP NOT NULL;

-- AlterTable
ALTER TABLE "contracts" ALTER COLUMN "proposalNumber" DROP NOT NULL,
ALTER COLUMN "bank" DROP NOT NULL,
ALTER COLUMN "contractDate" DROP NOT NULL,
ALTER COLUMN "valuePaid" DROP NOT NULL,
ALTER COLUMN "interest" DROP NOT NULL,
ALTER COLUMN "installments" DROP NOT NULL,
ALTER COLUMN "totalPaid" DROP NOT NULL,
ALTER COLUMN "commission" DROP NOT NULL,
ALTER COLUMN "currentCode" DROP NOT NULL;

-- AlterTable
ALTER TABLE "identifications" ALTER COLUMN "fatherName" DROP NOT NULL,
ALTER COLUMN "motherName" DROP NOT NULL,
ALTER COLUMN "sex" DROP NOT NULL,
ALTER COLUMN "maritalStatus" DROP NOT NULL,
ALTER COLUMN "nationality" DROP NOT NULL,
ALTER COLUMN "countryOfBirth" DROP NOT NULL,
ALTER COLUMN "stateOfBirth" DROP NOT NULL,
ALTER COLUMN "cityOfBirth" DROP NOT NULL;

-- AlterTable
ALTER TABLE "identificationsClients" ALTER COLUMN "fatherName" DROP NOT NULL,
ALTER COLUMN "motherName" DROP NOT NULL,
ALTER COLUMN "sex" DROP NOT NULL,
ALTER COLUMN "maritalStatus" DROP NOT NULL,
ALTER COLUMN "nationality" DROP NOT NULL,
ALTER COLUMN "countryOfBirth" DROP NOT NULL,
ALTER COLUMN "stateOfBirth" DROP NOT NULL,
ALTER COLUMN "cityOfBirth" DROP NOT NULL;
