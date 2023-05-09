import { Injectable } from '@nestjs/common';
import { PrismaService } from 'src/prisma/prisma.service';
import { SlotTimeDto } from '../dtos/slotTime.dto';
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
