import { Injectable } from '@nestjs/common';
import { PrismaService } from 'src/prisma/prisma.service';
import { UserDto } from './dtos/user.dto';
import { User } from './entities/user.entity';
import { Prisma } from '@prisma/client';
import * as bcrypt from 'bcrypt';

@Injectable()
export class UserService {
    constructor(private readonly prisma: PrismaService) { }

    async register(userDto: UserDto): Promise<User> {
        const data: Prisma.UserCreateInput = {
            ...userDto,
            password: await bcrypt.hash(userDto.password, 10),
        };

        const createUser = await this.prisma.user.create({ data })

        return {
            ...createUser,
            password: undefined,
        };
    }

    findUser(userName: string) {
        return this.prisma.user.findUnique({ where: { userName } });
    }

    findUserById(id: string) {
        return this.prisma.user.findUnique({ where: { id } });
    }
}
