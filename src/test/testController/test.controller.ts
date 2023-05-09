import {
  Controller,
  Param,
  Body,
  Post,
  Get,
  Delete,
  Put,
  Patch,
} from '@nestjs/common';
import { TestDto } from '../dtos/Test.dto';
import { TestService } from '../testService/test.service';
import { UUID } from 'crypto';
import { TestNotFoundException } from '../Exception/testException';
import { test } from '@prisma/client';

@Controller('test')
export class TestController {
  constructor(private testService: TestService) {}
  @Post()
  addTest(@Body() dto: test) {
    return this.testService.createTest(dto);
  }

  @Get()
  findAllTest() {
    const getTest = this.testService.findAllTest();
    if (getTest != null) return getTest;
    else throw new TestNotFoundException();
  }

  @Get(':id')
  getData(@Param('id') id: UUID) {
    const getDataBtId = this.testService.getData(id);
    if (getDataBtId != null) return getDataBtId;
    else throw new TestNotFoundException();
  }

  @Patch(':id')
  updateTest(@Param('id') id: string, @Body() updateTest: TestDto) {
    const update = this.testService.updatetest(id, updateTest);
    if (update != null) return update;
    else throw new TestNotFoundException();
  }

  @Delete(':id')
  deleteData(@Param('id') id: string) {
    return this.testService.deleteData(id);
  }
}
