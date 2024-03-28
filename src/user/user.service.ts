import { Injectable } from '@nestjs/common';
import { PrismaService } from 'src/prisma/prisma.service';
import { UserDto } from './dtos/user.dto';
import { User } from './entities/user.entity';
import * as bcrypt from 'bcrypt';
import { EmployeeDto } from './dtos/employee.dto';
import { Employee } from './entities/employee.entity';

@Injectable()
export class UserService {
  constructor(private readonly prisma: PrismaService) {}

  async register(userDto: UserDto): Promise<User> {
    const hashedPassword = await bcrypt.hash(userDto.password, 10);

    const createUser = await this.prisma.user.create({
      data: {
        ...userDto,
        password: hashedPassword,
        employee: {},
      },
    });

    return {
      ...createUser,
      password: undefined,
    };
  }

  async createEmployee(employeeDto: EmployeeDto): Promise<Employee> {
    const create = await this.prisma.employee.create({
      data: {
        ...employeeDto,
        rg: {},
        identification: {},
        contact: {},
        address: {},
      },
    });

    return {
      ...create,
    };
  }

  findUser(userName: string) {
    return this.prisma.user.findUnique({ where: { userName } });
  }

  findUserById(id: string) {
    return this.prisma.user.findUnique({ where: { id } });
  }

  findEmployeeByUserId(userId: string) {
    return this.prisma.employee.findUnique({ where: { userId } });
  }
}
