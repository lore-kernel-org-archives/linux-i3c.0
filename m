Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC081C83000
	for <linux-i3c@archiver.kernel.org>; Wed, 25 Jun 2025 17:36:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XcxghbV9sUoVnaCRTq+K7jhqEUa+XaGaNjj3FJhjEgM=; b=qlKz2irShvaet/
	o9uSYFAh5sHRc05aj1Ie+X0IkMJhWeA4YSSI3PE6704ALjPoI1kjqfgyur0Qox7CpS128giwz5Fmn
	xto+gX/7duZgLiUrQWHaopfY1VGmOIfj2vr0Gfko9rizFb4M8dg3l7RFK4spCoc7Nlyle0a2F4dk9
	S3Q3hVnD/e2P60Kb+d/ln7KqyAYQgwdqnjEro2WiMUlQSjI7ymDDix21J4gtsTBRznQrUzicYq32F
	VEiDh0cVklcnmvX9YYfTIFPfo05f68cSYi+8A6Y1NXN+WedtqtIFo3keWIqNRQcoV0Y2kTGFDDt8g
	/S2guVaAlIdwWVr9E4qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUU3O-00000009Tay-1Sso;
	Wed, 25 Jun 2025 17:36:58 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUPsi-00000008kGm-0W6e
	for linux-i3c@lists.infradead.org;
	Wed, 25 Jun 2025 13:09:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=kzdEHdkkNjMHsIT0DAmMvWAjYn7mpE9WhEzzYUPowOc=; b=SP2w9L
	cKa3ns4OF8SSIrylYfI4CQOCLS2NuiUsyWMa4FgPekbStn/h9zGbTxi1n/D+dSxa
	m/eoE0dJHoEstgHPUFdr3VW/YtvJthJzisqQv6ybyNkMWD/jA8rPo1jPkmWKpZWG
	QEoBfJr8VNFojNmbt+Yq/OcvkGyGflqfQ1cmAwU/O+TgLW4eK+DO6RbWeNmvktkh
	b7ieynr6TQcA4gr6bWk2ddJJCuwfWg5xWt9v3pbUe1QSXdPSrUey+Gx+ShEiWq2p
	xu3OVjJws73qx1PjlxAe9WqE8+XoZctG9cTL/R73UIXVBz28IMhjn3Co0SXTi61C
	NCa50j5+dVr5tf4g==
Received: (qmail 659045 invoked from network); 25 Jun 2025 15:09:37 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 25 Jun 2025 15:09:37 +0200
X-UD-Smtp-Session: l3s3148p1@NE0sKGU4WtdtKDAs
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>,
	linux-i3c@lists.infradead.org
Subject: [PATCH 2/3] i3c: dw: switch to use SUSV4 error codes
Date: Wed, 25 Jun 2025 15:09:20 +0200
Message-ID: <20250625130918.14507-7-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250625130918.14507-5-wsa+renesas@sang-engineering.com>
References: <20250625130918.14507-5-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_060940_449200_D0875EF2 
X-CRM114-Status: UNSURE (   9.94  )
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

This checkpatch warning makes sense here: "ENOTSUPP is not a SUSV4 error
code, prefer EOPNOTSUPP" We don't have a userspace interface yet, but we
probably will get one. So, let's convert these error codes now, before
it will be forgotten in the future, and they could slip through to
applications.

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
