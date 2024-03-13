import { Injectable } from '@nestjs/common';
import { MessagesHelper } from './helpers/messages.helper';
import { UserService } from 'src/user/user.service';
import { User } from 'src/user/entities/user.entity';
import * as bcrypt from 'bcrypt';
import { UnauthorizedError } from './errors/unauthorized.error';
import { UserPayload } from './models/UserPayload';
import { JwtService } from '@nestjs/jwt';
import { UserToken } from './models/UserToken';

@Injectable()
export class AuthService {
  constructor(
    private readonly userService: UserService,
    private readonly jwtService: JwtService,
  ) {}

  async login(user: User): Promise<UserToken> {
    const payload: UserPayload = {
      sub: user.id,
      userName: user.userName,
      name: user.name,
      lastName: user.lastName,
      createdAt: user.createdAt,
    };

    const jwtToken = this.jwtService.sign(payload);

    return {
      access_token: jwtToken,
    };
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
