Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB5E5EF4EDF
	for <linux-i3c@archiver.kernel.org>; Mon,  6 Apr 2026 12:43:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kre0fDmQROWUncfatHoI8azWVer8VDNNmQm4DjjDrF4=; b=nowwGzjyFUBEfC
	mHy1Hw6MgND8F0EcwNpQSeW4J/B0dyBYS/en8R7x4GDRauXCstKkLhq1vCuLMspG9y59XUMptuoGP
	I7WOn1lQ60IGnKPN/u4xTrhlDiKmeatHp+X6qIgx99q9Z3bfzlUnccnJSTsB6bBwwnGwvLoez8j65
	XLAmCzdsUG8h6J1P2uCfSINsb2UaJXIVz908Z8IPyWovwfi1zw1NceoYjbSktadVwaHYMvUDnHAjS
	JIz2ZCXykItx0X5HXnRwWl70ZSwU5O16eRab07FJwo5ho5WZFoFwLTcO8zerXWfhFpcwjYKSlfR/a
	8pnc1V6er+B56MAQA6RA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9jIc-000000057N0-1Zyo;
	Mon, 06 Apr 2026 12:43:26 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9jIa-000000057MR-0s83
	for linux-i3c@lists.infradead.org;
	Mon, 06 Apr 2026 12:43:25 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-2b0afa0210bso18814765ad.2
        for <linux-i3c@lists.infradead.org>; Mon, 06 Apr 2026 05:43:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775479403; x=1776084203; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wFXMumAntQ8wMwwB4Cm6xgKR3q8YklhzLyY8Ugve8Fo=;
        b=lvdV4gBrjX7DRSJIyrDC3pRRzTj3NWB/pvB5jE15v+5QaYsl/c1aHGspaf4xqAo8Zb
         leiUKMNz4pK061DNf2rXBVR7b3aZaWe4b/l0xhOdMQI/hHYCzC7HZdNWi6jZM2r/iL4x
         t6QoI4eYZEnVzpvSuLTd2cTNV/1FujnOjdc5C+djFkpfmo/iiPzo4fVtGcUPWSL7fZHX
         gCvX2FopnMdf4qZKSH/LG9SmEJtnwPKOQMFSfE222kaCaORPEpXtKRbIpkkl63x/wg7j
         Ad1COU6zf0uDjI+7H3uM3Yxy3LKMTfkqV5Ofw+ml8vwWSE/uKR/ju1p5pvEzTHkMM8yi
         Xn5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775479403; x=1776084203;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wFXMumAntQ8wMwwB4Cm6xgKR3q8YklhzLyY8Ugve8Fo=;
        b=NY1ZM6G8x8gNoeiTz0EPATFPqNUII3lOqk8KYmblWklfvU4Eoy6jUHSZ35ugWWMRnP
         Dk3mXo9Oh6jteffm2QDdgT65944DvyscBRAXKheMCg2h5yNClOxEIVAF6TjV7nj61Bq8
         +xpf2ALGWIG4woyF15CJSFrGOvgiFyKcyr/GouKyOyy/5xpcE5RSNeH2bByZPfR99g/o
         lzvSW/SnyIlBdpmrPe/3sABhlaV4Uh9/JUQ55sUXRlHpSIMrrcwEGYP+wi/I+C8BY5kl
         il15f17kPfnHqodDXa9GZa7xsXB1mEWBbX6d0SR4QgceL3duUjWJ6CsmTWm74ZgYjt7t
         cT5A==
X-Gm-Message-State: AOJu0YyWra9lwjY1jtX4WzQEFl6qP8v0GJWUZK0TwFzm4bV0yNphtYfI
	/yoNRgvokFrc7iiHpijE+H7bUiGh9FtbTCIjC45UGoSvyRCD5y1ZIrnH
X-Gm-Gg: AeBDiesBRJdOY7vbiKEosSvGiqIl+xzl8kEZ2N28NIVMsiNNj8l3f604z8ZzsEEXpdO
	RbJ6nzGkLF9PBBl8dTLZIoBiPIEjoioSjmdAOrCrQcknjnPNHNZBgkTYKTICLBfX0Y0OtWif9/I
	s+aPZMUdtocRtMiA9ilqjjGrIYT8f30YeiDRNENfhsyp4fJ2Kjk93ruURBbMZRZ/gBzmzDLi0/D
	oDy2TZmndQ3BRDDF0oHyjh7U9yihHfJWZCnJyCByLjVEFmmuexgWTuAc+MoQ8EPO82/H2EdFIOI
	hb4oeX2ZT8gVMIW1O+UZ61eb4Tc9lp+HxPrxAwkU4dyjte5wnXcowoLbRlenRd+bLfwWGZRJNJJ
	TILuB/rmptVNvuZkMOj8HtTUS9OPB/vWtruagj3NiaSvSzc/WA0i9ZW/kxcAJecFXN8k8kVcZqo
	rY8khn/XfsdrHXO++a58DDLjV53XFTumCn955wtAiAowvvA0K8ir/Q6sco9U1qoG47Qobzz+HK2
	NAal54fWnIZzGH9C65Y
X-Received: by 2002:a17:903:388c:b0:2b2:67ca:5ff9 with SMTP id d9443c01a7336-2b28166b24bmr130928605ad.0.1775479403236;
        Mon, 06 Apr 2026 05:43:23 -0700 (PDT)
Received: from junjungu-PC.localdomain ([223.167.147.240])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b27472d233sm143486445ad.2.2026.04.06.05.43.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2026 05:43:23 -0700 (PDT)
From: Felix Gu <ustc.gu@gmail.com>
Date: Mon, 06 Apr 2026 20:43:16 +0800
Subject: [PATCH v3 1/2] i3c: master: renesas: Fix memory leak in
 renesas_i3c_i3c_xfers()
MIME-Version: 1.0
Message-Id: <20260406-renesas-v3-1-4b724d7708f4@gmail.com>
References: <20260406-renesas-v3-0-4b724d7708f4@gmail.com>
In-Reply-To: <20260406-renesas-v3-0-4b724d7708f4@gmail.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Frank Li <Frank.Li@nxp.com>
Cc: linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Felix Gu <ustc.gu@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775479398; l=1599;
 i=ustc.gu@gmail.com; h=from:subject:message-id;
 bh=Cx2s2w3meJfSfpKTacSMv/QU3Sx8jDulv3B2bNsYKQU=;
 b=ngZ1UVYMhz0kYIc6Gh4zPWxqI+TT9L9Uxc8oLCc7ij2AZOERHBATRPr338sBS7YtvnWD4AZoA
 cRTfTga8GAvAGEPV0WpNwk3v2wN6zlkLvQpJfsEvadfPWGQuLKJfUoU
X-Developer-Key: i=ustc.gu@gmail.com; a=ed25519;
 pk=fjUXwmjchVN7Ja6KGP55IXOzFeCl9edaHoQIEUA+/hw=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260406_054324_254414_98CFABD5 
X-CRM114-Status: GOOD (  13.17  )
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
Tested-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Reviewed-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Felix Gu <ustc.gu@gmail.com>
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
 

-- 
2.43.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
