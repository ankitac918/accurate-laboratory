/*
  Warnings:

  - You are about to drop the `Plan` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "Plan" DROP CONSTRAINT "Plan_id_fkey";

-- DropTable
DROP TABLE "Plan";

-- CreateTable
CREATE TABLE "test" (
    "id" TEXT NOT NULL,
    "planeName" TEXT NOT NULL,
    "price" TEXT NOT NULL,

    CONSTRAINT "test_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "test" ADD CONSTRAINT "test_id_fkey" FOREIGN KEY ("id") REFERENCES "tests"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
