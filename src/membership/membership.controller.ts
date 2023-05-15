import {
  Controller,
  Post,
  Body,
  Get,
  Param,
  Patch,
  Delete,
} from '@nestjs/common';
import { MembershipService } from './membership.service';
import { MembershipDto } from './dto/membership.dto';

@Controller('membership')
export class MembershipController {
  constructor(private membershipService: MembershipService) {}

  @Post()
  createMembership(@Body() dto: MembershipDto) {
    return this.membershipService.createMembership(dto);
  }

  @Get()
  getAll() {
    return this.membershipService.findAll();
  }

  @Get(':id')
  getById(@Param('id') id: string) {
    return this.membershipService.getById(id);
  }

  @Patch(':id')
  updateMembership(
    @Param('id') id: string,
    @Body() updateMembership: MembershipDto,
  ) {
    return this.membershipService.update(id, updateMembership);
  }

  @Delete(':id')
  deleteMembership(@Param('id') id: string) {
    return this.membershipService.delete(id);
  }
}
