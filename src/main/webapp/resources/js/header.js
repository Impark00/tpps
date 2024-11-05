    if (localStorage.getItem('darkMode') === 'enabled') {
        document.body.classList.add('dark-mode');
        document.getElementById('darkModeToggle').innerText = '화이트 모드'; // 다크 모드일 때 버튼 텍스트
    }

    // 다크 모드 토글 버튼
    document.getElementById('darkModeToggle').addEventListener('click', function() {
        document.body.classList.toggle('dark-mode');
        // 다크 모드 상태 저장 및 버튼 텍스트 변경
        if (document.body.classList.contains('dark-mode')) {
            localStorage.setItem('darkMode', 'enabled');
            this.innerText = '화이트 모드'; // 버튼 텍스트 변경
        } else {
            localStorage.removeItem('darkMode');
            this.innerText = '다크 모드'; // 버튼 텍스트 변경
        }
    });