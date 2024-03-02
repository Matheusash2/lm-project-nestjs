import { Injectable } from '@nestjs/common';
import { PrismaService } from 'src/prisma/prisma.service';
import { RegisterUserDto } from './dtos/register.dto';
import { User } from './entities/user.entity';
import { Prisma } from '@prisma/client';
import * as bcrypt from 'bcrypt';

@Injectable()
export class UserService {
    constructor(private readonly prisma: PrismaService) { }

    async register(registerUserDto: RegisterUserDto): Promise<User> {
        const data: Prisma.registerCreateInput = {
            ...registerUserDto,
            password: await bcrypt.hash(registerUserDto.password, 10),
        };

        const createUser = await this.prisma.register.create({ data })

        return {
            ...createUser,
            password: undefined,
        };
    }

    findUser(userName: string) {
        return this.prisma.register.findUnique({ where: { userName } });
    }

    findUserById(id: string) {
        return this.prisma.register.findUnique({ where: { id } });
    }
}
