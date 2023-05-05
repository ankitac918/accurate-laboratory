import { Injectable } from '@nestjs/common';
import { PrismaService } from 'src/prisma/prisma.service';

@Injectable()
export class StaffService {
  constructor(private prisma: PrismaService) {}

  async createStaff(data): Promise<any> {
    try {
      const staff = await this.prisma.staff.create({
        data,
      });
      return staff;
    } catch (error) {
      throw error;
    }
  }
}
