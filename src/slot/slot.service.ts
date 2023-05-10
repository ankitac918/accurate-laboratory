import { Injectable } from '@nestjs/common';
import { PrismaService } from '../prisma/prisma.service';
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
