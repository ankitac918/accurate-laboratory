import { Module } from '@nestjs/common';
import { ConfigModule } from '@nestjs/config/dist';
import { UserModule } from './user/user.module';
import { PrismaModule } from './prisma/prisma.module';
import { TestModule } from './test/test.module';

@Module({
  imports: [
    ConfigModule.forRoot({ isGlobal: true }),
    UserModule,
    PrismaModule,
    TestModule,
  ],
  controllers: [],
  providers: [],
})
export class AppModule {}
