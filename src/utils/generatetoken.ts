import jwt from "jsonwebtoken";
import express from "express";

export const generateToken = (userId: string, res: express.Response) => {
  const secretKey = process.env.JWT_SECRET;
  const expiresIn = (process.env.JWT_EXPIRES_IN as any) || "1h";
  const payload = { id: userId };

  if (!secretKey) {
    throw new Error("JWT_SECRET is not set");
  }

  const token = jwt.sign(payload, secretKey, { expiresIn });
  res.cookie("token", token, {
    httpOnly: true,
    secure: process.env.NODE_ENV === "production",
    sameSite: "strict",
    maxAge: 3600000, // 1 hour in milliseconds
  });
  return token;
};
