import { ForbiddenException, Injectable } from '@nestjs/common';
import { PrismaService } from '../../prisma/prisma.service';
import { PlanDto } from '../dtos/Plan.dto';
import { Prisma, Test } from '@prisma/client';

@Injectable()
export class PlanService {
  constructor(private readonly prisma: PrismaService) {}
  async createPlan(dto: PlanDto) {
    try {
      const plan = this.prisma.plan.create({
        data: {
          test_id: dto.test_id,
          plane_name: dto.plane_name,
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

  deleteplan(id:string){
    return this.prisma.plan.delete({where:{id:id}})
  }
}
