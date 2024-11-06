

    function validateForm() {
        const content = document.getElementById('acontent').value.trim();
        const image = document.getElementById('image').files.length > 0;

        // 내용이 비어있고 이미지도 없는 경우
        if (content === '' && !image) {
            alert("내용 또는 이미지를 선택해야 합니다.");
            return false; // 제출 중지
        }

        return true; // 제출 허용
}