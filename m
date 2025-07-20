Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0554C83F27
	for <linux-i3c@archiver.kernel.org>; Tue, 22 Jul 2025 11:14:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=H8/yv307xw2RjMPFBQsubomLzOQVurzEsmoRCXzy/JU=; b=jwiUpavPRZ/8nW
	tQYdXy2coHslN/it2Kt2RnjdASvTRAWu5j/N1guJInsRdOdWqLzivzPNlaBoIO1D0qLbeqwPkCVYY
	+Og/0hLrKEHqZUMIFMBiTrSbGVbsyFwBk6IqNvAHtMbRHgRLKNFAtY6DTNR0J1xNZnwK521hyMH1s
	38+sGNaOOczTnPos6M2nzMzC6bInW7hunrTiaWySm+Y0if7Fl5fM4FMLC/ApHaMhsbRMk/nmAsGxT
	30BY1IvNX3XcLd4q/ojdFBWLsTj7uX+SXFq3i52i4FTn9xC/FTQVC4joRAEDmx0CghNC8poEONt7k
	If6uKdwXOZA095tYDiiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueAx9-00000002FoU-1MDT;
	Tue, 22 Jul 2025 11:14:35 +0000
Received: from mail-ua1-x930.google.com ([2607:f8b0:4864:20::930])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udVuU-0000000FS2Z-0Lce
	for linux-i3c@lists.infradead.org;
	Sun, 20 Jul 2025 15:25:07 +0000
Received: by mail-ua1-x930.google.com with SMTP id a1e0cc1a2514c-87ecac3e17cso1917656241.3
        for <linux-i3c@lists.infradead.org>; Sun, 20 Jul 2025 08:25:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753025105; x=1753629905; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rlwld6FdGzx+gNpdq9uPUdbnoNu6WgBQ31n27jU5G6E=;
        b=WH6Zv8jhPUQZPtXsLKvUkmr23br4K5mdGoa8gh5dbMf7iZSPz/E45OLu98V2F3So2w
         f7ALniaN8FygB1C/lZWVDS3muFk09Sh3T5lB+d6Lo6PO6HAmEp5z/DnSn8IkDxs0w4PQ
         4g1ReaGixK5b94lIthn2HzpI6ddFKBcLQkHgii4pbGsnNA8jAx2oMwNpiiSdhiOZDFlV
         7UvTxWJ3VReMPXgKTbgeD3NVLkiRURjESh1+31EQba27CGeL8vb55pZCaYPNCCp1qytw
         NXNXzLU+JUSpFmYYPNDnzqxo0FcKCqCT1WRIxgiIFHMVvwLZVFuVI8B4sgogpcNKFxw8
         y17w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753025105; x=1753629905;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rlwld6FdGzx+gNpdq9uPUdbnoNu6WgBQ31n27jU5G6E=;
        b=hu4nuy2pHpSuEly+Ro59+jsxQWuLiI7zG9vOUJwKmTQvCCmbRip4zUOHRvIWYbMq5e
         1sE0vcZVtLfY8vha8x1jhpegaxAs5vTFhZm3HeKxsB88NHDMvD+B1/ANj18T+ld+QKqT
         L/C3i+5gdZPHJY0AmUQJA4Z5nBZKFEDXQebh430O3jJmJXw9gtiTbDbMAKcTc2CkSVaA
         6ehgwjPjmX4qAY27tQdHvSDNTzxurNRKO8NlirU9sLKlF5TlSU0fKQBwB2K3YFjYGSZK
         MmxL7OHISfZYEiQ+YQicqsCXa65fNz13Vgo0RiwBJg2oj2yllG5T17tCrFr35nYQJmi6
         kK/Q==
X-Forwarded-Encrypted: i=1; AJvYcCWuNPxK4i3EuUkF+MxU4O+PF9O3lgcsgJBeBOxx6ZTGo6LenSmkyA5yrRj1Q3cHWgEoSTXmsxKfIXw=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx0DdyaWf8BegwtJAcOaWqS4j8UJ28mM/Wx4slQ5K0RuRZx/Zjn
	/LHxnQj674TUa/m+MZVjEZPQ6Uc8B771UT7MmetIwe/T7mIZobMduBky
X-Gm-Gg: ASbGnctVEbZX1D72YPHGGCgvZyczToK19Q0ugjtCozxgBhxWFhaT5NjYajIDT6vwcev
	lTLJTEQyXLzSU3enjcNdwXHzkiLcH9+g7+zZge6v/o2hR7QGq1S4pKUt5EGlllBwfir27M4MV2C
	LCE96Xol2YyyXoUxATkII/Oknjv1vLjoPVTrKERnT/b/aUUtB2YROhtMXB1yoODTGFNZmWhtSJN
	UT7a/PN4P+/O/rdv0o4S4i2FtKnPCeRkv3XIzFmtZf3bAQ/7DEVGLrpaLhVTYDNiuaZ+mxgcUDN
	2qB52dBQE3vjqJNgNoVojBVH0SPRdqYey/jP2e/iJysUyYYpmzizDVs4tNdGVmUL3WCkYtKcBMF
	n2ssDvQxuPAzVSPKfQV/O+V0aqtbQtrFYlc0Mci/BHjvn4Z0tT9rjTbZwgoHnn+/qFNWMh2EKKV
	NQMyaYaw==
X-Google-Smtp-Source: AGHT+IG92NRkx8ltYfrcXZ5eevHEHXa70/Jp/PIid1of657KfjI7EX1GOTtiKanjN1S6eknrX4Nt5w==
X-Received: by 2002:a05:6122:1acc:b0:530:7ab8:49ab with SMTP id 71dfb90a1353d-5373fa6909amr7613401e0c.0.1753025104945;
        Sun, 20 Jul 2025 08:25:04 -0700 (PDT)
Received: from 9950X.localdomain (syn-142-197-132-170.res.spectrum.com. [142.197.132.170])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-53764eedd3bsm2157582e0c.5.2025.07.20.08.25.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Jul 2025 08:25:03 -0700 (PDT)
From: Luis Felipe Hernandez <luis.hernandez093@gmail.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Marc Kleine-Budde <mkl@pengutronix.de>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Randy Dunlap <rdunlap@infradead.org>,
	Pavel Pisa <pisa@cmp.felk.cvut.cz>,
	Ondrej Ille <ondrej.ille@gmail.com>,
	Vincent Mailhol <mailhol.vincent@wanadoo.fr>,
	Frank Li <Frank.Li@nxp.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	dri-devel@lists.freedesktop.org,
	linux-i3c@lists.infradead.org,
	linux-can@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Luis Felipe Hernandez <luis.hernandez093@gmail.com>
Subject: [PATCH v2 1/1] docs: Fix kernel-doc indentation errors
Date: Sun, 20 Jul 2025 11:24:01 -0400
Message-ID: <20250720152401.70720-2-luis.hernandez093@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250720152401.70720-1-luis.hernandez093@gmail.com>
References: <20250720152401.70720-1-luis.hernandez093@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250720_082506_125098_644EAE7E 
X-CRM114-Status: GOOD (  14.31  )
X-Mailman-Approved-At: Tue, 22 Jul 2025 04:10:58 -0700
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

Fix kernel-doc issues that reported Unexpected indentation errors
durring documentation build (make htmldocs) in CAN, I3C and GPU drivers.

Convert formatting to proper ReST list syntax to resolve warning.

Changes since v1:
- Convert return value descriptions to proper ReST format
- Fix code block introduction with :: syntax  
- Add GPU driver fixes
- Remove SCSI driver (already fixed)

Link: https://lore.kernel.org/all/20250703023511.82768-1-luis.hernandez093@gmail.com/

Signed-off-by: Luis Felipe Hernandez <luis.hernandez093@gmail.com>
---
 drivers/gpu/drm/drm_gpuvm.c              | 16 ++++++++--------
 drivers/i3c/device.c                     | 13 ++++++++-----
 drivers/net/can/ctucanfd/ctucanfd_base.c | 12 +++++++-----
 3 files changed, 23 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/drm_gpuvm.c b/drivers/gpu/drm/drm_gpuvm.c
index bbc7fecb6f4a..982a3476a988 100644
--- a/drivers/gpu/drm/drm_gpuvm.c
+++ b/drivers/gpu/drm/drm_gpuvm.c
@@ -2430,7 +2430,7 @@ static const struct drm_gpuvm_ops lock_ops = {
  * remapped, and locks+prepares (drm_exec_prepare_object()) objects that
  * will be newly mapped.
  *
- * The expected usage is:
+ * The expected usage is::
  *
  *    vm_bind {
  *        struct drm_exec exec;
@@ -2464,14 +2464,14 @@ static const struct drm_gpuvm_ops lock_ops = {
  * op, because the later altered step will involve the same GEM object(s)
  * already seen in the earlier locking step.  For example:
  *
- * 1) An earlier driver DRIVER_OP_UNMAP op removes the need for a
- *    DRM_GPUVA_OP_REMAP/UNMAP step.  This is safe because we've already
- *    locked the GEM object in the earlier DRIVER_OP_UNMAP op.
+ * * An earlier driver DRIVER_OP_UNMAP op removes the need for a
+ *   DRM_GPUVA_OP_REMAP/UNMAP step.  This is safe because we've already
+ *   locked the GEM object in the earlier DRIVER_OP_UNMAP op.
  *
- * 2) An earlier DRIVER_OP_MAP op overlaps with a later DRIVER_OP_MAP/UNMAP
- *    op, introducing a DRM_GPUVA_OP_REMAP/UNMAP that wouldn't have been
- *    required without the earlier DRIVER_OP_MAP.  This is safe because we've
- *    already locked the GEM object in the earlier DRIVER_OP_MAP step.
+ * * An earlier DRIVER_OP_MAP op overlaps with a later DRIVER_OP_MAP/UNMAP
+ *   op, introducing a DRM_GPUVA_OP_REMAP/UNMAP that wouldn't have been
+ *   required without the earlier DRIVER_OP_MAP.  This is safe because we've
+ *   already locked the GEM object in the earlier DRIVER_OP_MAP step.
  *
  * Returns: 0 on success or a negative error codec
  */
diff --git a/drivers/i3c/device.c b/drivers/i3c/device.c
index e80e48756914..48b49757a90b 100644
--- a/drivers/i3c/device.c
+++ b/drivers/i3c/device.c
@@ -26,11 +26,14 @@
  *
  * This function can sleep and thus cannot be called in atomic context.
  *
- * Return: 0 in case of success, a negative error core otherwise.
- *	   -EAGAIN: controller lost address arbitration. Target
- *		    (IBI, HJ or controller role request) win the bus. Client
- *		    driver needs to resend the 'xfers' some time later.
- *		    See I3C spec ver 1.1.1 09-Jun-2021. Section: 5.1.2.2.3.
+ * Return:
+ * * 0 in case of success
+ * * a negative error core otherwise.
+ * * -EAGAIN: controller lost address arbitration. Target
+ *   (IBI, HJ or controller role request) win the bus. Client
+ *   driver needs to resend the 'xfers' some time later.
+ *   See I3C spec ver 1.1.1 09-Jun-2021. Section: 5.1.2.2.3.
+ *
  */
 int i3c_device_do_priv_xfers(struct i3c_device *dev,
 			     struct i3c_priv_xfer *xfers,
diff --git a/drivers/net/can/ctucanfd/ctucanfd_base.c b/drivers/net/can/ctucanfd/ctucanfd_base.c
index bf6398772960..f910422188c3 100644
--- a/drivers/net/can/ctucanfd/ctucanfd_base.c
+++ b/drivers/net/can/ctucanfd/ctucanfd_base.c
@@ -506,11 +506,13 @@ static bool ctucan_is_txt_buf_writable(struct ctucan_priv *priv, u8 buf)
  * @buf:	TXT Buffer index to which frame is inserted (0-based)
  * @isfdf:	True - CAN FD Frame, False - CAN 2.0 Frame
  *
- * Return: True - Frame inserted successfully
- *	   False - Frame was not inserted due to one of:
- *			1. TXT Buffer is not writable (it is in wrong state)
- *			2. Invalid TXT buffer index
- *			3. Invalid frame length
+ * Return:
+ * * True - Frame inserted successfully
+ * * False - Frame was not inserted due to one of:
+ *
+ *   * TXT Buffer is not writable (it is in wrong state)
+ *   * Invalid TXT buffer index
+ *   * Invalid frame length
  */
 static bool ctucan_insert_frame(struct ctucan_priv *priv, const struct canfd_frame *cf, u8 buf,
 				bool isfdf)
-- 
2.43.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
