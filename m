Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6565AC5B543
	for <linux-i3c@archiver.kernel.org>; Wed,  4 Jun 2025 10:18:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vmplbVs9w6gZedNcoDfAFLw9z7qIND4Hw3hYSIJfX1c=; b=Qp4NMCtqzYSI0y
	vGZG/vYE8goagqzogRb3l6xJXN/56jtiA1LDh1ORp1VF5Xdb5L+Vr7mhkl3DYyrIzX/obfH4j6nfM
	2lnWGHKSff8g42zoey8iHsdhsogdSTAe6wXoaoVgbuGnxKRF5pAtZW7wmC/a9BkFp87njHCjqjVza
	RjCUGkCeh9Iv7VE0/WXcPVESdjXCCpYFFFk5+ZKf7WlWdQj9xzMceLHzRvIIG0GzRLLY+cIBNnt6d
	BxV/CEXG9EU5KcO6C9/RgVXOgln74WYcp5LcEuJlthb/wwvE5sUuWojXhAhGNsWRogGSv3q0KgUUh
	1MXV623Dx2fFZPqYnJiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMlCp-0000000D76k-0gme;
	Wed, 04 Jun 2025 10:18:47 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMlCl-0000000D73N-2JDS
	for linux-i3c@lists.infradead.org;
	Wed, 04 Jun 2025 10:18:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=PmK6FJZV8fqFWrIkB8zm3Vv/1h6dxAyJGyX3WocYk/M=; b=MYbsJC
	cp/rJHmUsYTQUszX98SjlbAIQcdtQ8hkJxTeYGnTSBwQrh8ekIs+MTIvHuAJaOwD
	T7IhJ6SxAikNc5iwKOdTkouYBfHdU34Ym6s0ZsaI/uuUoBccInSE2RbnRZbCFkoV
	QMX2lvnzScJRCTZUnhG/TFqX7hIvtaqggmyKRk38wncSfegFmXvdvvHm339erxZC
	zdjfKI2jcL8+VHferS0CzMPm7PtuMuGpFq0QH1WdQIGiyP90JSkX/hOxnaFTuOgz
	SosGmY4Q1d/+5NoaaWgI+NmGWSoMFXLWVemSr+Vb3XZPLudCb90bZTxT7R6EGHdM
	xz7BWBl5nd0ug5xA==
Received: (qmail 629194 invoked from network); 4 Jun 2025 12:18:36 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 4 Jun 2025 12:18:36 +0200
X-UD-Smtp-Session: l3s3148p1@TPXuUbw2kKogAwDPXx36AJSQ3b6GkO36
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i3c@lists.infradead.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>
Subject: [PATCH 1/4] i3c: dw: use adapter timeout value for I2C transfers
Date: Wed,  4 Jun 2025 12:18:27 +0200
Message-ID: <20250604101831.56585-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250604101831.56585-1-wsa+renesas@sang-engineering.com>
References: <20250604101831.56585-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250604_031844_485169_C4D56AF1 
X-CRM114-Status: GOOD (  10.03  )
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

I2C adapters have their own timeout value which can be changed by
userspace if desired. Use it for I2C transfers. The default is 1Hz, so
the default behaviour is unchanged.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/i3c/master/dw-i3c-master.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
index 611c22b72c15..0c370672a4fc 100644
--- a/drivers/i3c/master/dw-i3c-master.c
+++ b/drivers/i3c/master/dw-i3c-master.c
@@ -1142,7 +1142,7 @@ static int dw_i3c_master_i2c_xfers(struct i2c_dev_desc *dev,
 	}
 
 	dw_i3c_master_enqueue_xfer(master, xfer);
-	if (!wait_for_completion_timeout(&xfer->comp, XFER_TIMEOUT))
+	if (!wait_for_completion_timeout(&xfer->comp, m->i2c.timeout))
 		dw_i3c_master_dequeue_xfer(master, xfer);
 
 	ret = xfer->ret;
-- 
2.47.2


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
