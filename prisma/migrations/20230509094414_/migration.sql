/*
  Warnings:

  - You are about to drop the column `slot_id` on the `slot_Time` table. All the data in the column will be lost.
  - You are about to drop the `Tests` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `plans` table. If the table is not empty, all the data it contains will be lost.
  - The required column `id` was added to the `GeoLocation` table with a prisma-level default value. This is not possible if the table is not empty. Please add this column as optional, then populate it before making it required.
  - Added the required column `slotId` to the `slot_Time` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "GeoLocation" DROP CONSTRAINT "GeoLocation_userId_fkey";

-- DropForeignKey
ALTER TABLE "plans" DROP CONSTRAINT "plans_test_id_fkey";

-- DropForeignKey
ALTER TABLE "slot_Time" DROP CONSTRAINT "slot_Time_slot_id_fkey";

-- DropIndex
DROP INDEX "GeoLocation_userId_key";

-- DropIndex
DROP INDEX "Member_userId_key";

-- DropIndex
DROP INDEX "slot_Time_slot_id_key";

-- AlterTable
ALTER TABLE "GeoLocation" ADD COLUMN     "id" TEXT NOT NULL,
ALTER COLUMN "userId" DROP NOT NULL,
ADD CONSTRAINT "GeoLocation_pkey" PRIMARY KEY ("id");

-- AlterTable
ALTER TABLE "Membership" ALTER COLUMN "active" SET DEFAULT true;

-- AlterTable
ALTER TABLE "Staff" ALTER COLUMN "active" SET DEFAULT true;

-- AlterTable
ALTER TABLE "slot_Time" DROP COLUMN "slot_id",
ADD COLUMN     "slotId" TEXT NOT NULL;

-- AlterTable
ALTER TABLE "slots" ALTER COLUMN "is_selected" SET DEFAULT true;

-- DropTable
DROP TABLE "Tests";

-- DropTable
DROP TABLE "plans";

-- CreateTable
CREATE TABLE "test" (
    "active" BOOLEAN NOT NULL DEFAULT true,
    "homeCollection" BOOLEAN NOT NULL DEFAULT false,
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "outsource" BOOLEAN NOT NULL DEFAULT true,
    "price" TEXT NOT NULL,

    CONSTRAINT "test_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Plan" (
    "id" UUID NOT NULL DEFAULT gen_random_uuid(),
    "planeName" TEXT NOT NULL,
    "price" TEXT NOT NULL,
    "testId" TEXT NOT NULL,

    CONSTRAINT "Plan_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "MemberPlan" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "price" INTEGER NOT NULL,
    "descriptiom" TEXT NOT NULL,
    "active" BOOLEAN NOT NULL DEFAULT true,

    CONSTRAINT "MemberPlan_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "AppointmentDetail" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "gender" TEXT NOT NULL,
    "age" INTEGER NOT NULL,
    "dob" TEXT NOT NULL,
    "mobile" INTEGER NOT NULL,
    "date" TEXT NOT NULL,
    "time" TEXT NOT NULL,
    "password" TEXT NOT NULL,
    "address" TEXT NOT NULL,
    "status" TEXT,
    "grandTotal" INTEGER NOT NULL,
    "pickupCharge" INTEGER NOT NULL,
    "discountAmt" INTEGER NOT NULL,
    "uId" TEXT,
    "geoLocationId" TEXT NOT NULL,
    "membershipId" TEXT NOT NULL,
    "paymentOrderSuccessRazorpay_order_id" TEXT NOT NULL,
    "healthPackageId" TEXT,

    CONSTRAINT "AppointmentDetail_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "HealthPackage" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "price" INTEGER NOT NULL,
    "active" BOOLEAN NOT NULL DEFAULT true,
    "parameters" INTEGER NOT NULL,
    "healthTests" TEXT[],
    "description" TEXT NOT NULL,

    CONSTRAINT "HealthPackage_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "HealthTest" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "price" INTEGER NOT NULL,
    "active" BOOLEAN NOT NULL DEFAULT true,
    "outsource" BOOLEAN NOT NULL DEFAULT true,
    "homeCollection" BOOLEAN NOT NULL DEFAULT true,
    "offerPrice" INTEGER,
    "appointmentDetailId" TEXT,

    CONSTRAINT "HealthTest_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "TestPricePlan" (
    "planId" TEXT NOT NULL,
    "planName" TEXT NOT NULL,
    "price" INTEGER NOT NULL,
    "healthTestId" TEXT,

    CONSTRAINT "TestPricePlan_pkey" PRIMARY KEY ("planId")
);

-- CreateTable
CREATE TABLE "PaymentOrderSuccess" (
    "razorpay_order_id" TEXT NOT NULL,
    "razorpay_payment_id" TEXT NOT NULL,
    "razorpay_signature" TEXT NOT NULL,

    CONSTRAINT "PaymentOrderSuccess_pkey" PRIMARY KEY ("razorpay_order_id")
);

-- CreateIndex
CREATE UNIQUE INDEX "AppointmentDetail_geoLocationId_key" ON "AppointmentDetail"("geoLocationId");

-- AddForeignKey
ALTER TABLE "GeoLocation" ADD CONSTRAINT "GeoLocation_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Plan" ADD CONSTRAINT "Plan_testId_fkey" FOREIGN KEY ("testId") REFERENCES "test"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "slot_Time" ADD CONSTRAINT "slot_Time_slotId_fkey" FOREIGN KEY ("slotId") REFERENCES "slots"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "AppointmentDetail" ADD CONSTRAINT "AppointmentDetail_healthPackageId_fkey" FOREIGN KEY ("healthPackageId") REFERENCES "HealthPackage"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "AppointmentDetail" ADD CONSTRAINT "AppointmentDetail_geoLocationId_fkey" FOREIGN KEY ("geoLocationId") REFERENCES "GeoLocation"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "AppointmentDetail" ADD CONSTRAINT "AppointmentDetail_membershipId_fkey" FOREIGN KEY ("membershipId") REFERENCES "Membership"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "AppointmentDetail" ADD CONSTRAINT "AppointmentDetail_paymentOrderSuccessRazorpay_order_id_fkey" FOREIGN KEY ("paymentOrderSuccessRazorpay_order_id") REFERENCES "PaymentOrderSuccess"("razorpay_order_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "HealthTest" ADD CONSTRAINT "HealthTest_appointmentDetailId_fkey" FOREIGN KEY ("appointmentDetailId") REFERENCES "AppointmentDetail"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "TestPricePlan" ADD CONSTRAINT "TestPricePlan_healthTestId_fkey" FOREIGN KEY ("healthTestId") REFERENCES "HealthTest"("id") ON DELETE SET NULL ON UPDATE CASCADE;
