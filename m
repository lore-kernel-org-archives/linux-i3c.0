Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E564AC982FA
	for <linux-i3c@archiver.kernel.org>; Mon, 21 Sep 2026 23:07:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=Vc76yDroICDwFDQGiaLk9lfWRzcX81ch+ZzyIuyo6rE=; b=iMZFBQy+PBVNOVUmw3ohyfth2l
	/LEIdwrXbF7erw1lJLSZjjjB9Ygd1qOyzdhKMsXYzI5hVg7ijnN4VQNPsj5FXYDdjheCtb0GF6ST0
	bBD1884s9i46hhz395xnxPQW9xoCtKGTff1zlwTg60E0k4feDGLdiGqZiA7aUm4mto+aiHShaBH/+
	7puxxeVK3kTxLhUoGP+ksaqW6CpjcW4FFiL2d78YYwoLWdXU+wHa6uojBRq7N2Nw/G5qLxMrU9pjD
	4Y0+Oh/f3jpqJe/9CqcrAGWosbkkTkNSdxIn0Icn6/gLT4e2hPGl6S3I8+gBJZm1UJZBEaF1phGhH
	aH/Vwrww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8n6b-00000003dW0-1fAq;
	Mon, 21 Sep 2026 23:07:25 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8n6a-00000003dV3-0MnX
	for linux-i3c@bombadil.infradead.org;
	Mon, 21 Sep 2026 23:07:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=R6tln3zzXyXdjXIsZYRibDgjhT6eLkPrDJnsUsI23uA=; b=qPTwpLsSo7DAptXpVLfxNJWweT
	j3+OUJPbVgdhuHwXIq4Y7cVJpMsPt0CW3R/0KVg+TL7fpDzxAZt6xlEIZ+gQlV2NawasTn9+OdlNG
	/kqPYP6rgjik3fJ2qqSETXiQjhXAGPoBAUvrW+YmcFuoRJzzzWugfVpUZDOdVRNOLrSwCrq0H9BQe
	tdezHAyq9PfYmvP6TQYPJUaMVc2d6ysmdC7bnfnAHMKKKg07/AMVG23gOeT5GcEM0PsKBM2r+VjJf
	PziuVdr5j8CXrEtbOUT587Pk6ym7DvUOSCzdGkUgxPAlz8VrmdNko0h12MQjIZK35I9Sj9pwg9872
	E8oWDK8A==;
Received: from mail-pg1-x545.google.com ([2607:f8b0:4864:20::545])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x8n6R-0000000Cu2E-3rBy
	for linux-i3c@lists.infradead.org;
	Mon, 21 Sep 2026 23:07:22 +0000
Received: by mail-pg1-x545.google.com with SMTP id 41be03b00d2f7-cc1ca15334cso4185420a12.1
        for <linux-i3c@lists.infradead.org>; Mon, 21 Sep 2026 16:07:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790032031; x=1790636831; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=R6tln3zzXyXdjXIsZYRibDgjhT6eLkPrDJnsUsI23uA=;
        b=NSG8X2BC8iRGA/LuVpC0kAFP+7xgUSTBv1idb+twYPDpC2YbKzsnUii6pn8xpi51Vw
         KBL6gUNGLRidy4WU/pSLGIMS2mH8Il95t1TU9SKiFVnPhsWLFkPOsV3kbedyHrBu07Gv
         hfgOU/8TV/h27dWaCoqpNApd7q/A8ygiG2wov5rQ9kVG2DtipzABXxU5kgMfs3Yy2zfr
         2i7Q/tPK9FLgbdCltjiC/hciQci9IvlKGhExShFOoXwLGLLrTvqVpk2zYXB+gbhK710n
         3OBI3QtVdape2XvNApsWk0sGi4h1E2mVqjbzV0gBy3vqDLwEScgXB4GeYuzZj///PESQ
         RP4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790032031; x=1790636831;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=R6tln3zzXyXdjXIsZYRibDgjhT6eLkPrDJnsUsI23uA=;
        b=Zyem821kLtMFfTjRhz32UGtNeS9BcyrO8KaFK0JAkn67sYLTUQhm4XoeVdPPjdVRDm
         8VrbYzOfYrhP0t+Fco65Aa1rZ5yEaCpT+ZUjI6D6J+qmamfSUOt3n0ZP6CafhJ0qpCO2
         c+eMcv+4gh1D+r+nLCUZPGLnFunvDsTnwC8mnoqM5L1Mv/GcynF6WtmcPE2IwOYMDHvA
         sxcL+2W9AptQY0kwk5H38HSV/ZLlttITcpf42d+sH50uKH550nfX+fUGbKNGPmGooNqC
         sEv96Ik3WgTYyAx2kUci/vAopN/2SyhNbC4rbyIGHcBz2R4MIoXNQtgzAhiHR7NVgf9q
         +oZw==
X-Gm-Message-State: AFuF++kgL+r7i1xawFz8e33sTOmhP9uD1/ndu7Ggh2+drJGBgu599GKO
	Fvz8tTQj3fjJXmQbgopTlgjiQnZ+W9SZWyadvR+X27tCG5qc+b4XlmmmaEElyq+DJixB1+yc0Z9
	NUSBVd5D/UtDaI+9hEfveq16Xc+tFzovNAoxm4fjujqsChf33eMAbM4q8VN1ZI48IPAZ7H0G5ac
	TzGqd2BHznoYskP9zn/Z3RIhEZTgET8KAR9uMbvh6LhQPRKuHUdh6AxV8xgw8LY+qF/syaD8kYq
	JpbGw==
X-Received: from dyrt38.prod.google.com ([2002:a05:7300:4f26:b0:339:6b44:abf5])
 (user=samagazaryan job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:3909:b0:39e:3558:f925 with SMTP id 98e67ed59e1d1-39e54d86a97mr17168028a91.24.1790032030595;
 Mon, 21 Sep 2026 16:07:10 -0700 (PDT)
Date: Mon, 21 Sep 2026 23:06:01 +0000
In-Reply-To: <20260921230603.2518652-1-samagazaryan@google.com>
Mime-Version: 1.0
References: <20260921230603.2518652-1-samagazaryan@google.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Message-ID: <20260921230603.2518652-4-samagazaryan@google.com>
Subject: [PATCH v5 3/5] i3c: use actual_len for read transfers
From: Sam Agazaryan <samagazaryan@google.com>
To: linux-i3c@lists.infradead.org, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Frank Li <Frank.Li@nxp.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, Arnd Bergmann <arnd@arndb.de>, 
	Adrian Hunter <adrian.hunter@intel.com>, Meagan Lloyd <meaganlloyd@linux.microsoft.com>, 
	Vitor Soares <vitor.soares@toradex.com>, 
	Oleksandr Shulzhenko <oleksandr.shulzhenko.viktorovych@intel.com>, 
	Boris Brezillon <boris.brezillon@collabora.com>, linux-kernel@vger.kernel.org, 
	Sam Agazaryan <samagazaryan@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_000719_552930_0D5D2BDE 
X-CRM114-Status: GOOD (  18.98  )
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

Currently only the amd and svc I3C controller drivers populate
i3c_xfer.actual_len on reads, while dw-i3c-master and mipi-i3c-hci
overwrite i3c_xfer.len with the received byte count and leave actual_len
as 0. Because of this inconsistency, mctp-i3c reads xfer.len instead of
xfer.actual_len, making it fail on controllers that do not mutate len.

Unify read length reporting across the subsystem:
- Clarify in <linux/i3c/device.h> that actual_len reflects the actual
  number of bytes transferred on reads.
- Update adi, cdns, dw, mipi-i3c-hci, and renesas controller drivers to
  populate actual_len on read transfers without mutating len.
- Update mctp-i3c to read xfer.actual_len instead of xfer.len.

Co-developed-by: Meagan Lloyd <meaganlloyd@linux.microsoft.com>
Signed-off-by: Meagan Lloyd <meaganlloyd@linux.microsoft.com>
Signed-off-by: Sam Agazaryan <samagazaryan@google.com>
---
 drivers/i3c/master/adi-i3c-master.c    |  5 ++++-
 drivers/i3c/master/dw-i3c-master.c     |  2 +-
 drivers/i3c/master/i3c-master-cdns.c   |  5 ++++-
 drivers/i3c/master/mipi-i3c-hci/core.c |  2 +-
 drivers/i3c/master/renesas-i3c.c       |  3 +++
 drivers/net/mctp/mctp-i3c.c            | 10 +++++-----
 include/linux/i3c/device.h             |  2 +-
 7 files changed, 19 insertions(+), 10 deletions(-)

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
index 4563d8761ba0..28e8eb293747 100644
--- a/drivers/i3c/master/dw-i3c-master.c
+++ b/drivers/i3c/master/dw-i3c-master.c
@@ -1029,7 +1029,7 @@ static int dw_i3c_master_i3c_xfers(struct i3c_dev_desc *dev,
 		struct dw_i3c_cmd *cmd = &xfer->cmds[i];
 
 		if (i3c_xfers[i].rnw)
-			i3c_xfers[i].len = cmd->rx_len;
+			i3c_xfers[i].actual_len = cmd->rx_len;
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
index dadf049bd4b5..f74c02fab9e3 100644
--- a/drivers/i3c/master/mipi-i3c-hci/core.c
+++ b/drivers/i3c/master/mipi-i3c-hci/core.c
@@ -509,7 +509,7 @@ static int i3c_hci_i3c_xfers(struct i3c_dev_desc *dev,
 		goto out;
 	for (i = 0; i < nxfers; i++) {
 		if (i3c_xfers[i].rnw)
-			i3c_xfers[i].len = RESP_DATA_LENGTH(xfer[i].response);
+			i3c_xfers[i].actual_len = RESP_DATA_LENGTH(xfer[i].response);
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
diff --git a/drivers/net/mctp/mctp-i3c.c b/drivers/net/mctp/mctp-i3c.c
index 6d2bbae7477b..5f94c11a1712 100644
--- a/drivers/net/mctp/mctp-i3c.c
+++ b/drivers/net/mctp/mctp-i3c.c
@@ -131,12 +131,12 @@ static int mctp_i3c_read(struct mctp_i3c_device *mi)
 	if (rc < 0)
 		goto err;
 
-	if (WARN_ON_ONCE(xfer.len > mi->mrl)) {
+	if (WARN_ON_ONCE(xfer.actual_len > mi->mrl)) {
 		/* Bad i3c bus driver */
 		rc = -EIO;
 		goto err;
 	}
-	if (xfer.len < MCTP_I3C_MINLEN) {
+	if (xfer.actual_len < MCTP_I3C_MINLEN) {
 		stats->rx_length_errors++;
 		rc = -EIO;
 		goto err;
@@ -145,15 +145,15 @@ static int mctp_i3c_read(struct mctp_i3c_device *mi)
 	/* check PEC, including address byte */
 	addr = mi->addr << 1 | 1;
 	pec = i2c_smbus_pec(0, &addr, 1);
-	pec = i2c_smbus_pec(pec, xfer.data.in, xfer.len - 1);
-	if (pec != ((u8 *)xfer.data.in)[xfer.len - 1]) {
+	pec = i2c_smbus_pec(pec, xfer.data.in, xfer.actual_len - 1);
+	if (pec != ((u8 *)xfer.data.in)[xfer.actual_len - 1]) {
 		stats->rx_crc_errors++;
 		rc = -EINVAL;
 		goto err;
 	}
 
 	/* Remove PEC */
-	skb_trim(skb, xfer.len - 1);
+	skb_trim(skb, xfer.actual_len - 1);
 
 	cb = __mctp_cb(skb);
 	cb->halen = PID_SIZE;
diff --git a/include/linux/i3c/device.h b/include/linux/i3c/device.h
index 971d53349b6f..f868a7bf2bc9 100644
--- a/include/linux/i3c/device.h
+++ b/include/linux/i3c/device.h
@@ -59,7 +59,7 @@ enum i3c_xfer_mode {
  * @rnw: encodes the transfer direction. true for a read, false for a write
  * @cmd: Read/Write command in HDR mode, read: 0x80 - 0xff, write: 0x00 - 0x7f
  * @len: transfer length in bytes of the transfer
- * @actual_len: actual length in bytes are transferred by the controller
+ * @actual_len: actual length in bytes transferred by the controller on read
  * @data: input/output buffer
  * @data.in: input buffer. Must point to a DMA-able buffer
  * @data.out: output buffer. Must point to a DMA-able buffer
-- 
2.55.0.1082.g2b9226bbc0-goog


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
