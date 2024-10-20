# https://docs.aws.amazon.com/lambda/latest/dg/python-image.html#python-image-base
# Python 3.12 did not work
FROM public.ecr.aws/lambda/python:3.10  

# Copy requirements.txt
COPY ./helloWorld/requirements.txt ${LAMBDA_TASK_ROOT}

# Install the specified packages
RUN python -m pip install --upgrade pip setuptools
RUN pip install -r requirements.txt --target ${LAMBDA_TASK_ROOT}

# Copy function code
COPY ./helloWorld/app.py ${LAMBDA_TASK_ROOT}

# Set the CMD to your handler (could also be done as a parameter override outside of the Dockerfile)
CMD [ "lambda_function.handler" ]