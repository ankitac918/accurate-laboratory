import { Body, Controller, Get, Post, Param, Patch } from '@nestjs/common';
import { MembersService } from '../membersService/members.service';
import { MembersDto } from '../dtos/members.dto';
import { MemberNotFoundException } from '../exception/memeberException';

@Controller('members')
export class MemberesController {
  constructor(private memberService: MembersService) {}

  @Post()
  createMemebers(@Body() dto: MembersDto) {
    return this.memberService.createMember(dto);
  }

  @Get()
  async findAll() {
    const findAllMembers = await this.memberService.findAll();
    if (findAllMembers !== null) return findAllMembers;
    else throw new MemberNotFoundException();
  }

  @Get(':id')
  async findById(@Param('id') id: string) {
    const findMemberById = await this.memberService.findById(id);
    if (findMemberById != null) return findMemberById;
    else throw new MemberNotFoundException();
  }

  @Patch(':id')
  async updateMember(
    @Param('id') id: string,
    @Body() updateMember: MembersDto,
  ) {
    const update = await this.memberService.update(id, updateMember);
    if (update != null) return update;
    else throw new MemberNotFoundException();
  }
}
