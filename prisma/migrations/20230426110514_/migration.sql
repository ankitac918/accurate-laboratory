-- DropForeignKey
ALTER TABLE "plans" DROP CONSTRAINT "plans_test_id_fkey";

-- CreateTable
CREATE TABLE "_PlanTotest" (
    "A" UUID NOT NULL,
    "B" UUID NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "_PlanTotest_AB_unique" ON "_PlanTotest"("A", "B");

-- CreateIndex
CREATE INDEX "_PlanTotest_B_index" ON "_PlanTotest"("B");

-- AddForeignKey
ALTER TABLE "_PlanTotest" ADD CONSTRAINT "_PlanTotest_A_fkey" FOREIGN KEY ("A") REFERENCES "plans"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_PlanTotest" ADD CONSTRAINT "_PlanTotest_B_fkey" FOREIGN KEY ("B") REFERENCES "tests"("id") ON DELETE CASCADE ON UPDATE CASCADE;
