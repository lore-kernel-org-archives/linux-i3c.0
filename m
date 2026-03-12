Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 271F2103E2F6
	for <linux-i3c@archiver.kernel.org>; Thu, 12 Mar 2026 00:15:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=7IRZ6isG58rIT1QkDju+01rkMp29WFz7rECUoG6u6Z8=; b=lvMTABpaKfonp0
	Q28Gedxy5RdgHdb5nS0gGbDtQ3KIGqvZjWbYJTsK+Bcz05GhlzPqLbLZMPTXstz+Y9LpeWxdakDoL
	dmpkUQa0uHO0PoJAuUpd83y3huSS6yTHGJ7FWOQSyOktVO4ofdSFXmYed7+kg5aBcZIgfe+VsPXu1
	c93cseEjigfkdTcO7GjKIcwhFezwDLLf8n5dLtJEoW0kYg3gJ/TFUdAwJN4wlBCP5OalprzILFRkp
	uim8tBrwaYp6pvVcOnQGukMS2j8bkHOqLG03TBlGz0BaS+QwCOeJ3FVO6KIPLVfABeaCwmBm/FoVE
	YZHOTx7C9EdzUncZdJ2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0TiW-0000000CvSi-1LnV;
	Thu, 12 Mar 2026 00:15:56 +0000
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0TiU-0000000CvS9-02QD
	for linux-i3c@lists.infradead.org;
	Thu, 12 Mar 2026 00:15:55 +0000
Received: by mail-pg1-x52c.google.com with SMTP id 41be03b00d2f7-c73d251b93bso204686a12.0
        for <linux-i3c@lists.infradead.org>; Wed, 11 Mar 2026 17:15:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773274552; x=1773879352; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5kLAJsER4lp2HD3vq6mJxj6QgJh+XYZbatqBm7oKRCo=;
        b=DfYuQltDOUlAGRHgMjkHuZqm2fbr5EfcSdEsXKGE4EKfZiXg038lI6RBxs6KTWXyDp
         lmY+OBPILYdB8QI2WMro0YCiBH6YH7OMhHFf1w9qonmRD0Jxdm431JhSlZQZZNDbfuGq
         3JVQ+i/xvpV3mHwmElx6JLsUDCcVV3C8lb2V+RUrV1TIv96+mUaHDZEU1AQOWInXQAfH
         OjQZ0KP2aZKq0KI/Kyr06aogUtA25JqRgUkN1QXmbZJj7M/SXnhQjvBMAkyeOQ/jD04y
         9ja9PP9bIQZ1bD/3oHPnK8WrMhDrYSckBq1xhSa9cU+3ENoY63yCWCu4mKPIYE+zhMET
         qkkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773274552; x=1773879352;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5kLAJsER4lp2HD3vq6mJxj6QgJh+XYZbatqBm7oKRCo=;
        b=xSK6uiKq3oV8eqA7KAtoA/Nxs8Kgwv8nWlpNwaYZLBjS+UAeL5vTlZx+rfC/Zy4mFs
         XcJ8vZQ0/5sSZDTTdLr57rpqEb9YOi9ywphYzzhsXBB9nFEq7nTaubwBY/4SvuqwPHOc
         F9o8BCWnTAYFXcJD00nGxU60sPedbiTS4JLiSPPjkTcTVNUbywpRvJug3cMdZm5mr5KF
         x17Qw73ILCo4dn3HpJAOE2zXAlBhGlLAc9icInk7ZuTcLvdDmVZqTC3mhM4MJaSNd6K4
         AqChKzZVXb47IM5OUerQifwOJjM80Qndl/eNAbMnQ+gLy4VSS8nV495cPhWIZXkkbf1M
         gWpw==
X-Gm-Message-State: AOJu0YyJVfbn9/fJ4YDqsKAARG6Zmvn4ZI3DqO66R6Myf0yRu1w1RcXp
	NUz0PRHPsQfG6tpRbwxWypziUlnG6QxPnreep3SH9TT0tLhNS4v/C0f2nLYURWe6
X-Gm-Gg: ATEYQzz5cTJJPbVf9dZB1s4GT7XgAPKu9AAgDImruwWFW6zWUheJysz0PDB6zy26yLQ
	sficdjCletfhaJ+0FpDZi4X1nrRhBVEMLggBNjTValI0V3wTANoTgCorMFiLae2OQ0OZHsOGNqn
	NTYfpfAHdvpbyUywWVlF9pfb57lLgL879p0bbnsa9HNCEA5aVJ2mwLgKfLIrVJZQZx+GjIxoMm1
	t6NM2iEMgbNCIQEsWyimb14W6YhgFXR1NVgLF7ULFo+keRph6VEB8AVcCcSJpYCYYoVe7c+0ePA
	Nfze77ow9pwUy1h/b90iTdoa/6RC7hwF/sDA1FBm+g7Rhh2I5kwV9QYHAhzgNkOCkzquRfFVrms
	Yh+a1KNK+tTs+MYN3+luda/3dI09243gSyPhMJC6fBK6jYalooBvC1JUt14Mk/aVxsLqnOcM+xg
	cLW65RKIVUj264ydNwcjjQavsFfl/fKAd45jq4QH2k2/+A1Og6dusBAQ==
X-Received: by 2002:a05:6a21:6f89:b0:398:ab2c:a5bd with SMTP id adf61e73a8af0-398d7875fd1mr1213671637.21.1773274552521;
        Wed, 11 Mar 2026 17:15:52 -0700 (PDT)
Received: from ryzen ([2601:644:8000:56f5::8bd])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82a072449fesm891746b3a.13.2026.03.11.17.15.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 17:15:52 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-i3c@lists.infradead.org
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-kernel@vger.kernel.org (open list),
	linux-hardening@vger.kernel.org (open list:KERNEL HARDENING (not covered by other areas):Keyword:\b__counted_by(_le|_be)?\b)
Subject: [PATCH] i3c: master: use kzalloc_flex
Date: Wed, 11 Mar 2026 17:15:34 -0700
Message-ID: <20260312001534.24423-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260311_171554_073338_04FCFECD 
X-CRM114-Status: UNSURE (   9.36  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-i3c@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-i3c.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-i3c/>
List-Post: <mailto:linux-i3c@lists.infradead.org>
List-Help: <mailto:linux-i3c-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

Simplifies allocations by using a flexible array member in this struct.

Add __counted_by to get extra runtime analysis.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/i3c/master.c | 14 ++++----------
 1 file changed, 4 insertions(+), 10 deletions(-)

diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
index 9e6be49bebb2..b62cb3ee69c1 100644
--- a/drivers/i3c/master.c
+++ b/drivers/i3c/master.c
@@ -2793,10 +2793,10 @@ struct i3c_generic_ibi_slot {
 struct i3c_generic_ibi_pool {
 	spinlock_t lock;
 	unsigned int num_slots;
-	struct i3c_generic_ibi_slot *slots;
 	void *payload_buf;
 	struct list_head free_slots;
 	struct list_head pending;
+	struct i3c_generic_ibi_slot slots[] __counted_by(num_slots);
 };
 
 /**
@@ -2824,7 +2824,6 @@ void i3c_generic_ibi_free_pool(struct i3c_generic_ibi_pool *pool)
 	WARN_ON(nslots != pool->num_slots);
 
 	kfree(pool->payload_buf);
-	kfree(pool->slots);
 	kfree(pool);
 }
 EXPORT_SYMBOL_GPL(i3c_generic_ibi_free_pool);
@@ -2847,20 +2846,16 @@ i3c_generic_ibi_alloc_pool(struct i3c_dev_desc *dev,
 	unsigned int i;
 	int ret;
 
-	pool = kzalloc_obj(*pool);
+	pool = kzalloc_flex(*pool, slots, req->num_slots);
 	if (!pool)
 		return ERR_PTR(-ENOMEM);
 
+	pool->num_slots = req->num_slots;
+
 	spin_lock_init(&pool->lock);
 	INIT_LIST_HEAD(&pool->free_slots);
 	INIT_LIST_HEAD(&pool->pending);
 
-	pool->slots = kzalloc_objs(*slot, req->num_slots);
-	if (!pool->slots) {
-		ret = -ENOMEM;
-		goto err_free_pool;
-	}
-
 	if (req->max_payload_len) {
 		pool->payload_buf = kcalloc(req->num_slots,
 					    req->max_payload_len, GFP_KERNEL);
@@ -2879,7 +2874,6 @@ i3c_generic_ibi_alloc_pool(struct i3c_dev_desc *dev,
 					  (i * req->max_payload_len);
 
 		list_add_tail(&slot->node, &pool->free_slots);
-		pool->num_slots++;
 	}
 
 	return pool;
-- 
2.53.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
