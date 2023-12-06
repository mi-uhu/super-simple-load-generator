FROM alpine:latest

ENV DESTINATION_URL not-an-url
ENV REQUEST_INTERVAL 5

RUN apk --no-cache add curl

WORKDIR /app

RUN echo -e '#!/bin/sh\n\
while true; do\n\
  response=$(curl -L $DESTINATION_URL)\n\
  echo "Response: $response"\n\n\
  sleep $REQUEST_INTERVAL\n\
done' > curl_script.sh

RUN chmod +x curl_script.sh
CMD ["./curl_script.sh"]
