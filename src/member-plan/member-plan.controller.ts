import { Controller, Post, Body, Get, Param, Patch } from '@nestjs/common';
import { MemberPlanService } from './member-plan.service';
import { memberPlanDto } from './dto/memberPlan.dto';

@Controller('member-plan')
export class MemberPlanController {
  constructor(private memberPlanService: MemberPlanService) {}

  @Post()
  createMemberPlan(@Body() dto: memberPlanDto) {
    this.memberPlanService.createMemberPlan(dto);
  }

  @Get()
  findAllMemberPlan() {
    return this.memberPlanService.findAll();
  }

  @Get(':id')
  findById(@Param('id') id: string) {
    return this.memberPlanService.findByid(id);
  }

  @Patch(':id')
  updateMemberPlan(
    @Param('id') id: string,
    @Body() memberplanDto: memberPlanDto,
  ) {
    return this.memberPlanService.update(id, memberplanDto);
  }
}
