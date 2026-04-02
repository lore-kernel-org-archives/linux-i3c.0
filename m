Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BE9AD3943C
	for <linux-i3c@archiver.kernel.org>; Thu,  2 Apr 2026 15:14:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=bl/FijWZojqySDO/1nPmL/zr3FzbVhgwc/yUZygR8dw=; b=npDsSRuEHhXo4L
	01Ku5ay2UQ3nNLoOHlZmjcPZaBWEtBOgm1e1Ymit3uN3H3IDIAVbL3B/db5XwN7bMvyqSsej/Xu+e
	OSOZgFiaXytL2VwkNxn3GDHPPcEZxGVMSHg8OubAiuek6mA5ZchC7t9o2X4B1WTe6IPJ3wOwVZkh8
	trmkMu5tqG6wGjyJ/ixZAnQiUpE5WSBkIGEjemqOHCrxP6pE1id0xqiFWUR81rfHTJ0JipspF4M6s
	kMXPgDwkhLTJWZlEobmhmWLUNFmzHk80yRPi6BLHgu7rZzKxYm03kSu0G9tmmIo9YWsXzU51QcyDJ
	JznEcHuR7oPCDQKl6YOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8Jks-00000000QYK-03Qz;
	Thu, 02 Apr 2026 15:14:46 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8Jkp-00000000QXc-0ZrD
	for linux-i3c@lists.infradead.org;
	Thu, 02 Apr 2026 15:14:44 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-2ab077e3f32so3845255ad.3
        for <linux-i3c@lists.infradead.org>; Thu, 02 Apr 2026 08:14:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775142882; x=1775747682; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SxY2w6DCsYlRi40UkBDrubtuEniANeT5i6QMbLNLZS0=;
        b=UC4xTlxO1NaFeUqNhQql8bEdFCdXrfhmsXm6ZnmmK4SlYr3uU2E1D6K97a+JiyFiGA
         ew7jR8fiPsynJVJsW4AQ14DLbjzQgxcJvN/XAPbrLR4IzPjedi5qug7/PTnSabS0u3xJ
         /OLTqC8sfChC3AdrwWfna7GByt6Ccy/U+RkTaT5bKp95sSwFz2MUQDEvydnqmYTGX5R2
         ixFmtwm+mieamnBt5ePHwyXLkb8J7vr0Y8KRbpA5EatHjFjfNoWxK64TxiLweU+K+EiC
         VvTUc/dkQWkKLXNIHUWLvQ4Aqpj+TRUr+7Gxl8KUoy2Zs6orEtocL+T/m0MOR+GOqkfg
         /BBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775142882; x=1775747682;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SxY2w6DCsYlRi40UkBDrubtuEniANeT5i6QMbLNLZS0=;
        b=c7svdp1O+E7J5QeNS8LveewSftG3ej161RnSAEs2Xovw4NQ7ghUx9JbQ1djGKo/eW6
         L/3nH/aRwAo5/EKGe42VOBbSqwKfqsUh01j55Bf0iqrMKP64+eUDgV45FzgpUbLdVlVK
         3Aug6O0qEbZnhDtFh3F8/25XRR/KCMNQwjRNutn7k/N74hdyG9LJ8BNJk9niZ2LwBsPd
         aHJSHIyRzuwc4O2OGwNSBIUQjrJxRswKDV7ZnJMcDk0HN7TKJbKjuvLv+ctJpquNpKpy
         5Ry8704Lr5RIdfCmAY7wYEKKqMoSDXfFXQuuYsH+RJtFKvNLEUaGWqyLDJB+/2MpF13P
         71vw==
X-Gm-Message-State: AOJu0Yyy50nWOD+6QSxW2WqLPkQjDlNa2W9ml0kFuoXuv7wrUNyPXiZX
	HVyM8Gn8lTG/TWxQpPi86GXQXIoVAs5GfP58Mg9HaW1DX/NIHOtidOQdovBXZoWB
X-Gm-Gg: AeBDies1VjDJqLKerYs0ExbWf2QpGLIVuKp2y1lbjdd+lbuzVxDFZX0zhIuLdtiYYwJ
	NlK2+uM1cZe3UrX1xIGUu1737R4bANa5RfUFhhf1SX3RQNn4RCBG/vY93WtFcG/nbtxI0JLA09M
	aQpg1JELWSXE/m+krqA4kgLMcqpMrnfrAQ10Om8UJONF/2YmTsKBikHUNmO6Ue/RXcFKkU6kS+3
	8NowLjLUg9nvvn6ygGbF4QGY1/G/cylPu9IlZlLR1ZvtQiTgUo9OuH/EPAi0J62ynEiO+qbpIaA
	d8vlhKTjY9V7t9HL3nYJFOv/RHLRmXBi6zVp8geI8K9/0qn3JymI+vERQ7yzRiNVePTxJpvLKHO
	qg0Jn59GQqQmApQMosLczCzFtiqxHkUrgLADOs2eifJ8M6HQw2HeEFs/RdjTm8Q5RSU9Dvqs3kP
	rmZpo2jgwUhvdoEVmhDQgy3RQZmDXeawa0KGVw
X-Received: by 2002:a17:903:1b50:b0:2b2:4df2:1e69 with SMTP id d9443c01a7336-2b269ab2ddcmr83266315ad.4.1775142881980;
        Thu, 02 Apr 2026 08:14:41 -0700 (PDT)
Received: from junjungu-PC.localdomain ([223.167.147.240])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b27478b64csm35079155ad.30.2026.04.02.08.14.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2026 08:14:41 -0700 (PDT)
From: Felix Gu <ustc.gu@gmail.com>
Date: Thu, 02 Apr 2026 23:14:38 +0800
Subject: [PATCH v2] i3c: dw: Fix memory leak in dw_i3c_master_i3c_xfers()
MIME-Version: 1.0
Message-Id: <20260402-dw-i3c-2-v2-1-aa6c81d392da@gmail.com>
X-B4-Tracking: v=1; b=H4sIAN2HzmkC/23MQQ6CMBCF4auQWTumnQKKK+9hWEA7hUkETGuqh
 nB3K2uX/8vLt0LkIBzhUqwQOEmUZc5BhwLs2M0Do7jcQIpqVSpC90IxFgnPXpNx7JumJ8j3R2A
 v7526tblHic8lfHY56d/6B0kaNfaVUc1J1VXJ9jpMndyPdpmg3bbtC+yOEY6gAAAA
X-Change-ID: 20260402-dw-i3c-2-8f123def99b2
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Frank Li <Frank.Li@nxp.com>, Aniket <aniketmaurya@google.com>
Cc: linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Felix Gu <ustc.gu@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775142880; l=2156;
 i=ustc.gu@gmail.com; h=from:subject:message-id;
 bh=tkVOEMPd2UVvi7ufnqgFQQBx4xsxicEdqBqOqe29Zco=;
 b=XErUWn9qgG/pW/leCpGYJvSs7Q5dtfxKuSM6bAHAdwfUJoR1ZwYQHChU7j80buv2qHVnNUM5R
 jFin8KZ1sh0B3lNvytqWLe2cR537xeu7RDK9MXKpz6vOuaIXhlKyRdn
X-Developer-Key: i=ustc.gu@gmail.com; a=ed25519;
 pk=fjUXwmjchVN7Ja6KGP55IXOzFeCl9edaHoQIEUA+/hw=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260402_081443_202702_40DD7F3D 
X-CRM114-Status: GOOD (  12.54  )
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

The dw_i3c_master_i3c_xfers() function allocates memory for the xfer
structure using dw_i3c_master_alloc_xfer(). If pm_runtime_resume_and_get()
fails, the function returns without freeing the allocated xfer, resulting
in a memory leak.

Use the __free(kfree) cleanup attribute to automatically free the memory
when the variable goes out of scope.

Fixes: 62fe9d06f570 ("i3c: dw: Add power management support")
Signed-off-by: Felix Gu <ustc.gu@gmail.com>
---
Changes in v2:
- Switch to use __free(kfree) to automatically free the memory.
- Link to v1: https://lore.kernel.org/r/20260402-dw-i3c-2-v1-1-b530970654ec@gmail.com
---
 drivers/i3c/master/dw-i3c-master.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
index d6bdb32397fb..2e31228b3809 100644
--- a/drivers/i3c/master/dw-i3c-master.c
+++ b/drivers/i3c/master/dw-i3c-master.c
@@ -7,6 +7,7 @@
 
 #include <linux/bitfield.h>
 #include <linux/bitops.h>
+#include <linux/cleanup.h>
 #include <linux/clk.h>
 #include <linux/completion.h>
 #include <linux/err.h>
@@ -924,7 +925,6 @@ static int dw_i3c_master_i3c_xfers(struct i3c_dev_desc *dev,
 	struct i3c_master_controller *m = i3c_dev_get_master(dev);
 	struct dw_i3c_master *master = to_dw_i3c_master(m);
 	unsigned int nrxwords = 0, ntxwords = 0;
-	struct dw_i3c_xfer *xfer;
 	int i, ret = 0;
 
 	if (!i3c_nxfers)
@@ -944,7 +944,7 @@ static int dw_i3c_master_i3c_xfers(struct i3c_dev_desc *dev,
 	    nrxwords > master->caps.datafifodepth)
 		return -EOPNOTSUPP;
 
-	xfer = dw_i3c_master_alloc_xfer(master, i3c_nxfers);
+	struct dw_i3c_xfer *xfer __free(kfree) = dw_i3c_master_alloc_xfer(master, i3c_nxfers);
 	if (!xfer)
 		return -ENOMEM;
 
@@ -995,7 +995,6 @@ static int dw_i3c_master_i3c_xfers(struct i3c_dev_desc *dev,
 	}
 
 	ret = xfer->ret;
-	dw_i3c_master_free_xfer(xfer);
 
 	pm_runtime_put_autosuspend(master->dev);
 	return ret;

---
base-commit: bd0f139e5fc11182777b81cefc3893ea508544ec
change-id: 20260402-dw-i3c-2-8f123def99b2

Best regards,
-- 
Felix Gu <ustc.gu@gmail.com>


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
