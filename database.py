from sqlalchemy import create_engine, Column, ForeignKey
from sqlalchemy.orm import relationship
from sqlalchemy.types import SmallInteger, VARCHAR, CHAR
from sqlalchemy.dialects.mysql import TINYINT, TINYTEXT
from sqlalchemy.ext.declarative import declarative_base

