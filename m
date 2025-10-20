Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4807CCCD1A5
	for <linux-i3c@archiver.kernel.org>; Mon, 20 Oct 2025 09:40:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=lelw77wcMa6R5JzbRJ4u62ZemJ28+XQ6v6zmPQov32A=; b=tqhLikNnPT0sHB
	y7LVeAejTxrX0cJMM8j0dDZsTIbjzrA9Y1wNogvX1XXHaCpjAbg3OQ5V9QaN75+Pr8/LbYGvLLDj+
	5W8BNbih75CQwxPREV/eUcdh/i4neIFkEEVw19bsyv9fPEJvnMVQEDB0mBfK5oFuSQEdo9rfHRqun
	f4guYUgB7Xb7hYY8n602fHl9ALpYzKL6EkZUIvWd+4tmUfdgdybQ5znL23g92+z0M4Ut2g0RcsXb7
	sVFwTepbcCct4HBtRPtqbnRb7FH7zJHSiSTe5WxLVJgG5yydHcRoa8pZzOI6BEAaKHwGMczwRayJD
	8JOFn/YQ8eoWooZ1COiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAmNZ-0000000Cd8N-0AJ1;
	Mon, 20 Oct 2025 09:40:37 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAmNX-0000000Cd7p-3RhM
	for linux-i3c@bombadil.infradead.org;
	Mon, 20 Oct 2025 09:40:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=a0oIALzdvBCzHopaQRdtbabnk+sudKi1EV/R9L+v82w=; b=APYvWumlKxNfBfBl1NNvhMtuVw
	ZWFLezZ5wKeAA+/h5kmyEk+WzvwvV3Ko5Yhm3tGlJ8HfnL4nNn05Md581Jc7MyYxjKVMaIApXTODU
	+aU1XL5uhIV4uhL1DKn9LvX4tZx5xBvtk6iZ8JkkMky8usMq80lPnq7C5tB65EAq2DkBk7vYy0ZkU
	+pielfxLBYEEAcbNyB3+6LwCoeFI/64ZoOJO4hdnm+gdjQv658GTPTaM2C0lHCassCcCs0EDmIXs6
	QUGFnp1OaXzvqdtf5zWb4cUvgtDcWwX3qd+1OiRYudJOQ8HXvi+Ibk0uZuC3u8ty8E0N3l10esWdm
	iUwMJGpw==;
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAmNR-00000009gHB-2WRv
	for linux-i3c@lists.infradead.org;
	Mon, 20 Oct 2025 09:40:33 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-27ee41e0798so66366735ad.1
        for <linux-i3c@lists.infradead.org>; Mon, 20 Oct 2025 02:40:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760953226; x=1761558026; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=a0oIALzdvBCzHopaQRdtbabnk+sudKi1EV/R9L+v82w=;
        b=VKdEh2xeY/6j/hgFAzHSSrN5RqrV5KtWvLbuSkkx83sjN750FhAgI0FbuHmNwcydRv
         JemXUmeAPywgH7m0You0I8vWdumZKhNkA1SMfaFuSeZCje0LN1Cux8OgnVUupgwtDOnQ
         UbiHvnbkLGC0ngV31nWyKmfWG2PptVDg0lLHM1BJCZxGQ8DnMPp3q4wX5FTW/GlVIHkV
         Jz798TXDpCrgtsoJ+3wVR63pp/5/ClOec6MNOBye8zUN1H8QVjA0M5/QSxUiSn58wgvQ
         vF6pqp0ilQ9BrHhoPT1gMuFh/HxgCYAKh9IfXnV8VRsztPzVjMsnphnzhWUfKrGEqX4e
         jMHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760953226; x=1761558026;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a0oIALzdvBCzHopaQRdtbabnk+sudKi1EV/R9L+v82w=;
        b=rXKk3ij/G9wrwVvNl+C9k86OyVNAKqndEwS1rP10hykPyYIuzsoxjpbSquq5/zwNmU
         BXhzuECUwpfGJaxyIK2GRXMxHb0kMN+ExrbdrxWuCNKS8JqS7q6kUl4D7POikFsklmGk
         91oSF9vfKLpRdBNRzrUlndSbL6327uZIdE4jnddS7AQduRLW3Xudysn3mjih2TPLqhkn
         wG+WTDkHrZAD3chQ3etlGlpPgvpgC/gge81suiuczOjM00mg+UOK4+I+W1YxSu8khVK3
         eK7IjSDdvoThm65uuprAa1aPOwhUVaDA8jCY8KrC6vtt8ACZWxIbeP21vH4z0cCLGXo2
         ER2w==
X-Forwarded-Encrypted: i=1; AJvYcCVq005wfeUCpswp5lZ1BpTHeHHmf2N0eLg4U3fqtfOBtLLMJP5mINrxrMOz6+asc9QlYkrIXkQ0tXk=@lists.infradead.org
X-Gm-Message-State: AOJu0YzUpPSP69bJ9DwUS23jXag0AEVEEL8buoB7kZkSnnF3DvJ/DKWR
	ywL2kzqb36ogUhGNB2RcwI0/xxNMCCDgIv6v+F+8rFPAMg2LSy6Y3Ez+
X-Gm-Gg: ASbGncvy8bhqzI/pmMdZu4hCQxiaEiBUkw4B0wqBjjR2Q16ZFloQIEQsi/Buq6hYnrf
	Gql1DiWmcOkvz6UEHEJaN0c2SsOI0530pSH6xqWrwPNd5+6YOal09jOeI4MxeNHJCzXg2G7Dxp6
	u6Yv0EpYRDNcfQKuVkB9JZr4A/0ON7fWSq0I4afZj6FEaeuRrevdx8iXCOakK0OlUVjx3bSgzG7
	WOYWpc91RYwzdViuFlha20trQE2RERXxrrVvlLb+44VmGz86LlK4H7hLFmUjhODJ6FnpNBqyU6q
	5OI2TWAzvE/CEOX4DR/S5WT2AnpYKF4m4qnZKcnbADpgyPukYRTL3JDCeInq8yNnvG6btAgdbXL
	Z0mEybNsOuO1Ju65J99opDPRzgtFsNk/cud0vSkeN2U3cwQXpH3l86H+/TTDCJbKlvWiBuQ2NkY
	sE4eohMVq/wZ/EInnob523
X-Google-Smtp-Source: AGHT+IGZfMm3IaaCudoKntZRXnxbMi2Da04nhgpHPd/fehyifYq0ePK/zfcjTv3HglwhIjBUkF7u6Q==
X-Received: by 2002:a17:903:1106:b0:27e:f07c:8413 with SMTP id d9443c01a7336-290c9cf8f3amr142565565ad.9.1760953226254;
        Mon, 20 Oct 2025 02:40:26 -0700 (PDT)
Received: from cs20-buildserver.. ([2402:7500:402:b3a0:c6a1:3569:3089:3268])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-292471fdcccsm75165905ad.78.2025.10.20.02.40.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Oct 2025 02:40:25 -0700 (PDT)
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
Subject: [PATCH v1 1/1] i3c: master: svc: Prevent incomplete IBI transaction
Date: Mon, 20 Oct 2025 17:40:20 +0800
Message-Id: <20251020094020.632545-1-yschu@nuvoton.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_104031_389807_DFAB48DE 
X-CRM114-Status: GOOD (  11.16  )
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
 drivers/i3c/master/svc-i3c-master.c | 24 +++++++++++++++---------
 1 file changed, 15 insertions(+), 9 deletions(-)

diff --git a/drivers/i3c/master/svc-i3c-master.c b/drivers/i3c/master/svc-i3c-master.c
index 9641e66a4e5f..9cf9fb586e92 100644
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
-						SVC_I3C_MSTATUS_COMPLETE(val), 0, 1000);
+					 SVC_I3C_MSTATUS_COMPLETE(val), 0, 1000);
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
