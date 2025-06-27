Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A4CFC7EE32
	for <linux-i3c@archiver.kernel.org>; Fri, 27 Jun 2025 12:39:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lxN64tEHk66P3MipA6EMZB7cveNpX4ZyTA2z06aQBmI=; b=pkixeni0wXGd1m
	RbhIrHFVpuZebATCjP8gRRdjIH+OGCwRoV4tBxvoNez0wX/1mY8AtRNbfMyMxnp0vTbLRqB5x+mLK
	9M+SdcqftFPNLK0x6POh7Uhz3T+78/LwjmKsRhFsG9vEPpQXkIrRzqulNG/ZFLvDlabUzH1ReJSxh
	RG+nNxLAsCRjx5T8ZASDDUxdhMyBYiND/cPu3ajn2TZ6gOgAMKOeP63+1CqhzedAAwBASu6JPOqji
	udNE2joCpfTvQa7HeSAGAnaTp2PtgGNK74bgwgIZPD1Uh7sx5KiADyMStupFEZnGxxOoxpEBBlK/Z
	aWqti5STAd1EWf32iGEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uV8MG-0000000Ef7I-0JR9;
	Fri, 27 Jun 2025 12:39:08 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uV75x-0000000ESCy-3EIf
	for linux-i3c@lists.infradead.org;
	Fri, 27 Jun 2025 11:18:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=xT0iy3mXmITl75fYvOD0W/SWNIX0fZU7TXLrhInH0is=; b=djK5AP
	LBGVCUgDydeUvI9HIZHRmzzQVkz2/HeDgyN/uWWr/er16Yo2MlEuG9PJM2i+wbAw
	2erqh4NoeTx845vgpssNCbJOmslzTKhtI79hJYhuCdLjq76BZ247tif1VlL/TUnV
	f+HXCPJ6NtJ11PSdC0G4eetMw9wz0A81DVA9iqKawfCoQZSUSMBGaa1FX62PACrl
	xjQH5mjbV7RCUNpoCa/MTx/XdGOT3qQDLPoJbHarTUyN9DVIkgQXqlTWSZvcpL36
	AyS6Q6DJLdPWpjMk27/K+au2UIti+RQxMvJKggAiaEKK9b9Pci+rjEVXloFCxP4V
	jjdXr/umYW6Nuo2g==
Received: (qmail 1443586 invoked from network); 27 Jun 2025 13:18:12 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 27 Jun 2025 13:18:12 +0200
X-UD-Smtp-Session: l3s3148p1@rFFj1Ys4lIMgAwDPXzuUAOCQSK0rM+sw
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>,
	linux-i3c@lists.infradead.org
Subject: [PATCH v2 2/3] i3c: dw: replace ENOTSUPP with SUSV4-compliant EOPNOTSUPP
Date: Fri, 27 Jun 2025 13:17:57 +0200
Message-ID: <20250627111755.16535-7-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250627111755.16535-5-wsa+renesas@sang-engineering.com>
References: <20250627111755.16535-5-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250627_041814_087992_21309DBB 
X-CRM114-Status: UNSURE (   9.36  )
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

The checkpatch warning '"ENOTSUPP is not a SUSV4 error code, prefer
EOPNOTSUPP"' is correct. We never want this to slip to userspace.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/i3c/master/dw-i3c-master.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
index 611c22b72c15..91429d94a866 100644
--- a/drivers/i3c/master/dw-i3c-master.c
+++ b/drivers/i3c/master/dw-i3c-master.c
@@ -932,7 +932,7 @@ static int dw_i3c_master_priv_xfers(struct i3c_dev_desc *dev,
 		return 0;
 
 	if (i3c_nxfers > master->caps.cmdfifodepth)
-		return -ENOTSUPP;
+		return -EOPNOTSUPP;
 
 	for (i = 0; i < i3c_nxfers; i++) {
 		if (i3c_xfers[i].rnw)
@@ -943,7 +943,7 @@ static int dw_i3c_master_priv_xfers(struct i3c_dev_desc *dev,
 
 	if (ntxwords > master->caps.datafifodepth ||
 	    nrxwords > master->caps.datafifodepth)
-		return -ENOTSUPP;
+		return -EOPNOTSUPP;
 
 	xfer = dw_i3c_master_alloc_xfer(master, i3c_nxfers);
 	if (!xfer)
@@ -1093,7 +1093,7 @@ static int dw_i3c_master_i2c_xfers(struct i2c_dev_desc *dev,
 		return 0;
 
 	if (i2c_nxfers > master->caps.cmdfifodepth)
-		return -ENOTSUPP;
+		return -EOPNOTSUPP;
 
 	for (i = 0; i < i2c_nxfers; i++) {
 		if (i2c_xfers[i].flags & I2C_M_RD)
@@ -1104,7 +1104,7 @@ static int dw_i3c_master_i2c_xfers(struct i2c_dev_desc *dev,
 
 	if (ntxwords > master->caps.datafifodepth ||
 	    nrxwords > master->caps.datafifodepth)
-		return -ENOTSUPP;
+		return -EOPNOTSUPP;
 
 	xfer = dw_i3c_master_alloc_xfer(master, i2c_nxfers);
 	if (!xfer)
-- 
2.47.2


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
