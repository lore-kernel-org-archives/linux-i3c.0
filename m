Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37100CDB470
	for <linux-i3c@archiver.kernel.org>; Wed, 24 Jun 2026 05:04:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=FeDBliE4Bbfr06vkWtgPwsJsoLn+9P8hnvlgJM6ht+4=; b=p6Y0duEu9cLVO6
	behiNXgryiF76FCq29Izqb6XTSPfPdDO9LYHZKBx9MOExKfvM8loQfBkGj0Mbs+H+D8ixbAPwTKl9
	+IBcEX4cJddH0GCYMOLaqMYDv+DXAVLwrCqt377btbXFaWv9Mg5ZimGufEKhVmYCgG3cwXle1rFx7
	1PmQeagwI9t+R9iDHWNZmRXinF5GMX0ZIeQJswc6RZjwzpD3kTEUQcXcK8r//0swff7jXtmJKm2MV
	jxdbrg/c0Cy5e4YSP2sDx6GC9pN8BL4VFMoaZSv0t9mCchX344jFnED5pH8l1ilt+RlHk6/MkzJXF
	LnJpzXp91u54UVdY7TAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcFmz-000000079AV-2Ord;
	Wed, 24 Jun 2026 05:04:41 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcFmw-0000000799r-0m2h
	for linux-i3c@lists.infradead.org;
	Wed, 24 Jun 2026 05:04:40 +0000
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-36baeec21dcso332842a91.3
        for <linux-i3c@lists.infradead.org>; Tue, 23 Jun 2026 22:04:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782277477; x=1782882277; darn=lists.infradead.org;
        h=mime-version:content-transfer-encoding:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4StFu5ahPZMOCmpAmf7ZBLUUMy/f7dbOEJjELgNIlkA=;
        b=SCn6s8qnY+zVypmQzJJNG+rrE7hVbVcRDq/v7+IceuFhqio55sVes9MMLF0Y9srIJd
         aYsGs6Px9t8PEa5RZbohf0vsTANH+8/a7edbuHCDkoAewF5EZI8NYfxXS1gMaNs/i/5Z
         6wz6PJJZWVid3telW/jUUvbhnoupyjFPtq4Tin7JjQymP6GsuNwYNHzkhd37NFURmkb9
         U/FbhTfxIk+g/NTdwfPdVH+/SWBCuFvCzsE0QKv5756qgCuCIQu7HcmDsBuPuUSEh5Ki
         BT4AFEBCaLOwvo+rPISgQcyp5N80nb2dCP9NvUL6ksBVkiAxtFVn+cSrU9ZwJwpzBkkN
         ENPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782277477; x=1782882277;
        h=mime-version:content-transfer-encoding:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4StFu5ahPZMOCmpAmf7ZBLUUMy/f7dbOEJjELgNIlkA=;
        b=eg15cSDLFoiSxYzWPnuTBKjcP+xt1vxhdgCR61Z+OA28gDGMDnVDp5+S7v4vDJTRDK
         wHl/+Xlh2eQDdZI7lBlrLu0wpK8bLFu6naQLjFCfzG9nebZDx63JekBra2g+7jWX8WaM
         Ph6veBpOumzHDCxaz9aiaOe4ujSBsBz9diebd869R/dSzsMASIMNzIdBwOEaGMXxPAkD
         EUNL3bL39GXRR6JG9YKcajIMNAchMuhW6hJQi0wxn5MxZLKzdxbXLrg+caqfroFg6vY+
         ZOdovgu+7f0ORyJFn/z9mEzn9Kgo8ebKZb6aeiKUhLIPaWxoVzEm0SDBTGiUF7p/6LZG
         WubQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp/elWiIZricU44QZy9zYDx43nTIdR9cohzsQAmS9hPoxVm5prjsvpTKMH8MFTxy9JyMWEZhAXk0Xk=@lists.infradead.org
X-Gm-Message-State: AOJu0Yyy9x1NlEo5Wns7zY6KDdJ1qXsHqPbZ9fIJmp74j0R+isRBiP4X
	qcOpM4uwdhcKQ8OS0TY+5pO7gzkq1OcHOpzli4/DoWoIv28FRjVnwb2i
X-Gm-Gg: AfdE7clSvgRXGau/TfnFZArpIb2dFdeuwUpD7gfPY4tTTqHiQ+64RC8rUL1GN5FCG5l
	mLhE42I+zztFtT471Z9ajg7GgWsPTtgNEz/KZ7b2Tr4ux+sKEZ8bFGLsjvt6HO3ZPleJq4PGIYi
	uHc1klrMmA9h8n5GDl2RI37D00yk0ael9mN+kOMUg3v5KTOxGcHwanYzhGB8hKdP1GiilC4h8vN
	tAND4fV9gOZdrq+TSKKJ5dYBbqOlQZhffEgwzJL8lFJ25ncaigyHt7ipLdHl2rBEwqAUYHgskQW
	XuEy+EykZml72ifNlng9kOHA2aqC4lrorIBhlBElxWV4TQQtWNLEtlVDaA2mZsOLaywYzQe+bj5
	lVX0odmyRxnESZzpxR67qIeJReEIVOOTfLSUrPtlD8HpPQAmlOcxzM1VqwOd1vW1wNU5BOJdaK6
	VykqRASzcshVdgGMXWBS/AMB2d+fL/pPQtR/GPOg==
X-Received: by 2002:a17:902:fc50:b0:2c6:9f66:d57e with SMTP id d9443c01a7336-2c7c7745507mr67099365ad.36.1782277477048;
        Tue, 23 Jun 2026 22:04:37 -0700 (PDT)
Received: from csl-conti-dell7858.ntu.edu.sg ([155.69.195.57])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c7444a9c5asm117748675ad.74.2026.06.23.22.04.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 22:04:36 -0700 (PDT)
From: Maoyi Xie <maoyixie.tju@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, Frank Li <Frank.Li@nxp.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Kaixuan Li <kaixuan.li@ntu.edu.sg>, linux-i3c@lists.infradead.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: [PATCH v2] i3c: master: svc: bound IBI payload to the requested
 max_payload_len
Date: Wed, 24 Jun 2026 13:04:33 +0800
Message-ID: <178227747353.2931373.15868718612134648277@maoyixie.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260623_220438_230911_6FFC68A5 
X-CRM114-Status: GOOD (  14.87  )
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

svc_i3c_master_handle_ibi() reads the IBI payload from the RX FIFO into
the IBI slot. The loop is bounded by the hardware FIFO size
(SVC_I3C_FIFO_SIZE), not by the slot size.

slot->data points into the IBI pool, which i3c_generic_ibi_alloc_pool()
sizes at max_payload_len per slot. svc_i3c_master_request_ibi() only
rejects a max_payload_len larger than SVC_I3C_FIFO_SIZE, so a driver can
request a smaller one. mctp-i3c requests 1. Each readsb() then copies the
controller RXCOUNT bytes (up to 31) with no check against the slot size.
A device that sends more bytes than the slot holds writes past
slot->data, an out-of-bounds write into the IBI pool.

Bound the loop by dev->ibi->max_payload_len and clamp each read to the
space left in the slot, the same way dw-i3c does. A device can still send
more than the requested payload. Flush the leftover bytes from the RX FIFO
so they do not leak into the next transfer.

Fixes: dd3c52846d59 ("i3c: master: svc: Add Silvaco I3C master driver")
Cc: stable@vger.kernel.org
Co-developed-by: Kaixuan Li <kaixuan.li@ntu.edu.sg>
Signed-off-by: Kaixuan Li <kaixuan.li@ntu.edu.sg>
Signed-off-by: Maoyi Xie <maoyixie.tju@gmail.com>
---
v2:
- use min() instead of min_t(), the types already match (Frank Li)
- flush the leftover RX FIFO bytes after the bounded read, so an
  oversized IBI does not desync the next transfer (Sashiko AI review)

 drivers/i3c/master/svc-i3c-master.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/i3c/master/svc-i3c-master.c b/drivers/i3c/master/svc-i3c-master.c
index e2d99a3ac07d..4eb54f9ee2cd 100644
--- a/drivers/i3c/master/svc-i3c-master.c
+++ b/drivers/i3c/master/svc-i3c-master.c
@@ -465,14 +465,22 @@ static int svc_i3c_master_handle_ibi(struct svc_i3c_master *master,
 	buf = slot->data;
 
 	while (SVC_I3C_MSTATUS_RXPEND(readl(master->regs + SVC_I3C_MSTATUS))  &&
-	       slot->len < SVC_I3C_FIFO_SIZE) {
+	       slot->len < dev->ibi->max_payload_len) {
 		mdatactrl = readl(master->regs + SVC_I3C_MDATACTRL);
 		count = SVC_I3C_MDATACTRL_RXCOUNT(mdatactrl);
+		count = min(count, dev->ibi->max_payload_len - slot->len);
 		readsb(master->regs + SVC_I3C_MRDATAB, buf, count);
 		slot->len += count;
 		buf += count;
 	}
 
+	/*
+	 * The device may have sent more than the requested payload. Drop the
+	 * extra bytes so they do not leak into the next transfer.
+	 */
+	if (SVC_I3C_MSTATUS_RXPEND(readl(master->regs + SVC_I3C_MSTATUS)))
+		writel(SVC_I3C_MDATACTRL_FLUSHRB, master->regs + SVC_I3C_MDATACTRL);
+
 	master->ibi.tbq_slot = slot;
 
 	return 0;

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
