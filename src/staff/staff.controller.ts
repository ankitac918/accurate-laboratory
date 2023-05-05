import { Controller, Post, Body } from '@nestjs/common';
import { StaffService } from './staff.service';
import { create } from 'domain';
import { StaffDto } from './dto/staff.dto';

@Controller('staff')
export class StaffController {
  constructor(private staffService: StaffService) {}

  @Post()
  create(@Body() dto: StaffDto) {
    return this.staffService.createStaff(dto);
  }
}
