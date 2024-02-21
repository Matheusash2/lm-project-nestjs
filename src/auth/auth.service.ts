import { Injectable } from '@nestjs/common';
import { MessagesHelper } from './helpers/messages.helper';
import { UserService } from 'src/user/user.service';
import { User } from 'src/user/entities/user.entity';
import * as bcrypt from 'bcrypt';
import { UnauthorizedError } from './errors/unauthorized.error';

@Injectable()
export class AuthService {
  constructor(private readonly userService: UserService) {}
  async login() {
    return MessagesHelper.AUTH_LOGIN_SUCCESS;
  }

  async validateUser(userName: string, password: string): Promise<User> {
    const user = await this.userService.findUser(userName);

    if (user) {
      const isPasswordValid = await bcrypt.compare(password, user.password);

      if (isPasswordValid) {
        return { ...user, password: undefined };
      }
    }

    throw new UnauthorizedError(
      MessagesHelper.AUTH_PASSWORD_OR_LOGIN_NOT_FOUND,
    );
  }
}
