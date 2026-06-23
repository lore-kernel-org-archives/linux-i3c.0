Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02E98CDB46F
	for <linux-i3c@archiver.kernel.org>; Tue, 23 Jun 2026 15:51:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=JbP+rPEFXlivsun5/GS3e2gBUUKqQ/Pk6FG6UBCYkXE=; b=nELXzrHBYq6V0R
	F2QV6qDBMcv4DL0g0ZSJ6TFHSZOUtr5JXJhdWe299nulnWFiTsKHw8w3dXTweLc0tMjkrPnxxBbid
	flgOTo6p6AWlCFt8AnFllGSEnJmxnnY0xTmvb3DDCIEnVaQO15ZodG4xfAejkueDzJMy7FkW+McNO
	lbj4XL1LeaSLM2nz03ylG6fxGzS/VJEcXDUM9PTm2JS1xY2nvWLrR0Noh+l8d3gUN5GrSjgjd7Jy4
	GJZt5tua2qEhy/NW0Yb55RWnQMkA/KU0ikXmEMO/7SrbIhHtGxeXAAC3/WUQ3V/ROjXV2j02wzlCM
	7FEPoud/WwDi0qjynmEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wc3Pf-00000006ZVY-1ybN;
	Tue, 23 Jun 2026 15:51:47 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wc3Pd-00000006ZV6-1baE
	for linux-i3c@lists.infradead.org;
	Tue, 23 Jun 2026 15:51:46 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-84226d0f1d2so68605b3a.1
        for <linux-i3c@lists.infradead.org>; Tue, 23 Jun 2026 08:51:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782229904; x=1782834704; darn=lists.infradead.org;
        h=mime-version:content-transfer-encoding:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=j9NNaAQXxA7tp5h7ZzpX9ErwD3n1HZRKdmhW285xKfA=;
        b=YVbPgxVHVRZkKAd5qj+FWijYSha6cN0z3Lg8xl7I0jCUlm0z6RZ7JsUyY94yuU1bhu
         +Os9Wp/8Uha5/8EnP89PlK9F0G6Z75nIp5chL7Afo5H561zn+r/pgopAXgry6CN1RE32
         svx+IXarShfrWrLySJO+GNutgGoRjzPhqneyarpU87Yf6mDCplfWfdJJN45zUYsJiz8b
         p2NLR7psqeQSQFfhaGrBt86xLvYXYWZ0hM0SFHgxUvSgrpi1AQHePbZY0IAWLiRGnF2F
         /qLbssjtUDZGafwCh94IHvhrUl/+3rgabmIW3EIgbVOEces4zS8298rmHdDDGRE/Pdi0
         elKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782229904; x=1782834704;
        h=mime-version:content-transfer-encoding:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j9NNaAQXxA7tp5h7ZzpX9ErwD3n1HZRKdmhW285xKfA=;
        b=l+CfptQqU2buOeKDSCyO0jKseqPGsbAuj84CGxWbS5AOyNFXYG2MvYVhnsHPlT4koj
         +6s+aXUY0LpPo1TMOcp433QOFrFkUI0UUYdPL52gLkmn4bm6xwq3dvzs08ZCDK41qopD
         v6BYJITX2AqGNrmJFaEvO7ebYyK+cVx5D3U8lly82/MQ567whQaRY+/M+Sdumr3MyMLV
         asxyM8D52FUgurjs8Juw0J9wKa4HAAse/R4vWo5p+8TjNMo7G1hh1heMe02dgdNm0x/x
         AXljcjZkSRBLq25mf+FlEEQ+3H/dF1HQ5XAccjKsP1Ym0O/aTVazTAnxDCE+XkTWvnVM
         Apog==
X-Forwarded-Encrypted: i=1; AFNElJ8FFAHOXFlquYiJ1aQ3QjV+Fcozvjv9Cq1jkxN4rN9bkxOqzHJnwngT5EA4m7ldNWqcl8BJGLgC6HM=@lists.infradead.org
X-Gm-Message-State: AOJu0YxYDlu53y2eQPbrsN4g6qOgGhucUr2rNa4F3ICe6Rtm+zXHa9cl
	MCU5iSFJTTiOFQ4w8sCjkn80rDH2BvWF7UJpMALv8Bic7G00a/dKj/tbqmIQLw==
X-Gm-Gg: AfdE7cms2knJgr3grX6XAYjcZi5UmUC61CUCycrbtTiaimVwzysCDGXIT5SHLQcglbK
	iX8bvn5yeBW/Yhda9WzLZNmXRRN/njksFLwgmji4QSx5ReBwg9uf6pYQ1xltAzBZ7zFvDliWh7H
	/jNL/rD1QvHu0L9dsDvNpZlO7ROGYE0PfrzfPmhkhOYr/XxcG4oxUnAMLcvhms0Fx2OXnv1x5cN
	tEaKV6aRw4CBH8667zr/Alw5gB7PxeT+Wm2kfOnHrLW+Ud9mUI203eEEWPVd3+z6XPMp5bZBSfJ
	qRAAQ4nRWA0fWyZA+IxWoyx8YMqMuJ2cSGPR5xVSoNCWhxog4UzKW/L6wJg5k6HY555Z21wBui6
	fDC7HSN8PNLhmH/T2qbYM3uwkvFHSVPlypQT0C/3w7GrgivGAGKXWZg9VLMfds4VvoOHjEuX1FD
	VVgeDuBmeM9Y6EmWl1vlwZqYhJon685Sw2AMZ68A==
X-Received: by 2002:a05:6a00:4004:b0:845:4c76:e46a with SMTP id d2e1a72fcca58-845952108a1mr4322078b3a.3.1782229904262;
        Tue, 23 Jun 2026 08:51:44 -0700 (PDT)
Received: from csl-conti-dell7858.ntu.edu.sg ([155.69.195.57])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84564ebcf45sm10418471b3a.48.2026.06.23.08.51.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 08:51:43 -0700 (PDT)
From: Maoyi Xie <maoyixie.tju@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, Frank Li <Frank.Li@nxp.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Kaixuan Li <kaixuan.li@ntu.edu.sg>, linux-i3c@lists.infradead.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: [PATCH] i3c: master: svc: bound IBI payload to the requested max_payload_len
Date: Tue, 23 Jun 2026 23:51:40 +0800
Message-ID: <178222990006.2767135.12462569914183698733@maoyixie.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260623_085145_434858_4140846B 
X-CRM114-Status: GOOD (  11.13  )
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
space left in the slot, the same way dw-i3c does.

Fixes: dd3c52846d59 ("i3c: master: svc: Add Silvaco I3C master driver")
Cc: stable@vger.kernel.org
Co-developed-by: Kaixuan Li <kaixuan.li@ntu.edu.sg>
Signed-off-by: Kaixuan Li <kaixuan.li@ntu.edu.sg>
Signed-off-by: Maoyi Xie <maoyixie.tju@gmail.com>
---
 drivers/i3c/master/svc-i3c-master.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/i3c/master/svc-i3c-master.c b/drivers/i3c/master/svc-i3c-master.c
index e2d99a3ac07d..7420bfbdd259 100644
--- a/drivers/i3c/master/svc-i3c-master.c
+++ b/drivers/i3c/master/svc-i3c-master.c
@@ -465,9 +465,11 @@ static int svc_i3c_master_handle_ibi(struct svc_i3c_master *master,
 	buf = slot->data;
 
 	while (SVC_I3C_MSTATUS_RXPEND(readl(master->regs + SVC_I3C_MSTATUS))  &&
-	       slot->len < SVC_I3C_FIFO_SIZE) {
+	       slot->len < dev->ibi->max_payload_len) {
 		mdatactrl = readl(master->regs + SVC_I3C_MDATACTRL);
 		count = SVC_I3C_MDATACTRL_RXCOUNT(mdatactrl);
+		count = min_t(unsigned int, count,
+			      dev->ibi->max_payload_len - slot->len);
 		readsb(master->regs + SVC_I3C_MRDATAB, buf, count);
 		slot->len += count;
 		buf += count;

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
