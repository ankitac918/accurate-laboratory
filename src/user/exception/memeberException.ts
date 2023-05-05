import { HttpException, HttpStatus, UseFilters } from '@nestjs/common';


export class MemberNotFoundException extends HttpException {
  constructor(msg?: string, status?: HttpStatus) {
    super(msg || 'member not found', status || HttpStatus.BAD_REQUEST);
  }
}
