import { Module } from '@nestjs/common';
import { MemberPlanController } from './member-plan.controller';
import { MemberPlanService } from './member-plan.service';

@Module({
  controllers: [MemberPlanController],
  providers: [MemberPlanService]
})
export class MemberPlanModule {}
