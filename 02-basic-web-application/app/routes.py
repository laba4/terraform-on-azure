from fastapi import APIRouter, HTTPException

from sqlmodel import select

from db import SessionDep
from models import Hero, HealthStatus

router = APIRouter()


@router.get("/health")
def get_health() -> HealthStatus:
    return HealthStatus(status="ok")


@router.get("/heroes")
def read_heroes(session: SessionDep) -> list[Hero]:
    return list(session.exec(select(Hero)).all())


@router.get("/heroes/{hero_id}")
def read_hero(hero_id: int, session: SessionDep) -> Hero:
    hero = session.get(Hero, hero_id)
    if not hero:
        raise HTTPException(status_code=404, detail="Hero not found")
    return hero


@router.post("/heroes")
def create_hero(hero: Hero, session: SessionDep) -> Hero:
    session.add(hero)
    session.commit()
    session.refresh(hero)
    return hero
