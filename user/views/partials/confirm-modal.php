<!-- Modal Xác Nhận Dùng Chung -->
<div id="custom-confirm-modal" style="display: none; position: fixed; inset: 0; z-index: 9999; background: rgba(15, 23, 42, 0.5); backdrop-filter: blur(4px); align-items: center; justify-content: center;">
    <div id="confirm-modal-box" style="background: #fff; border-radius: 12px; width: 100%; max-width: 400px; padding: 24px; box-shadow: 0 20px 25px -5px rgba(0,0,0,0.1); transform: scale(0.95); transition: transform 0.2s; margin: 16px;">
        <h3 id="confirm-title" style="font-size: 1.25rem; font-weight: 700; color: #0f172a; margin-bottom: 8px;">Xác nhận hành động</h3>
        <p id="confirm-message" style="color: #475569; margin-bottom: 24px; line-height: 1.5;">Bạn có chắc chắn muốn thực hiện hành động này?</p>
        <div style="display: flex; gap: 12px; justify-content: flex-end;">
            <button id="confirm-btn-cancel" style="padding: 10px 16px; border-radius: 8px; border: 1px solid #cbd5e1; background: #fff; color: #334155; font-weight: 600; cursor: pointer; transition: 0.2s;">Hủy bỏ</button>
            <button id="confirm-btn-ok" style="padding: 10px 16px; border-radius: 8px; border: none; background: #ef4444; color: #fff; font-weight: 600; cursor: pointer; transition: 0.2s;">Đồng ý</button>
        </div>
    </div>
</div>

<script>
    let confirmCallback = null;

    // Hàm gọi Modal
    function showConfirm(message, callback, title = 'Xác nhận hành động', btnText = 'Đồng ý', isDanger = true) {
        document.getElementById('confirm-title').innerText = title;
        document.getElementById('confirm-message').innerText = message;
        
        const btnOk = document.getElementById('confirm-btn-ok');
        btnOk.innerText = btnText;
        btnOk.style.background = isDanger ? '#ef4444' : '#2563eb'; // Đỏ cho Xóa, Xanh cho Hành động khác
        
        confirmCallback = callback;
        
        const modal = document.getElementById('custom-confirm-modal');
        const box = document.getElementById('confirm-modal-box');
        
        modal.style.display = 'flex';
        // Hiệu ứng phóng to nhẹ
        setTimeout(() => { box.style.transform = 'scale(1)'; }, 10);
    }

    function closeConfirm() {
        const modal = document.getElementById('custom-confirm-modal');
        const box = document.getElementById('confirm-modal-box');
        box.style.transform = 'scale(0.95)';
        setTimeout(() => { modal.style.display = 'none'; }, 200);
    }

    document.getElementById('confirm-btn-cancel').addEventListener('click', function() {
        closeConfirm();
        confirmCallback = null;
    });

    document.getElementById('confirm-btn-ok').addEventListener('click', function() {
        closeConfirm();
        if (typeof confirmCallback === 'function') {
            confirmCallback();
        }
        confirmCallback = null;
    });

    // Bấm ra ngoài vùng trắng để đóng
    document.getElementById('custom-confirm-modal').addEventListener('click', function(e) {
        if (e.target === this) closeConfirm();
    });
</script>