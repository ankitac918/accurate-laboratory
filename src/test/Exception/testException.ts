import { HttpException, HttpStatus} from '@nestjs/common';


export class TestNotFoundException extends HttpException {
  constructor(msg?: string, status?: HttpStatus) {
    super(msg || 'test not found', status || HttpStatus.BAD_REQUEST);
  }
}
