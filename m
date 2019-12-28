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
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6665C2D0DC
	for <linux-i3c@archiver.kernel.org>; Thu,  2 Jan 2020 12:26:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 87AE2215A4
	for <linux-i3c@archiver.kernel.org>; Thu,  2 Jan 2020 12:26:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hb1Z2Cyw";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KzU+fMIs"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 87AE2215A4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=ANpZ2N/Zzv8SD/E3Cee+xCYvWfXQwMaUyqGY6NdZQtY=; b=hb1
	Z2CywAV9eR/ZqTn0a8b3uFBo/KNrV26IiNQA9SDDjXkc/J6LFd48EUWfFdyxT69ycpSpOFkJKp7pE
	ZK09CDO1tPMXW2l280zR9DykOGxlhQPBHENIF/tnyFrfJWznNfD2H3Us2f/0AmyKGtvk7WahOgkQB
	uSu8DveyA4qx2SpzzWh5zR6INeyrnOFUQgB8dkkTJuHi5PX2WGQhalblunxgeg4V+08oAOu+wci/d
	K6ldn3UqQM5WWszuhOksnrsJamYNHOYKQ2MurCJtd4E431MxEW5M1KwMz+813XGRHQVX2mzbBLyeE
	jZ7Tg+hsl1rmcXfGbdITz4/DOMAHTVw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1imzYN-0001LP-JO; Thu, 02 Jan 2020 12:26:15 +0000
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ilHE5-00054r-44
 for linux-i3c@lists.infradead.org; Sat, 28 Dec 2019 18:54:14 +0000
Received: by mail-pg1-x542.google.com with SMTP id 6so16076299pgk.0
 for <linux-i3c@lists.infradead.org>; Sat, 28 Dec 2019 10:54:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=588nZdPWSQouHjrbTQFmmqqGhpH/jdEr/402TOJdIJc=;
 b=KzU+fMIscpUWow82dmtcE1NqW4BtUv9qlJ/V66IIlkZOW1slFsk8PIok3Yt6Y1Xohd
 O7rBugj37TUVCItVg94RKD7rHZNospOTzMhKAcuEKkwZetrwVTxS1TAf4zTj9ec0wxZ4
 hn2kYpoHyoLA3YvCETC8a3ghKsA4SWv5bCq3lU1ZggIf1PKZVO9iMqZP2XXMa6rxemHB
 lRUsNUPtrn4bWrL3RwTAev+KCtNaKRPR7RriLMkRIJqs1AGBj5ZWhveSLBPCT2k28NKF
 60vsaswEps2QEApSLKcau8AyvC6kp4uWs1QxSu8j370Fz0BlLRes/qnOZC4QIxN6k1r0
 05Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=588nZdPWSQouHjrbTQFmmqqGhpH/jdEr/402TOJdIJc=;
 b=JdkkGknob8pYjB9p25Uihvk14gY7g9kTC6pXHp0bXDOT41e2JKO1iIzNZ2Dm2TMk5L
 /I4TWj/nmNcL1Dye2/s7JN6EtzZIQf/kkUf5OsMSwSwJ1GJ+eBNEaFeHHyO2EI0LfhAv
 ZBKWH7yyHTZxpWz5Ts5XBBO7A1plbELVSITUMu3dxQSRkCwIWJtYap7KkxRcU6Ak2zFt
 FYXGt0DCIAoFpy3/sUP1HR7ZjpuJK+IWYShJy1fe1imT/EBj28tn3YJnG4yVCO1560KR
 5v/p3mtraZN/PbB4vjjOR5gJOMpByixyTFVJyX8dscwIg3wyYS26Oud0dmhrqjp4LY2b
 a46Q==
X-Gm-Message-State: APjAAAXH3zgpQCLaG3wc0NuxQ93dTHdMXZ/9dK6A5DXTm5u5oOLkAElj
 VuNySibRZkopMLtwEIb5wyk=
X-Google-Smtp-Source: APXvYqyMHrB05SJ3/Gp0VgA5qfEvy9nXYHMD8qUa30Vtq3e4UjI6m5ninFt+t5uVVWIN4TnGLFJqyQ==
X-Received: by 2002:a62:4d87:: with SMTP id
 a129mr61018157pfb.116.1577559251648; 
 Sat, 28 Dec 2019 10:54:11 -0800 (PST)
Received: from localhost ([2001:19f0:6001:12c8:5400:2ff:fe72:6403])
 by smtp.gmail.com with ESMTPSA id j125sm44497385pfg.160.2019.12.28.10.54.11
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Sat, 28 Dec 2019 10:54:11 -0800 (PST)
From: Yangtao Li <tiny.windzz@gmail.com>
To: vitor.soares@synopsys.com,
	bbrezillon@kernel.org,
	pgaj@cadence.com
Subject: [PATCH 1/2] i3c: dw: convert to devm_platform_ioremap_resource
Date: Sat, 28 Dec 2019 18:54:05 +0000
Message-Id: <20191228185406.26551-1-tiny.windzz@gmail.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191228_105413_157252_9180FB13 
X-CRM114-Status: UNSURE (   8.60  )
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
 drivers/i3c/master/dw-i3c-master.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
index b0ff0e12d84c..7b941e93337f 100644
--- a/drivers/i3c/master/dw-i3c-master.c
+++ b/drivers/i3c/master/dw-i3c-master.c
@@ -1100,15 +1100,13 @@ static const struct i3c_master_controller_ops dw_mipi_i3c_ops = {
 static int dw_i3c_probe(struct platform_device *pdev)
 {
 	struct dw_i3c_master *master;
-	struct resource *res;
 	int ret, irq;
 
 	master = devm_kzalloc(&pdev->dev, sizeof(*master), GFP_KERNEL);
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
