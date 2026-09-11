Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3841DC88E56
	for <linux-i3c@archiver.kernel.org>; Fri, 11 Sep 2026 21:10:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dJXTiz/civjHF4J4i25LNMdjO4J6/+W7yMSdS6tF+AU=; b=cS/24hfEgiWc8Z
	w6xZXxzr9AACXmeWxuDZlaxqY0lKCES3GPBfaiRGFE/pY5G5mY5G4ew6rY6CvPew8MSkEL8Hp9rqK
	vwLZz9h8/xlGoQsCJbmzhrMEuQInnEUOt3dgQyWCIkRAw+4goiddud4qLOQEaNpZhkx537CSzxgNp
	sY+v7Zai0fG+EQ8MQv6fW9LfY/cz2h+WBD9biSwow9PDZPNgL/B2fObx+iQbiKG5u6KiC29Ua1Omw
	ZaW9qZB6MrknF22PTu1BzdJu6f084gHh43+/2Y5+yVcdypIoDqsoLkx/u9rPprReKHbWdfxIsWjjz
	iJ9j/xeT9M4zc2PGUc/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x58W6-000000009B6-0BxM;
	Fri, 11 Sep 2026 21:10:38 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x58W3-000000009A1-1eYJ
	for linux-i3c@lists.infradead.org;
	Fri, 11 Sep 2026 21:10:36 +0000
Received: by linux.microsoft.com (Postfix, from userid 1223)
	id 6E14A20B716C; Fri, 11 Sep 2026 14:09:53 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 6E14A20B716C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1789160993;
	bh=gAccggQiR6cHWMQ7IKOcnlWbv/MGGLk9GbykqygO1Aw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nX6cfD4jd5TstRq/desWkVf3UEI4LCLq3aWR+9Z6bFQwQNLakk8uBV8lxE8WGbUkZ
	 YZGdS1b8X8PVtVESD6YVqkCceT2AN/IBu+dxcbBmm13sp7N09gfZsgHt2C5LIBD4bk
	 5Zs8rwJgSDaDEoJTTcdLn9x4/zWZeLutDRM5L6Qw=
From: Meagan Lloyd <meaganlloyd@linux.microsoft.com>
To: linux-i3c@lists.infradead.org
Cc: meaganlloyd@linux.microsoft.com,
	alexandre.belloni@bootlin.com,
	vitor.soares@toradex.com,
	samagazaryan@google.com,
	gregkh@linuxfoundation.org,
	arnd@arndb.de,
	boris.brezillon@collabora.com,
	oleksandr.shulzhenko.viktorovych@intel.com,
	tgopinath@linux.microsoft.com,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	linux@roeck-us.net,
	Frank.Li@nxp.com,
	jorge.marques@analog.com,
	pgaj@cadence.com,
	wsa+renesas@sang-engineering.com,
	tommaso.merciai.xr@bp.renesas.com,
	nuno.sa@analog.com,
	Michael.Hennerich@analog.com,
	jic23@kernel.org,
	dlechner@baylibre.com,
	andy@kernel.org,
	lorenzo@kernel.org,
	enelsonmoore@gmail.com,
	rppt@kernel.org,
	pratyush@kernel.org,
	giovanni.cabiddu@intel.com,
	gabewhigham@gmail.com,
	haren@linux.ibm.com,
	pasha.tatashin@soleen.com,
	jirislaby@kernel.org,
	adrian.ho.yin.ng@altera.com,
	ustc.gu@gmail.com,
	jszhang@kernel.org,
	adrian.hunter@intel.com,
	akhilrajeev@nvidia.com,
	tze.yee.ng@altera.com,
	manikanta.guntupalli@amd.com,
	shubhrajyoti.datta@amd.com,
	jarkko.nikula@linux.intel.com,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux@analog.com,
	linux-iio@vger.kernel.org
Subject: [PATCH 2/3] i3c: set i3c_xfer.actual_len in controller drivers
Date: Fri, 11 Sep 2026 14:09:34 -0700
Message-ID: <20260911210935.1353126-3-meaganlloyd@linux.microsoft.com>
X-Mailer: git-send-email 2.43.7
In-Reply-To: <20260911210935.1353126-1-meaganlloyd@linux.microsoft.com>
References: <20260911210935.1353126-1-meaganlloyd@linux.microsoft.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_141035_463408_276F2784 
X-CRM114-Status: GOOD (  13.59  )
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

Set i3c_xfer.actual_len for reads across the I3C Controller drivers.

actual_len provides a consistent location for device drivers to know the
read response bytes without overriding the len field.

Signed-off-by: Meagan Lloyd <meaganlloyd@linux.microsoft.com>
---
 drivers/i3c/master/adi-i3c-master.c    | 5 ++++-
 drivers/i3c/master/dw-i3c-master.c     | 4 +++-
 drivers/i3c/master/i3c-master-cdns.c   | 5 ++++-
 drivers/i3c/master/mipi-i3c-hci/core.c | 5 ++++-
 drivers/i3c/master/renesas-i3c.c       | 3 +++
 5 files changed, 18 insertions(+), 4 deletions(-)

diff --git a/drivers/i3c/master/adi-i3c-master.c b/drivers/i3c/master/adi-i3c-master.c
index b35386260350..d033bfd4ecc2 100644
--- a/drivers/i3c/master/adi-i3c-master.c
+++ b/drivers/i3c/master/adi-i3c-master.c
@@ -412,8 +412,11 @@ static int adi_i3c_master_i3c_xfers(struct i3c_dev_desc *dev,
 
 	ret = xfer->ret;
 
-	for (i = 0; i < nxfers; i++)
+	for (i = 0; i < nxfers; i++) {
 		xfers[i].err = adi_i3c_cmd_get_err(&xfer->cmds[i]);
+		if (xfers[i].rnw)
+			xfers[i].actual_len = xfer->cmds[i].rx_len;
+	}
 
 	return ret;
 }
diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
index 4563d8761ba0..54406e31c870 100644
--- a/drivers/i3c/master/dw-i3c-master.c
+++ b/drivers/i3c/master/dw-i3c-master.c
@@ -1028,8 +1028,10 @@ static int dw_i3c_master_i3c_xfers(struct i3c_dev_desc *dev,
 	for (i = 0; i < i3c_nxfers; i++) {
 		struct dw_i3c_cmd *cmd = &xfer->cmds[i];
 
-		if (i3c_xfers[i].rnw)
+		if (i3c_xfers[i].rnw) {
 			i3c_xfers[i].len = cmd->rx_len;
+			i3c_xfers[i].actual_len = cmd->rx_len;
+		}
 	}
 
 	ret = xfer->ret;
diff --git a/drivers/i3c/master/i3c-master-cdns.c b/drivers/i3c/master/i3c-master-cdns.c
index 2d98c1ce9b12..331062c10b31 100644
--- a/drivers/i3c/master/i3c-master-cdns.c
+++ b/drivers/i3c/master/i3c-master-cdns.c
@@ -795,8 +795,11 @@ static int cdns_i3c_master_i3c_xfers(struct i3c_dev_desc *dev,
 
 	ret = cdns_xfer->ret;
 
-	for (i = 0; i < nxfers; i++)
+	for (i = 0; i < nxfers; i++) {
 		xfers[i].err = cdns_i3c_cmd_get_err(&cdns_xfer->cmds[i]);
+		if (xfers[i].rnw)
+			xfers[i].actual_len = cdns_xfer->cmds[i].rx_len;
+	}
 
 	cdns_i3c_master_free_xfer(cdns_xfer);
 
diff --git a/drivers/i3c/master/mipi-i3c-hci/core.c b/drivers/i3c/master/mipi-i3c-hci/core.c
index dadf049bd4b5..29fa68e29484 100644
--- a/drivers/i3c/master/mipi-i3c-hci/core.c
+++ b/drivers/i3c/master/mipi-i3c-hci/core.c
@@ -508,8 +508,11 @@ static int i3c_hci_i3c_xfers(struct i3c_dev_desc *dev,
 	if (ret)
 		goto out;
 	for (i = 0; i < nxfers; i++) {
-		if (i3c_xfers[i].rnw)
+		if (i3c_xfers[i].rnw) {
 			i3c_xfers[i].len = RESP_DATA_LENGTH(xfer[i].response);
+			i3c_xfers[i].actual_len = RESP_DATA_LENGTH(xfer[i].response);
+		}
+
 		if (RESP_STATUS(xfer[i].response) != RESP_SUCCESS) {
 			ret = -EIO;
 			goto out;
diff --git a/drivers/i3c/master/renesas-i3c.c b/drivers/i3c/master/renesas-i3c.c
index 28c0927a0179..a3dcb4cd9b0e 100644
--- a/drivers/i3c/master/renesas-i3c.c
+++ b/drivers/i3c/master/renesas-i3c.c
@@ -918,6 +918,9 @@ static int renesas_i3c_i3c_xfers(struct i3c_dev_desc *dev, struct i3c_xfer *i3c_
 		time_left = renesas_i3c_wait_xfer(i3c, xfer);
 		if (!time_left)
 			xfer_failed = true;
+
+		if (i3c_xfers[i].rnw)
+			i3c_xfers[i].actual_len = cmd->rx_count;
 	}
 
 	if (xfer_failed)
-- 
2.49.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
