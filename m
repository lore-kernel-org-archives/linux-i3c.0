Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CF3DCCF9E0
	for <linux-i3c@archiver.kernel.org>; Mon, 27 Oct 2025 03:47:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=K17s9QNdIVJqoeqnNYlrkqlWlTtaEHOsMQTQn5xvGkQ=; b=fF+n5ZB4Lh0TJh
	aLv4jhHl0s9uGTmEl856zoUoDI/MMmmX8ec8ojDhywDiykuifbn7xUMQVY6vExbJQb11JIY0sA28v
	rxli2MKJ8KrvzldEQsKuFDDmKyvF5Z+Pkrv+hfJhl3XQcrpWegIQq3t9YSwZqGGYkRY6smMC9AoSn
	jIHTCjAG6CE2xtifmuAh0WumrMPPCxUPV/DlLw5vmhe9VaTqn0BHgKQrk4PqoxVC573W9Lh8NfRaS
	GK9DZAZxyC+l1S4JZITRuoT9PjlmxQjZhpgqKhEu42QurTV12tDgyckZLsRSDgbcp0g6kQFzTHh4e
	xBOS2GNTAJM6ZPepI+Sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDECb-0000000D4Tm-0Ky1;
	Mon, 27 Oct 2025 03:47:25 +0000
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDECY-0000000D4TI-1a5R
	for linux-i3c@lists.infradead.org;
	Mon, 27 Oct 2025 03:47:23 +0000
Received: by mail-pg1-x52f.google.com with SMTP id 41be03b00d2f7-b6ce696c18bso3831116a12.1
        for <linux-i3c@lists.infradead.org>; Sun, 26 Oct 2025 20:47:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761536841; x=1762141641; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CxQovh9eMpHejPQRZH3kbXNMIwm3B/L8EVHuJgLjyZA=;
        b=QbxRhaMY0hA3TzKTLHU+1iej5q0AlYtjS0W0fLtjgsM1fMMy0Pz8OELwaV4UsAupmv
         ocPOvQ2f/m8Uymxc4oyddRMgNtNSHh3kDR5dKDDp3cCk2g1w6XPHf3xJWIepirA6E0Gx
         a3Wl6cFaPTzhxQuoRu3i3wVgFZRBeiwMlClKs8or3JYSzIFSyXvcc73uJF6P479M4pP7
         HaOg2OXACuCFfx372qKncC3A2DO5/5pUEgJo/0aJsTxnAh/O/APae/TBC+BzZkTXfZW1
         Dxp3hYifuks0cbTA/jBAmdZsERPE8k2oOOkeARGlWhN3+6OHKBYUd2ko7GHRqRawDpmc
         rNRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761536841; x=1762141641;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CxQovh9eMpHejPQRZH3kbXNMIwm3B/L8EVHuJgLjyZA=;
        b=bShyo+8/9r5zZMaJC86ETesg7FIYJPpkwYPQ8VZC0Nn9yORHQVrYN5Qc6F2wI7sXKi
         sTxUpe428bBcS+jaMjRXoCnci3GyckvKFfxbQA9woZMXJJ/lC0Zv/9wOk4UlwfdOFlFz
         huJzE8xBkVG+PaNgI0CsIITlfQbqLRB+YIGdHR4W5eVs4bpgB5CzcKOINHksysQGTzMw
         EbAY3D0enE2R+4Bxnzly5PRR3qIK86Duuw499scQLyr6n4wD/v5v/yShwHbFUjjQBDF+
         01WtYWQ1jkkNzu/rIJGOopsgrEW9pICfG0+rGlKzX2qZcCLiweix1/X4Z363Kxs6X9rs
         buWA==
X-Forwarded-Encrypted: i=1; AJvYcCVv34uGXvMu/DKW5+6lNzN0wViPRNFfLtUkRtbv4CpcbR1z+Z0qgEJqEXRBJmEQ8/id2YSIqPSCBko=@lists.infradead.org
X-Gm-Message-State: AOJu0YzhLvJtGnktS/mSMC0UullOJxr3Y4lZjwEhe/LSoMiC5L8y1lfL
	8Az5dXys//eJqxWiRT9g5utvgiGh5XjnrJs2tvNWF/GmIHBDTa+cbMlV
X-Gm-Gg: ASbGncvvxVK2SYF0YXHE/M0Y8yLynVpnLQu+TzoAPGMf0yvdIIdR5bMGWgTKCtzURFl
	0MTO3Qg53of4qrCGdxDaHYanMlgyLzHjfxTjylrpt6x7gZf325QXQ97K+Bk+NtwTUZZVPL5qmwR
	ScmdkP9EVT+KfaKOQ00G8xCUfLIeKFOsHZD/wcJ0rSruikygd0LfmHiTp5lx284X4E5Dw/XaOKk
	tTKQGxkhR+dA6YDquCQ/8GYR5jPIayf5xCKzYzZGHEPRmE8FSgHQTE8HQeH7NCFmBpTRM9G3XN2
	nBHfsQIvJA//FCU1W0+Ktabnt0aqXe/NH7ACqQJBYrY79brWmMsxbdQjMxnTlcA63Ij+i5OLlkk
	r1hS2z6jdXUVu/tqnIpkfA5Ay2T4JbfGzwPzbjF5Zs5lkVoVUbkKEjiU0I8si66ffVBdeVT4ge6
	Z9ms74onWdy6WuMFHHdiXR
X-Google-Smtp-Source: AGHT+IG7mgnceqMZanZPDI1w2t5pzxRJNT+htUoM4mb2kcMgZdM1p1lZkOwKbk4NvSUfMv8tqi2X9Q==
X-Received: by 2002:a17:902:f68c:b0:25c:d4b6:f119 with SMTP id d9443c01a7336-290c9c89ce1mr477448905ad.12.1761536841341;
        Sun, 26 Oct 2025 20:47:21 -0700 (PDT)
Received: from cs20-buildserver.. ([2402:7500:402:b3a0:5492:7724:1128:1af1])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b71268bdd50sm5997929a12.0.2025.10.26.20.47.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Oct 2025 20:47:21 -0700 (PDT)
From: Stanley Chu <stanley.chuys@gmail.com>
X-Google-Original-From: Stanley Chu <yschu@nuvoton.com>
To: frank.li@nxp.com,
	miquel.raynal@bootlin.com,
	alexandre.belloni@bootlin.com,
	linux-i3c@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	tomer.maimon@nuvoton.com,
	kwliu@nuvoton.com,
	yschu@nuvoton.com
Subject: [PATCH v2 1/1] i3c: master: svc: Prevent incomplete IBI transaction
Date: Mon, 27 Oct 2025 11:47:15 +0800
Message-Id: <20251027034715.708243-1-yschu@nuvoton.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251026_204722_419557_DBEB9CB2 
X-CRM114-Status: GOOD (  11.27  )
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

From: Stanley Chu <yschu@nuvoton.com>

If no free IBI slot is available, svc_i3c_master_handle_ibi returns
immediately. This causes the STOP condition to be missed because the
EmitStop request is sent when the transfer is not complete. To resolve
this, svc_i3c_master_handle_ibi must wait for the transfer to complete
before returning.

Fixes: dd3c52846d59 ("i3c: master: svc: Add Silvaco I3C master driver")
Signed-off-by: Stanley Chu <yschu@nuvoton.com>
---
Changes since v1:
 * do not touch coding style change
---
 drivers/i3c/master/svc-i3c-master.c | 22 ++++++++++++++--------
 1 file changed, 14 insertions(+), 8 deletions(-)

diff --git a/drivers/i3c/master/svc-i3c-master.c b/drivers/i3c/master/svc-i3c-master.c
index 9641e66a4e5f..e70a64f2a32f 100644
--- a/drivers/i3c/master/svc-i3c-master.c
+++ b/drivers/i3c/master/svc-i3c-master.c
@@ -406,21 +406,27 @@ static int svc_i3c_master_handle_ibi(struct svc_i3c_master *master,
 	int ret, val;
 	u8 *buf;
 
-	slot = i3c_generic_ibi_get_free_slot(data->ibi_pool);
-	if (!slot)
-		return -ENOSPC;
-
-	slot->len = 0;
-	buf = slot->data;
-
+	/*
+	 * Wait for transfer to complete before returning. Otherwise, the EmitStop
+	 * request might be sent when the transfer is not complete.
+	 */
 	ret = readl_relaxed_poll_timeout(master->regs + SVC_I3C_MSTATUS, val,
 						SVC_I3C_MSTATUS_COMPLETE(val), 0, 1000);
 	if (ret) {
 		dev_err(master->dev, "Timeout when polling for COMPLETE\n");
-		i3c_generic_ibi_recycle_slot(data->ibi_pool, slot);
 		return ret;
 	}
 
+	slot = i3c_generic_ibi_get_free_slot(data->ibi_pool);
+	if (!slot) {
+		dev_dbg(master->dev, "No free ibi slot, drop the data\n");
+		writel(SVC_I3C_MDATACTRL_FLUSHRB, master->regs + SVC_I3C_MDATACTRL);
+		return -ENOSPC;
+	}
+
+	slot->len = 0;
+	buf = slot->data;
+
 	while (SVC_I3C_MSTATUS_RXPEND(readl(master->regs + SVC_I3C_MSTATUS))  &&
 	       slot->len < SVC_I3C_FIFO_SIZE) {
 		mdatactrl = readl(master->regs + SVC_I3C_MDATACTRL);
-- 
2.34.1


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
