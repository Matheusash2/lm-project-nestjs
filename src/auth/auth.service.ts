import { BadRequestException, Injectable } from '@nestjs/common';
import { LoginDto } from './dtos/login.dto';
import { MessagesHelper } from './helpers/messages.helper';

@Injectable()
export class AuthService {
  login(dto: LoginDto) {
    if (dto.login !== 'teste@email.com' || dto.password !== 'teste@123') {
      throw new BadRequestException(
        MessagesHelper.AUTH_PASSWORD_OR_LOGIN_NOT_FOUND,
      );
    }
    return MessagesHelper.AUTH_LOGIN_SUCCESS;
  }
}
