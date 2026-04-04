Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22DFFE88D66
	for <linux-i3c@archiver.kernel.org>; Sat,  4 Apr 2026 10:33:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kul3Gltg8idRoRyXCP5fRMEoG3f/p7TB8KtSnhzB3bQ=; b=fgRxVRJaIFa+I8
	xAMsoAIDgDA3yrYOzwJWTUfmjC2/hYel6rJkEvvkNqeSW31O7advQD3mxubdBjFSkYn+yNdSTrukH
	TAPgDeHKoK3chL24YtNXZZn+09NF2cMOJYG7+q7TEurC0C42Ta07z9GC8CcqouYOKbRYrSDem8pcF
	HbuSXvKGa4YLk6iZUM/sw+F0DDHN4gB1mfIsinHJ0Zv7yp1KnjE6LZ5sRIuNDsdgMmS6EYzZfH/IO
	Nc3JBXQpRtj5z3D3nL+R+IKpw3QFNuqTYE4jYvue2U/fHGH2ZX/TuVjhPwDOnGhfbMQ4eIPHka3Q6
	HBYR/MMZ19ydsTeao+Rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8yJJ-00000003Nuq-3MI7;
	Sat, 04 Apr 2026 10:33:01 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8yJH-00000003NuF-3HEJ
	for linux-i3c@lists.infradead.org;
	Sat, 04 Apr 2026 10:33:00 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-82a7539851fso1152886b3a.1
        for <linux-i3c@lists.infradead.org>; Sat, 04 Apr 2026 03:32:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775298779; x=1775903579; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Pk4Y96vmEVK2/Fzs8OZM8UdQsuUdy4dsTicEentXc40=;
        b=M9DRPKjq29LoKPdVF8kMGWEx52mVXoMfTOmNRTYGjjILpkSOrH3TFVB/ZQqxg8jDTV
         CVfWFCmaFzGReDg2YEaW1RNAfHLucHG+XLZGxGyRfyP0ULwTKKqMf9YnDtBpMLm15mqJ
         cfjGBG8sFwgpKqtV1T/0+9QBjemZEYarDtJXa7Kjkqhg0qp8d9ynqAqYhDlSdz7EeE6+
         kjSGFzRGCpeHDRotDII/cQ7P0VDZuuinQ1tHiPYQNbcZFUYM6lLWgRi00VgNeJndWXaM
         5LOUkKvmBp5odHCGG4cCSzr+VMHtSwLLvjLoJGsFkpCx2+FrdwuU4OKLEih4VDci7bu5
         pggg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775298779; x=1775903579;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Pk4Y96vmEVK2/Fzs8OZM8UdQsuUdy4dsTicEentXc40=;
        b=TZ4EqwYX9EzAXDyt9VlF/kD1LCXIZ1qeCxFoeKGgMAi5FbYiCNCVEcmViboPUwIkgR
         hOAdUMJXomwcb012CO9b49t1xo1DefiUbVXWuY8614g9Rb7XqhanEHQZxZnIfsbApuRJ
         vxnd4sbt+dxNZyrVgMwPnxIrMqF6N1gJMmcjPm9lB4sLhLdci71P7NDJmCvJAofSNhKD
         nESP75NQbaqsUKntWedciQR//1PRdRAL46vvoiJLMATwJCvtAgfdUtQMO8IcAcucfmEh
         jh2Cqg+2UiXuOt7n+PGaqQRUm0fAMeS12P8IlxDjhMI6n2uRrpoiYE3OeIvw23Zg6mvr
         OhRA==
X-Gm-Message-State: AOJu0YzQu7nNS+1feP9oyh71bZH/44cwBtEXbzyvgvhe0EfWH4XwVEGs
	hbljGZD/sAfFLhElE76CvQ0upT009fOgcdFbXkfJLjRvSYqfNsEL+B/B
X-Gm-Gg: AeBDievu7afB+ZkngfDLlrLiDr4V/TQKJ8oVoWzl+xMD038tny8ISyYBw1DA6RhIH1s
	0M9ke5rrtqvBjGjhUKYpEyQJ9QIZVmH3cAB3rWGWRRVmKH2cgdPgWuGte9lRgmefW78MckrWjkj
	+S4SnC/TsBhlDLIQLppEkBy2BTJhOtNTAQ6bMRilv9gKQCeT+wpShmqyDz1e/tbKdPPJfuXHkGj
	0TIV8duTKYT466DlHz6c9COLz0YA4RDMfqip1/b2iB/kUOcGVkhiAQ+WpyYUVE2zXg+gPyw9BPs
	7RAxeA3ooCr2H8HSH9AsB0j5sWb/SIXVJWxzsqPDqb+7LHgyrDiIVCurf+Zfh87XF1KgBQFHyFI
	Mp7uKDsiL6QKh+DIHlxdt6rnzoXKS4rU4tW5s5IpXE7OaQGSJb9s1qn7kQY3QzCBF9AmYuTh/29
	cmr7wdMDl8QzwCc4B2kuAeZ1i78oJSlOIk7WhGLO13uAQYWjM=
X-Received: by 2002:a05:6a00:1c9c:b0:82c:6b1b:7ad4 with SMTP id d2e1a72fcca58-82d0da454f1mr5730365b3a.3.1775298779048;
        Sat, 04 Apr 2026 03:32:59 -0700 (PDT)
Received: from junjungu-PC.localdomain ([223.167.147.240])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cf9b27064sm10475789b3a.9.2026.04.04.03.32.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Apr 2026 03:32:58 -0700 (PDT)
From: Felix Gu <ustc.gu@gmail.com>
Date: Sat, 04 Apr 2026 18:32:31 +0800
Subject: [PATCH v3 2/2] i3c: dw: Simplify xfer cleanup with __free(kfree)
MIME-Version: 1.0
Message-Id: <20260404-dw-i3c-2-v3-2-8f7d146549c1@gmail.com>
References: <20260404-dw-i3c-2-v3-0-8f7d146549c1@gmail.com>
In-Reply-To: <20260404-dw-i3c-2-v3-0-8f7d146549c1@gmail.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Frank Li <Frank.Li@nxp.com>, Aniket <aniketmaurya@google.com>
Cc: linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Felix Gu <ustc.gu@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775298773; l=4745;
 i=ustc.gu@gmail.com; h=from:subject:message-id;
 bh=F+6szknsGcTuRf9Kk8Hq2YbBwDyaMpkpTbb9+j63n/A=;
 b=lQI2UFsOrAlq9E8RBuqRUV+IugSYi920O5J9BGf4FoHLns4ajIrr+vcT2SipVwm2XBHeRI7mz
 8zY+pzrXm2ID0emNnB9xCVUOrvk6PuhZFQAClpwZaCuhaAFPbknBvLO
X-Developer-Key: i=ustc.gu@gmail.com; a=ed25519;
 pk=fjUXwmjchVN7Ja6KGP55IXOzFeCl9edaHoQIEUA+/hw=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260404_033259_854605_26DA5D20 
X-CRM114-Status: GOOD (  13.34  )
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

Convert dw-i3c-master to use __free(kfree) guards for struct dw_i3c_xfer
allocations. This frees xfer objects automatically on scope exit, and
removes the now-unused dw_i3c_master_free_xfer() helper.

Signed-off-by: Felix Gu <ustc.gu@gmail.com>
---
 drivers/i3c/master/dw-i3c-master.c | 33 +++++++--------------------------
 1 file changed, 7 insertions(+), 26 deletions(-)

diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
index 2e31228b3809..41ef37115f8b 100644
--- a/drivers/i3c/master/dw-i3c-master.c
+++ b/drivers/i3c/master/dw-i3c-master.c
@@ -394,11 +394,6 @@ dw_i3c_master_alloc_xfer(struct dw_i3c_master *master, unsigned int ncmds)
 	return xfer;
 }
 
-static void dw_i3c_master_free_xfer(struct dw_i3c_xfer *xfer)
-{
-	kfree(xfer);
-}
-
 static void dw_i3c_master_start_xfer_locked(struct dw_i3c_master *master)
 {
 	struct dw_i3c_xfer *xfer = master->xferqueue.cur;
@@ -716,7 +711,6 @@ static void dw_i3c_master_bus_cleanup(struct i3c_master_controller *m)
 static int dw_i3c_ccc_set(struct dw_i3c_master *master,
 			  struct i3c_ccc_cmd *ccc)
 {
-	struct dw_i3c_xfer *xfer;
 	struct dw_i3c_cmd *cmd;
 	int ret, pos = 0;
 
@@ -726,7 +720,7 @@ static int dw_i3c_ccc_set(struct dw_i3c_master *master,
 			return pos;
 	}
 
-	xfer = dw_i3c_master_alloc_xfer(master, 1);
+	struct dw_i3c_xfer *xfer __free(kfree) = dw_i3c_master_alloc_xfer(master, 1);
 	if (!xfer)
 		return -ENOMEM;
 
@@ -751,14 +745,11 @@ static int dw_i3c_ccc_set(struct dw_i3c_master *master,
 	if (xfer->cmds[0].error == RESPONSE_ERROR_IBA_NACK)
 		ccc->err = I3C_ERROR_M2;
 
-	dw_i3c_master_free_xfer(xfer);
-
 	return ret;
 }
 
 static int dw_i3c_ccc_get(struct dw_i3c_master *master, struct i3c_ccc_cmd *ccc)
 {
-	struct dw_i3c_xfer *xfer;
 	struct dw_i3c_cmd *cmd;
 	int ret, pos;
 
@@ -766,7 +757,7 @@ static int dw_i3c_ccc_get(struct dw_i3c_master *master, struct i3c_ccc_cmd *ccc)
 	if (pos < 0)
 		return pos;
 
-	xfer = dw_i3c_master_alloc_xfer(master, 1);
+	struct dw_i3c_xfer *xfer __free(kfree) = dw_i3c_master_alloc_xfer(master, 1);
 	if (!xfer)
 		return -ENOMEM;
 
@@ -791,7 +782,6 @@ static int dw_i3c_ccc_get(struct dw_i3c_master *master, struct i3c_ccc_cmd *ccc)
 	ret = xfer->ret;
 	if (xfer->cmds[0].error == RESPONSE_ERROR_IBA_NACK)
 		ccc->err = I3C_ERROR_M2;
-	dw_i3c_master_free_xfer(xfer);
 
 	return ret;
 }
@@ -838,12 +828,15 @@ static int dw_i3c_master_send_ccc_cmd(struct i3c_master_controller *m,
 static int dw_i3c_master_daa(struct i3c_master_controller *m)
 {
 	struct dw_i3c_master *master = to_dw_i3c_master(m);
-	struct dw_i3c_xfer *xfer;
 	struct dw_i3c_cmd *cmd;
 	u32 olddevs, newdevs;
 	u8 last_addr = 0;
 	int ret, pos;
 
+	struct dw_i3c_xfer *xfer __free(kfree) = dw_i3c_master_alloc_xfer(master, 1);
+	if (!xfer)
+		return -ENOMEM;
+
 	ret = pm_runtime_resume_and_get(master->dev);
 	if (ret < 0) {
 		dev_err(master->dev,
@@ -877,15 +870,8 @@ static int dw_i3c_master_daa(struct i3c_master_controller *m)
 		ret = 0;
 	}
 
-	xfer = dw_i3c_master_alloc_xfer(master, 1);
-	if (!xfer) {
-		ret = -ENOMEM;
-		goto rpm_out;
-	}
-
 	pos = dw_i3c_master_get_free_pos(master);
 	if (pos < 0) {
-		dw_i3c_master_free_xfer(xfer);
 		ret = pos;
 		goto rpm_out;
 	}
@@ -910,8 +896,6 @@ static int dw_i3c_master_daa(struct i3c_master_controller *m)
 			i3c_master_add_i3c_dev_locked(m, master->devs[pos].addr);
 	}
 
-	dw_i3c_master_free_xfer(xfer);
-
 rpm_out:
 	pm_runtime_put_autosuspend(master->dev);
 	return ret;
@@ -1083,7 +1067,6 @@ static int dw_i3c_master_i2c_xfers(struct i2c_dev_desc *dev,
 	struct i3c_master_controller *m = i2c_dev_get_master(dev);
 	struct dw_i3c_master *master = to_dw_i3c_master(m);
 	unsigned int nrxwords = 0, ntxwords = 0;
-	struct dw_i3c_xfer *xfer;
 	int i, ret = 0;
 
 	if (!i2c_nxfers)
@@ -1103,7 +1086,7 @@ static int dw_i3c_master_i2c_xfers(struct i2c_dev_desc *dev,
 	    nrxwords > master->caps.datafifodepth)
 		return -EOPNOTSUPP;
 
-	xfer = dw_i3c_master_alloc_xfer(master, i2c_nxfers);
+	struct dw_i3c_xfer *xfer __free(kfree) = dw_i3c_master_alloc_xfer(master, i2c_nxfers);
 	if (!xfer)
 		return -ENOMEM;
 
@@ -1112,7 +1095,6 @@ static int dw_i3c_master_i2c_xfers(struct i2c_dev_desc *dev,
 		dev_err(master->dev,
 			"<%s> cannot resume i3c bus master, err: %d\n",
 			__func__, ret);
-		dw_i3c_master_free_xfer(xfer);
 		return ret;
 	}
 
@@ -1144,7 +1126,6 @@ static int dw_i3c_master_i2c_xfers(struct i2c_dev_desc *dev,
 		dw_i3c_master_dequeue_xfer(master, xfer);
 
 	ret = xfer->ret;
-	dw_i3c_master_free_xfer(xfer);
 
 	pm_runtime_put_autosuspend(master->dev);
 	return ret;

-- 
2.43.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
