import { Injectable } from '@nestjs/common';
import { PrismaService } from '../prisma/prisma.service';
import { Prisma } from '@prisma/client';
import { memberPlanDto } from './dto/memberPlan.dto';

@Injectable()
export class MemberPlanService {
  constructor(private prisma: PrismaService) {}

  async createMemberPlan(data: Prisma.MemberPlanCreateInput) {
    const memberPlan = await this.prisma.memberPlan.create({
      data: {
        ...data,
        active: true,
      },
    });
    return memberPlan;
  }

  findAll() {
    return this.prisma.memberPlan.findMany();
  }

  findByid(id: string) {
    return this.prisma.memberPlan.findUnique({ where: { id: id } });
  }

  update(id: string, dto: memberPlanDto) {
    return this.prisma.memberPlan.update({
      where: { id: id },
      data: dto,
    });
  }
}
