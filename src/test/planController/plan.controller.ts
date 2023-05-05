import { Controller, Body, Post, Get } from '@nestjs/common';
import { PlanService } from '../planService/plan.service';
import { PlanDto } from '../dtos/Plan.dto';

@Controller('plan')
export class PlanController {
  constructor(private planServive: PlanService) {}

  @Post()
  addPlan(@Body() dto: PlanDto) {
    return this.planServive.createPlan(dto);
  }

  @Get()
  getPlan() {
    return this.planServive.getPlan();
  }
}
