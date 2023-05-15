/*
  Warnings:

  - The primary key for the `tests` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The `id` column on the `tests` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - You are about to drop the `Plan` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "Plan" DROP CONSTRAINT "Plan_testsId_fkey";

-- AlterTable
ALTER TABLE "tests" DROP CONSTRAINT "tests_pkey",
DROP COLUMN "id",
ADD COLUMN     "id" UUID NOT NULL DEFAULT gen_random_uuid(),
ADD CONSTRAINT "tests_pkey" PRIMARY KEY ("id");

-- DropTable
DROP TABLE "Plan";

-- CreateTable
CREATE TABLE "plans" (
    "id" UUID NOT NULL DEFAULT gen_random_uuid(),
    "test_id" UUID NOT NULL,
    "planeName" TEXT NOT NULL,
    "price" TEXT NOT NULL,

    CONSTRAINT "plans_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "plans" ADD CONSTRAINT "plans_test_id_fkey" FOREIGN KEY ("test_id") REFERENCES "tests"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
