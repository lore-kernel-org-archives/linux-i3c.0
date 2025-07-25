Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E59EC87FCA
	for <linux-i3c@archiver.kernel.org>; Fri, 25 Jul 2025 07:04:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=nGfuBqrxyz3lBbuEBazIAS4NfQ7+FTEZS93IUbB0ZhA=; b=X7+sJdWOcaqEJ9
	EcWMz6r5n9KJOHXnnMiMpVOF8j6N5lghkeqOoVpfzYCdjvaJtQZYs+oy3MMpX9kEKzy86rmp0Ce9L
	CDBvmx4BP1oO0rX+pvDYZNuF+M6/Si96z/4ZBbXnhH6t/qBCmEj4QGzzZ5alVoch7KtYMAOkniAkz
	hm2hsMqqb3XnbQk8SvI8txxWOAbP7jxqiLbZmjIDcuVdjYhdoGC63fVzon6glcBODhiTasJH35Q/r
	n9SHtn6RYB2BYlFC8b1wuZQUgHR0roOB3Ow73Ixqc+NXrf9YPmVO+HLxWuwv/PRVLqBH1cP0qJmW7
	9A8vTzXjdaBhU9IHanBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufCTw-00000009DoB-1ftM;
	Fri, 25 Jul 2025 07:04:40 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufCSq-00000009Dd9-2yle
	for linux-i3c@lists.infradead.org;
	Fri, 25 Jul 2025 07:03:33 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-236470b2dceso15110775ad.0
        for <linux-i3c@lists.infradead.org>; Fri, 25 Jul 2025 00:03:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753427011; x=1754031811; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=K6yO7IzaeHBSJlHJN9ngERptq/fpvKj+ephhcUYtT70=;
        b=CTonx4xvdBDLxoAyo7UkKCABO1EYrNj3A7XMWWltYg9JV0QiWknichu4roGYVI8uih
         NQuYkeTI53MjZBnsju0qxHKVsyii+bPZnIysDZd9Z1auH5PB7q1QrXXlmCOtiCVTpUrb
         oXW41jPWQ2v8jWEX+pRj7ftekQzP7NBBhF2oPTGuxHcMUHDaGfwVgddK56/hlXEw/3+c
         94FoP458V9V/EsTgdNc+n0PLOqvOrDVSpTgWp0kPNeMb2Yg/gNv6niNsweqdTWHRhhwE
         Eis1jWSGjV45pw50fbuBIKFdG02E8n1YDqL/G6o0LncF6dMonX1NaODvhko+Cxrdc72u
         hq5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753427011; x=1754031811;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K6yO7IzaeHBSJlHJN9ngERptq/fpvKj+ephhcUYtT70=;
        b=lmxqceFFionluk4KiwAK/id77tXsa1RvRJhF8BzY4PYcWdLplJxZYX/Ag06JdpIVqy
         ZowFnzQciercXe5jkpCnEUb29sl9oZqFkYf69azPJ6iO9jB5Dp/y4M8DFPLtyMTr4RjX
         cc+mHKHB3jo36uHbitS586qfqbpY7i43TJ0zzAq3gGK8mIw9d+1hZH/iDmh2IHkhzm5l
         AAYdIy36MXuSbDHE0Dm1+0eH/YCk3cNuBCmOCwTnn7wMSMRCKeJ7wUXOTdmSpUfGoOJi
         seMlK7bYTsKA2hnhtojo4tc9tIOt+8hieN3ykOk0QE/t70SgQQQFckYdi3lrcXP/nIpG
         MmBg==
X-Forwarded-Encrypted: i=1; AJvYcCX72kD1Ze5iyZYZ99ymG24sQa/WFarvDRY1r9zVTuXS7GbT717vBCAeXXHP+q04n0R6Rm9GNroYn+8=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz1a4zgxbX2bVODbmD2klv898vjHOVr+awNCLHnfrm89OZAyR8j
	J32W0TUuaeEskYydeu5fIrq9msCXO3R9TrBmYs8czhom/1MSiXPrloTn
X-Gm-Gg: ASbGncvVOttvLcuJDuBMt0k+/UYgWU4ke+FTXZZxxCoUK8mrMSninUfqmm6ujW07R8Y
	GAS1aOnTRXHKVKsa0BoYrIH0rj1MzqEGmz3HuYvL9b+SL1grZzMje2qQiLWYCe4GZ+GQdCWALQ1
	PlCafK2OBTsRtM7SBRhZDR0bz1P1mTiPy3h0dt03nYHtk5lqjgkPS8BXXG6wavK8/KxwdWecTeg
	vnH8srh3LTAOTM81RwU/Zb4nDPw4py0bqPQOyHsyjUSCau4epV88C3s4F7HgWGl43HnEfpJpr8V
	ZCiMurJaNq+3w1cGHaDfnuheydOfYB6yzqS4BrwYZLITqV+3pA/f8e/c7WVGawd2EEdUijNHxB2
	JcsGMBfXiw0JT5DCt0l1ASFNTyqDm3Fxc
X-Google-Smtp-Source: AGHT+IG6KVfUPFfMgR78uASZYFuZsUTL4kAp3w3utSG9AFXK2UQGsNqpZIMCbThdR2zXsyXoL7Ed3g==
X-Received: by 2002:a17:903:2409:b0:234:8a4a:adac with SMTP id d9443c01a7336-23fb30ab831mr13271445ad.20.1753427011460;
        Fri, 25 Jul 2025 00:03:31 -0700 (PDT)
Received: from cs20-buildserver.lan ([2402:7500:400:60db:2e0:4cff:fe68:863])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23fa475f2fesm30097865ad.21.2025.07.25.00.03.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Jul 2025 00:03:30 -0700 (PDT)
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
Subject: [PATCH v1] i3c: master: svc: Fix npcm845 FIFO_EMPTY quirk
Date: Fri, 25 Jul 2025 15:03:10 +0800
Message-Id: <20250725070310.1655585-1-yschu@nuvoton.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250725_000332_752649_FA54BC5F 
X-CRM114-Status: GOOD (  11.11  )
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

Prefilling in private write transfers is only necessary when the FIFO
is empty. Otherwise, if the transfer is NACKed due to IBIWON and retries
continue, data may be prefilled again but could be lost because the FIFO
is not empty.

Fixes: 4008a74e0f9b ("i3c: master: svc: Fix npcm845 FIFO empty issue")
Signed-off-by: Stanley Chu <yschu@nuvoton.com>
---
 drivers/i3c/master/svc-i3c-master.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/i3c/master/svc-i3c-master.c b/drivers/i3c/master/svc-i3c-master.c
index 7e1a7cb94b43..34b6e125b18a 100644
--- a/drivers/i3c/master/svc-i3c-master.c
+++ b/drivers/i3c/master/svc-i3c-master.c
@@ -104,6 +104,7 @@
 #define   SVC_I3C_MDATACTRL_TXTRIG_FIFO_NOT_FULL GENMASK(5, 4)
 #define   SVC_I3C_MDATACTRL_RXTRIG_FIFO_NOT_EMPTY 0
 #define   SVC_I3C_MDATACTRL_RXCOUNT(x) FIELD_GET(GENMASK(28, 24), (x))
+#define   SVC_I3C_MDATACTRL_TXCOUNT(x) FIELD_GET(GENMASK(20, 16), (x))
 #define   SVC_I3C_MDATACTRL_TXFULL BIT(30)
 #define   SVC_I3C_MDATACTRL_RXEMPTY BIT(31)
 
@@ -280,6 +281,13 @@ static inline bool is_events_enabled(struct svc_i3c_master *master, u32 mask)
 	return !!(master->enabled_events & mask);
 }
 
+static inline bool svc_i3c_master_tx_empty(struct svc_i3c_master *master)
+{
+	u32 reg = readl(master->regs + SVC_I3C_MDATACTRL);
+
+	return (SVC_I3C_MDATACTRL_TXCOUNT(reg) == 0);
+}
+
 static bool svc_i3c_master_error(struct svc_i3c_master *master)
 {
 	u32 mstatus, merrwarn;
@@ -1303,7 +1311,8 @@ static int svc_i3c_master_xfer(struct svc_i3c_master *master,
 		 * The only way to work around this hardware issue is to let the
 		 * FIFO start filling as soon as possible after EmitStartAddr.
 		 */
-		if (svc_has_quirk(master, SVC_I3C_QUIRK_FIFO_EMPTY) && !rnw && xfer_len) {
+		if (svc_has_quirk(master, SVC_I3C_QUIRK_FIFO_EMPTY) && !rnw && xfer_len &&
+		    svc_i3c_master_tx_empty(master)) {
 			u32 end = xfer_len > SVC_I3C_FIFO_SIZE ? 0 : SVC_I3C_MWDATAB_END;
 			u32 len = min_t(u32, xfer_len, SVC_I3C_FIFO_SIZE);
 
-- 
2.34.1


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
