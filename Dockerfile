FROM python:2.7

ENV TERM xterm

RUN apt update \
    && apt upgrade -y \
    && apt install -y build-essential tmux wget zsh vim git less ansible

RUN pip install --upgrade pip \
    && pip install ansible-lint \
    && pip install python-heatclient \
    && pip install python-swiftclient \
    && pip install argparse os_client_config shade \
    && pip install ndg-httpsclient \
    && rm -rf ~/.cache/pip

RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"; exit 0 
RUN git clone --depth=1 https://github.com/amix/vimrc.git ~/.vim_runtime \
    && sh ~/.vim_runtime/install_awesome_vimrc.sh
	
CMD ["zsh"]
