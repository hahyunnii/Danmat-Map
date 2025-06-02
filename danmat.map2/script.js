// 식당 데이터 (예시)
let restaurantData = []; // 서버에서 가져올 데이터로 변경

// 카카오맵 API 키
const KAKAO_API_KEY = 'e627fd1253b1591fc15b125faae850e3';

// 사용 가능한 모든 태그 (카테고리)
const allTags = [
  // 음식 종류
  { value: '한식', type: 'foodtype' },
  { value: '중식', type: 'foodtype' },
  { value: '일식', type: 'foodtype' },
  { value: '양식', type: 'foodtype' },
  { value: '아시안', type: 'foodtype' },
  { value: '기타', type: 'foodtype' },
  { value: '분식', type: 'foodtype' },
  
  // 특징
  { value: '혼밥하기 좋은', type: 'feature' },
  { value: '늦은 저녁 식사 가능', type: 'feature' },
  { value: '이른 아침 식사 가능', type: 'feature' },
  { value: '단체 식사 가능', type: 'feature' },
  { value: '단체 포장/예약 가능', type: 'feature' },
  { value: '가성비 좋은', type: 'feature' },
  { value: '주류도 판매하는', type: 'feature' },
  { value: '토요일 영업하는', type: 'feature' },
  { value: '일요일 영업하는', type: 'feature' },
  
  // 카페 태그
  { value: '카페', type: 'type' },
  { value: '카공하기 좋은', type: 'cafe' },
  { value: '팀플하기 좋은', type: 'cafe' },
  
  // 주점 태그
  { value: '단체 모임하기 좋은', type: 'bar' },
  { value: '안주가 맛있는', type: 'bar' }
];

// 다국어 지원을 위한 번역 데이터
const translations = {
  // 영어 번역
  en: {
    // 페이지 요소
    '단맛지도': 'DanMat Map',
    '식당이나 태그 검색...': 'Search restaurants or tags...',
    '카테고리 필터:': 'Category Filter:',
    '태그 선택': 'Select tags',
    '검색 결과가 없습니다': 'No search results',
    '카테고리 메뉴': 'Category Menu',
    '오늘의 추천 맛집': 'Today\'s Recommended Restaurant',
    '다른 가게 추천받기': 'Get Another Recommendation',
    
    // 카테고리 메뉴
    '음식점': 'Restaurants',
    '카페': 'Cafes',
    '주점': 'Bars',
    '전체보기': 'View All',
    '랜덤추천': 'Random',
    '태그 필터': 'Tag Filters',
    '태그로 찾기': 'Find by Tags',
    '식당': 'Restaurants',
    '식당 종류': 'Restaurant Types',
    '특징': 'Features',
    '음식 종류': 'Food Types',
    '가격대': 'Price Range',
    '편의시설': 'Amenities',
    '기타 필터': 'Other Filters',
    '좌석 타입': 'Seating Types',
    '모두 보기': 'Show All',
    '영업 시간': 'Business Hours',
    '다른 추천': 'Try Another',
    '랜덤 추천': 'Random Recommendation',
    '닫기': 'Close',
    '가게 추천': 'Recommend',
    
    // 태그 번역
    '한식': 'Korean Food',
    '중식': 'Chinese Food',
    '일식': 'Japanese Food',
    '양식': 'Western Food',
    '아시안': 'Asian Food',
    '기타': 'Others',
    '카페': 'Cafe',
    '혼밥하기 좋은': 'Good for Solo Dining',
    '늦은 저녁 식사 가능': 'Late Night Dining',
    '이른 아침 식사 가능': 'Early Morning Dining',
    '단체 식사 가능': 'Group Dining Available',
    '단체 포장/예약 가능': 'Group Take-out/Reservation',
    '가성비 좋은': 'Good Value',
    '주류도 판매하는': 'Serves Alcohol',
    '토요일 영업하는': 'Open on Saturday',
    '일요일 영업하는': 'Open on Sunday',
    '카공하기 좋은': 'Good for Study',
    '팀플하기 좋은': 'Good for Team Projects',
    '단체 모임하기 좋은': 'Good for Group Meetings',
    '안주가 맛있는': 'Good Snacks',
    '분식': 'Korean Snacks',
    
    // 식당 이름
    '맛있는 한식당': 'Delicious Korean Restaurant',
    '카페 단맛': 'Sweet Cafe',
    '중화요리집': 'Chinese Restaurant',
    '스시 명가': 'Sushi House',
    '카페 공부': 'Study Cafe'
  },
  
  // 일본어 번역
  ja: {
    // 페이지 요소
    '단맛지도': 'ダンマット地図',
    '식당이나 태그 검색...': 'レストランやタグを検索...',
    '카테고리 필터:': 'カテゴリフィルター:',
    '태그 선택': 'タグを選択',
    '검색 결과가 없습니다': '検索結果がありません',
    '카테고리 메뉴': 'カテゴリメニュー',
    '오늘のおすすめレストラン': '今日のおすすめレストラン',
    '別のお店を推薦': '別のお店を推薦',
    
    // 카테고리 메뉴
    '음식점': 'レストラン',
    '카페': 'カフェ',
    '주점': '居酒屋',
    '전체보기': '全て見る',
    '랜덤추천': 'ランダム',
    '태그 필터': 'タグフィルター',
    '태그로 찾기': 'タグで検索',
    '식당': 'レストラン',
    '식당 종류': 'レストランの種類',
    '특징': '特徴',
    '음식 종류': '料理の種類',
    '가격대': '価格帯',
    '편의시설': '施設',
    '기타 필터': 'その他のフィルター',
    '좌석 타입': '座席タイプ',
    '모두 보기': '全て表示',
    '영업 시간': '営業時間',
    '다른 추천': '別のおすすめ',
    'ランダムおすすめ': 'ランダムおすすめ',
    '閉じる': '閉じる',
    'おすすめ': 'おすすめ',
    
    // 태그 번역
    '한식': '韓国料理',
    '중식': '中華料理',
    '일식': '日本料理',
    '양식': '洋食',
    '아시안': 'アジア料理',
    '기타': 'その他',
    '카페': 'カフェ',
    '혼밥하기 좋은': '一人で食べるのに良い',
    '遅い夕食可能': '遅い夕食可能',
    '早朝食事可能': '早朝食事可能',
    '団体食事可能': '団体食事可能',
    '団体テイクアウト/予約可能': '団体テイクアウト/予約可能',
    'コスパが良い': 'コスパが良い',
    'お酒も販売': 'お酒も販売',
    '土曜営業': '土曜営業',
    '日曜営業': '日曜営業',
    '勉強に良い': '勉強に良い',
    'チームプロジェクトに良い': 'チームプロジェクトに良い',
    '団体会合に良い': '団体会合に良い',
    '美味しいおつまみ': '美味しいおつまみ',
    '韓国ファストフード': '韓国ファストフード',
    
    // 식당 이름
    '美味しい韓国料理店': '美味しい韓国料理店',
    'カフェ甘味': 'カフェ甘味',
    '中華料理店': '中華料理店',
    '寿司の名店': '寿司の名店',
    '勉強カフェ': '勉強カフェ'
  },
  
  // 중국어 번역
  zh: {
    // 페이지 요소
    '단맛지도': '丹麦地图',
    '식당이나 태그 검색...': '搜索餐厅或标签...',
    '카테고리 필터:': '类别筛选:',
    '태그 선택': '选择标签',
    '검색 결과가 없습니다': '没有搜索结果',
    '类别菜单': '类别菜单',
    '今日推荐餐厅': '今日推荐餐厅',
    '获取另一个推荐': '获取另一个推荐',
    
    // 카테고리 메뉴
    '음식점': '餐厅',
    '카페': '咖啡厅',
    '주점': '酒吧',
    '전체보기': '查看全部',
    '随机推荐': '随机推荐',
    '标签筛选': '标签筛选',
    '按标签查找': '按标签查找',
    '餐厅': '餐厅',
    '餐厅类型': '餐厅类型',
    '特点': '特点',
    '食物类型': '食物类型',
    '价格范围': '价格范围',
    '设施': '设施',
    '其他筛选': '其他筛选',
    '座位类型': '座位类型',
    '显示全部': '显示全部',
    '营业时间': '营业时间',
    '换一个推荐': '换一个推荐',
    '随机推荐': '随机推荐',
    '关闭': '关闭',
    '推荐': '推荐',
    
    // 태그 번역
    '韩国料理': '韩国料理',
    '中国料理': '中国料理',
    '日本料理': '日本料理',
    '西餐': '西餐',
    '亚洲料理': '亚洲料理',
    '其他': '其他',
    '咖啡厅': '咖啡厅',
    '适合独自用餐': '适合独自用餐',
    '可晚餐': '可晚餐',
    '可早餐': '可早餐',
    '可团体用餐': '可团体用餐',
    '可团体打包/预约': '可团体打包/预约',
    '性价比高': '性价比高',
    '提供酒类': '提供酒类',
    '周六营业': '周六营业',
    '周日营业': '周日营业',
    '适合学习': '适合学习',
    '适合团队项目': '适合团队项目',
    '适合团体聚会': '适合团体聚会',
    '小吃可口': '小吃可口',
    '韩式小吃': '韩式小吃',
    
    // 식당 이름
    '美味韩国餐厅': '美味韩国餐厅',
    '甜味咖啡厅': '甜味咖啡厅',
    '中华料理店': '中华料理店',
    '寿司名家': '寿司名家',
    '学习咖啡厅': '学习咖啡厅'
  }
};

// 현재 선택된 언어 (기본값: 한국어)
let currentLang = 'ko';

// 검색을 위한 데이터 소스 생성
const searchData = [
  // 식당 이름을 데이터 소스에 추가
  ...restaurantData.map(place => ({
    value: place.name,
    type: 'restaurant',
    id: place.id
  })),
  
  // 태그를 데이터 소스에 추가
  ...allTags.map(tag => ({
    value: tag.value,
    type: 'tag',
    tagType: tag.type
  }))
];

// 전역 변수
let map;
let markers = [];
let tagify;
let autoCompleteJS;
let selectedTags = []; // 선택된 태그 저장 배열
let currentCategory = 'restaurant'; // 현재 선택된 카테고리 (기본값: 음식점)

window.onload = function () {
  // 서버에서 식당 데이터 가져오기
  fetchRestaurantData();
  // 다른 초기화 함수들은 fetchRestaurantData 내부에서 호출됩니다.
};

// 서버에서 식당 데이터 가져오기
async function fetchRestaurantData() {
  try {
    // 로딩 애니메이션 표시
    showLoading();
    
    const response = await fetch('http://localhost:8080/restaurants');
    const data = await response.json();
    
    // 모든 주소를 좌표로 변환하는 Promise 배열 생성
    const geocodePromises = data.map((restaurant) => {
      return new Promise((resolve) => {
        if (!restaurant.address || restaurant.address.trim() === '') {
          // 주소가 없는 경우 기본 좌표 사용
          console.warn(`주소 정보 없음: ${restaurant.title}`);
          resolve({
            ...restaurant,
            latitude: "37.321877",
            longitude: "127.126899"
          });
          return;
        }
        
        // REST API로 주소 검색
        geocodeAddress(restaurant.address)
          .then(result => {
            if (result) {
              resolve({
                ...restaurant,
                latitude: result.y,
                longitude: result.x
              });
            } else {
              // 좌표 변환 실패 시 기본 좌표 사용
              console.warn(`주소 변환 실패: ${restaurant.address}`);
              resolve({
                ...restaurant,
                latitude: "37.321877",
                longitude: "127.126899"
              });
            }
          })
          .catch(error => {
            console.error(`주소 변환 중 오류: ${restaurant.address}`, error);
            resolve({
              ...restaurant,
              latitude: "37.321877",
              longitude: "127.126899"
            });
          });
      });
    });
    
    // 모든 주소 변환이 완료될 때까지 기다림
    const geocodedData = await Promise.all(geocodePromises);
    
    // 받아온 데이터를 마커 표시에 적합한 형태로 변환
    restaurantData = geocodedData.map(restaurant => {
      // 서버에서 받은 카테고리 값을 영문 카테고리로 매핑
      let category = 'restaurant'; // 기본값
      
      // restaurant.category 값에 따라 적절한 영문 카테고리 설정
      if (restaurant.category) {
        switch(restaurant.category) {
          case '음식점':
            category = 'restaurant';
            break;
          case '카페':
            category = 'cafe';
            break;
          case '주점':
            category = 'bar';
            break;
          case '기타':
            category = 'other';
            break;
          default:
            category = 'restaurant';
        }
      }
      
      return {
        id: restaurant.id,
        name: restaurant.title,
        position: new kakao.maps.LatLng(parseFloat(restaurant.latitude), parseFloat(restaurant.longitude)),
        tags: restaurant.tags,
        category: category,
        menu: restaurant.menu,
        address: restaurant.address,
        imageUrl: restaurant.imageUrl,
        status: restaurant.status,
        // 다국어 번역 필드 추가
        titleEn: restaurant.titleEn,
        titleJa: restaurant.titleJa, 
        titleZh: restaurant.titleZh,
        menuEn: restaurant.menuEn,
        menuJa: restaurant.menuJa,
        menuZh: restaurant.menuZh
      };
    });
    
    console.log('변환된 식당 데이터:', restaurantData);
    
    // 데이터를 가져온 후 지도 초기화 및 기타 초기화 작업 수행
    initMap();
    initTagify();
    initAutoComplete();
    initLanguageSelector();
    initCategoryMenu();
    initButtonEvents();
    
    // 로딩 애니메이션 숨기기
    hideLoading();
  } catch (error) {
    console.error('데이터를 가져오는 중 오류 발생:', error);
    alert('서버에서 데이터를 가져오는데 실패했습니다.');
    hideLoading();
  }
}



// REST API를 이용한 주소 -> 좌표 변환
async function geocodeAddress(address) {
  try {
    const response = await fetch(`https://dapi.kakao.com/v2/local/search/address.json?query=${encodeURIComponent(address)}`, {
      headers: {
        'Authorization': `KakaoAK ${KAKAO_API_KEY}`
      }
    });
    
    if (!response.ok) {
      throw new Error(`HTTP error! Status: ${response.status}`);
    }
    
    const data = await response.json();
    
    if (data.documents && data.documents.length > 0) {
      // 첫 번째 결과 사용
      const location = data.documents[0].address || data.documents[0].road_address;
      if (location) {
        return {
          x: location.x,  // 경도 (longitude)
          y: location.y   // 위도 (latitude)
        };
      }
    }
    
    return null;
  } catch (error) {
    console.error('좌표 변환 API 오류:', error);
    return null;
  }
}

// 로딩 애니메이션 표시
function showLoading() {
  // 이미 로딩 요소가 있는지 확인
  let loadingEl = document.getElementById('loading-animation');
  
  // 없으면 생성
  if (!loadingEl) {
    loadingEl = document.createElement('div');
    loadingEl.id = 'loading-animation';
    loadingEl.innerHTML = `
      <div class="loading-spinner"></div>
      <p>데이터를 불러오는 중...</p>
    `;
    loadingEl.style.position = 'fixed';
    loadingEl.style.top = '0';
    loadingEl.style.left = '0';
    loadingEl.style.width = '100%';
    loadingEl.style.height = '100%';
    loadingEl.style.backgroundColor = 'rgba(255, 255, 255, 0.8)';
    loadingEl.style.display = 'flex';
    loadingEl.style.flexDirection = 'column';
    loadingEl.style.alignItems = 'center';
    loadingEl.style.justifyContent = 'center';
    loadingEl.style.zIndex = '9999';
    
    // 스피너 스타일
    const style = document.createElement('style');
    style.textContent = `
      .loading-spinner {
        width: 50px;
        height: 50px;
        border: 5px solid #f3f3f3;
        border-top: 5px solid #ff8a65;
        border-radius: 50%;
        animation: spin 1s linear infinite;
        margin-bottom: 15px;
      }
      
      @keyframes spin {
        0% { transform: rotate(0deg); }
        100% { transform: rotate(360deg); }
      }
    `;
    
    document.head.appendChild(style);
    document.body.appendChild(loadingEl);
  } else {
    loadingEl.style.display = 'flex';
  }
}

// 로딩 애니메이션 숨기기
function hideLoading() {
  const loadingEl = document.getElementById('loading-animation');
  if (loadingEl) {
    loadingEl.style.display = 'none';
  }
}

// 지도 초기화
function initMap() {
  const container = document.getElementById('map');
  const options = {
    center: new kakao.maps.LatLng(37.321877, 127.126899), // 단국대 죽전캠퍼스
    level: 3
  };

  map = new kakao.maps.Map(container, options);

  // 단국대 주변 범위 제한
  const bounds = new kakao.maps.LatLngBounds(
    new kakao.maps.LatLng(37.318, 127.122), // 남서
    new kakao.maps.LatLng(37.325, 127.131)  // 북동
  );
  map.setBounds(bounds);
  
  // 초기에 모든 항목 표시 (필터링 없이)
  restaurantData.forEach(place => {
    addMarker(place);
  });
}

// 카테고리 메뉴 초기화
function initCategoryMenu() {
  // 초기 카테고리 설정 (기본값: 음식점)
  setActiveCategory('restaurant');
  
  // 메인 카테고리 버튼 이벤트
  const mainCategoryBtns = document.querySelectorAll('.main-category-btn');
  mainCategoryBtns.forEach(btn => {
    btn.addEventListener('click', function() {
      const category = this.dataset.category;
      setActiveCategory(category);
      
      // 해당 카테고리의 모든 항목 표시
      clearMarkers();
      
      // 선택된 카테고리에 해당하는 장소만 필터링
      const filteredPlaces = restaurantData.filter(place => place.category === category);
      
      console.log(`${category} 카테고리 필터링:`, filteredPlaces);
      
      // 필터링된 장소에 마커 표시
      filteredPlaces.forEach(place => {
        addMarker(place);
      });
      
      // 지도 범위 재설정
      if (filteredPlaces.length > 0) {
        const bounds = new kakao.maps.LatLngBounds();
        filteredPlaces.forEach(place => bounds.extend(place.position));
        map.setBounds(bounds);
      }
    });
  });
  
  // 모든 카테고리 그룹 표시
  document.querySelectorAll('.category-group').forEach(group => {
    group.classList.add('active');
  });
  
  // 모든 카테고리 메뉴 표시
  document.querySelectorAll('.category-children').forEach(menu => {
    menu.classList.add('active');
  });
  
  // 카테고리 토글 버튼 이벤트
  const categoryToggle = document.querySelector('.category-toggle');
  const sidebar = document.querySelector('.category-sidebar');
  
  categoryToggle.addEventListener('click', function() {
    sidebar.classList.toggle('active');
    
    // 백드롭 생성 및 이벤트 추가 (모바일)
    let backdrop = document.querySelector('.sidebar-backdrop');
    if (!backdrop) {
      backdrop = document.createElement('div');
      backdrop.className = 'sidebar-backdrop';
      document.body.appendChild(backdrop);
      
      backdrop.addEventListener('click', function() {
        sidebar.classList.remove('active');
        backdrop.classList.remove('active');
      });
    }
    
    if (sidebar.classList.contains('active')) {
      backdrop.classList.add('active');
    } else {
      backdrop.classList.remove('active');
    }
  });
  
  // 부모 카테고리 토글
  const categoryParents = document.querySelectorAll('.category-parent');
  categoryParents.forEach(parent => {
    parent.addEventListener('click', function() {
      const childrenId = this.dataset.category + '-menu';
      const children = document.getElementById(childrenId);
      
      // 토글 상태 변경
      const isExpanded = this.getAttribute('aria-expanded') === 'true';
      this.setAttribute('aria-expanded', !isExpanded);
      
      // 토글 아이콘 방향 변경
      const toggleIcon = this.querySelector('.toggle-icon');
      if (toggleIcon) {
        toggleIcon.textContent = isExpanded ? '▸' : '▾';
      }
      
      // 자식 요소 토글
      children.classList.toggle('active');
    });
    
    // 기본적으로 펼쳐놓기
    parent.setAttribute('aria-expanded', 'true');
    const childrenId = parent.dataset.category + '-menu';
    document.getElementById(childrenId).classList.add('active');
    
    // 토글 아이콘 추가 (없는 경우)
    if (!parent.querySelector('.toggle-icon')) {
      const toggleIcon = document.createElement('span');
      toggleIcon.className = 'toggle-icon';
      toggleIcon.textContent = '▾'; // 기본적으로 펼쳐진 상태
      toggleIcon.style.marginLeft = '5px';
      parent.appendChild(toggleIcon);
    }
  });
  
  // 서브카테고리 토글
  const subcategoryParents = document.querySelectorAll('.subcategory-parent');
  subcategoryParents.forEach(parent => {
    parent.addEventListener('click', function() {
      const childrenId = this.dataset.subcategory + '-menu';
      const children = document.getElementById(childrenId);
      
      // 토글 상태 변경
      const isExpanded = this.getAttribute('aria-expanded') === 'true';
      this.setAttribute('aria-expanded', !isExpanded);
      
      // 토글 아이콘 방향 변경
      const toggleIcon = this.querySelector('.toggle-icon');
      if (toggleIcon) {
        toggleIcon.textContent = isExpanded ? '▸' : '▾';
      }
      
      // 자식 요소 토글
      children.classList.toggle('active');
    });
    
    // 기본적으로 펼쳐놓기
    parent.setAttribute('aria-expanded', 'true');
    const childrenId = parent.dataset.subcategory + '-menu';
    document.getElementById(childrenId).classList.add('active');
    
    // 토글 아이콘 추가 (없는 경우)
    if (!parent.querySelector('.toggle-icon')) {
      const toggleIcon = document.createElement('span');
      toggleIcon.className = 'toggle-icon';
      toggleIcon.textContent = '▾'; // 기본적으로 펼쳐진 상태
      toggleIcon.style.marginLeft = '5px';
      parent.appendChild(toggleIcon);
    }
  });
  
  // 체크박스 필터 이벤트
  const checkboxes = document.querySelectorAll('.filter-item input[type="checkbox"]');
  checkboxes.forEach(checkbox => {
    checkbox.addEventListener('change', function() {
      const tag = this.dataset.tag;
      
      if (this.checked) {
        // 체크된 경우 태그 추가
        if (!selectedTags.includes(tag)) {
          selectedTags.push(tag);
          tagify.addTags([tag]); // tagify에도 추가
        }
      } else {
        // 체크 해제된 경우 태그 제거
        const index = selectedTags.indexOf(tag);
        if (index > -1) {
          selectedTags.splice(index, 1);
          
          // tagify에서도 제거
          const tagifyValues = tagify.value.filter(tagObj => tagObj.value !== tag);
          tagify.loadOriginalValues(tagifyValues.map(tagObj => tagObj.value));
        }
      }
      
      // 선택된 태그로 필터링 (체크박스 변경 시에는 태그로 필터링하지 않음)
      // filterRestaurants(selectedTags);
    });
  });
}

// 버튼 이벤트 초기화
function initButtonEvents() {
  // 랜덤 가게 추천 버튼
  const randomBtn = document.getElementById('random-place-btn');
  const modal = document.getElementById('random-modal');
  const closeBtn = document.querySelector('.close-btn');
  const tryAnotherBtn = document.getElementById('try-another-btn');
  
  // 랜덤 가게 추천 버튼 클릭
  randomBtn.addEventListener('click', function() {
    showRandomPlace();
    modal.classList.add('active');
  });
  
  // 모달 닫기 버튼
  closeBtn.addEventListener('click', function() {
    modal.classList.remove('active');
  });
  
  // 다른 가게 추천받기 버튼
  tryAnotherBtn.addEventListener('click', function() {
    showRandomPlace();
  });
  
  // 모달 바깥 클릭 시 닫기
  window.addEventListener('click', function(event) {
    if (event.target === modal) {
      modal.classList.remove('active');
    }
  });
  
  // 모두 보기 버튼
  const showAllBtn = document.getElementById('show-all-btn');
  showAllBtn.addEventListener('click', function() {
    // 현재 선택된 카테고리의 모든 항목 표시
    clearMarkers();
    
    // 선택된 카테고리에 해당하는 장소만 필터링
    const filteredPlaces = restaurantData.filter(place => place.category === currentCategory);
    
    // 필터링된 장소에 마커 표시
    filteredPlaces.forEach(place => {
      addMarker(place);
    });
    
    // 지도 범위 재설정
    if (filteredPlaces.length > 0) {
      const bounds = new kakao.maps.LatLngBounds();
      filteredPlaces.forEach(place => bounds.extend(place.position));
      map.setBounds(bounds);
    }
  });
}

// 활성 카테고리 설정
function setActiveCategory(category) {
  currentCategory = category;
  
  // 모든 메인 카테고리 버튼 비활성화
  document.querySelectorAll('.main-category-btn').forEach(btn => {
    btn.classList.remove('active');
  });
  
  // 선택된 메인 카테고리 버튼 활성화
  document.querySelector(`.main-category-btn[data-category="${category}"]`).classList.add('active');
  
  // 모든 카테고리 그룹 표시
  document.querySelectorAll('.category-group').forEach(group => {
    group.classList.add('active');
  });
}

// 카테고리별 필터링
function filterByCategory(category) {
  clearMarkers();
  
  // 전체 목록 표시
  restaurantData.forEach(place => {
    addMarker(place);
  });
  
  // 지도 범위 재설정
  const bounds = new kakao.maps.LatLngBounds();
  restaurantData.forEach(place => bounds.extend(place.position));
  map.setBounds(bounds);
}

// 랜덤 가게 추천 표시
function showRandomPlace() {
  // 현재 카테고리와 선택된 태그를 기반으로 필터링
  let filteredPlaces = restaurantData.filter(place => place.category === currentCategory);
  
  // 선택된 태그가 있으면 추가 필터링
  if (selectedTags.length > 0) {
    filteredPlaces = filteredPlaces.filter(place => {
      return place.tags.some(tag => selectedTags.includes(tag));
    });
  }
  
  // 필터링된 결과가 없으면 해당 카테고리의 모든 가게 중에서 선택
  if (filteredPlaces.length === 0) {
    filteredPlaces = restaurantData.filter(place => place.category === currentCategory);
  }
  
  // 필터링된 가게가 없으면 메시지 표시
  if (filteredPlaces.length === 0) {
    const randomPlaceInfo = document.getElementById('random-place-info');
    randomPlaceInfo.innerHTML = `
      <p style="text-align: center; color: #888;">해당 카테고리에 가게가 없습니다.</p>
    `;
    return;
  }
  
  // 랜덤으로 하나 선택
  const randomIndex = Math.floor(Math.random() * filteredPlaces.length);
  const randomPlace = filteredPlaces[randomIndex];
  
  // 랜덤 가게 정보 표시
  displayRandomPlace(randomPlace);
  
  // 지도에서 해당 가게 표시
  map.setCenter(randomPlace.position);
  map.setLevel(2);  // 확대 레벨 설정
  
  // 이전 마커 모두 제거
  clearMarkers();
  
  // 선택된 가게만 마커 표시
  addMarker(randomPlace);
  
  // 마커 클릭 효과 (인포윈도우 표시)
  const targetMarker = markers[0]; // 현재는 마커가 하나만 있으므로 첫 번째 마커
  if (targetMarker) {
    kakao.maps.event.trigger(targetMarker, 'click');
  }
}

// 랜덤 가게 정보 표시
function displayRandomPlace(place) {
  const randomPlaceInfo = document.getElementById('random-place-info');
  
  // 가게 정보 HTML 생성
  const translatedName = translate(place.name);
  const translatedTags = place.tags.map(tag => translate(tag));
  
  // 메뉴 번역
  let translatedMenu = place.menu;
  if (place.menu && currentLang !== 'ko') {
    switch(currentLang) {
      case 'en':
        translatedMenu = place.menuEn || place.menu;
        break;
      case 'ja':
        translatedMenu = place.menuJa || place.menu;
        break;
      case 'zh':
        translatedMenu = place.menuZh || place.menu;
        break;
    }
  }
  
  const categoryEmoji = 
    place.category === 'restaurant' ? '🍴' : 
    place.category === 'cafe' ? '☕' : '🍺';
  
  // 현재 표시된 가게 ID 저장
  randomPlaceInfo.dataset.placeId = place.id;
  
  randomPlaceInfo.innerHTML = `
    <div style="text-align: center; margin-bottom: 15px;">
      <span style="font-size: 24px; margin-bottom: 10px; display: block;">${categoryEmoji}</span>
      <h3 style="font-size: 20px; color: var(--primary-color); margin-bottom: 10px;">${translatedName}</h3>
      ${place.menu ? `<p style="margin-bottom: 8px; font-size: 14px;">🍽️ ${translatedMenu}</p>` : ''}
    </div>
    <div style="display: flex; flex-wrap: wrap; gap: 5px; justify-content: center;">
      ${translatedTags.map(tag => `<span style="background: var(--tag-bg); color: white; font-size: 12px; padding: 3px 8px; border-radius: 12px; display: inline-block;">${tag}</span>`).join('')}
    </div>
  `;
}

