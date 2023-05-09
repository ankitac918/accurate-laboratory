import { Controller, Post } from '@nestjs/common';
import { SlotService } from './slot.service';
import { SlotDto } from './dtos/slot.dto';


@Controller('slot')
export class SlotController {
  constructor(private slotService: SlotService) {}

  @Post()
  addPost(dto: SlotDto) {
    return this.slotService.createSlot(dto);
  }
}
 