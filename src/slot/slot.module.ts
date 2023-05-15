import { Module } from '@nestjs/common';
import { SlotController } from './slot.controller';
import { SlotService } from './slot.service';
import { SlotTimeController } from './slot-time-controller/slot-time.controller';
import { SlotTimeService } from './slot-time-service/slot-time.service';

@Module({
  controllers: [SlotController,SlotTimeController],
  providers: [SlotService,SlotTimeService]
})
export class SlotModule {}
