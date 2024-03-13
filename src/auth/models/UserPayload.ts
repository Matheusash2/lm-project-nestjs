export interface UserPayload {
  sub: string;
  userName: string;
  name: string;
  lastName: string;
  createdAt: Date;
  iat?: number;
  exp?: number;
}
