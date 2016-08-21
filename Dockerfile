FROM ruby:2.3.1

RUN useradd -m -u 1000 user

COPY xfoil6.97_patch.txt /home/user/xfoil6.97_patch.txt
COPY build.sh /home/user/build.sh
RUN /home/user/build.sh

COPY autoexec.rb /home/user/autoexec.rb
COPY runxfoil.rb /home/user/runxfoil.rb
COPY test.rb /home/user/test.rb
RUN chown user:user /home/user/autoexec.rb /home/user/runxfoil.rb /home/user/test.rb
RUN /home/user/test.rb

USER user
ENTRYPOINT /home/user/autoexec.rb
