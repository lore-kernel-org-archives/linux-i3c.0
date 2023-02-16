Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BA44C61DA4
	for <linux-i3c@archiver.kernel.org>; Thu, 16 Feb 2023 15:15:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	Mime-Version:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=gWQmSa/hVQv1BGWGHmQRAZUVE+B1Mv+LIIqkjFNv2L0=; b=uPC
	HgiTL/D+t3QbLgiwR2y9dRR4niNIfsoulPLj5DjxpSJ/6DSDpT0WetAD9/WcCoTB+1jkV9OXRxVEd
	rWSeSuhaXBhd0kwWnx6p5idhGokXdUhdaafsLlTVV3rKoTRLQhQU65OWLXMVu+NxYT6bQQ4tW+oUT
	3TDnRB9GNXYEExDY2SqWoi6YaRRDioPkVUsH+JYTdvf5dZYaniKUX5Bi6ukts3xDCkAhdgIWm9ya+
	atAsXb5D/YlE5cwm4l1LVYxsMEAVvU7PTYf479CYljM7dIiLHr8VOdNihO9J/4SyYmqzCHsroGAOr
	NcuV0JXsFOzDlHJLcIJDfthi8tORv4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSfyP-00ApGx-57; Thu, 16 Feb 2023 15:15:01 +0000
Received: from mail-yw1-x1149.google.com ([2607:f8b0:4864:20::1149])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSfue-00AoZm-55
	for linux-i3c@lists.infradead.org; Thu, 16 Feb 2023 15:11:12 +0000
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-527501b56ffso22951997b3.15
        for <linux-i3c@lists.infradead.org>; Thu, 16 Feb 2023 07:11:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=qqMGnRjZj67H+uo/a7kB+5tYajP931OKisC+PcDlIto=;
        b=H+7jbbNtNvxP239FK+id+MguHSSyGo2wTrvtY9DDS0YNvTi2vK1PYnwq4u0t2aUz27
         VuZALewfZHlf7Iw22G+iTM/KiJZ3/MvkLEp/ANWkO7KkWLCAKjMgaoDFR3P+dEefVYiw
         LRx4EA4DIlnY2NRgdUoDo4+Q0lyxd0jZct5acbtithq61ldynvyN4Fg4IrGT84wzaPbZ
         xh9+ci6UuhPoL6KjcwwToZjI2Zu1j6DJeqHIUtkAJ0m5unNIy3PT//8dsLnkkZJ/0J9c
         3EUKBtYX8JzHkrp+ZEevQeb6O5PHhpJfZ3SmzF8PlAugTnwiVgyQuP8xN7qiJ9rFYzeD
         ePDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qqMGnRjZj67H+uo/a7kB+5tYajP931OKisC+PcDlIto=;
        b=tu/cXjC+VGExRZLLamtvXcBtIdHmXLFIvB0pLjv8H2kiyt4GHo9IX6QhwGj1eyI7aD
         zWeaZw2g3o3hb95Z+CRXWxj1TOqGd0uacuDSRsWFgtiXfH4BxhoJsHLH6p32qkiQYjDe
         QnAfBOFYVaiGH9FvCmuTz/V6PXIxH+9JA899FDqtZHspUINGbuHYNwv1a4e7jlPgyOuj
         3fl8OdomZ0API0qfmvE6TtcaWIumVih3B2hnqNvcnlHjNmyf8+rALkcWvLVBYnC9yUTm
         jkOhpfLMBYmm4/V5wTyfOe08i5v4GOusmdNAazulH97oLhQvQ7Z29D1vG/9KrLFvyJ7W
         8ZWg==
X-Gm-Message-State: AO0yUKVi1gtsNmQj+pG+9OrFmGNFQpI6o0jCvF6Z9U2xqCbCG/QCnAzT
	vVHS6o2sAi7lp3fo5XcgLvdBtzEBICJyMEWb
X-Google-Smtp-Source: AK7set9X88/pH1hQHbIhksYYJvB721b36NsXG60z78UMXCaavH1Nz2n8Mx60CJfndOiBASHbzp6vqRzikm6KKLh0
X-Received: from zenghuchen.c.googlers.com ([fda3:e722:ac3:cc00:2b:7d90:c0a8:2448])
 (user=zenghuchen job=sendgmr) by 2002:a81:ac60:0:b0:52e:bb8a:1cc4 with SMTP
 id z32-20020a81ac60000000b0052ebb8a1cc4mr8ywj.6.1676560260836; Thu, 16 Feb
 2023 07:11:00 -0800 (PST)
Date: Thu, 16 Feb 2023 10:10:57 -0500
Mime-Version: 1.0
X-Mailer: git-send-email 2.39.2.637.g21b0678d19-goog
Message-ID: <20230216151057.293764-1-zenghuchen@google.com>
Subject: [PATCH v3] i3c: update dw-i3c-master i3c_clk_cfg function
From: Jack Chen <zenghuchen@google.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Jesus Sanchez-Palencia <jesussanp@google.com>, Mark Slevinsky <markslevinsky@google.com>, 
	Jack Chen <zenghuchen@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230216_071108_216939_608FB1F8 
X-CRM114-Status: GOOD (  11.25  )
X-Mailman-Approved-At: Thu, 16 Feb 2023 07:15:00 -0800
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

Bus-speed could be default(12.5MHz) or defined by users in dts.
Dw-i3c-master should not hard-code the initial speed to be
I3C_BUS_TYP_I3C_SCL_RATE (12.5MHz)
And because of Synopsys's I3C controller limit (hcnt/lcnt register
length) and core-clk provided, there is a limit to bus speed, too.
For example, when core-clk is 250 MHz, the bus speed cannot be
lowered below 1MHz.

Tested: tested with an i3c sensor and captured with a logic analyzer.

Signed-off-by: Jack Chen <zenghuchen@google.com>
---
[v3]
- change the target tree to be i3c/next
[v2]
- replace max with max_t

 drivers/i3c/master/dw-i3c-master.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
index 51a8608203de..48954d3e6571 100644
--- a/drivers/i3c/master/dw-i3c-master.c
+++ b/drivers/i3c/master/dw-i3c-master.c
@@ -531,7 +531,7 @@ static int dw_i3c_clk_cfg(struct dw_i3c_master *master)
 	if (hcnt < SCL_I3C_TIMING_CNT_MIN)
 		hcnt = SCL_I3C_TIMING_CNT_MIN;
 
-	lcnt = DIV_ROUND_UP(core_rate, I3C_BUS_TYP_I3C_SCL_RATE) - hcnt;
+	lcnt = DIV_ROUND_UP(core_rate, master->base.bus.scl_rate.i3c) - hcnt;
 	if (lcnt < SCL_I3C_TIMING_CNT_MIN)
 		lcnt = SCL_I3C_TIMING_CNT_MIN;
 
@@ -541,7 +541,8 @@ static int dw_i3c_clk_cfg(struct dw_i3c_master *master)
 	if (!(readl(master->regs + DEVICE_CTRL) & DEV_CTRL_I2C_SLAVE_PRESENT))
 		writel(BUS_I3C_MST_FREE(lcnt), master->regs + BUS_FREE_TIMING);
 
-	lcnt = DIV_ROUND_UP(I3C_BUS_TLOW_OD_MIN_NS, core_period);
+	lcnt = max_t(u8,
+		     DIV_ROUND_UP(I3C_BUS_TLOW_OD_MIN_NS, core_period), lcnt);
 	scl_timing = SCL_I3C_TIMING_HCNT(hcnt) | SCL_I3C_TIMING_LCNT(lcnt);
 	writel(scl_timing, master->regs + SCL_I3C_OD_TIMING);
 
-- 
2.39.2.637.g21b0678d19-goog


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
