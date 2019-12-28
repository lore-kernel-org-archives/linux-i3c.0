Return-Path: <SRS0=VRwb=2X=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B91C0C3276D
	for <linux-i3c@archiver.kernel.org>; Thu,  2 Jan 2020 12:26:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8875F21734
	for <linux-i3c@archiver.kernel.org>; Thu,  2 Jan 2020 12:26:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="E5u1Jr1x";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e9q6Ugps"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8875F21734
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=9j0grB/oIMrMAjoV/tQwM/QNeqH52T1Y9gz3D11WwdM=; b=E5u1Jr1xskt/sw2BtqGZeOVUsU
	VsuKsDmBS+xi58V7cXCt5mJxC84V0vXBzPeib4h28nUqYcQYJn1CGaRjDW6rE2T24Bug+3wVdtPln
	YT52+Wc3x0g1IDmfWKcWqwDc22ho446dCeGuxKQqfkYKCszffn4VJnoAv27CIzhiq/quPLGU3r52/
	96Au0geDpH1+2KAbYuU+uvm6lxeGeSt1FI5PNYnQmKDkXMCk3SSpeyhockhHVtjpo9PWgfzzNUMv5
	VE2pYikemK8esGsuEg9sYB04TsXAFb2Y6eQUuzGqxQ8690uVo0qB12qZx8PaXyEpM6TQNgKqA+1UT
	TvdW4vcQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1imzYN-0001LV-MA; Thu, 02 Jan 2020 12:26:15 +0000
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ilHE5-000557-T1
 for linux-i3c@lists.infradead.org; Sat, 28 Dec 2019 18:54:15 +0000
Received: by mail-pf1-x444.google.com with SMTP id i23so10923161pfo.2
 for <linux-i3c@lists.infradead.org>; Sat, 28 Dec 2019 10:54:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=UMpegDdh42rzwNWi4a8X/3LZzmdLDgDCJkziq2QANl8=;
 b=e9q6UgpsjC8HSol+91vUSHFa8daBZdwfDH9ZaAV2Jp6qXzLG2sx+VRx0s6GWj8/ADO
 HYGMGVEEMgKjXVJ0AdrCNTV7kiDHSMV8/qNfTrMf+f1GmzI/bebbACkVVz14k/dS82Tj
 IhYUG14vGzbmhUd73o0R7t2I3cX7SSb6YUHbqZWXHxOq+czkfmzq1I5oyVDPuOMeZAGH
 BNf12FdFdPkDC9ndIR7pTNCQhi/8qLU3QlbOmDWLsSv8SgtoSdjB1PW1QYu1oheOMUW4
 Uvi7Rf8iwO7R6LazQsZ6crHj2+WJF4Yxvx/3/uO8zfCmTXvCuMYb4YKWtZlRSvv/i1vm
 coTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=UMpegDdh42rzwNWi4a8X/3LZzmdLDgDCJkziq2QANl8=;
 b=iMz66jT0V7r/cqbWELFlzjDQhIoisZDAWJj/DdZfy21DpKVDhLOspS7otvrcd2wAKI
 v7El1gnsocfykCZ536cnsvXI9NWpu6U2VnKI65ADp09iel/kNBrKnygdxanx5LZ7PF/x
 1aqImnLB2dNLdtasCShczYQiUy1F/5YI/pZK57gPitVgJ0CcwXlGVIbzF7HE+YIKqTi1
 3nYv/2XUItLZuQkCJi2Ts3VyzJpwspNT/oSGJ3L+2FbE6qKefzrcSzX8dkK5FG4ySpFf
 UNLI5FILaz4vKQv6dTtqQqWzRWxTZgLR6ZKljP5xwYoloQgA3ZBeyEwbSp2JppJ0T0Ol
 72NQ==
X-Gm-Message-State: APjAAAU26R1SJ73XnRIqLDI3QVM+o24mFyYaiCqr+x8hROnW8yFYtiwI
 P9d/r2+G68oDgmJKk/YcHf4=
X-Google-Smtp-Source: APXvYqxZdd7bCMqliucX1yrrszuwOT+M4ZDG7SqTzywn9D7Id0OiQSUtwWIlN0/jvmlNbs4Auz2/aQ==
X-Received: by 2002:a63:fe0a:: with SMTP id p10mr59963512pgh.96.1577559253330; 
 Sat, 28 Dec 2019 10:54:13 -0800 (PST)
Received: from localhost ([2001:19f0:6001:12c8:5400:2ff:fe72:6403])
 by smtp.gmail.com with ESMTPSA id 80sm37407784pfw.123.2019.12.28.10.54.12
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Sat, 28 Dec 2019 10:54:12 -0800 (PST)
From: Yangtao Li <tiny.windzz@gmail.com>
To: vitor.soares@synopsys.com,
	bbrezillon@kernel.org,
	pgaj@cadence.com
Subject: [PATCH 2/2] i3c: master: cdns: convert to
 devm_platform_ioremap_resource
Date: Sat, 28 Dec 2019 18:54:06 +0000
Message-Id: <20191228185406.26551-2-tiny.windzz@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191228185406.26551-1-tiny.windzz@gmail.com>
References: <20191228185406.26551-1-tiny.windzz@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191228_105413_930809_589062B7 
X-CRM114-Status: UNSURE (   9.34  )
X-CRM114-Notice: Please train this message.
X-Mailman-Approved-At: Thu, 02 Jan 2020 04:26:14 -0800
X-BeenThere: linux-i3c@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux I3C <linux-i3c.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-i3c/>
List-Post: <mailto:linux-i3c@lists.infradead.org>
List-Help: <mailto:linux-i3c-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=subscribe>
Cc: Yangtao Li <tiny.windzz@gmail.com>, linux-i3c@lists.infradead.org,
 linux-kernel@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

Use devm_platform_ioremap_resource() to simplify code.

Signed-off-by: Yangtao Li <tiny.windzz@gmail.com>
---
 drivers/i3c/master/i3c-master-cdns.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/i3c/master/i3c-master-cdns.c b/drivers/i3c/master/i3c-master-cdns.c
index 10db0bf0655a..2fb7ed34f995 100644
--- a/drivers/i3c/master/i3c-master-cdns.c
+++ b/drivers/i3c/master/i3c-master-cdns.c
@@ -1524,7 +1524,6 @@ static void cdns_i3c_master_hj(struct work_struct *work)
 static int cdns_i3c_master_probe(struct platform_device *pdev)
 {
 	struct cdns_i3c_master *master;
-	struct resource *res;
 	int ret, irq;
 	u32 val;
 
@@ -1532,8 +1531,7 @@ static int cdns_i3c_master_probe(struct platform_device *pdev)
 	if (!master)
 		return -ENOMEM;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	master->regs = devm_ioremap_resource(&pdev->dev, res);
+	master->regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(master->regs))
 		return PTR_ERR(master->regs);
 
-- 
2.17.1


_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
