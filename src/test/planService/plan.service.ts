import { ForbiddenException, Injectable } from '@nestjs/common';
import { PrismaService } from 'src/prisma/prisma.service';
import { PlanDto } from '../dtos/Plan.dto';
import { Prisma, test } from '@prisma/client';

@Injectable()
export class PlanService {
  constructor(private readonly prisma: PrismaService) {}
  async createPlan(dto: PlanDto) {
    try {
      const plan = this.prisma.plan.create({
        data: {
          testId: dto.testsId,
          planeName: dto.planeName,
          price: dto.price,
        },
      });
      return plan;
    } catch (error) {
      if (error instanceof Prisma.PrismaClientKnownRequestError) {
        if (error.code === 'P2002') {
          throw new ForbiddenException('Credentials taken');
        }
      }
      throw error;
    }
  }

  getPlan() {
    return this.prisma.plan.findMany();
  }
}
