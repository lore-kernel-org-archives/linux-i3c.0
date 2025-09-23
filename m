Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47552CAC5A5
	for <linux-i3c@archiver.kernel.org>; Tue, 23 Sep 2025 20:36:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=60G9MT+me/BGVfutHir289w0dZ4+jx+/fKEijUq+ZXQ=; b=vrJPtEhLWKMlyB
	oC0qQF5cfbWnWPpa4uNGANqpVC9YcDQOfW1tN5sWmzaX/Eurl8sLfOh9UXJcBywXfDoG2G4FzCufp
	3Jsf/91iTuORd48f2BBL1tHLs8slx0+roafXezguaGdrjvPQ24Pb4A+DpRVXNkucec9aCungduCvy
	OPYB+oEzUm5TJI/WxSW/xFE0BUU0x/0ffxqTnYSPPbWPaz/OyUOUhOx+E1wI5LDNTl3tij+6/K0Ny
	X2M2JQodCYHlaQs1JRfkelcU5gycRrNqT7CCbAPJFDXe3QMVDP0eQigyEon8N/ehCUkeA3E235zX7
	Fm4mcAdPGwSk85T4X7bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v19kG-0000000En3F-3ZGd;
	Tue, 23 Sep 2025 20:36:16 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v19kC-0000000En2d-3tNg
	for linux-i3c@lists.infradead.org;
	Tue, 23 Sep 2025 20:36:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=ZJIzr87B9EwoeX
	RAt4mdlfybQOB28UXsMsSoD9ahbt0=; b=UuzD6GGNFArc3CXzixX8yN026yZskL
	12HLoszM4pgGzQbr1J9NevX68S38JdrtXxojoqYT/6gFUtDwMsoz/nuYk8Knqm9t
	gflIJq35O0I9q5FFepRLqz7SQy+2EawBakRKLPyEjCVLVB8LgZ0fPCZmMybZ08Nj
	wnnDFN4BKerUzfcIFV+GHN4qXQaorvAuM3Hry5oCRzYzurDDC2ceb2QKBts3z14e
	PaSeUjueEqRXhzjjxjdxrbBvmxzW+Tsjv1nkui5yiBnuGEvK8q/DUCXDYlIMfqt9
	523eyngkOXVNiMAT7BSC/aK08VNG1fmITuVDWAAqYhMrirq+Ld6e/GyQ==
Received: (qmail 1234876 invoked from network); 23 Sep 2025 22:36:08 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 23 Sep 2025 22:36:08 +0200
X-UD-Smtp-Session: l3s3148p1@/afH4n0/Iukujnsp
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>,
	linux-i3c@lists.infradead.org
Subject: [PATCH] i3c: Remove superfluous FIXME
Date: Tue, 23 Sep 2025 22:35:58 +0200
Message-ID: <20250923203557.18298-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250923_133613_823451_FE4FFE01 
X-CRM114-Status: UNSURE (   6.74  )
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

I2C adapters can already change timeout and retry parameters via IOCTL.
This allows for better tuning to workloads compared to per-adapter
defaults. So, the FIXME is not needed.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/i3c/master.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
index acaba4d53697..d946db75df70 100644
--- a/drivers/i3c/master.c
+++ b/drivers/i3c/master.c
@@ -2564,8 +2564,6 @@ static int i3c_master_i2c_adapter_init(struct i3c_master_controller *master)
 	adap->owner = master->dev.parent->driver->owner;
 	adap->algo = &i3c_master_i2c_algo;
 	strscpy(adap->name, dev_name(master->dev.parent), sizeof(adap->name));
-
-	/* FIXME: Should we allow i3c masters to override these values? */
 	adap->timeout = HZ;
 	adap->retries = 3;
 
-- 
2.47.2


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
