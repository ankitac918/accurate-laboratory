import { Controller, Post } from '@nestjs/common';
import { SlotTimeService } from '../slot-time-service/slot-time.service';
import { SlotTimeDto } from '../dtos/slotTime.dto';
import { SlotTime } from '@prisma/client';

@Controller('slot-time')
export class SlotTimeController {
  constructor(private slotTimeService: SlotTimeService) {}

  @Post()
  createSlotTime(dto: SlotTime) {
    return this.slotTimeService.createSlotTime(dto);
  }
}
