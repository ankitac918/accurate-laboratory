import { Injectable } from '@nestjs/common';
import { Prisma } from '@prisma/client';
import { PrismaService } from 'src/prisma/prisma.service';
import { SlotDto } from './dtos/slot.dto';

@Injectable()
export class SlotService {
  constructor(private prisma: PrismaService) {}

  async createSlot(dto: SlotDto) {
    const slot = this.prisma.slot.create({
      data: {
        date: dto.date,
        start: dto.start,
        end: dto.end,
      },
    });
    return slot;
  }
}
