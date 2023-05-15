/*
  Warnings:

  - You are about to drop the column `discountAmt` on the `AppointmentDetail` table. All the data in the column will be lost.
  - You are about to drop the column `geoLocationId` on the `AppointmentDetail` table. All the data in the column will be lost.
  - You are about to drop the column `grandTotal` on the `AppointmentDetail` table. All the data in the column will be lost.
  - You are about to drop the column `healthPackageId` on the `AppointmentDetail` table. All the data in the column will be lost.
  - You are about to drop the column `membershipId` on the `AppointmentDetail` table. All the data in the column will be lost.
  - You are about to drop the column `paymentOrderSuccessRazorpay_order_id` on the `AppointmentDetail` table. All the data in the column will be lost.
  - You are about to drop the column `pickupCharge` on the `AppointmentDetail` table. All the data in the column will be lost.
  - You are about to drop the column `uId` on the `AppointmentDetail` table. All the data in the column will be lost.
  - You are about to drop the column `userId` on the `GeoLocation` table. All the data in the column will be lost.
  - You are about to drop the column `healthTests` on the `HealthPackage` table. All the data in the column will be lost.
  - You are about to drop the column `appointmentDetailId` on the `HealthTest` table. All the data in the column will be lost.
  - You are about to drop the column `homeCollection` on the `HealthTest` table. All the data in the column will be lost.
  - You are about to drop the column `offerPrice` on the `HealthTest` table. All the data in the column will be lost.
  - You are about to drop the column `userId` on the `Member` table. All the data in the column will be lost.
  - You are about to drop the column `planeName` on the `Plan` table. All the data in the column will be lost.
  - You are about to drop the column `testId` on the `Plan` table. All the data in the column will be lost.
  - You are about to drop the column `healthTestId` on the `TestPricePlan` table. All the data in the column will be lost.
  - You are about to drop the column `planName` on the `TestPricePlan` table. All the data in the column will be lost.
  - You are about to drop the column `healthPackage` on the `User` table. All the data in the column will be lost.
  - You are about to drop the column `slotId` on the `slot_Time` table. All the data in the column will be lost.
  - You are about to drop the `test` table. If the table is not empty, all the data it contains will be lost.
  - Added the required column `discount_amt` to the `AppointmentDetail` table without a default value. This is not possible if the table is not empty.
  - Added the required column `geo_lcation_id` to the `AppointmentDetail` table without a default value. This is not possible if the table is not empty.
  - Added the required column `grand_total` to the `AppointmentDetail` table without a default value. This is not possible if the table is not empty.
  - Added the required column `membership_id` to the `AppointmentDetail` table without a default value. This is not possible if the table is not empty.
  - Added the required column `payment_order_success_razorpay_order_id` to the `AppointmentDetail` table without a default value. This is not possible if the table is not empty.
  - Added the required column `pickup_charge` to the `AppointmentDetail` table without a default value. This is not possible if the table is not empty.
  - Added the required column `user_id` to the `Member` table without a default value. This is not possible if the table is not empty.
  - Added the required column `plane_name` to the `Plan` table without a default value. This is not possible if the table is not empty.
  - Added the required column `test_id` to the `Plan` table without a default value. This is not possible if the table is not empty.
  - Added the required column `plan_name` to the `TestPricePlan` table without a default value. This is not possible if the table is not empty.
  - Added the required column `slot_id` to the `slot_Time` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "AppointmentDetail" DROP CONSTRAINT "AppointmentDetail_geoLocationId_fkey";

-- DropForeignKey
ALTER TABLE "AppointmentDetail" DROP CONSTRAINT "AppointmentDetail_healthPackageId_fkey";

-- DropForeignKey
ALTER TABLE "AppointmentDetail" DROP CONSTRAINT "AppointmentDetail_membershipId_fkey";

-- DropForeignKey
ALTER TABLE "AppointmentDetail" DROP CONSTRAINT "AppointmentDetail_paymentOrderSuccessRazorpay_order_id_fkey";

-- DropForeignKey
ALTER TABLE "GeoLocation" DROP CONSTRAINT "GeoLocation_userId_fkey";

-- DropForeignKey
ALTER TABLE "HealthTest" DROP CONSTRAINT "HealthTest_appointmentDetailId_fkey";

-- DropForeignKey
ALTER TABLE "Member" DROP CONSTRAINT "Member_userId_fkey";

-- DropForeignKey
ALTER TABLE "Plan" DROP CONSTRAINT "Plan_testId_fkey";

-- DropForeignKey
ALTER TABLE "TestPricePlan" DROP CONSTRAINT "TestPricePlan_healthTestId_fkey";

-- DropForeignKey
ALTER TABLE "slot_Time" DROP CONSTRAINT "slot_Time_slotId_fkey";

-- AlterTable
ALTER TABLE "AppointmentDetail" DROP COLUMN "discountAmt",
DROP COLUMN "geoLocationId",
DROP COLUMN "grandTotal",
DROP COLUMN "healthPackageId",
DROP COLUMN "membershipId",
DROP COLUMN "paymentOrderSuccessRazorpay_order_id",
DROP COLUMN "pickupCharge",
DROP COLUMN "uId",
ADD COLUMN     "discount_amt" INTEGER NOT NULL,
ADD COLUMN     "geo_lcation_id" TEXT NOT NULL,
ADD COLUMN     "grand_total" INTEGER NOT NULL,
ADD COLUMN     "health_package_id" TEXT,
ADD COLUMN     "membership_id" TEXT NOT NULL,
ADD COLUMN     "payment_order_success_razorpay_order_id" TEXT NOT NULL,
ADD COLUMN     "pickup_charge" INTEGER NOT NULL,
ADD COLUMN     "u_Id" TEXT;

-- AlterTable
ALTER TABLE "GeoLocation" DROP COLUMN "userId",
ADD COLUMN     "user_id" TEXT;

-- AlterTable
ALTER TABLE "HealthPackage" DROP COLUMN "healthTests",
ADD COLUMN     "health_tests" TEXT[];

-- AlterTable
ALTER TABLE "HealthTest" DROP COLUMN "appointmentDetailId",
DROP COLUMN "homeCollection",
DROP COLUMN "offerPrice",
ADD COLUMN     "appointment_detail_id" TEXT,
ADD COLUMN     "home_collection" BOOLEAN NOT NULL DEFAULT true,
ADD COLUMN     "offer_price" INTEGER;

-- AlterTable
ALTER TABLE "Member" DROP COLUMN "userId",
ADD COLUMN     "user_id" TEXT NOT NULL;

-- AlterTable
ALTER TABLE "Plan" DROP COLUMN "planeName",
DROP COLUMN "testId",
ADD COLUMN     "plane_name" TEXT NOT NULL,
ADD COLUMN     "test_id" TEXT NOT NULL;

-- AlterTable
ALTER TABLE "TestPricePlan" DROP COLUMN "healthTestId",
DROP COLUMN "planName",
ADD COLUMN     "healthTest_id" TEXT,
ADD COLUMN     "plan_name" TEXT NOT NULL;

-- AlterTable
ALTER TABLE "User" DROP COLUMN "healthPackage",
ADD COLUMN     "health_package" TEXT;

-- AlterTable
ALTER TABLE "slot_Time" DROP COLUMN "slotId",
ADD COLUMN     "slot_id" TEXT NOT NULL;

-- DropTable
DROP TABLE "test";

-- CreateTable
CREATE TABLE "Test" (
    "active" BOOLEAN NOT NULL DEFAULT true,
    "home_collection" BOOLEAN NOT NULL DEFAULT false,
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "outsource" BOOLEAN NOT NULL DEFAULT true,
    "price" TEXT NOT NULL,

    CONSTRAINT "Test_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "GeoLocation" ADD CONSTRAINT "GeoLocation_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Member" ADD CONSTRAINT "Member_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Plan" ADD CONSTRAINT "Plan_test_id_fkey" FOREIGN KEY ("test_id") REFERENCES "Test"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "slot_Time" ADD CONSTRAINT "slot_Time_slot_id_fkey" FOREIGN KEY ("slot_id") REFERENCES "slots"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "AppointmentDetail" ADD CONSTRAINT "AppointmentDetail_health_package_id_fkey" FOREIGN KEY ("health_package_id") REFERENCES "HealthPackage"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "AppointmentDetail" ADD CONSTRAINT "AppointmentDetail_geo_lcation_id_fkey" FOREIGN KEY ("geo_lcation_id") REFERENCES "GeoLocation"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "AppointmentDetail" ADD CONSTRAINT "AppointmentDetail_membership_id_fkey" FOREIGN KEY ("membership_id") REFERENCES "Membership"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "AppointmentDetail" ADD CONSTRAINT "AppointmentDetail_payment_order_success_razorpay_order_id_fkey" FOREIGN KEY ("payment_order_success_razorpay_order_id") REFERENCES "PaymentOrderSuccess"("razorpay_order_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "HealthTest" ADD CONSTRAINT "HealthTest_appointment_detail_id_fkey" FOREIGN KEY ("appointment_detail_id") REFERENCES "AppointmentDetail"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "TestPricePlan" ADD CONSTRAINT "TestPricePlan_healthTest_id_fkey" FOREIGN KEY ("healthTest_id") REFERENCES "HealthTest"("id") ON DELETE SET NULL ON UPDATE CASCADE;
