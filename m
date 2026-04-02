Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21E80D3943C
	for <linux-i3c@archiver.kernel.org>; Thu,  2 Apr 2026 14:52:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=3//SUjjeTjSMFz4x1XAgR9sKGJStj1V6NtYATWGlfws=; b=wzn3TVHM5qOIN9
	Wa5hu0r+jolQ3mzd39+zmJ3OiG+2mQJtcZpeybya1j1xlO9MeSo4Qi/rNePiEt2xMybEc7GQ98CDN
	/2aL6U5hcxdyVhmwYEdSheZHaZyYgF4kUJSzG9eDVUUfmInnNB7GlJyNafTBQZ8Ytw2nSJwq1XBBq
	CZOFUiyU1W4oBiapsz4AkC5+ZxLCZhln9LkbYCLWMWCYn3abTpyiwO9jxhrn5vS6HxgdJ5QGTsf+d
	mus0TDmfZOUo9wXUK6IGTSnwm5eBNgdGVLxADjY2AzO1HgPKOw3hwTfL/+IIAzYIokOl/YypMjbEV
	s+P3YDv3xm4r61Qmzeqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8JPP-00000000Nid-3fuN;
	Thu, 02 Apr 2026 14:52:35 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8JPN-00000000Ni6-0hVw
	for linux-i3c@lists.infradead.org;
	Thu, 02 Apr 2026 14:52:34 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-82ce49785a0so432737b3a.2
        for <linux-i3c@lists.infradead.org>; Thu, 02 Apr 2026 07:52:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775141552; x=1775746352; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=i42oyAoWrWhqYiY7EaTfu2aPCqxrJU30Sf3G8iAIZSc=;
        b=rqfZ7g0cFmxGDZDrxkSvtfw13aQ+Gjkqpen07s/sMaNQJRD25u1sp8aIDAkROzDVam
         uvJJSknQLXtA/9TIvsFMUpwqSthtc6BDRYs+LzdJMVLj9zELetCiLUS8eqPQiOnpOp3P
         rUA97bKX9cB4/roMitIoUaQyvdHtDUog4mDdwxYntXjouQDvgnSsgfZeMEsjEGMrPpxk
         19flXeu4cbQqa331i1oSjT6iVgHkeJCwHXdrkCgMBpfazD3JXjNHSgMg9jehm22msa9e
         6mEJsrGmeCQa9jM9yg9GWBjWX40RokXS5voHiuypk4+RwJgqJdH2Htb1S9kNSpuszzJS
         qwfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775141552; x=1775746352;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i42oyAoWrWhqYiY7EaTfu2aPCqxrJU30Sf3G8iAIZSc=;
        b=hB3OmBgHhneAyrgmSOKjR2bIeU5EodkXOkL623li6B7Cd5b0cxzvFcF24Yp2/87RJa
         qEP68uAvsFbDAJSBp1Dc8Cpsq4+/Gv/AfL86CawCTQzLUwseChQ6tLSY+r6JmPotCne8
         5Zfb1pjKX3rdbI2VnH0RxJ1EHWXLD4vRzs+akWqmGCr0tnk/9wKU1Fm6iLmkizf+M1i4
         RbkbbMyoygfXoA3blTqf//DVE41TDcVx6FXZriZMYaszoGhciMYAeb9E3E0PE5DlDlc3
         2Ua0YakltnIIWpyaqvEU+lDSGYwp9ibK2iQJstDgTUzLRZOlAybeu62NzxNZlxhcIHk6
         lK4A==
X-Gm-Message-State: AOJu0YyBlVsHBT8ebjI/8UmliBnEovS88yZq27NI0q5IIwi5yl9F133L
	nHaHehf1Jg163btQty2Fu1IVB6NuXy67EJ6DZqGrbiPXdmMfTarOjaIh
X-Gm-Gg: ATEYQzwSY8MA2o+zt9NMDhVsga2LMLH9/1zKOTGGKvdUlMbHQGesbUNhwd8nhVyxK/U
	b25oxLaaMqayTL+12LjB2y7SGRxJOpL2SyYxg2cj2CaeXtx2VKDov8SBBzJEn4gdBDU0OKGMMwI
	QE9wi1onGxdzuXV2oaA/DL7ssQY8QFb6MYxpwTJ08wm9sURf0PRWVppT6644WFTIa7RGd5RZh+k
	fMZR+1b8P/iWkWtfuEO9lcFxCXZMWzpWu2RzWv9xOOFo9RqLNsxP34hdBGmPHdUrqg9dt3ij3UT
	5l+kEYAwKfRJvXlI5k1YK6Pftz/5PHQVZDV5aO1/WPbWEnrAQ3nYpySbbijwEcUSs7sHheh4tsR
	FTF6wn6pkfjjwH6TgBCansf9b8ecWhoHTXAApUftgxWmP/CkA1BK8YkYNTUmkdh3TggitAQPGVS
	VArDrEunEh/hB9Xfmer1b5NKKABzqWiR9I58Vi
X-Received: by 2002:a05:6a00:1a1c:b0:82c:ebae:3cb with SMTP id d2e1a72fcca58-82cebae0a76mr5987896b3a.43.1775141552030;
        Thu, 02 Apr 2026 07:52:32 -0700 (PDT)
Received: from junjungu-PC.localdomain ([223.167.147.240])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cf9c6f0c3sm3282256b3a.43.2026.04.02.07.52.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2026 07:52:31 -0700 (PDT)
From: Felix Gu <ustc.gu@gmail.com>
Date: Thu, 02 Apr 2026 22:52:26 +0800
Subject: [PATCH v2] i3c: master: renesas: Fix memory leak in
 renesas_i3c_i3c_xfers()
MIME-Version: 1.0
Message-Id: <20260402-renesas-v2-1-f7e8cf73c7df@gmail.com>
X-B4-Tracking: v=1; b=H4sIAKmCzmkC/2XMQQ7CIBCF4as0sxYDqNS68h6mixGGdhILBgzRN
 Nxd7Nbl//LyrZApMWW4dCskKpw5hhZ614GdMUwk2LUGLbWRR6lFokAZs7AGvUM/3K0maO9nIs/
 vTbqNrWfOr5g+G1zUb/03ihJKHMyAvTub/iT1dVqQH3sbFxhrrV/ozOM7ngAAAA==
X-Change-ID: 20260402-renesas-c6afdaf9bc2e
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Frank Li <Frank.Li@nxp.com>
Cc: linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Felix Gu <ustc.gu@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775141550; l=1726;
 i=ustc.gu@gmail.com; h=from:subject:message-id;
 bh=Gc0CJ76TP9tPyD/jOJJbqcXy0deV2iVAeV9vSIr2vgk=;
 b=mB+J5g//XKRZJo5mWiLXJEwM7rUsvEUwvi2zU+Mz4ETkF96KNLuWce1pdssXohriZjBSDHobM
 wfZ+4mpKi6IArPj0SF0JxiMne67Ht6WJZPR1qOA4StWS0mXplb4YE9g
X-Developer-Key: i=ustc.gu@gmail.com; a=ed25519;
 pk=fjUXwmjchVN7Ja6KGP55IXOzFeCl9edaHoQIEUA+/hw=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260402_075233_212384_C44DEEF9 
X-CRM114-Status: GOOD (  13.14  )
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

The xfer structure allocated by renesas_i3c_alloc_xfer() was never freed
in the renesas_i3c_i3c_xfers() function. Use the __free(kfree) cleanup
attribute to automatically free the memory when the variable goes out of
scope.

Fixes: d028219a9f14 ("i3c: master: Add basic driver for the Renesas I3C controller")
Signed-off-by: Felix Gu <ustc.gu@gmail.com>
---
Changes in v2:
- Add cleanup header file to fix Frank's comment.
- Link to v1: https://lore.kernel.org/r/20260402-renesas-v1-1-369a7d867502@gmail.com
---
 drivers/i3c/master/renesas-i3c.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/i3c/master/renesas-i3c.c b/drivers/i3c/master/renesas-i3c.c
index d9f5b30a4b2f..a8a9e89a9710 100644
--- a/drivers/i3c/master/renesas-i3c.c
+++ b/drivers/i3c/master/renesas-i3c.c
@@ -8,6 +8,7 @@
 
 #include <linux/bitfield.h>
 #include <linux/bitops.h>
+#include <linux/cleanup.h>
 #include <linux/clk.h>
 #include <linux/completion.h>
 #include <linux/err.h>
@@ -817,13 +818,12 @@ static int renesas_i3c_i3c_xfers(struct i3c_dev_desc *dev, struct i3c_xfer *i3c_
 	struct i3c_master_controller *m = i3c_dev_get_master(dev);
 	struct renesas_i3c *i3c = to_renesas_i3c(m);
 	struct renesas_i3c_i2c_dev_data *data = i3c_dev_get_master_data(dev);
-	struct renesas_i3c_xfer *xfer;
 	int i;
 
 	/* Enable I3C bus. */
 	renesas_i3c_bus_enable(m, true);
 
-	xfer = renesas_i3c_alloc_xfer(i3c, 1);
+	struct renesas_i3c_xfer *xfer __free(kfree) = renesas_i3c_alloc_xfer(i3c, 1);
 	if (!xfer)
 		return -ENOMEM;
 

---
base-commit: bd0f139e5fc11182777b81cefc3893ea508544ec
change-id: 20260402-renesas-c6afdaf9bc2e

Best regards,
-- 
Felix Gu <ustc.gu@gmail.com>


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
