FROM node:20-alpine

WORKDIR /app

# -----------------------------
# Build-time args (ONLY if Next.js needs them during build)
# -----------------------------
ARG NEXT_PUBLIC_CLERK_PUBLISHABLE_KEY
ARG NEXT_PUBLIC_VAPI_ASSISTANT_ID
ARG NEXT_PUBLIC_VAPI_API_KEY

# -----------------------------
# Runtime environment variables
# (Actual values Render pe set hongi)
# -----------------------------
ENV NEXT_PUBLIC_CLERK_PUBLISHABLE_KEY=$NEXT_PUBLIC_CLERK_PUBLISHABLE_KEY
ENV NEXT_PUBLIC_VAPI_ASSISTANT_ID=$NEXT_PUBLIC_VAPI_ASSISTANT_ID
ENV NEXT_PUBLIC_VAPI_API_KEY=$NEXT_PUBLIC_VAPI_API_KEY

# Server-side secrets (NO NEXT_PUBLIC)
ENV RESEND_API_KEY=$RESEND_API_KEY
ENV CLERK_SECRET_KEY=$CLERK_SECRET_KEY
ENV DATABASE_URL=$DATABASE_URL
ENV ADMIN_EMAIL=$ADMIN_EMAIL
ENV NEXT_PUBLIC_APP_URL=$NEXT_PUBLIC_APP_URL

# -----------------------------
# Install dependencies
# -----------------------------
COPY package*.json ./
RUN npm install

# -----------------------------
# Copy source
# -----------------------------
COPY . .

# -----------------------------
# Prisma + Next build
# -----------------------------
RUN npx prisma generate
RUN npm run build

# -----------------------------
# Run app
# -----------------------------
EXPOSE 3000
CMD ["npm", "start"]
