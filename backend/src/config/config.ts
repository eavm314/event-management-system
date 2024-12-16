import * as dotenv from 'dotenv';
dotenv.config();

export const env = {
  port: process.env.PORT || 9000,
  environment: process.env.NODE_ENV || 'develop'
};

export const db = {
  url: process.env.DB_URL,
}

export const auth = {
  saltRounds: Number(process.env.PW_SALT_ROUNDS) || 10,
  jwtSecret: process.env.JWT_SECRET || "my_secret",
  jwtExpTime: process.env.JWT_EXP_TIME || "1h",
}

export const files = {
  storagePath: process.env.FILE_STORAGE_PATH
}