# Specify Base Image
FROM docker.io/node:18-alpine

# Work Directory
WORKDIR /usr/app

#copy pkg.json to container
COPY ./package.json ./
# Install Dependencies
RUN npm install

#remaining files to container
COPY ./ ./
# Startup Command
CMD ["npm", "start"]