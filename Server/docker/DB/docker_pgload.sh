docker run --rm -it ghcr.io/dimitri/pgloader:3.6.9 \
pgloader  mysql://master:oitmis@192.168.1.109:3306/noteDB \
postgresql://master:oitmis@192.168.1.109:5432/notedb
