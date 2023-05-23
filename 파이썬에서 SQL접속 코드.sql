-- 파이썬에서 SQL 접속 코드--
import cx_Oracle 
Import dbconn
-- 데이터베이스 연결 정보
host = "local host"
port = 1521
sid = "xe"
username = "innbum"
password = "innbum"

-- 데이터베이스 연결 생성
dsn = cx_Oracle.makedsn(host, port, sid=sid)
print(dsn)
CONNECTION = cs_Oracle.connect(username, password, dsn)

-- 데이터베이스 연결 테스트
print(f"연결된 버전은 {connection.version}")

If __name__ == '__main__":
-- 쿼리 실행
Connection = dbconnection();
CURSOR = CONNECTION.cursor()
CURSOR.execute("SELECT * FROM 테이블명")
RESULT = CURSOR.fetchall()

-- 결과 출력
FOR ROW IN RESULT:
print(row)

-- 코렙에서는 안됌



터미널에서

conda activate 사용자
conda install pip
bin/pip install oracledb

진행하시고
import oracledb as cx_Oracle

connection = cx_Oracle.connect(user=username, password=password, dsn=dsn)

수정하시고 오류 생기면

dsn = cx_Oracle.makedsn(host, port, service_name=sid)



!pip install cx_Oracle
!pip install sqlalchemy

from sqlalchemy import create_engine

# Oracle 접속 정보
USERNAME = 'SYSTEM'
PASSWORD = 'admin'
HOST = 'localhost'
PORT = '1521'
SERVICE = 'orcl'

# 접속 URL 생성
url = f'oracle+cx_oracle://{USERNAME}:{PASSWORD}@{HOST}:{PORT}/{SERVICE}'

# 엔진 생성
engine = create_engine(url)

# 쿼리 실행
df = pd.read_sql('SELECT * FROM book', engine)

# 출력
print(df)
