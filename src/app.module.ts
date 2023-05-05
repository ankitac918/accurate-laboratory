import { Module } from '@nestjs/common';
import { ConfigModule } from '@nestjs/config/dist';
import { UserModule } from './user/user.module';
import { PrismaModule } from './prisma/prisma.module';
import { TestModule } from './test/test.module';
import { StaffModule } from './staff/staff.module';
import { MembershipModule } from './membership/membership.module';
import { SlotModule } from './slot/slot.module';

@Module({
  imports: [
    ConfigModule.forRoot({ isGlobal: true }),
    UserModule,
    PrismaModule,
    TestModule,
    StaffModule,
    MembershipModule,
    SlotModule
  ],
  controllers: [],
  providers: [],
})
export class AppModule {}
