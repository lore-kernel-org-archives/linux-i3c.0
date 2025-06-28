Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48B1BC7EE39
	for <linux-i3c@archiver.kernel.org>; Sat, 28 Jun 2025 19:20:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Kav33OFzDtjPI0rDG5zQNrcWBTXNfE+P9ouxd8GJ2y0=; b=2A7SGLCxVJrUJd
	V4W0QKgkbiGuPY9JO+2F/Zx9Lfdat68h7NessFT37lBCJbBZM/O6uCApo5+9azQ0dfVpJ4wmeM1mu
	Cy8l+lU+fSmieoClGi15hsWMSsdQDKmW/Fz9uxQzIWPjbWTbjnzGlkstLtDZC8x54H2l3l2aocc7o
	SG0eNHrpRvh3jWhFnDYG8LdIxGd26OeW4OruiYUI+q61wKc3BJovNOoLAf0F24JLR7oAL1eqezwjJ
	p4mE/Wa9/TRdEpys0ccWLrjz76ZUd5lM1AzjumeoWvypCxR1rudfygJbIpzgmhNTm1dNcRN0B3JAf
	MYbd8G1EYoyQgVCdJvTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVb6a-0000000HFHf-0DkI;
	Sat, 28 Jun 2025 19:20:52 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVb6X-0000000HFFr-3vf1
	for linux-i3c@lists.infradead.org;
	Sat, 28 Jun 2025 19:20:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=tAlopqS+uXPpfwDIJULj8OOtkm5TOkovt9Zs2uY71kQ=; b=IfUrJ4
	FVqTq4BrkDLTx8pyEbdxEQhLpamAQE6vxKvOfeHm0GaMD9ewOurWQIRiusdwdfLp
	imJcjxP3PVR6SBCcUjSO03lDQf36n7VMHON6fItPN2PIzjhah0htmeEec3q2P/wI
	PkgyaQFXezW+rV8gEOIUorRmG7C0zzG2wVlSFMt7DxFsIIg/2FZx6z70I8pevEtt
	2xetnd0447SsCpmsWjE7Pt8Mf89lQZ6mdvlhPAEeEXoJluock8HjhdxdbpnwHEjo
	UsZLqbtAnn4qUpvOytNsivzv1wkwkco9ZNdXYDi+zxdJjmgyNuxBITfgGtG3Usui
	P2wx/SsU5NlLJzMg==
Received: (qmail 1919028 invoked from network); 28 Jun 2025 21:20:48 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 28 Jun 2025 21:20:48 +0200
X-UD-Smtp-Session: l3s3148p1@eqgcsaY4dM0tnPBw
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	=?UTF-8?q?Przemys=C5=82aw=20Gaj?= <pgaj@cadence.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>,
	linux-i3c@lists.infradead.org
Subject: [PATCH v3 3/3] i3c: master: cdns: replace ENOTSUPP with SUSV4-compliant EOPNOTSUPP
Date: Sat, 28 Jun 2025 21:20:30 +0200
Message-ID: <20250628192027.3932-8-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250628192027.3932-5-wsa+renesas@sang-engineering.com>
References: <20250628192027.3932-5-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250628_122050_250040_213166F6 
X-CRM114-Status: GOOD (  10.14  )
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

Replace non-standard ENOTSUPP with the SUSV4-defined error code
EOPNOTSUPP to fix below checkpatch warning:
  "ENOTSUPP is not a SUSV4 error code, prefer EOPNOTSUPP"

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/i3c/master/i3c-master-cdns.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/i3c/master/i3c-master-cdns.c b/drivers/i3c/master/i3c-master-cdns.c
index fd3752cea654..e24d93a82e1c 100644
--- a/drivers/i3c/master/i3c-master-cdns.c
+++ b/drivers/i3c/master/i3c-master-cdns.c
@@ -742,7 +742,7 @@ static int cdns_i3c_master_priv_xfers(struct i3c_dev_desc *dev,
 
 	for (i = 0; i < nxfers; i++) {
 		if (xfers[i].len > CMD0_FIFO_PL_LEN_MAX)
-			return -ENOTSUPP;
+			return -EOPNOTSUPP;
 	}
 
 	if (!nxfers)
@@ -750,7 +750,7 @@ static int cdns_i3c_master_priv_xfers(struct i3c_dev_desc *dev,
 
 	if (nxfers > master->caps.cmdfifodepth ||
 	    nxfers > master->caps.cmdrfifodepth)
-		return -ENOTSUPP;
+		return -EOPNOTSUPP;
 
 	/*
 	 * First make sure that all transactions (block of transfers separated
@@ -765,7 +765,7 @@ static int cdns_i3c_master_priv_xfers(struct i3c_dev_desc *dev,
 
 	if (rxslots > master->caps.rxfifodepth ||
 	    txslots > master->caps.txfifodepth)
-		return -ENOTSUPP;
+		return -EOPNOTSUPP;
 
 	cdns_xfer = cdns_i3c_master_alloc_xfer(master, nxfers);
 	if (!cdns_xfer)
@@ -822,11 +822,11 @@ static int cdns_i3c_master_i2c_xfers(struct i2c_dev_desc *dev,
 	int i, ret = 0;
 
 	if (nxfers > master->caps.cmdfifodepth)
-		return -ENOTSUPP;
+		return -EOPNOTSUPP;
 
 	for (i = 0; i < nxfers; i++) {
 		if (xfers[i].len > CMD0_FIFO_PL_LEN_MAX)
-			return -ENOTSUPP;
+			return -EOPNOTSUPP;
 
 		if (xfers[i].flags & I2C_M_RD)
 			nrxwords += DIV_ROUND_UP(xfers[i].len, 4);
@@ -836,7 +836,7 @@ static int cdns_i3c_master_i2c_xfers(struct i2c_dev_desc *dev,
 
 	if (ntxwords > master->caps.txfifodepth ||
 	    nrxwords > master->caps.rxfifodepth)
-		return -ENOTSUPP;
+		return -EOPNOTSUPP;
 
 	xfer = cdns_i3c_master_alloc_xfer(master, nxfers);
 	if (!xfer)
-- 
2.47.2


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
