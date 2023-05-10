import { Injectable } from '@nestjs/common';
import { PrismaService } from '../../prisma/prisma.service';
import { SlotTime } from '.prisma/client';

@Injectable()
export class SlotTimeService {
  constructor(private prisma: PrismaService) {}

  async createSlotTime(dto: SlotTime) {
    const slotTime = this.prisma.slotTime.create({
      data:{
        ...dto
      }
    });
    return slotTime;
  }
}
