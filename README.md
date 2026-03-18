#### Coffee Commerce DB 설계 및 성능 최적화

---

#### 1. 프로젝트 개요
- **기간**: 2025.11.18 ~ 2025.12.22  
- **인원**: 1명  
- **목표**: DB 설계 + 대용량 환경에서 성능 최적화

#### 2. 수행 역할
- 요구사항 정의 및 ERD 설계 (3NF 정규화)
- Python으로 **1,853만 건 테스트 데이터 생성**
- PostgreSQL `COPY`로 대용량 데이터 적재
- 조회 패턴 기반 **인덱스 설계**

#### 3. 성과
- **18,530,000 rows / 150초 적재**
- 실행 계획 개선: `Seq Scan → Index Scan`
- 성능 개선: **216ms → 0.096ms**


#### 4. 의의
- DB 설계부터 성능 튜닝까지 End-to-End 경험
- 대용량 데이터 기반 인덱스 성능 검증 수행

#### 5. ERD 설계
<img width="750" height="600" alt="image" src="https://github.com/user-attachments/assets/ad5004b8-c7b4-4e63-bc1c-b972da300d40" />
