
# Use a specific version for stability
FROM node:25-alpine3

# Create the working directory
WORKDIR /app

# 1. Copy ONLY dependency files first (for efficient layer caching)
COPY package.json yarn.lock ./

# 2. Install production dependencies only
RUN yarn install --production

# 3. Copy the rest of the source code
COPY . .

# 4. Security: Switch to the non-privileged 'node' user
USER node

EXPOSE 3000

CMD ["node", "src/index.js"]