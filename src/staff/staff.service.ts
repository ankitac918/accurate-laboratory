  import { Injectable } from '@nestjs/common';
import { Prisma } from '@prisma/client';
import { PrismaService } from '../prisma/prisma.service';
import { StaffDto } from './dto/staff.dto';

@Injectable()
export class StaffService {
  constructor(private prisma: PrismaService) {}

  async createStaff(data: Prisma.StaffCreateInput): Promise<any> {
    try {
      const staff = await this.prisma.staff.create({
        data: {
          ...data,
          active: true,
        },
      });
      return staff;
    } catch (error) {
      throw error;
    }
  }

  findAllStaff() {
    return this.prisma.staff.findMany();
  }

  findById(id: string) {
    return this.prisma.staff.findUnique({ where: { id: id } });
  }

  updateStaff(id: string, staff: StaffDto) {
    return this.prisma.staff.update({ where: { id: id }, data: staff });
  }

  deleteStaff(id: string) {
    return this.prisma.staff.delete({ where: { id: id } });
  }
}
