import { Module } from '@nestjs/common';
import { TestController } from './testController/test.controller';
import { TestService } from './testService/test.service';
import { PlanController } from './planController/plan.controller';
import { PlanService } from './planService/plan.service';

@Module({
  controllers: [TestController,PlanController],
  providers: [TestService,PlanService]
})
export class TestModule {}
