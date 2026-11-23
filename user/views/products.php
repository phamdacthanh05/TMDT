<!-- Tiêu đề trang -->
<section class="section" style="padding-bottom: 0;">
    <div class="container">
        <div class="section-header" style="margin-bottom: 0;">
            <div>
                <div class="section-tag">Kho tài nguyên</div>
                <h1 class="section-title">Tất Cả Sản Phẩm</h1>
                <p class="section-subtitle">Khám phá toàn bộ Source Code, Template và Tài liệu chất lượng cao dành cho bạn.</p>
            </div>
        </div>
    </div>
</section>

<!-- Thanh Bộ Lọc Ngang & Danh sách sản phẩm -->
<section class="section">
    <div class="container">
        
        <!-- ========== THANH BỘ LỌC NGANG ========== -->
        <div style="background: #fff; border: 1px solid var(--slate-200); border-radius: 12px; padding: 20px; margin-bottom: 32px; box-shadow: var(--shadow-sm);">
            <form method="GET" action="<?= APP_BASE ?>/pages/products.php" style="display: flex; flex-wrap: wrap; gap: 16px; align-items: flex-end;">
                
                <!-- Tìm kiếm -->
                <div style="flex: 2; min-width: 200px;">
                    <label class="form-label" style="font-size: 0.85rem; margin-bottom: 6px;">Tìm kiếm</label>
                    <input type="text" name="keyword" class="form-control" placeholder="Nhập tên sản phẩm..." value="<?= e($filters['keyword']) ?>" style="padding: 10px 14px;">
                </div>
                
                <!-- Danh mục -->
                <div style="flex: 1; min-width: 150px;">
                    <label class="form-label" style="font-size: 0.85rem; margin-bottom: 6px;">Danh mục</label>
                    <select name="category" class="form-control" style="padding: 10px 14px;">
                        <option value="">Tất cả danh mục</option>
                        <?php foreach ($categories as $cat): ?>
                            <option value="<?= e($cat) ?>" <?= ($filters['category'] === $cat) ? 'selected' : '' ?>>
                                <?= e($cat) ?>
                            </option>
                        <?php endforeach; ?>
                    </select>
                </div>

                <!-- Sắp xếp -->
                <div style="flex: 1; min-width: 150px;">
                    <label class="form-label" style="font-size: 0.85rem; margin-bottom: 6px;">Sắp xếp</label>
                    <select name="sort" class="form-control" style="padding: 10px 14px;">
                        <option value="newest" <?= $filters['sort'] === 'newest' ? 'selected' : '' ?>>Mới nhất</option>
                        <option value="price_asc" <?= $filters['sort'] === 'price_asc' ? 'selected' : '' ?>>Giá: Thấp → Cao</option>
                        <option value="price_desc" <?= $filters['sort'] === 'price_desc' ? 'selected' : '' ?>>Giá: Cao → Thấp</option>
                        <option value="best_seller" <?= $filters['sort'] === 'best_seller' ? 'selected' : '' ?>>Bán chạy nhất</option>
                    </select>
                </div>

                <!-- Khoảng giá -->
                <div style="flex: 1.5; min-width: 200px;">
                    <label class="form-label" style="font-size: 0.85rem; margin-bottom: 6px;">Khoảng giá (VNĐ)</label>
                    <div style="display: flex; gap: 8px; align-items: center;">
                        <input type="number" name="min_price" class="form-control" placeholder="Từ" value="<?= $filters['min_price'] > 0 ? $filters['min_price'] : '' ?>" min="0" step="10000" style="padding: 10px 14px;">
                        <span style="color: var(--slate-400);">-</span>
                        <input type="number" name="max_price" class="form-control" placeholder="Đến" value="<?= $filters['max_price'] > 0 ? $filters['max_price'] : '' ?>" min="0" step="10000" style="padding: 10px 14px;">
                    </div>
                </div>

                <!-- Nút Áp dụng & Xóa -->
                <div style="display: flex; gap: 8px;">
                    <button type="submit" class="btn btn-primary" style="padding: 10px 20px; height: 42px;">Lọc</button>
                    <a href="<?= APP_BASE ?>/pages/products.php" class="btn btn-outline" style="padding: 10px 20px; height: 42px;">Xóa</a>
                </div>
            </form>

            <!-- Các nút lọc giá nhanh -->
            <div style="margin-top: 12px; display: flex; gap: 8px; flex-wrap: wrap; font-size: 0.85rem; align-items: center; border-top: 1px dashed var(--slate-200); padding-top: 12px;">
                <span style="color: var(--slate-500); font-weight: 500;">Lọc nhanh giá:</span>
                <a href="?min_price=0&max_price=100000" class="badge" style="background: var(--slate-100); color: var(--slate-700); padding: 4px 10px; border-radius: 4px; text-decoration: none;">Dưới 100k</a>
                <a href="?min_price=100000&max_price=500000" class="badge" style="background: var(--slate-100); color: var(--slate-700); padding: 4px 10px; border-radius: 4px; text-decoration: none;">100k - 500k</a>
                <a href="?min_price=500000&max_price=1000000" class="badge" style="background: var(--slate-100); color: var(--slate-700); padding: 4px 10px; border-radius: 4px; text-decoration: none;">500k - 1M</a>
                <a href="?min_price=1000000" class="badge" style="background: var(--slate-100); color: var(--slate-700); padding: 4px 10px; border-radius: 4px; text-decoration: none;">Trên 1M</a>
            </div>
        </div>

        <!-- ========== DANH SÁCH SẢN PHẨM ========== -->
        <div>
            <!-- Thanh thông tin kết quả -->
            <div style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 20px; padding: 12px 16px; background: var(--slate-50); border-radius: 8px; font-size: 0.9rem; color: var(--slate-600);">
                <div>
                    Tìm thấy <strong><?= count($products) ?></strong> sản phẩm
                    <?php if ($filters['keyword']): ?> cho từ khóa "<?= e($filters['keyword']) ?>"<?php endif; ?>
                </div>
            </div>
            
            <?php if (empty($products)): ?>
                <div class="alert alert-error" style="text-align: center; padding: 40px;">
                    <p style="font-size: 1.1rem; margin-bottom: 8px;">Không tìm thấy sản phẩm nào phù hợp.</p>
                    <p style="color: var(--slate-500); margin-bottom: 16px;">Thử thay đổi bộ lọc hoặc từ khóa tìm kiếm.</p>
                    <a href="<?= APP_BASE ?>/pages/products.php" class="btn btn-primary btn-sm">Xóa bộ lọc</a>
                </div>
            <?php else: ?>
                <div class="product-grid">
                    <?php foreach ($products as $item): ?>
                        <div class="product-card">
                            <div class="product-thumb">
                                <img src="<?= product_image($item['image']) ?>" alt="<?= e($item['name']) ?>">
                                <span class="product-badge"><?= e($item['category']) ?></span>
                            </div>
                            <div class="product-content">
                                <h3 class="product-title">
                                    <a href="<?= APP_BASE ?>/pages/product-detail.php?id=<?= $item['id'] ?>"><?= e($item['name']) ?></a>
                                </h3>
                                <p class="product-desc"><?= e($item['description']) ?></p>
                                <div class="product-footer">
                                    <div class="product-price-box">
                                        <?php if ($item['sale_price']): ?>
                                            <span class="product-price"><?= money($item['sale_price']) ?></span>
                                            <span class="product-price-old"><?= money($item['price']) ?></span>
                                        <?php else: ?>
                                            <span class="product-price"><?= money($item['price']) ?></span>
                                        <?php endif; ?>
                                    </div>
                                    <a href="<?= APP_BASE ?>/pages/product-detail.php?id=<?= $item['id'] ?>" class="btn btn-primary btn-sm">Xem chi tiết</a>
                                </div>
                            </div>
                        </div>
                    <?php endforeach; ?>
                </div>
            <?php endif; ?>
        </div>
        
    </div>
</section>