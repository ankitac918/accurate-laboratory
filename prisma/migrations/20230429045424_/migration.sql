/*
  Warnings:

  - You are about to drop the `tests` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "plans" DROP CONSTRAINT "plans_test_id_fkey";

-- DropTable
DROP TABLE "tests";

-- CreateTable
CREATE TABLE "Tests" (
    "active" BOOLEAN NOT NULL DEFAULT true,
    "homeCollection" BOOLEAN NOT NULL DEFAULT false,
    "id" UUID NOT NULL DEFAULT gen_random_uuid(),
    "name" TEXT NOT NULL,
    "outsource" BOOLEAN NOT NULL DEFAULT true,
    "price" TEXT NOT NULL,

    CONSTRAINT "Tests_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "plans" ADD CONSTRAINT "plans_test_id_fkey" FOREIGN KEY ("test_id") REFERENCES "Tests"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
