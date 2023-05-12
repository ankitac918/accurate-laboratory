import { Type } from 'class-transformer';
import { IsDateString, ValidateNested } from 'class-validator';
import { SlotTimeDto } from './slotTime.dto';

export class SlotDto {
  @IsDateString()
  date: Date;

  @IsDateString()
  start: Date;

  @IsDateString()
  end: Date;

  @ValidateNested()
  @Type(() => SlotTimeDto)
  Slot_time: SlotTimeDto;
}
