/*
  Warnings:

  - You are about to drop the `test` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "test" DROP CONSTRAINT "test_id_fkey";

-- AlterTable
ALTER TABLE "User" ADD COLUMN     "address" TEXT,
ADD COLUMN     "age" TEXT,
ADD COLUMN     "gender" TEXT,
ADD COLUMN     "healthPackage" TEXT,
ADD COLUMN     "tests" TEXT;

-- DropTable
DROP TABLE "test";

-- CreateTable
CREATE TABLE "Plan" (
    "id" TEXT NOT NULL,
    "testsId" TEXT NOT NULL,
    "planeName" TEXT NOT NULL,
    "price" TEXT NOT NULL,

    CONSTRAINT "Plan_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "Plan" ADD CONSTRAINT "Plan_testsId_fkey" FOREIGN KEY ("testsId") REFERENCES "tests"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
