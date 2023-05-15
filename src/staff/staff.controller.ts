import {
  Controller,
  Post,
  Body,
  Get,
  Param,
  Patch,
  Delete,
} from '@nestjs/common';
import { StaffService } from './staff.service';
import { StaffDto } from './dto/staff.dto';

@Controller('staff')
export class StaffController {
  constructor(private staffService: StaffService) {}

  @Post()
  create(@Body() dto: StaffDto) {
    return this.staffService.createStaff(dto);
  }

  @Get()
  findStaff() {
    return this.staffService.findAllStaff();
  }

  @Get(':id')
  finfById(@Param('id') id: string) {
    return this.staffService.findById(id);
  }

  @Patch(':id')
  updateStaff(@Param('id') id: string, updateStaff: StaffDto) {
    return this.staffService.updateStaff(id, updateStaff);
  }

  @Delete(':id')
  deleteStaff(@Param('id') id: string) {
    return this.staffService.deleteStaff(id);
  }
}
