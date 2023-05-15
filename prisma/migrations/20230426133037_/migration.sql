/*
  Warnings:

  - You are about to drop the `_PlanTotest` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "_PlanTotest" DROP CONSTRAINT "_PlanTotest_A_fkey";

-- DropForeignKey
ALTER TABLE "_PlanTotest" DROP CONSTRAINT "_PlanTotest_B_fkey";

-- DropTable
DROP TABLE "_PlanTotest";

-- AddForeignKey
ALTER TABLE "plans" ADD CONSTRAINT "plans_test_id_fkey" FOREIGN KEY ("test_id") REFERENCES "tests"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
